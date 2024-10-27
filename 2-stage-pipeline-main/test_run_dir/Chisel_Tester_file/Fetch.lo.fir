circuit Fetch :
  module Fetch :
    input clock : Clock
    input reset : UInt<1>
    input io_enb : UInt<1>
    input io_in : UInt<32>
    output io_out : UInt<32>

    reg PCs : UInt<32>, clock with :
      reset => (UInt<1>("h0"), PCs) @[Fetch.scala 11:20]
    node _pc_buffer_T = add(PCs, io_in) @[Fetch.scala 12:41]
    node _pc_buffer_T_1 = tail(_pc_buffer_T, 1) @[Fetch.scala 12:41]
    node pc_buffer = mux(io_enb, io_in, _pc_buffer_T_1) @[Fetch.scala 12:24]
    io_out <= PCs @[Fetch.scala 14:11]
    PCs <= mux(reset, UInt<32>("h0"), pc_buffer) @[Fetch.scala 11:20 Fetch.scala 11:20 Fetch.scala 13:8]
