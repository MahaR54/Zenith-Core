package singlecycle
import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class single_cyclesTest extends FreeSpec with ChiselScalatestTester {
  "Chisel Tester file " in {
    test(new single_cycle) { a =>
      //  a.io.rdata.poke(1.U)
      // a.io.rdata(1).poke(1.U)
      // a.io.rdata(2).poke(1.U)
      // a.io.rdata(3).poke(1.U)
      a.clock.step(300)
    }
  }
}