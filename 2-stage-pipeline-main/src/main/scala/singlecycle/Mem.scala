package singlecycle
import chisel3._
import chisel3.util._
class IO_Mem extends Bundle {

      val address = Input(UInt(32.W))
      val req = Input(Bool())
      // val wr_enb = Input(Bool())
      // val wdata = Input(UInt(32.W))

      val rdata = Output(UInt(32.W))
      val valid = Output(Bool())
  }