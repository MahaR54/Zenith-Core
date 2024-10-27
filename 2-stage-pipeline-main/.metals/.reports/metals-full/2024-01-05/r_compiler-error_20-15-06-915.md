file://<HOME>/Documents/single%20cycle/src/main/scala/singlecycle/Fetch.scala
### file%3A%2F%2F%2Fhome%2Fadeia%2FDocuments%2Fsingle%2520cycle%2Fsrc%2Fmain%2Fscala%2Fsinglecycle%2FFetch.scala:26: error: ; expected but , found
    (io.inst(6,0)==="b1101111".asUInt)),prevValueReg+io.in,PCs+io.in)
                                       ^

occurred in the presentation compiler.

action parameters:
uri: file://<HOME>/Documents/single%20cycle/src/main/scala/singlecycle/Fetch.scala
text:
```scala
package singlecycle
import chisel3._
import chisel3.util._

class Fetch extends Module{
    val io=IO(new Bundle{
        val enb=Input(Bool())
        val branch=Input(SInt(1.W))
        val in=Input(UInt(32.W))
        val inst=Input(UInt(32.W))
        val valid = Input(Bool())
        val out=Output(UInt(32.W))
        val preout=Output(UInt(32.W))
        val req=Output(Bool())
    })
    io.req:=0.B
    io.out:=0.U
    
    val PCs=RegInit(0.U(32.W))
    val prevValueReg = RegInit(0.U(32.W))
    val preinst = RegInit(0.U(32.W))
    val preinsts = RegInit(0.U(32.W))
    

    PCs:=Mux(((io.inst(6,0)==="b1100011".asUInt)  )|(io.inst(6,0)==="b1100111".asUInt)|
    (io.inst(6,0)==="b1101111".asUInt)),prevValueReg+io.in,PCs+io.in)
    io.out:=PCs
     
when(io.inst(6,0)==="b0000011".asUInt){
  io.req:=1.B
}
  when(true.B) {
    prevValueReg := io.out
  }
  when(true.B) {
    preinst := io.inst
  }
  dontTouch(preinst)
  io.preout := prevValueReg
  preinsts:=preinst
  dontTouch(io.branch)
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

file%3A%2F%2F%2Fhome%2Fadeia%2FDocuments%2Fsingle%2520cycle%2Fsrc%2Fmain%2Fscala%2Fsinglecycle%2FFetch.scala:26: error: ; expected but , found
    (io.inst(6,0)==="b1101111".asUInt)),prevValueReg+io.in,PCs+io.in)
                                       ^