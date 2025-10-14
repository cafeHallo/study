`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/12 02:49:10
// Design Name: 
// Module Name: ibex_axi_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ibex_axi_wrapper (
    input  wire         clk,
    input  wire         rst_n,
    // AXI Lite bus (from PS or Interconnect)
    input  wire [31:0]  s_axi_awaddr,
    input  wire         s_axi_awvalid,
    output wire         s_axi_awready,
    input  wire [31:0]  s_axi_wdata,
    input  wire [3:0]   s_axi_wstrb,
    input  wire         s_axi_wvalid,
    output wire         s_axi_wready,
    output wire [1:0]   s_axi_bresp,
    output wire         s_axi_bvalid,
    input  wire         s_axi_bready,
    input  wire [31:0]  s_axi_araddr,
    input  wire         s_axi_arvalid,
    output wire         s_axi_arready,
    output wire [31:0]  s_axi_rdata,
    output wire [1:0]   s_axi_rresp,
    output wire         s_axi_rvalid,
    input  wire         s_axi_rready,

    // UART interface
    output wire         uart_tx,
    input  wire         uart_rx
);

    wire [31:0] data_addr;
    wire [31:0] data_wdata;
    wire [31:0] data_rdata;
    wire        data_we;

    // Ibex Core
    ibex_core u_ibex (
        .clk_i(clk),
        .rst_ni(rst_n),
        .test_en_i(1'b0),
        .hart_id_i(32'd0),
        .instr_req_o(),
        .instr_gnt_i(1'b1),
        .instr_rvalid_i(1'b1),
        .instr_addr_o(),
        .instr_rdata_i(32'h00000013), // NOP
        .data_req_o(),
        .data_gnt_i(1'b1),
        .data_rvalid_i(1'b1),
        .data_we_o(data_we),
        .data_addr_o(data_addr),
        .data_wdata_o(data_wdata),
        .data_rdata_i(data_rdata)
    );

    // --- UARTに直結（簡易） ---
    assign uart_tx = data_we ? data_wdata[0] : 1'b1; // テスト用途

    assign s_axi_awready = 1'b1;
    assign s_axi_wready  = 1'b1;
    assign s_axi_bresp   = 2'b00;
    assign s_axi_bvalid  = s_axi_awvalid & s_axi_wvalid;
    assign s_axi_arready = 1'b1;
    assign s_axi_rdata   = 32'hDEADBEEF;
    assign s_axi_rresp   = 2'b00;
    assign s_axi_rvalid  = s_axi_arvalid;

endmodule
