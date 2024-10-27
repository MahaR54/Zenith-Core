file://<HOME>/Documents/single%20cycle/src/main/scala/singlecycle/CPU.scala
### file%3A%2F%2F%2Fhome%2Fadeia%2FDocuments%2Fsingle%2520cycle%2Fsrc%2Fmain%2Fscala%2Fsinglecycle%2FCPU.scala:82: error: ; expected but , found
    ,0.U,io.rdata)
    ^

occurred in the presentation compiler.

action parameters:
uri: file://<HOME>/Documents/single%20cycle/src/main/scala/singlecycle/CPU.scala
text:
```scala
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

    decode.io.instruction:=Mux(((a(6,0)==="b1100011".asUInt) & b===1.S)|(a(6,0)==="b1100111".asUInt)|((a(6,0)==="b1101111".asUInt) ))
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
(decode.io.instout(6,0)==="b0110111".U)|(decode.io.instout(6,0)==="b0010111".U)|| (decode.io.instout(6,0)==="b1101111".U)
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
```



#### Error stacktrace:

```
scala.meta.internal.parsers.Reporter.syntaxError(Reporter.scala:16)
	scala.meta.internal.parsers.Reporter.syntaxError$(Reporter.scala:16)
	scala.meta.internal.parsers.Reporter$$anon$1.syntaxError(Reporter.scala:22)
	scala.meta.internal.parsers.Reporter.syntaxError(Reporter.scala:17)
	scala.meta.internal.parsers.Reporter.syntaxError$(Reporter.scala:17)
	scala.meta.internal.parsers.Reporter$$anon$1.syntaxError(Reporter.scala:22)
	scala.meta.internal.parsers.ScalametaParser.syntaxErrorExpected(ScalametaParser.scala:367)
	scala.meta.internal.parsers.ScalametaParser.expect(ScalametaParser.scala:369)
	scala.meta.internal.parsers.ScalametaParser.accept(ScalametaParser.scala:373)
	scala.meta.internal.parsers.ScalametaParser.acceptStatSep(ScalametaParser.scala:389)
	scala.meta.internal.parsers.ScalametaParser.acceptStatSepOpt(ScalametaParser.scala:393)
	scala.meta.internal.parsers.ScalametaParser.statSeqBuf(ScalametaParser.scala:4357)
	scala.meta.internal.parsers.ScalametaParser.getStats$2(ScalametaParser.scala:4399)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$scala$meta$internal$parsers$ScalametaParser$$templateStatSeq$3(ScalametaParser.scala:4400)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$scala$meta$internal$parsers$ScalametaParser$$templateStatSeq$3$adapted(ScalametaParser.scala:4397)
	scala.meta.internal.parsers.ScalametaParser.scala$meta$internal$parsers$ScalametaParser$$listBy(ScalametaParser.scala:505)
	scala.meta.internal.parsers.ScalametaParser.scala$meta$internal$parsers$ScalametaParser$$templateStatSeq(ScalametaParser.scala:4397)
	scala.meta.internal.parsers.ScalametaParser.scala$meta$internal$parsers$ScalametaParser$$templateStatSeq(ScalametaParser.scala:4386)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$templateBody$1(ScalametaParser.scala:4237)
	scala.meta.internal.parsers.ScalametaParser.inBracesOr(ScalametaParser.scala:245)
	scala.meta.internal.parsers.ScalametaParser.inBraces(ScalametaParser.scala:241)
	scala.meta.internal.parsers.ScalametaParser.templateBody(ScalametaParser.scala:4237)
	scala.meta.internal.parsers.ScalametaParser.templateBodyOpt(ScalametaParser.scala:4241)
	scala.meta.internal.parsers.ScalametaParser.templateAfterExtends(ScalametaParser.scala:4184)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$template$1(ScalametaParser.scala:4205)
	scala.meta.internal.parsers.ScalametaParser.atPos(ScalametaParser.scala:300)
	scala.meta.internal.parsers.ScalametaParser.autoPos(ScalametaParser.scala:346)
	scala.meta.internal.parsers.ScalametaParser.template(ScalametaParser.scala:4192)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$templateOpt$1(ScalametaParser.scala:4230)
	scala.meta.internal.parsers.ScalametaParser.atPos(ScalametaParser.scala:300)
	scala.meta.internal.parsers.ScalametaParser.autoPos(ScalametaParser.scala:346)
	scala.meta.internal.parsers.ScalametaParser.templateOpt(ScalametaParser.scala:4222)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$classDef$1(ScalametaParser.scala:3866)
	scala.meta.internal.parsers.ScalametaParser.autoEndPos(ScalametaParser.scala:349)
	scala.meta.internal.parsers.ScalametaParser.autoEndPos(ScalametaParser.scala:354)
	scala.meta.internal.parsers.ScalametaParser.classDef(ScalametaParser.scala:3842)
	scala.meta.internal.parsers.ScalametaParser.tmplDef(ScalametaParser.scala:3801)
	scala.meta.internal.parsers.ScalametaParser.topLevelTmplDef(ScalametaParser.scala:3786)
	scala.meta.internal.parsers.ScalametaParser$$anonfun$2.applyOrElse(ScalametaParser.scala:4378)
	scala.meta.internal.parsers.ScalametaParser$$anonfun$2.applyOrElse(ScalametaParser.scala:4366)
	scala.PartialFunction.$anonfun$runWith$1$adapted(PartialFunction.scala:145)
	scala.meta.internal.parsers.ScalametaParser.statSeqBuf(ScalametaParser.scala:4357)
	scala.meta.internal.parsers.ScalametaParser.bracelessPackageStats$1(ScalametaParser.scala:4579)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$batchSource$11(ScalametaParser.scala:4590)
	scala.meta.internal.parsers.ScalametaParser.autoEndPos(ScalametaParser.scala:349)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$batchSource$10(ScalametaParser.scala:4590)
	scala.meta.internal.parsers.ScalametaParser.tryParse(ScalametaParser.scala:201)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$batchSource$1(ScalametaParser.scala:4582)
	scala.meta.internal.parsers.ScalametaParser.atPos(ScalametaParser.scala:300)
	scala.meta.internal.parsers.ScalametaParser.autoPos(ScalametaParser.scala:346)
	scala.meta.internal.parsers.ScalametaParser.batchSource(ScalametaParser.scala:4550)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$source$1(ScalametaParser.scala:4543)
	scala.meta.internal.parsers.ScalametaParser.atPos(ScalametaParser.scala:300)
	scala.meta.internal.parsers.ScalametaParser.autoPos(ScalametaParser.scala:346)
	scala.meta.internal.parsers.ScalametaParser.source(ScalametaParser.scala:4543)
	scala.meta.internal.parsers.ScalametaParser.entrypointSource(ScalametaParser.scala:4548)
	scala.meta.internal.parsers.ScalametaParser.parseSourceImpl(ScalametaParser.scala:127)
	scala.meta.internal.parsers.ScalametaParser.$anonfun$parseSource$1(ScalametaParser.scala:124)
	scala.meta.internal.parsers.ScalametaParser.parseRuleAfterBOF(ScalametaParser.scala:51)
	scala.meta.internal.parsers.ScalametaParser.parseRule(ScalametaParser.scala:46)
	scala.meta.internal.parsers.ScalametaParser.parseSource(ScalametaParser.scala:124)
	scala.meta.parsers.Parse$.$anonfun$parseSource$1(Parse.scala:29)
	scala.meta.parsers.Parse$$anon$1.apply(Parse.scala:36)
	scala.meta.parsers.Api$XtensionParseDialectInput.parse(Api.scala:25)
	scala.meta.internal.semanticdb.scalac.ParseOps$XtensionCompilationUnitSource.toSource(ParseOps.scala:17)
	scala.meta.internal.semanticdb.scalac.TextDocumentOps$XtensionCompilationUnitDocument.toTextDocument(TextDocumentOps.scala:206)
	scala.meta.internal.pc.SemanticdbTextDocumentProvider.textDocument(SemanticdbTextDocumentProvider.scala:54)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$semanticdbTextDocument$1(ScalaPresentationCompiler.scala:374)
```
#### Short summary: 

file%3A%2F%2F%2Fhome%2Fadeia%2FDocuments%2Fsingle%2520cycle%2Fsrc%2Fmain%2Fscala%2Fsinglecycle%2FCPU.scala:82: error: ; expected but , found
    ,0.U,io.rdata)
    ^