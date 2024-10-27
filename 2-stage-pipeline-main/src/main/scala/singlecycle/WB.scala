package singlecycle
import chisel3._
import chisel3.util._

class WB extends Module {
  val io = IO(new Bundle {
    val lout = Input(SInt(32.W))
    val ins = Input(UInt(32.W))
    val alu_out = Input(SInt(32.W))
    val pcout = Input(UInt(32.W))
    val data = Output( SInt(32.W))
  })
 io.data := MuxCase ( 0.S , Array (
(io.ins(6,0) === "b0000011".U) -> io.lout ,
(io.ins(6,0)==="b0110011".U ) -> io.alu_out ,
(io.ins(6,0)==="b0010011".U ) -> io.alu_out,
(io.ins(6,0)==="b0110111".U ) -> io.alu_out,
(io.ins(6,0)==="b0010111".U) -> io.alu_out,
(io.ins(6,0)==="b1101111".U ) ->((io.pcout).asSInt+(4.S)),
(io.ins(6,0)==="b1100111".U ) ->((io.pcout).asSInt+(4.S)) ,
(io.ins(6,0)==="b1100011".U ) -> io.alu_out )
)

}
