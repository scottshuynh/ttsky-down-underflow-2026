from argparse import ArgumentParser
from pathlib import Path
import sys


def get_rom_sync_hdl(module_name: str, addr_w: int, data_w: int) -> list[str]:
    rom_sync_template = [
        "// This is an auto-generated file.",
        "`default_nettype none",
        "",
        f"module {module_name} (",
        "    input wire logic clk,",
        f"    input wire logic [{str(addr_w)}-1:0] addr,",
        f"    output     logic [{str(data_w)}-1:0] data",
        "    );",
        "",
        f"    logic [{str(data_w)}-1:0] memory [{str(2**addr_w)}];",
        "",
        "    initial begin",
    ]

    return rom_sync_template


def mem_to_rom_sync(
    mem_filename: str, addr_w: int, data_w: int, rom_filename: str = ""
):
    mem_filepath = Path(mem_filename)
    if not mem_filepath.is_absolute():
        print(f"File ({mem_filename}) must be absolute path.")
        sys.exit(1)
    if not mem_filepath.is_file():
        print(f"File ({mem_filename}) does not exist.")
        sys.exit(1)

    rom_hex_list = []
    with mem_filepath.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if line.startswith("//"):
                continue
            values = line.split("//")[0].split()
            for value in values:
                if value:
                    if value.startswith("//"):
                        continue
                    rom_hex_list.append(value)

    assert (2**addr_w * data_w) // 8 == len(rom_hex_list), (
        f"Number of bytes in .mem file does not match args ({addr_w=} {data_w=}). Got: {len(rom_hex_list)}"
    )

    rom_filepath = Path(rom_filename)
    if not rom_filename:
        rom_filepath = mem_filepath.parent / (mem_filepath.stem + "_rom.sv")

    rom_sync_hdl = get_rom_sync_hdl(rom_filepath.stem, addr_w, data_w)
    for idx, rom_hex_data in enumerate(rom_hex_list):
        rom_sync_hdl.append(
            f"        memory[{str(idx)}] = 8'h{str(rom_hex_data)};",
        )
    rom_sync_hdl.extend(
        [
            "    end",
            "    always_ff @(posedge clk) begin",
            "        data <= memory[addr];",
            "    end",
            "endmodule",
        ]
    )

    if rom_filepath.parent.exists():
        if rom_filepath.suffix == ".sv":
            with rom_filepath.open("w", encoding="utf-8") as f:
                for hdl in rom_sync_hdl:
                    f.write(hdl + "\n")
        else:
            print(
                f"ROM output file must by SystemVerilog. Got extension: {rom_filepath.suffix}"
            )
            sys.exit(1)
    else:
        print(f"Invalid path ({str(rom_filepath)}) to output ROM file.")
        sys.exit(1)


if __name__ == "__main__":
    parser = ArgumentParser(
        "mem to rom_sync",
        description="Converts a mem file to a SystemVerilog Synchronous ROM",
    )
    parser.add_argument(
        "mem_filename", type=str, default="", help="Absolute Path to .mem file"
    )
    parser.add_argument("rom_addr_w", type=int, default=0, help="ROM Address Width")
    parser.add_argument("rom_data_w", type=int, default=0, help="ROM Data Width")
    parser.add_argument(
        "rom_filename",
        type=str,
        default="",
        help="Absolute Path to output ROM .sv file",
    )
    args = parser.parse_args()
    mem_to_rom_sync(
        args.mem_filename, args.rom_addr_w, args.rom_data_w, args.rom_filename
    )
