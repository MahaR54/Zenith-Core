package singlecycle
import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class single_cycle extends Module{
    val io=IO(new Bundle{

    })

    val insmem= Module(new instmem("/home/maha/Downloads/2-stage-pipeline-main (1)/src/main/scala/singlecycle/input.txt"))
    dontTouch(insmem.io)

     val dmemory= Module(new datamemory)
    // dontTouch(dmemory.io)

     val cpu= Module(new CPU)
    dontTouch(cpu.io)


    //connections of insmem//
    insmem.io.address:=cpu.io.address
    insmem.io.req:=cpu.io.req

   //dmemory
    dmemory.io.in:=cpu.io.dmemin
    dmemory.io.address:=cpu.io.dmaddress
    dmemory.io.store:=cpu.io.store
    dmemory.io.load:=cpu.io.load

        //connections of cpu//
    cpu.io.rdata:=insmem.io.rdata
    cpu.io.loadin:=dmemory.io.out
    cpu.io.valid:=insmem.io.valid
}