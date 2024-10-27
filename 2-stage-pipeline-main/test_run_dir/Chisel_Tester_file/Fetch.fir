;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Fetch : 
  module Fetch : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enb : UInt<1>, flip in : UInt<32>, out : UInt<32>}
    
    reg PCs : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Fetch.scala 11:20]
    node _pc_buffer_T = add(PCs, io.in) @[Fetch.scala 12:41]
    node _pc_buffer_T_1 = tail(_pc_buffer_T, 1) @[Fetch.scala 12:41]
    node pc_buffer = mux(io.enb, io.in, _pc_buffer_T_1) @[Fetch.scala 12:24]
    PCs <= pc_buffer @[Fetch.scala 13:8]
    io.out <= PCs @[Fetch.scala 14:11]
    
