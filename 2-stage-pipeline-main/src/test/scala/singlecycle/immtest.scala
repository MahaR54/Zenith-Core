package singlecycle
import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class immtest extends FreeSpec with ChiselScalatestTester {
  "Chisel Tester file " in {
    test(new imm) { a =>
       a.io.ins.poke("b1 111111 00011 00010 001 1110 1 1100011".U)
      a.io.pc_out.poke(1.U)
      a.io.out.expect(8.S)
      a.clock.step(300)
    }
  }
}