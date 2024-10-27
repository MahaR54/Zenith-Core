package singlecycle
import chisel3._
import chisel3.util._

class Fetch extends Module{
    val io=IO(new Bundle{
        val enb=Input(Bool())
        val branch=Input(SInt(1.W))
        val in=Input(UInt(32.W))
        val inst=Input(UInt(32.W))
        val valid = Input(Bool())
        val out=Output(UInt(32.W))
        val preout=Output(UInt(32.W))
        val req=Output(Bool())
    })
    io.req:=0.B
    io.out:=0.U
    
    val PCs=RegInit(0.U(32.W))
    val prevValueReg = RegInit(0.U(32.W))
    val preinst = RegInit(0.U(32.W))
    val preinsts = RegInit(0.U(32.W))

    PCs:=Mux( Mux( io.inst(31)===1.U,(io.inst(6,0)==="b1100011".asUInt) ,((io.inst(6,0)==="b1100011".asUInt) & (io.branch===1.S) ))|(io.inst(6,0)==="b1100111".asUInt)|
    (io.inst(6,0)==="b1101111".asUInt),
     prevValueReg+io.in,PCs+io.in)
    io.out:=PCs
     
when(io.inst(6,0)==="b0000011".asUInt){
  io.req:=1.B
}
  when(true.B) {
    prevValueReg := io.out
  }
  when(true.B) {
    preinst := io.inst
  }
  dontTouch(preinst)
  io.preout := prevValueReg
  preinsts:=preinst
  dontTouch(io.branch)
}