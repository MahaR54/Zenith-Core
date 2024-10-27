package singlecycle
import chisel3._
import chisel3.util._

class controlunit extends Module{
    var io=IO(new Bundle{
        val ins=Input(UInt(32.W))
        val rs1=Output(UInt(5.W))
        val rs2=Output(UInt(5.W))
        val rd=Output(UInt(5.W))
        val op=Output(UInt(4.W))
        val writereg=Output(Bool())
        val load=Output(Bool())
        val store=Output(Bool())
         val auipc=Output(UInt(32.W))
         val reg_pc_enb=Output(Bool())
    })
    
    io.rd:=io.ins(11,7)
    io.rs1:=io.ins(19,15)
    io.rs2:=io.ins(24,20)
    io.op:=Mux(io.ins(6,0)==="b0110011".U,Cat(io.ins(30),io.ins(14,12)),io.ins(14,12))
    io.writereg:=Mux((io.ins(6,0)==="b0110011".U)||
     ( io.ins(6,0)==="b0010011".U)||
     (io.ins(6,0)==="b0000011".U) || 
     (io.ins(6,0)==="b0110111".U) ||
     (io.ins(6,0)==="b1101111".U)|| 
     (io.ins(6,0)==="b0010111".U) ,1.B,0.B)
    io.load:=Mux(io.ins(6,0)==="b0000011".U,1.B,0.B)
    io.store:=Mux(io.ins(6,0)==="b0100011".U,1.B,0.B)
     io.auipc:=(Cat(Fill(20,0.U),io.ins(31,12))).asUInt
    io.reg_pc_enb:=Mux(io.ins(6,0)==="b1100111".U,1.B,0.B)
}

