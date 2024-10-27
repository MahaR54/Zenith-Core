package singlecycle
import chisel3._
import chisel3.util._

class Regfile extends Module {
  var io = IO(new Bundle {
    val rs1 = Input(UInt(5.W))
    val rs2 = Input(UInt(5.W))
    val rd = Input(UInt(5.W))
    val data = Input(SInt(32.W))
    val wenb=Input(Bool())
    val d1 = Output(SInt(32.W))
    val d2 = Output(SInt(32.W))
     val valid =Output(Bool())

  })
  val valid=RegInit(0.B)
  val Regfile = RegInit(VecInit(Seq.fill(32)(0.S(32.W))))
  when(io.rs1.orR) {
    io.d1 := Regfile(io.rs1)
  }
  .otherwise{
    io.d1 :=0.S
  }
  when(io.rs2.orR) {
    io.d2 := Regfile(io.rs2)
  }
  .otherwise{
    io.d2 :=0.S
  }
  when(io.rd.orR && io.wenb===1.B) {
    Regfile(io.rd) := io.data
    valid:=1.B
  }
  io.valid:=valid

}
