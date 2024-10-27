package singlecycle
import chisel3._
import chisel3.util._

class imm extends Module {
  var io = IO(new Bundle {
    val ins = Input(UInt(32.W))
    val pc_out=Input(UInt(32.W))
    val out = Output(SInt(32.W))
  })
  io.out := 0.S
  switch(io.ins(6, 0)) {
    is(("b0010011".U)  ) { // I-format
      io.out :=  (io.ins(31, 20)).asSInt
    }
    is("b1100111".U)  { // I-format   jalr 
      io.out :=  Cat(Fill(20,io.ins(31))(io.ins(31, 20))).asSInt
    }
    is("b0100011".U) { // S-format
      io.out := (Cat(Fill(20, 0.U), Cat(io.ins(31, 24), io.ins(12, 7)))).asSInt
    }
    is("b1100011".U) { // B-format
      io.out := (Cat(Cat(io.ins(31), io.ins(7)), Cat(io.ins(30, 25), io.ins(11, 8)))).asSInt
      
    }
    is("b0110111".U) { // U-format
      io.out := (io.ins(31, 12)).asSInt

    }
    is("b0000011".U) { // L-format
      io.out := (Cat(Fill(20, 0.U), io.ins(31, 20))).asSInt
    }
    is("b1101111".U) { // J-format
      io.out := Cat(Fill(11, io.ins(31)), io.ins(31), io.ins(19, 12),io.ins(20),io.ins(30, 21),0.U).asSInt
    }
    is("b0010111".U) { // AUIPC-format
      io.out := ((Cat(Fill(20,0.U),io.ins(31,12)))+io.pc_out).asSInt
    }
    
    
  }
}