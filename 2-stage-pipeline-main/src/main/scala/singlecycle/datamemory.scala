package singlecycle
import chisel3._
import chisel3.util._

class datamemory extends Module {
  val io = IO(new Bundle {
//     val func=Input(UInt(7.W))
    val in=Input(SInt(32.W))
     val address=Input(UInt(32.W))
     val store=Input(Bool())
     val out=Output(SInt(32.W))
     val load=Input(Bool())
  })
   val memory = Mem(1024, SInt(8.W))
  when(io.store) {
    memory.write(io.address, io.in)
  }
  io.out :=  memory(io.address)
     
}
