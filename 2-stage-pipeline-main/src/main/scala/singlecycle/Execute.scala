package singlecycle
import chisel3._
import chisel3.util._
object R_I {

  val ALU_ADD = 0.U(4.W)
  val ALU_SLL = 1.U(4.W)
  val ALU_SLT = 2.U(4.W)
  val ALU_SLTU = 3.U(4.W)
  val ALU_XOR = 4.U(4.W)
  val ALU_SRL = 5.U(4.W)
  val ALU_OR = 6.U(4.W)
  val ALU_AND = 7.U(4.W)
  val ALU_SUB = 8.U(4.W)
  val ALU_SRA = 13.U(4.W)
}

object Branch {

  val ALU_Beq = 0.U(4.W)
  val ALU_Bne = 1.U(4.W)
  val ALU_Blt = 4.U(4.W)
  val ALU_Bge = 5.U(4.W)
  val ALU_Bltu = 6.U(4.W)
  val ALU_Bgeu = 7.U(4.W)
}

import R_I._
import Branch._

class IO_Interface(widthio: Int) extends Bundle {
  val opcode = Input(UInt(7.W))
  val alu_op = Input(UInt(4.W))
  val arg_x = Input(SInt(widthio.W))
  val arg_y = Input(SInt(widthio.W))
  val alu_out = Output(SInt(widthio.W))
}

class Execute(width: Int) extends Module {
  var io = IO(new IO_Interface(width))
  io.alu_out := 0.S
  when((io.opcode === "b0110011".U) || (io.opcode === "b0010011".U)) {
    when(io.alu_op === ALU_ADD) {
      io.alu_out := io.arg_x + io.arg_y
    }
      .elsewhen(io.alu_op === ALU_SUB) {
        io.alu_out := io.arg_x - io.arg_y
      }
      .elsewhen(io.alu_op === ALU_AND) {
        io.alu_out := io.arg_x & io.arg_y
      }
      .elsewhen(io.alu_op === ALU_OR) {
        io.alu_out := io.arg_x | io.arg_y
      }
      .elsewhen(io.alu_op === ALU_XOR) {
        io.alu_out := io.arg_x ^ io.arg_y
      }
      .elsewhen(io.alu_op === ALU_SLT) {
        io.alu_out := (io.arg_x < io.arg_y).asSInt
      }
      .elsewhen(io.alu_op === ALU_SLL) {
        io.alu_out := (io.arg_x << io.arg_y(4, 0))
      }
      .elsewhen(io.alu_op === ALU_SLTU) {
        io.alu_out := ((io.arg_x < io.arg_y).asUInt).asSInt
      }
      .elsewhen(io.alu_op === ALU_SRL) {
        io.alu_out := (io.arg_x >> io.arg_y(4, 0))
      }
      .elsewhen(io.alu_op === ALU_SRA) {
        io.alu_out := (io.arg_x >> io.arg_y(4, 0))
      }
      .otherwise {
        io.alu_out := 0.S
      }
  }

    // load address calculation
    .elsewhen(io.opcode === "b0000011".U) {
      io.alu_out := io.arg_y + io.arg_x
    }
   
    // Branch
    .elsewhen(io.opcode === "b1100011".U) { // Branch instructions
      when(io.alu_op === ALU_Beq) {
        io.alu_out := Mux(io.arg_x === io.arg_y, 1.S, 0.S)
         }
         .elsewhen(io.alu_op === ALU_Bne) {
        io.alu_out := Mux(io.arg_x =/= io.arg_y, 1.S, 0.S)
      }
      .elsewhen(io.alu_op === ALU_Blt) {
        io.alu_out := Mux(io.arg_x < io.arg_y, 1.S, 0.S)
      }.elsewhen(io.alu_op === ALU_Bge) {
        io.alu_out := Mux(io.arg_x >= io.arg_y, 1.S, 0.S)
      }.elsewhen(io.alu_op === ALU_Bltu) {
        io.alu_out := Mux(io.arg_x.asUInt < io.arg_y.asUInt, 1.S, 0.S)
      }.elsewhen(io.alu_op === ALU_Bgeu) {
        io.alu_out := Mux(io.arg_x.asUInt >= io.arg_y.asUInt, 1.S, 0.S)
      }
      .otherwise{
      io.alu_out := 0.S

      }
    }
    //jalr 
.elsewhen(io.opcode === "b1100111".U) {
      io.alu_out := io.arg_x + io.arg_y
    }
    .elsewhen(io.opcode === "b0110111".U) {//lui
      io.alu_out :=io.arg_y
    }
    .elsewhen(io.opcode === "b0010111".U) {//auipc
      io.alu_out :=io.arg_y
    }
    
}

    