// This is an auto-generated file.
`default_nettype none

module down_underflow_greet_rom (
    input wire logic clk,
    input wire logic [7-1:0] addr,
    output     logic [8-1:0] data
    );

    logic [8-1:0] memory [128];

    initial begin
        memory[0] = 8'h20;
        memory[1] = 8'h20;
        memory[2] = 8'h20;
        memory[3] = 8'h20;
        memory[4] = 8'h20;
        memory[5] = 8'h20;
        memory[6] = 8'h20;
        memory[7] = 8'h20;
        memory[8] = 8'h20;
        memory[9] = 8'h20;
        memory[10] = 8'h20;
        memory[11] = 8'h20;
        memory[12] = 8'h20;
        memory[13] = 8'h20;
        memory[14] = 8'h20;
        memory[15] = 8'h20;
        memory[16] = 8'h20;
        memory[17] = 8'h20;
        memory[18] = 8'h41;
        memory[19] = 8'h53;
        memory[20] = 8'h49;
        memory[21] = 8'h43;
        memory[22] = 8'h20;
        memory[23] = 8'h20;
        memory[24] = 8'h41;
        memory[25] = 8'h44;
        memory[26] = 8'h20;
        memory[27] = 8'h41;
        memory[28] = 8'h53;
        memory[29] = 8'h54;
        memory[30] = 8'h52;
        memory[31] = 8'h41;
        memory[32] = 8'h20;
        memory[33] = 8'h44;
        memory[34] = 8'h4F;
        memory[35] = 8'h57;
        memory[36] = 8'h4E;
        memory[37] = 8'h20;
        memory[38] = 8'h20;
        memory[39] = 8'h20;
        memory[40] = 8'h20;
        memory[41] = 8'h20;
        memory[42] = 8'h55;
        memory[43] = 8'h4E;
        memory[44] = 8'h44;
        memory[45] = 8'h45;
        memory[46] = 8'h52;
        memory[47] = 8'h20;
        memory[48] = 8'h20;
        memory[49] = 8'h46;
        memory[50] = 8'h4C;
        memory[51] = 8'h4F;
        memory[52] = 8'h57;
        memory[53] = 8'h20;
        memory[54] = 8'h20;
        memory[55] = 8'h20;
        memory[56] = 8'h20;
        memory[57] = 8'h20;
        memory[58] = 8'h32;
        memory[59] = 8'h30;
        memory[60] = 8'h32;
        memory[61] = 8'h36;
        memory[62] = 8'h20;
        memory[63] = 8'h20;
        memory[64] = 8'h20;
        memory[65] = 8'h46;
        memory[66] = 8'h4F;
        memory[67] = 8'h53;
        memory[68] = 8'h53;
        memory[69] = 8'h49;
        memory[70] = 8'h20;
        memory[71] = 8'h20;
        memory[72] = 8'h20;
        memory[73] = 8'h20;
        memory[74] = 8'h20;
        memory[75] = 8'h46;
        memory[76] = 8'h44;
        memory[77] = 8'h4E;
        memory[78] = 8'h2E;
        memory[79] = 8'h20;
        memory[80] = 8'h20;
        memory[81] = 8'h4D;
        memory[82] = 8'h4F;
        memory[83] = 8'h52;
        memory[84] = 8'h53;
        memory[85] = 8'h45;
        memory[86] = 8'h20;
        memory[87] = 8'h20;
        memory[88] = 8'h20;
        memory[89] = 8'h20;
        memory[90] = 8'h4D;
        memory[91] = 8'h49;
        memory[92] = 8'h43;
        memory[93] = 8'h52;
        memory[94] = 8'h4F;
        memory[95] = 8'h20;
        memory[96] = 8'h20;
        memory[97] = 8'h49;
        memory[98] = 8'h51;
        memory[99] = 8'h4F;
        memory[100] = 8'h4E;
        memory[101] = 8'h49;
        memory[102] = 8'h43;
        memory[103] = 8'h20;
        memory[104] = 8'h20;
        memory[105] = 8'h20;
        memory[106] = 8'h57;
        memory[107] = 8'h4F;
        memory[108] = 8'h52;
        memory[109] = 8'h4B;
        memory[110] = 8'h53;
        memory[111] = 8'h20;
        memory[112] = 8'h20;
        memory[113] = 8'h54;
        memory[114] = 8'h49;
        memory[115] = 8'h4E;
        memory[116] = 8'h59;
        memory[117] = 8'h20;
        memory[118] = 8'h20;
        memory[119] = 8'h20;
        memory[120] = 8'h20;
        memory[121] = 8'h54;
        memory[122] = 8'h41;
        memory[123] = 8'h50;
        memory[124] = 8'h45;
        memory[125] = 8'h4F;
        memory[126] = 8'h55;
        memory[127] = 8'h54;
    end
    always_ff @(posedge clk) begin
        data <= memory[addr];
    end
endmodule
