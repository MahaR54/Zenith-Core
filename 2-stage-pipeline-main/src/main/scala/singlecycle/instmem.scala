package singlecycle
import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class instmem(initFile: String) extends Module {
  var io = IO(new IO_Mem)

  val pre= Wire(UInt(32.W))
    dontTouch(pre)
  

  io.valid:=0.B
  io.rdata:=0.U
  val memory =SyncReadMem(1024, UInt(32.W))
  loadMemoryFromFile(memory, initFile)
  io.rdata:=memory((io.address)>>2.U)
  
  val prevValueReg = RegInit(0.U(32.W))
  when(true.B) {
    prevValueReg := io.address
  }
  pre := prevValueReg



  //  when(!io.req){
//  }

  // .otherwise{
  //    io.rdata:=0.U
 
  //    io.valid:=1.B

  //  }
// when(io.rdata(6,0)=== "b1100011".asUInt){
//   io.valid:=1.B
// }
    }