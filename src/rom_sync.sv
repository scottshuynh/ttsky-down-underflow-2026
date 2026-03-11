// Original work:
// Project F Library - Synchronous ROM
// (C)2021 Will Green, open source hardware released under the MIT License
// Learn more at https://projectf.io
//
// Modified work (C)2026 Scott Huynh
// Let's try to tape this out on the TTSKY26a shuttle.

`default_nettype none

module rom_sync #(
    parameter WIDTH=8,
    parameter DEPTH=256,
    parameter INIT_F="",
    localparam ADDRW=$clog2(DEPTH)
    ) (
    input wire logic clk,
    input wire logic [ADDRW-1:0] addr,
    output     logic [WIDTH-1:0] data
    );

    logic [WIDTH-1:0] memory [DEPTH];

    initial begin
        if (INIT_F != 0) begin
            $display("Create rom_sync with init file '%s'.", INIT_F);
            $readmemh(INIT_F, memory);
        end
    end

    always_ff @(posedge clk) begin
        data <= memory[addr];
    end
endmodule
