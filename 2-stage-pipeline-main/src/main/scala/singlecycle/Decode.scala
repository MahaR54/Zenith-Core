package singlecycle
import chisel3._
import chisel3.util._

class Decode extends Module {
  var io = IO(new Bundle {
    val instruction=Input(UInt(32.W))
    val pcout=Input(UInt(32.W))
    val regdata =Input(SInt(32.W))


    val reg_enb=Output(Bool())
    val instout=Output(UInt(32.W))
    val immout=Output(SInt(32.W))
    val read1=Output(SInt(32.W))
    val read2=Output(SInt(32.W))
    val op=Output(UInt(4.W))
    val opcode=Output(UInt(7.W))
    val load=Output(Bool())
    val writereg=Output(Bool())
    val store=Output(Bool())
    val valid=Output(Bool())
    
    

  })

    val Reg= Module(new Regfile)
    dontTouch(Reg.io)
    val Imme= Module(new imm)
    dontTouch(Imme.io)
    val CU= Module(new controlunit)
    dontTouch(CU.io)

    /// connection of cu //
    CU.io.ins:=io.instruction
    /// connection of Imm //
    Imme.io.ins:=io.instruction
    Imme.io.pc_out:=io.pcout

    /// connection of Regfile //
    Reg.io.rs1:=CU.io.rs1
    Reg.io.rs2:=CU.io.rs2
    Reg.io.rd:=CU.io.rd
    Reg.io.data:=io.regdata
    Reg.io.wenb:=CU.io.writereg

    //connections of Decoder //
     io.read1:=Reg.io.d1
     io.read2:=Reg.io.d2
    io.reg_enb:=CU.io.reg_pc_enb
    io.instout:=io.instruction
  io.immout:=Imme.io.out
  io.op:=CU.io.op
  io.opcode:=io.instruction(6,0)
  io.load:=CU.io.load
  io.writereg:=CU.io.writereg
  io.store:=CU.io.store
  io.valid:=Reg.io.valid

}