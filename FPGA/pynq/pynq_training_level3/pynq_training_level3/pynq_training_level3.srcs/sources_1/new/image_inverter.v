`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/09 03:49:40
// Design Name: 
// Module Name: image_inverter
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


module image_inverter(

    );
endmodule
`timescale 1ns / 1ps

module image_inverter (
    // Global Signals
    input wire clk,
    input wire resetn,

    // S_AXIS (Slave Stream - 入力)
    input wire [7:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output wire s_axis_tready, // (修正: wireのままassignで駆動)

    // M_AXIS (Master Stream - 出力)
    output wire [7:0] m_axis_tdata, // (修正: wireのままassignで駆動)
    output wire m_axis_tvalid,  // (修正: wireのままassignで駆動)
    input wire m_axis_tready
);

    // ----------------------------------------------------------------------
    // 1. データ処理: 入力データ(s_axis_tdata)のビット反転を行う
    // ----------------------------------------------------------------------
    // ビット反転（~）ではなく、画素値反転（255 - Data）を実装します
    // 8'hFF は 255 です
    assign m_axis_tdata = 8'hFF - s_axis_tdata;
    // または、単なるビット反転であれば assign m_axis_tdata = ~s_axis_tdata;

    // ----------------------------------------------------------------------
    // 2. ハンドシェイクロジック: シンプルなパススルー
    // ----------------------------------------------------------------------

    // 出力データ有効: 入力データが有効な場合、処理結果は即座に有効
    assign m_axis_tvalid = s_axis_tvalid;

    // 受信準備完了: 後段（DMAなど）が受け入れ可能で、かつ出力が有効な場合にのみ、入力も受け入れ可能にする
    // M_AXIS_TVALIDとM_AXIS_TREADYがONのとき、データが流れ、S_AXISも動く
    assign s_axis_tready = m_axis_tready;


    // ----------------------------------------------------------------------
    // リセットロジックについて:
    // assign文のみの組み合わせ回路にはリセットは不要です。
    // FFs(フリップフロップ)を使用する場合のみ、always @(posedge clk) ブロックでresetnを使用します。
    // ----------------------------------------------------------------------

endmodule