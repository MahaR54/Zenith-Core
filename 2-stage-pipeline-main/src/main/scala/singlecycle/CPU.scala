package singlecycle
import chisel3._
import chisel3.util._

class CPU extends Module {
  val io = IO(new Bundle {
    val loadin=Input(SInt(32.W))
    val dmaddress=Output(UInt(32.W))
    val dmemin=Output(SInt(32.W))
    val store=Output(Bool())
    val load=Output(Bool())
    
    val rdata=Input(UInt(32.W))
    val address=Output(UInt(32.W))

    val valid = Input(Bool())
    val req = Output(Bool())
    


//    val =Input(UInt(32.W))
  })
  val fetch = Module(new Fetch)
  dontTouch(fetch.io)

  val decode = Module(new Decode)
  dontTouch(decode.io)
  
  val execute = Module(new Execute(32))
  dontTouch(execute.io)

  // val mem = Module(new Mem)
  // dontTouch(mem.io)
  
  val wback = Module(new WB)
  dontTouch(wback.io)
  

    val preout=RegInit(0.U(8.W))
    preout:=fetch.io.preout

    decode.io.regdata:=wback.io.data

    val a= Wire(UInt(32.W))
    val preinst=RegInit(0.U(32.W))
    preinst:=io.rdata
    a:=preinst


    val preinsts=RegInit(0.U(32.W))
    preinsts:=a
    dontTouch(a)
    dontTouch(preinsts)
    val b= Wire(SInt(32.W))
    val pre_branch_result=RegInit(0.S(32.W))
    pre_branch_result:=execute.io.alu_out
    b:=pre_branch_result
    dontTouch(b)



  io.store:=decode.io.store
  io.load:=decode.io.load
  io.dmemin:=decode.io.read2
  io.address:=fetch.io.out
  io.req:=fetch.io.req
  fetch.io.valid:=io.valid

  // connections of fetch //
  // fetch.io.valid:=Mux((decode.io.instout(6,0)==="b0000011".U)|| (decode.io.instout(6,0)==="b1100011".U)  ||(decode.io.instout(6,0)==="b1101111".U),1.B,0.B)
  fetch.io.enb:=decode.io.reg_enb
  fetch.io.branch:=b
  fetch.io.in:= Mux(decode.io.instout(6,0)==="b1101111".U,(decode.io.immout).asUInt,//jal
    Mux(decode.io.instout(6,0)==="b1100011".U,// branch
    Mux(execute.io.alu_out===1.S,(decode.io.immout<<1.U).asUInt,4.U),
    Mux(decode.io.instout(6,0)==="b1100111".U, (execute.io.alu_out).asUInt,4.U)))//jalr

fetch.io.inst:=io.rdata
    //connections of Decode //

    decode.io.instruction:=Mux(((a(6,0)==="b1100011".asUInt) & b===1.S)|(a(6,0)==="b1100111".asUInt)|((a(6,0)==="b1101111".asUInt) & !(preinsts(6,0)==="b1101111".asUInt))
    ,0.U,io.rdata)
    decode.io.pcout:=fetch.io.out

    //connections of execute
    
    execute.io.opcode:=decode.io.instout(6,0)
    execute.io.alu_op:=decode.io.op
    execute.io.arg_x:=decode.io.read1
    execute.io.arg_y:=Mux((decode.io.instout(6,0)==="b0110011".U)|| 
    (decode.io.instout(6,0)==="b0100011".U ) || 
    (decode.io.instout(6,0)==="b1100011".U ),decode.io.read2,
    Mux((decode.io.instout(6,0)==="b0010011".U) ||(decode.io.instout(6,0)==="b0000011".U) ||(decode.io.instout(6,0)==="b1100111".U) 
    ||(decode.io.instout(6,0)==="b0110111".U)|(decode.io.instout(6,0)==="b0010111".U)|| (decode.io.instout(6,0)==="b1101111".U)
    ,decode.io.immout,0.S))  
     

    //connections of Memory //
    // mem.io.mask(0):=0.B
    // mem.io.mask(1):=0.B
    // mem.io.mask(2):=0.B
    // mem.io.mask(3):=0.B

    // mem.io.fun3:=decode.io.op
    //mem.io.load:=decode.io.load
    // mem.io.address:=Mux(decode.io.instout(6,0)==="b0000011".U,(execute.io.alu_out).asUInt,
    // Mux(decode.io.instout(6,0)==="b0100011".U,(Cat(decode.io.instout(31,25),decode.io.instout(11,7))+(decode.io.read1).asUInt).asUInt,0.U))
    // mem.io.rdata:=0.U
    //mem.io.enb:=decode.io.writereg
    //mem.io.store:=decode.io.store


    ///
    wback.io.lout:=io.loadin//io.loadout
    wback.io.ins:=decode.io.instruction
    wback.io.alu_out:=execute.io.alu_out
    wback.io.pcout:=fetch.io.preout

        io.dmaddress:=Mux(decode.io.instout(6,0)==="b0000011".U,(execute.io.alu_out).asUInt,
    Mux(decode.io.instout(6,0)==="b0100011".U,(Cat(decode.io.instout(31,25),decode.io.instout(11,7))+(decode.io.read1).asUInt).asUInt,0.U))

/////////////////////////////////////////////////////////

}