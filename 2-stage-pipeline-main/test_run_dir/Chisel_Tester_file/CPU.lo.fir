circuit CPU :
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

  module Regfile :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1 : UInt<5>
    input io_rs2 : UInt<5>
    input io_rd : UInt<5>
    input io_data : SInt<32>
    input io_wenb : UInt<1>
    output io_d1 : SInt<32>
    output io_d2 : SInt<32>

    reg Regfile_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_0) @[RegFile.scala 17:24]
    reg Regfile_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_1) @[RegFile.scala 17:24]
    reg Regfile_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_2) @[RegFile.scala 17:24]
    reg Regfile_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_3) @[RegFile.scala 17:24]
    reg Regfile_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_4) @[RegFile.scala 17:24]
    reg Regfile_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_5) @[RegFile.scala 17:24]
    reg Regfile_6 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_6) @[RegFile.scala 17:24]
    reg Regfile_7 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_7) @[RegFile.scala 17:24]
    reg Regfile_8 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_8) @[RegFile.scala 17:24]
    reg Regfile_9 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_9) @[RegFile.scala 17:24]
    reg Regfile_10 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_10) @[RegFile.scala 17:24]
    reg Regfile_11 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_11) @[RegFile.scala 17:24]
    reg Regfile_12 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_12) @[RegFile.scala 17:24]
    reg Regfile_13 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_13) @[RegFile.scala 17:24]
    reg Regfile_14 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_14) @[RegFile.scala 17:24]
    reg Regfile_15 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_15) @[RegFile.scala 17:24]
    reg Regfile_16 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_16) @[RegFile.scala 17:24]
    reg Regfile_17 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_17) @[RegFile.scala 17:24]
    reg Regfile_18 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_18) @[RegFile.scala 17:24]
    reg Regfile_19 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_19) @[RegFile.scala 17:24]
    reg Regfile_20 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_20) @[RegFile.scala 17:24]
    reg Regfile_21 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_21) @[RegFile.scala 17:24]
    reg Regfile_22 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_22) @[RegFile.scala 17:24]
    reg Regfile_23 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_23) @[RegFile.scala 17:24]
    reg Regfile_24 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_24) @[RegFile.scala 17:24]
    reg Regfile_25 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_25) @[RegFile.scala 17:24]
    reg Regfile_26 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_26) @[RegFile.scala 17:24]
    reg Regfile_27 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_27) @[RegFile.scala 17:24]
    reg Regfile_28 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_28) @[RegFile.scala 17:24]
    reg Regfile_29 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_29) @[RegFile.scala 17:24]
    reg Regfile_30 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_30) @[RegFile.scala 17:24]
    reg Regfile_31 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Regfile_31) @[RegFile.scala 17:24]
    node _T = orr(io_rs1) @[RegFile.scala 18:15]
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_rs1), Regfile_0) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_rs1), Regfile_1, _GEN_0) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_rs1), Regfile_2, _GEN_1) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_rs1), Regfile_3, _GEN_2) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_rs1), Regfile_4, _GEN_3) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_rs1), Regfile_5, _GEN_4) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_rs1), Regfile_6, _GEN_5) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_rs1), Regfile_7, _GEN_6) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_rs1), Regfile_8, _GEN_7) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_rs1), Regfile_9, _GEN_8) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_rs1), Regfile_10, _GEN_9) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_rs1), Regfile_11, _GEN_10) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_rs1), Regfile_12, _GEN_11) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_rs1), Regfile_13, _GEN_12) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_rs1), Regfile_14, _GEN_13) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_rs1), Regfile_15, _GEN_14) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_rs1), Regfile_16, _GEN_15) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_rs1), Regfile_17, _GEN_16) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_rs1), Regfile_18, _GEN_17) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_rs1), Regfile_19, _GEN_18) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_rs1), Regfile_20, _GEN_19) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_rs1), Regfile_21, _GEN_20) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_rs1), Regfile_22, _GEN_21) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_rs1), Regfile_23, _GEN_22) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_rs1), Regfile_24, _GEN_23) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_rs1), Regfile_25, _GEN_24) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_rs1), Regfile_26, _GEN_25) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_rs1), Regfile_27, _GEN_26) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_rs1), Regfile_28, _GEN_27) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_rs1), Regfile_29, _GEN_28) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_rs1), Regfile_30, _GEN_29) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_rs1), Regfile_31, _GEN_30) @[RegFile.scala 19:11 RegFile.scala 19:11]
    node _Regfile_io_rs1 = _GEN_31 @[RegFile.scala 19:11]
    node _GEN_32 = mux(_T, _Regfile_io_rs1, asSInt(UInt<1>("h0"))) @[RegFile.scala 18:20 RegFile.scala 19:11 RegFile.scala 22:11]
    node _T_1 = orr(io_rs2) @[RegFile.scala 24:15]
    node _GEN_33 = validif(eq(UInt<1>("h0"), io_rs2), Regfile_0) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_34 = mux(eq(UInt<1>("h1"), io_rs2), Regfile_1, _GEN_33) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_35 = mux(eq(UInt<2>("h2"), io_rs2), Regfile_2, _GEN_34) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_36 = mux(eq(UInt<2>("h3"), io_rs2), Regfile_3, _GEN_35) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_37 = mux(eq(UInt<3>("h4"), io_rs2), Regfile_4, _GEN_36) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_38 = mux(eq(UInt<3>("h5"), io_rs2), Regfile_5, _GEN_37) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_39 = mux(eq(UInt<3>("h6"), io_rs2), Regfile_6, _GEN_38) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_40 = mux(eq(UInt<3>("h7"), io_rs2), Regfile_7, _GEN_39) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_41 = mux(eq(UInt<4>("h8"), io_rs2), Regfile_8, _GEN_40) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_42 = mux(eq(UInt<4>("h9"), io_rs2), Regfile_9, _GEN_41) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_43 = mux(eq(UInt<4>("ha"), io_rs2), Regfile_10, _GEN_42) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_44 = mux(eq(UInt<4>("hb"), io_rs2), Regfile_11, _GEN_43) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_45 = mux(eq(UInt<4>("hc"), io_rs2), Regfile_12, _GEN_44) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_46 = mux(eq(UInt<4>("hd"), io_rs2), Regfile_13, _GEN_45) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_47 = mux(eq(UInt<4>("he"), io_rs2), Regfile_14, _GEN_46) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_48 = mux(eq(UInt<4>("hf"), io_rs2), Regfile_15, _GEN_47) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_49 = mux(eq(UInt<5>("h10"), io_rs2), Regfile_16, _GEN_48) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_50 = mux(eq(UInt<5>("h11"), io_rs2), Regfile_17, _GEN_49) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_51 = mux(eq(UInt<5>("h12"), io_rs2), Regfile_18, _GEN_50) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_52 = mux(eq(UInt<5>("h13"), io_rs2), Regfile_19, _GEN_51) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_53 = mux(eq(UInt<5>("h14"), io_rs2), Regfile_20, _GEN_52) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_54 = mux(eq(UInt<5>("h15"), io_rs2), Regfile_21, _GEN_53) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_55 = mux(eq(UInt<5>("h16"), io_rs2), Regfile_22, _GEN_54) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_56 = mux(eq(UInt<5>("h17"), io_rs2), Regfile_23, _GEN_55) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_57 = mux(eq(UInt<5>("h18"), io_rs2), Regfile_24, _GEN_56) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_58 = mux(eq(UInt<5>("h19"), io_rs2), Regfile_25, _GEN_57) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_59 = mux(eq(UInt<5>("h1a"), io_rs2), Regfile_26, _GEN_58) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_60 = mux(eq(UInt<5>("h1b"), io_rs2), Regfile_27, _GEN_59) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_61 = mux(eq(UInt<5>("h1c"), io_rs2), Regfile_28, _GEN_60) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_62 = mux(eq(UInt<5>("h1d"), io_rs2), Regfile_29, _GEN_61) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_63 = mux(eq(UInt<5>("h1e"), io_rs2), Regfile_30, _GEN_62) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _GEN_64 = mux(eq(UInt<5>("h1f"), io_rs2), Regfile_31, _GEN_63) @[RegFile.scala 25:11 RegFile.scala 25:11]
    node _Regfile_io_rs2 = _GEN_64 @[RegFile.scala 25:11]
    node _GEN_65 = mux(_T_1, _Regfile_io_rs2, asSInt(UInt<1>("h0"))) @[RegFile.scala 24:20 RegFile.scala 25:11 RegFile.scala 28:11]
    node _T_2 = orr(io_rd) @[RegFile.scala 30:14]
    node _T_3 = eq(io_wenb, UInt<1>("h1")) @[RegFile.scala 30:28]
    node _T_4 = and(_T_2, _T_3) @[RegFile.scala 30:18]
    node _Regfile_io_rd = io_data @[RegFile.scala 31:20 RegFile.scala 31:20]
    node _GEN_66 = mux(eq(UInt<1>("h0"), io_rd), _Regfile_io_rd, Regfile_0) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_67 = mux(eq(UInt<1>("h1"), io_rd), _Regfile_io_rd, Regfile_1) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_68 = mux(eq(UInt<2>("h2"), io_rd), _Regfile_io_rd, Regfile_2) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_69 = mux(eq(UInt<2>("h3"), io_rd), _Regfile_io_rd, Regfile_3) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_70 = mux(eq(UInt<3>("h4"), io_rd), _Regfile_io_rd, Regfile_4) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_71 = mux(eq(UInt<3>("h5"), io_rd), _Regfile_io_rd, Regfile_5) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_72 = mux(eq(UInt<3>("h6"), io_rd), _Regfile_io_rd, Regfile_6) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_73 = mux(eq(UInt<3>("h7"), io_rd), _Regfile_io_rd, Regfile_7) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_74 = mux(eq(UInt<4>("h8"), io_rd), _Regfile_io_rd, Regfile_8) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_75 = mux(eq(UInt<4>("h9"), io_rd), _Regfile_io_rd, Regfile_9) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_76 = mux(eq(UInt<4>("ha"), io_rd), _Regfile_io_rd, Regfile_10) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_77 = mux(eq(UInt<4>("hb"), io_rd), _Regfile_io_rd, Regfile_11) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_78 = mux(eq(UInt<4>("hc"), io_rd), _Regfile_io_rd, Regfile_12) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_79 = mux(eq(UInt<4>("hd"), io_rd), _Regfile_io_rd, Regfile_13) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_80 = mux(eq(UInt<4>("he"), io_rd), _Regfile_io_rd, Regfile_14) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_81 = mux(eq(UInt<4>("hf"), io_rd), _Regfile_io_rd, Regfile_15) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_82 = mux(eq(UInt<5>("h10"), io_rd), _Regfile_io_rd, Regfile_16) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_83 = mux(eq(UInt<5>("h11"), io_rd), _Regfile_io_rd, Regfile_17) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_84 = mux(eq(UInt<5>("h12"), io_rd), _Regfile_io_rd, Regfile_18) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_85 = mux(eq(UInt<5>("h13"), io_rd), _Regfile_io_rd, Regfile_19) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_86 = mux(eq(UInt<5>("h14"), io_rd), _Regfile_io_rd, Regfile_20) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_87 = mux(eq(UInt<5>("h15"), io_rd), _Regfile_io_rd, Regfile_21) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_88 = mux(eq(UInt<5>("h16"), io_rd), _Regfile_io_rd, Regfile_22) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_89 = mux(eq(UInt<5>("h17"), io_rd), _Regfile_io_rd, Regfile_23) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_90 = mux(eq(UInt<5>("h18"), io_rd), _Regfile_io_rd, Regfile_24) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_91 = mux(eq(UInt<5>("h19"), io_rd), _Regfile_io_rd, Regfile_25) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_92 = mux(eq(UInt<5>("h1a"), io_rd), _Regfile_io_rd, Regfile_26) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_93 = mux(eq(UInt<5>("h1b"), io_rd), _Regfile_io_rd, Regfile_27) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_94 = mux(eq(UInt<5>("h1c"), io_rd), _Regfile_io_rd, Regfile_28) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_95 = mux(eq(UInt<5>("h1d"), io_rd), _Regfile_io_rd, Regfile_29) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_96 = mux(eq(UInt<5>("h1e"), io_rd), _Regfile_io_rd, Regfile_30) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_97 = mux(eq(UInt<5>("h1f"), io_rd), _Regfile_io_rd, Regfile_31) @[RegFile.scala 31:20 RegFile.scala 31:20 RegFile.scala 17:24]
    node _GEN_98 = mux(_T_4, _GEN_66, Regfile_0) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_99 = mux(_T_4, _GEN_67, Regfile_1) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_100 = mux(_T_4, _GEN_68, Regfile_2) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_101 = mux(_T_4, _GEN_69, Regfile_3) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_102 = mux(_T_4, _GEN_70, Regfile_4) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_103 = mux(_T_4, _GEN_71, Regfile_5) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_104 = mux(_T_4, _GEN_72, Regfile_6) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_105 = mux(_T_4, _GEN_73, Regfile_7) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_106 = mux(_T_4, _GEN_74, Regfile_8) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_107 = mux(_T_4, _GEN_75, Regfile_9) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_108 = mux(_T_4, _GEN_76, Regfile_10) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_109 = mux(_T_4, _GEN_77, Regfile_11) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_110 = mux(_T_4, _GEN_78, Regfile_12) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_111 = mux(_T_4, _GEN_79, Regfile_13) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_112 = mux(_T_4, _GEN_80, Regfile_14) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_113 = mux(_T_4, _GEN_81, Regfile_15) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_114 = mux(_T_4, _GEN_82, Regfile_16) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_115 = mux(_T_4, _GEN_83, Regfile_17) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_116 = mux(_T_4, _GEN_84, Regfile_18) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_117 = mux(_T_4, _GEN_85, Regfile_19) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_118 = mux(_T_4, _GEN_86, Regfile_20) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_119 = mux(_T_4, _GEN_87, Regfile_21) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_120 = mux(_T_4, _GEN_88, Regfile_22) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_121 = mux(_T_4, _GEN_89, Regfile_23) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_122 = mux(_T_4, _GEN_90, Regfile_24) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_123 = mux(_T_4, _GEN_91, Regfile_25) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_124 = mux(_T_4, _GEN_92, Regfile_26) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_125 = mux(_T_4, _GEN_93, Regfile_27) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_126 = mux(_T_4, _GEN_94, Regfile_28) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_127 = mux(_T_4, _GEN_95, Regfile_29) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_128 = mux(_T_4, _GEN_96, Regfile_30) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _GEN_129 = mux(_T_4, _GEN_97, Regfile_31) @[RegFile.scala 30:36 RegFile.scala 17:24]
    node _Regfile_WIRE_0 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_1 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_2 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_3 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_4 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_5 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_6 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_7 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_8 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_9 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_10 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_11 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_12 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_13 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_14 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_15 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_16 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_17 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_18 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_19 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_20 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_21 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_22 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_23 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_24 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_25 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_26 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_27 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_28 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_29 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_30 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    node _Regfile_WIRE_31 = asSInt(UInt<32>("h0")) @[RegFile.scala 17:32 RegFile.scala 17:32]
    io_d1 <= _GEN_32
    io_d2 <= _GEN_65
    Regfile_0 <= mux(reset, _Regfile_WIRE_0, _GEN_98) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_1 <= mux(reset, _Regfile_WIRE_1, _GEN_99) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_2 <= mux(reset, _Regfile_WIRE_2, _GEN_100) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_3 <= mux(reset, _Regfile_WIRE_3, _GEN_101) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_4 <= mux(reset, _Regfile_WIRE_4, _GEN_102) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_5 <= mux(reset, _Regfile_WIRE_5, _GEN_103) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_6 <= mux(reset, _Regfile_WIRE_6, _GEN_104) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_7 <= mux(reset, _Regfile_WIRE_7, _GEN_105) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_8 <= mux(reset, _Regfile_WIRE_8, _GEN_106) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_9 <= mux(reset, _Regfile_WIRE_9, _GEN_107) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_10 <= mux(reset, _Regfile_WIRE_10, _GEN_108) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_11 <= mux(reset, _Regfile_WIRE_11, _GEN_109) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_12 <= mux(reset, _Regfile_WIRE_12, _GEN_110) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_13 <= mux(reset, _Regfile_WIRE_13, _GEN_111) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_14 <= mux(reset, _Regfile_WIRE_14, _GEN_112) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_15 <= mux(reset, _Regfile_WIRE_15, _GEN_113) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_16 <= mux(reset, _Regfile_WIRE_16, _GEN_114) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_17 <= mux(reset, _Regfile_WIRE_17, _GEN_115) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_18 <= mux(reset, _Regfile_WIRE_18, _GEN_116) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_19 <= mux(reset, _Regfile_WIRE_19, _GEN_117) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_20 <= mux(reset, _Regfile_WIRE_20, _GEN_118) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_21 <= mux(reset, _Regfile_WIRE_21, _GEN_119) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_22 <= mux(reset, _Regfile_WIRE_22, _GEN_120) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_23 <= mux(reset, _Regfile_WIRE_23, _GEN_121) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_24 <= mux(reset, _Regfile_WIRE_24, _GEN_122) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_25 <= mux(reset, _Regfile_WIRE_25, _GEN_123) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_26 <= mux(reset, _Regfile_WIRE_26, _GEN_124) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_27 <= mux(reset, _Regfile_WIRE_27, _GEN_125) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_28 <= mux(reset, _Regfile_WIRE_28, _GEN_126) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_29 <= mux(reset, _Regfile_WIRE_29, _GEN_127) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_30 <= mux(reset, _Regfile_WIRE_30, _GEN_128) @[RegFile.scala 17:24 RegFile.scala 17:24]
    Regfile_31 <= mux(reset, _Regfile_WIRE_31, _GEN_129) @[RegFile.scala 17:24 RegFile.scala 17:24]

  module imm :
    input clock : Clock
    input reset : UInt<1>
    input io_ins : UInt<32>
    input io_pc_out : UInt<32>
    output io_out : SInt<32>

    node _T = bits(io_ins, 6, 0) @[imm.scala 12:16]
    node _T_1 = eq(UInt<5>("h13"), _T) @[Conditional.scala 37:30]
    node _io_out_T = bits(io_ins, 31, 20) @[imm.scala 14:25]
    node _io_out_T_1 = asSInt(_io_out_T) @[imm.scala 14:35]
    node _T_2 = eq(UInt<7>("h67"), _T) @[Conditional.scala 37:30]
    node _io_out_T_2 = bits(io_ins, 31, 31) @[imm.scala 17:36]
    node _io_out_T_3 = bits(_io_out_T_2, 0, 0) @[Bitwise.scala 72:15]
    node _io_out_T_4 = mux(_io_out_T_3, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node _io_out_T_5 = bits(io_ins, 31, 20) @[imm.scala 17:48]
    node _io_out_T_6 = dshr(_io_out_T_4, _io_out_T_5) @[imm.scala 17:41]
    node _io_out_T_7 = bits(_io_out_T_6, 0, 0) @[imm.scala 17:41]
    node _io_out_T_8 = asSInt(_io_out_T_7) @[imm.scala 17:59]
    node _T_3 = eq(UInt<6>("h23"), _T) @[Conditional.scala 37:30]
    node io_out_hi = mux(UInt<1>("h0"), UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_out_hi_1 = bits(io_ins, 31, 24) @[imm.scala 20:47]
    node io_out_lo = bits(io_ins, 12, 7) @[imm.scala 20:63]
    node io_out_lo_1 = cat(io_out_hi_1, io_out_lo) @[Cat.scala 30:58]
    node _io_out_T_9 = cat(io_out_hi, io_out_lo_1) @[Cat.scala 30:58]
    node _io_out_T_10 = asSInt(_io_out_T_9) @[imm.scala 20:74]
    node _T_4 = eq(UInt<7>("h63"), _T) @[Conditional.scala 37:30]
    node io_out_hi_2 = bits(io_ins, 31, 31) @[imm.scala 23:32]
    node io_out_lo_2 = bits(io_ins, 7, 7) @[imm.scala 23:44]
    node io_out_hi_3 = cat(io_out_hi_2, io_out_lo_2) @[Cat.scala 30:58]
    node io_out_hi_4 = bits(io_ins, 30, 25) @[imm.scala 23:60]
    node io_out_lo_3 = bits(io_ins, 11, 8) @[imm.scala 23:76]
    node io_out_lo_4 = cat(io_out_hi_4, io_out_lo_3) @[Cat.scala 30:58]
    node _io_out_T_11 = cat(io_out_hi_3, io_out_lo_4) @[Cat.scala 30:58]
    node _io_out_T_12 = asSInt(_io_out_T_11) @[imm.scala 23:87]
    node _T_5 = eq(UInt<6>("h37"), _T) @[Conditional.scala 37:30]
    node _io_out_T_13 = bits(io_ins, 31, 12) @[imm.scala 27:24]
    node _io_out_T_14 = asSInt(_io_out_T_13) @[imm.scala 27:34]
    node _T_6 = eq(UInt<2>("h3"), _T) @[Conditional.scala 37:30]
    node io_out_hi_5 = mux(UInt<1>("h0"), UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_out_lo_5 = bits(io_ins, 31, 20) @[imm.scala 31:43]
    node _io_out_T_15 = cat(io_out_hi_5, io_out_lo_5) @[Cat.scala 30:58]
    node _io_out_T_16 = asSInt(_io_out_T_15) @[imm.scala 31:54]
    node _T_7 = eq(UInt<7>("h6f"), _T) @[Conditional.scala 37:30]
    node _io_out_T_17 = bits(io_ins, 31, 31) @[imm.scala 34:36]
    node _io_out_T_18 = bits(_io_out_T_17, 0, 0) @[Bitwise.scala 72:15]
    node io_out_hi_hi_hi = mux(_io_out_T_18, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_out_hi_hi_lo = bits(io_ins, 31, 31) @[imm.scala 34:49]
    node io_out_hi_lo = bits(io_ins, 19, 12) @[imm.scala 34:61]
    node io_out_lo_hi_hi = bits(io_ins, 20, 20) @[imm.scala 34:76]
    node io_out_lo_hi_lo = bits(io_ins, 30, 21) @[imm.scala 34:87]
    node io_out_lo_hi = cat(io_out_lo_hi_hi, io_out_lo_hi_lo) @[Cat.scala 30:58]
    node io_out_lo_6 = cat(io_out_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_out_hi_hi = cat(io_out_hi_hi_hi, io_out_hi_hi_lo) @[Cat.scala 30:58]
    node io_out_hi_6 = cat(io_out_hi_hi, io_out_hi_lo) @[Cat.scala 30:58]
    node _io_out_T_19 = cat(io_out_hi_6, io_out_lo_6) @[Cat.scala 30:58]
    node _io_out_T_20 = asSInt(_io_out_T_19) @[imm.scala 34:101]
    node _T_8 = eq(UInt<5>("h17"), _T) @[Conditional.scala 37:30]
    node io_out_hi_7 = mux(UInt<1>("h0"), UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_out_lo_7 = bits(io_ins, 31, 12) @[imm.scala 37:42]
    node _io_out_T_21 = cat(io_out_hi_7, io_out_lo_7) @[Cat.scala 30:58]
    node _io_out_T_22 = add(_io_out_T_21, io_pc_out) @[imm.scala 37:51]
    node _io_out_T_23 = tail(_io_out_T_22, 1) @[imm.scala 37:51]
    node _io_out_T_24 = asSInt(_io_out_T_23) @[imm.scala 37:63]
    node _GEN_0 = mux(_T_8, _io_out_T_24, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 imm.scala 37:14 imm.scala 11:10]
    node _GEN_1 = mux(_T_7, _io_out_T_20, _GEN_0) @[Conditional.scala 39:67 imm.scala 34:14]
    node _GEN_2 = mux(_T_6, _io_out_T_16, _GEN_1) @[Conditional.scala 39:67 imm.scala 31:14]
    node _GEN_3 = mux(_T_5, _io_out_T_14, _GEN_2) @[Conditional.scala 39:67 imm.scala 27:14]
    node _GEN_4 = mux(_T_4, _io_out_T_12, _GEN_3) @[Conditional.scala 39:67 imm.scala 23:14]
    node _GEN_5 = mux(_T_3, _io_out_T_10, _GEN_4) @[Conditional.scala 39:67 imm.scala 20:14]
    node _GEN_6 = mux(_T_2, _io_out_T_8, _GEN_5) @[Conditional.scala 39:67 imm.scala 17:14]
    node _GEN_7 = mux(_T_1, _io_out_T_1, _GEN_6) @[Conditional.scala 40:58 imm.scala 14:14]
    io_out <= asSInt(bits(_GEN_7, 31, 0))

  module controlunit :
    input clock : Clock
    input reset : UInt<1>
    input io_ins : UInt<32>
    output io_rs1 : UInt<5>
    output io_rs2 : UInt<5>
    output io_rd : UInt<5>
    output io_op : UInt<4>
    output io_writereg : UInt<1>
    output io_load : UInt<1>
    output io_store : UInt<1>
    output io_auipc : UInt<32>
    output io_reg_pc_enb : UInt<1>

    node _io_rd_T = bits(io_ins, 11, 7) @[Controlunit.scala 19:18]
    node _io_rs1_T = bits(io_ins, 19, 15) @[Controlunit.scala 20:19]
    node _io_rs2_T = bits(io_ins, 24, 20) @[Controlunit.scala 21:19]
    node _io_op_T = bits(io_ins, 6, 0) @[Controlunit.scala 22:22]
    node _io_op_T_1 = eq(_io_op_T, UInt<6>("h33")) @[Controlunit.scala 22:27]
    node io_op_hi = bits(io_ins, 30, 30) @[Controlunit.scala 22:53]
    node io_op_lo = bits(io_ins, 14, 12) @[Controlunit.scala 22:64]
    node _io_op_T_2 = cat(io_op_hi, io_op_lo) @[Cat.scala 30:58]
    node _io_op_T_3 = bits(io_ins, 14, 12) @[Controlunit.scala 22:79]
    node _io_op_T_4 = mux(_io_op_T_1, _io_op_T_2, _io_op_T_3) @[Controlunit.scala 22:15]
    node _io_writereg_T = bits(io_ins, 6, 0) @[Controlunit.scala 23:29]
    node _io_writereg_T_1 = eq(_io_writereg_T, UInt<6>("h33")) @[Controlunit.scala 23:34]
    node _io_writereg_T_2 = bits(io_ins, 6, 0) @[Controlunit.scala 24:14]
    node _io_writereg_T_3 = eq(_io_writereg_T_2, UInt<5>("h13")) @[Controlunit.scala 24:19]
    node _io_writereg_T_4 = or(_io_writereg_T_1, _io_writereg_T_3) @[Controlunit.scala 23:50]
    node _io_writereg_T_5 = bits(io_ins, 6, 0) @[Controlunit.scala 25:13]
    node _io_writereg_T_6 = eq(_io_writereg_T_5, UInt<2>("h3")) @[Controlunit.scala 25:18]
    node _io_writereg_T_7 = or(_io_writereg_T_4, _io_writereg_T_6) @[Controlunit.scala 24:35]
    node _io_writereg_T_8 = bits(io_ins, 6, 0) @[Controlunit.scala 26:13]
    node _io_writereg_T_9 = eq(_io_writereg_T_8, UInt<6>("h37")) @[Controlunit.scala 26:18]
    node _io_writereg_T_10 = or(_io_writereg_T_7, _io_writereg_T_9) @[Controlunit.scala 25:35]
    node _io_writereg_T_11 = bits(io_ins, 6, 0) @[Controlunit.scala 27:13]
    node _io_writereg_T_12 = eq(_io_writereg_T_11, UInt<7>("h6f")) @[Controlunit.scala 27:18]
    node _io_writereg_T_13 = or(_io_writereg_T_10, _io_writereg_T_12) @[Controlunit.scala 26:35]
    node _io_writereg_T_14 = bits(io_ins, 6, 0) @[Controlunit.scala 28:13]
    node _io_writereg_T_15 = eq(_io_writereg_T_14, UInt<5>("h17")) @[Controlunit.scala 28:18]
    node _io_writereg_T_16 = or(_io_writereg_T_13, _io_writereg_T_15) @[Controlunit.scala 27:34]
    node _io_writereg_T_17 = mux(_io_writereg_T_16, UInt<1>("h1"), UInt<1>("h0")) @[Controlunit.scala 23:21]
    node _io_load_T = bits(io_ins, 6, 0) @[Controlunit.scala 29:24]
    node _io_load_T_1 = eq(_io_load_T, UInt<2>("h3")) @[Controlunit.scala 29:29]
    node _io_load_T_2 = mux(_io_load_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Controlunit.scala 29:17]
    node _io_store_T = bits(io_ins, 6, 0) @[Controlunit.scala 30:25]
    node _io_store_T_1 = eq(_io_store_T, UInt<6>("h23")) @[Controlunit.scala 30:30]
    node _io_store_T_2 = mux(_io_store_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Controlunit.scala 30:18]
    node io_auipc_hi = mux(UInt<1>("h0"), UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_auipc_lo = bits(io_ins, 31, 12) @[Controlunit.scala 31:40]
    node _io_auipc_T = cat(io_auipc_hi, io_auipc_lo) @[Cat.scala 30:58]
    node _io_reg_pc_enb_T = bits(io_ins, 6, 0) @[Controlunit.scala 32:30]
    node _io_reg_pc_enb_T_1 = eq(_io_reg_pc_enb_T, UInt<7>("h67")) @[Controlunit.scala 32:35]
    node _io_reg_pc_enb_T_2 = mux(_io_reg_pc_enb_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Controlunit.scala 32:23]
    io_rs1 <= _io_rs1_T @[Controlunit.scala 20:11]
    io_rs2 <= _io_rs2_T @[Controlunit.scala 21:11]
    io_rd <= _io_rd_T @[Controlunit.scala 19:10]
    io_op <= _io_op_T_4 @[Controlunit.scala 22:10]
    io_writereg <= _io_writereg_T_17 @[Controlunit.scala 23:16]
    io_load <= _io_load_T_2 @[Controlunit.scala 29:12]
    io_store <= _io_store_T_2 @[Controlunit.scala 30:13]
    io_auipc <= bits(_io_auipc_T, 31, 0) @[Controlunit.scala 31:14]
    io_reg_pc_enb <= _io_reg_pc_enb_T_2 @[Controlunit.scala 32:18]

  module Decode :
    input clock : Clock
    input reset : UInt<1>
    input io_instruction : UInt<32>
    input io_pcout : UInt<32>
    input io_regdata : SInt<32>
    output io_reg_enb : UInt<1>
    output io_instout : UInt<32>
    output io_immout : SInt<32>
    output io_read1 : SInt<32>
    output io_read2 : SInt<32>
    output io_op : UInt<4>
    output io_opcode : UInt<7>
    output io_load : UInt<1>
    output io_writereg : UInt<1>
    output io_store : UInt<1>

    inst Reg of Regfile @[Decode.scala 27:20]
    inst Imme of imm @[Decode.scala 29:21]
    inst CU of controlunit @[Decode.scala 31:19]
    node _io_opcode_T = bits(io_instruction, 6, 0) @[Decode.scala 55:28]
    io_reg_enb <= CU.io_reg_pc_enb @[Decode.scala 51:15]
    io_instout <= io_instruction @[Decode.scala 52:15]
    io_immout <= Imme.io_out @[Decode.scala 53:12]
    io_read1 <= Reg.io_d1 @[Decode.scala 49:14]
    io_read2 <= Reg.io_d2 @[Decode.scala 50:14]
    io_op <= CU.io_op @[Decode.scala 54:8]
    io_opcode <= _io_opcode_T @[Decode.scala 55:12]
    io_load <= CU.io_load @[Decode.scala 56:10]
    io_writereg <= CU.io_writereg @[Decode.scala 57:14]
    io_store <= CU.io_store @[Decode.scala 58:11]
    Reg.clock <= clock
    Reg.reset <= reset
    Reg.io_rs1 <= CU.io_rs1 @[Decode.scala 42:15]
    Reg.io_rs2 <= CU.io_rs2 @[Decode.scala 43:15]
    Reg.io_rd <= CU.io_rd @[Decode.scala 44:14]
    Reg.io_data <= io_regdata @[Decode.scala 45:16]
    Reg.io_wenb <= CU.io_writereg @[Decode.scala 46:16]
    Imme.clock <= clock
    Imme.reset <= reset
    Imme.io_ins <= io_instruction @[Decode.scala 38:16]
    Imme.io_pc_out <= io_pcout @[Decode.scala 39:19]
    CU.clock <= clock
    CU.reset <= reset
    CU.io_ins <= io_instruction @[Decode.scala 35:14]

  module Execute :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    input io_alu_op : UInt<4>
    input io_arg_x : SInt<32>
    input io_arg_y : SInt<32>
    output io_alu_out : SInt<32>

    node _T = eq(io_opcode, UInt<6>("h33")) @[Execute.scala 42:19]
    node _T_1 = eq(io_opcode, UInt<5>("h13")) @[Execute.scala 42:51]
    node _T_2 = or(_T, _T_1) @[Execute.scala 42:37]
    node _T_3 = eq(io_alu_op, UInt<4>("h0")) @[Execute.scala 43:20]
    node _io_alu_out_T = add(io_arg_x, io_arg_y) @[Execute.scala 44:30]
    node _io_alu_out_T_1 = tail(_io_alu_out_T, 1) @[Execute.scala 44:30]
    node _io_alu_out_T_2 = asSInt(_io_alu_out_T_1) @[Execute.scala 44:30]
    node _T_4 = eq(io_alu_op, UInt<4>("h8")) @[Execute.scala 46:27]
    node _io_alu_out_T_3 = sub(io_arg_x, io_arg_y) @[Execute.scala 47:32]
    node _io_alu_out_T_4 = tail(_io_alu_out_T_3, 1) @[Execute.scala 47:32]
    node _io_alu_out_T_5 = asSInt(_io_alu_out_T_4) @[Execute.scala 47:32]
    node _T_5 = eq(io_alu_op, UInt<4>("h7")) @[Execute.scala 49:27]
    node _io_alu_out_T_6 = and(io_arg_x, io_arg_y) @[Execute.scala 50:32]
    node _io_alu_out_T_7 = asSInt(_io_alu_out_T_6) @[Execute.scala 50:32]
    node _T_6 = eq(io_alu_op, UInt<4>("h6")) @[Execute.scala 52:27]
    node _io_alu_out_T_8 = or(io_arg_x, io_arg_y) @[Execute.scala 53:32]
    node _io_alu_out_T_9 = asSInt(_io_alu_out_T_8) @[Execute.scala 53:32]
    node _T_7 = eq(io_alu_op, UInt<4>("h4")) @[Execute.scala 55:27]
    node _io_alu_out_T_10 = xor(io_arg_x, io_arg_y) @[Execute.scala 56:32]
    node _io_alu_out_T_11 = asSInt(_io_alu_out_T_10) @[Execute.scala 56:32]
    node _T_8 = eq(io_alu_op, UInt<4>("h2")) @[Execute.scala 58:27]
    node _io_alu_out_T_12 = lt(io_arg_x, io_arg_y) @[Execute.scala 59:33]
    node _io_alu_out_T_13 = asSInt(_io_alu_out_T_12) @[Execute.scala 59:45]
    node _T_9 = eq(io_alu_op, UInt<4>("h1")) @[Execute.scala 61:27]
    node _io_alu_out_T_14 = bits(io_arg_y, 4, 0) @[Execute.scala 62:44]
    node _io_alu_out_T_15 = dshl(io_arg_x, _io_alu_out_T_14) @[Execute.scala 62:33]
    node _T_10 = eq(io_alu_op, UInt<4>("h3")) @[Execute.scala 64:27]
    node _io_alu_out_T_16 = lt(io_arg_x, io_arg_y) @[Execute.scala 65:34]
    node _io_alu_out_T_17 = asSInt(_io_alu_out_T_16) @[Execute.scala 65:54]
    node _T_11 = eq(io_alu_op, UInt<4>("h5")) @[Execute.scala 67:27]
    node _io_alu_out_T_18 = bits(io_arg_y, 4, 0) @[Execute.scala 68:44]
    node _io_alu_out_T_19 = dshr(io_arg_x, _io_alu_out_T_18) @[Execute.scala 68:33]
    node _T_12 = eq(io_alu_op, UInt<4>("hd")) @[Execute.scala 70:27]
    node _io_alu_out_T_20 = bits(io_arg_y, 4, 0) @[Execute.scala 71:44]
    node _io_alu_out_T_21 = dshr(io_arg_x, _io_alu_out_T_20) @[Execute.scala 71:33]
    node _GEN_0 = mux(_T_12, _io_alu_out_T_21, asSInt(UInt<1>("h0"))) @[Execute.scala 70:40 Execute.scala 71:20 Execute.scala 74:20]
    node _GEN_1 = mux(_T_11, _io_alu_out_T_19, _GEN_0) @[Execute.scala 67:40 Execute.scala 68:20]
    node _GEN_2 = mux(_T_10, _io_alu_out_T_17, _GEN_1) @[Execute.scala 64:41 Execute.scala 65:20]
    node _GEN_3 = mux(_T_9, _io_alu_out_T_15, _GEN_2) @[Execute.scala 61:40 Execute.scala 62:20]
    node _GEN_4 = mux(_T_8, _io_alu_out_T_13, _GEN_3) @[Execute.scala 58:40 Execute.scala 59:20]
    node _GEN_5 = mux(_T_7, _io_alu_out_T_11, _GEN_4) @[Execute.scala 55:40 Execute.scala 56:20]
    node _GEN_6 = mux(_T_6, _io_alu_out_T_9, _GEN_5) @[Execute.scala 52:39 Execute.scala 53:20]
    node _GEN_7 = mux(_T_5, _io_alu_out_T_7, _GEN_6) @[Execute.scala 49:40 Execute.scala 50:20]
    node _GEN_8 = mux(_T_4, _io_alu_out_T_5, _GEN_7) @[Execute.scala 46:40 Execute.scala 47:20]
    node _GEN_9 = mux(_T_3, _io_alu_out_T_2, _GEN_8) @[Execute.scala 43:33 Execute.scala 44:18]
    node _T_13 = eq(io_opcode, UInt<2>("h3")) @[Execute.scala 79:25]
    node _io_alu_out_T_22 = add(io_arg_y, io_arg_x) @[Execute.scala 80:30]
    node _io_alu_out_T_23 = tail(_io_alu_out_T_22, 1) @[Execute.scala 80:30]
    node _io_alu_out_T_24 = asSInt(_io_alu_out_T_23) @[Execute.scala 80:30]
    node _T_14 = eq(io_opcode, UInt<7>("h63")) @[Execute.scala 84:25]
    node _T_15 = eq(io_alu_op, UInt<4>("h0")) @[Execute.scala 85:22]
    node _io_alu_out_T_25 = eq(io_arg_x, io_arg_y) @[Execute.scala 86:36]
    node _io_alu_out_T_26 = mux(_io_alu_out_T_25, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Execute.scala 86:26]
    node _T_16 = eq(io_alu_op, UInt<4>("h1")) @[Execute.scala 88:30]
    node _io_alu_out_T_27 = neq(io_arg_x, io_arg_y) @[Execute.scala 89:36]
    node _io_alu_out_T_28 = mux(_io_alu_out_T_27, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Execute.scala 89:26]
    node _T_17 = eq(io_alu_op, UInt<4>("h4")) @[Execute.scala 91:27]
    node _io_alu_out_T_29 = lt(io_arg_x, io_arg_y) @[Execute.scala 92:36]
    node _io_alu_out_T_30 = mux(_io_alu_out_T_29, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Execute.scala 92:26]
    node _T_18 = eq(io_alu_op, UInt<4>("h5")) @[Execute.scala 93:28]
    node _io_alu_out_T_31 = geq(io_arg_x, io_arg_y) @[Execute.scala 94:36]
    node _io_alu_out_T_32 = mux(_io_alu_out_T_31, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Execute.scala 94:26]
    node _T_19 = eq(io_alu_op, UInt<4>("h6")) @[Execute.scala 95:28]
    node _io_alu_out_T_33 = asUInt(io_arg_x) @[Execute.scala 96:36]
    node _io_alu_out_T_34 = asUInt(io_arg_y) @[Execute.scala 96:54]
    node _io_alu_out_T_35 = lt(_io_alu_out_T_33, _io_alu_out_T_34) @[Execute.scala 96:43]
    node _io_alu_out_T_36 = mux(_io_alu_out_T_35, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Execute.scala 96:26]
    node _T_20 = eq(io_alu_op, UInt<4>("h7")) @[Execute.scala 97:28]
    node _io_alu_out_T_37 = asUInt(io_arg_x) @[Execute.scala 98:36]
    node _io_alu_out_T_38 = asUInt(io_arg_y) @[Execute.scala 98:55]
    node _io_alu_out_T_39 = geq(_io_alu_out_T_37, _io_alu_out_T_38) @[Execute.scala 98:43]
    node _io_alu_out_T_40 = mux(_io_alu_out_T_39, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Execute.scala 98:26]
    node _GEN_10 = mux(_T_20, _io_alu_out_T_40, asSInt(UInt<1>("h0"))) @[Execute.scala 97:42 Execute.scala 98:20 Execute.scala 101:18]
    node _GEN_11 = mux(_T_19, _io_alu_out_T_36, _GEN_10) @[Execute.scala 95:42 Execute.scala 96:20]
    node _GEN_12 = mux(_T_18, _io_alu_out_T_32, _GEN_11) @[Execute.scala 93:41 Execute.scala 94:20]
    node _GEN_13 = mux(_T_17, _io_alu_out_T_30, _GEN_12) @[Execute.scala 91:40 Execute.scala 92:20]
    node _GEN_14 = mux(_T_16, _io_alu_out_T_28, _GEN_13) @[Execute.scala 88:43 Execute.scala 89:20]
    node _GEN_15 = mux(_T_15, _io_alu_out_T_26, _GEN_14) @[Execute.scala 85:35 Execute.scala 86:20]
    node _T_21 = eq(io_opcode, UInt<7>("h67")) @[Execute.scala 106:21]
    node _io_alu_out_T_41 = add(io_arg_x, io_arg_y) @[Execute.scala 107:30]
    node _io_alu_out_T_42 = tail(_io_alu_out_T_41, 1) @[Execute.scala 107:30]
    node _io_alu_out_T_43 = asSInt(_io_alu_out_T_42) @[Execute.scala 107:30]
    node _T_22 = eq(io_opcode, UInt<6>("h37")) @[Execute.scala 109:25]
    node _T_23 = eq(io_opcode, UInt<5>("h17")) @[Execute.scala 112:25]
    node _GEN_16 = mux(_T_23, io_arg_y, asSInt(UInt<1>("h0"))) @[Execute.scala 112:43 Execute.scala 113:18 Execute.scala 41:14]
    node _GEN_17 = mux(_T_22, io_arg_y, _GEN_16) @[Execute.scala 109:43 Execute.scala 110:18]
    node _GEN_18 = mux(_T_21, _io_alu_out_T_43, _GEN_17) @[Execute.scala 106:39 Execute.scala 107:18]
    node _GEN_19 = mux(_T_14, _GEN_15, _GEN_18) @[Execute.scala 84:43]
    node _GEN_20 = mux(_T_13, _io_alu_out_T_24, _GEN_19) @[Execute.scala 79:43 Execute.scala 80:18]
    node _GEN_21 = mux(_T_2, _GEN_9, _GEN_20) @[Execute.scala 42:70]
    io_alu_out <= asSInt(bits(_GEN_21, 31, 0))

  module Mem :
    input clock : Clock
    input reset : UInt<1>
    input io_rdata : SInt<32>
    input io_address : UInt<8>
    output io_wdata_0 : UInt<8>
    output io_wdata_1 : UInt<8>
    output io_wdata_2 : UInt<8>
    output io_wdata_3 : UInt<8>
    output io_enb : UInt<1>
    output io_fun3 : UInt<4>
    output io_load : UInt<1>
    output io_store : UInt<1>
    output io_mask_0 : UInt<1>
    output io_mask_1 : UInt<1>
    output io_mask_2 : UInt<1>
    output io_mask_3 : UInt<1>

    io_wdata_0 <= UInt<1>("h0") @[Mem.scala 23:12]
    io_wdata_1 <= UInt<1>("h0") @[Mem.scala 24:12]
    io_wdata_2 <= UInt<1>("h0") @[Mem.scala 25:12]
    io_wdata_3 <= UInt<1>("h0") @[Mem.scala 26:12]
    io_enb <= UInt<1>("h0") @[Mem.scala 27:7]
    io_fun3 <= UInt<1>("h0") @[Mem.scala 28:8]
    io_load <= UInt<1>("h0") @[Mem.scala 29:8]
    io_store <= UInt<1>("h0") @[Mem.scala 30:9]
    io_mask_0 <= UInt<1>("h0") @[Mem.scala 31:11]
    io_mask_1 <= UInt<1>("h0") @[Mem.scala 32:11]
    io_mask_2 <= UInt<1>("h0") @[Mem.scala 33:11]
    io_mask_3 <= UInt<1>("h0") @[Mem.scala 34:11]

  module WB :
    input clock : Clock
    input reset : UInt<1>
    input io_lout : SInt<32>
    input io_ins : UInt<32>
    input io_alu_out : SInt<32>
    input io_pcout : UInt<32>
    output io_data : SInt<32>

    node _io_data_T = bits(io_ins, 6, 0) @[WB.scala 14:8]
    node _io_data_T_1 = eq(_io_data_T, UInt<2>("h3")) @[WB.scala 14:14]
    node _io_data_T_2 = bits(io_ins, 6, 0) @[WB.scala 15:8]
    node _io_data_T_3 = eq(_io_data_T_2, UInt<6>("h33")) @[WB.scala 15:13]
    node _io_data_T_4 = bits(io_ins, 6, 0) @[WB.scala 16:8]
    node _io_data_T_5 = eq(_io_data_T_4, UInt<5>("h13")) @[WB.scala 16:13]
    node _io_data_T_6 = bits(io_ins, 6, 0) @[WB.scala 17:8]
    node _io_data_T_7 = eq(_io_data_T_6, UInt<6>("h37")) @[WB.scala 17:13]
    node _io_data_T_8 = bits(io_ins, 6, 0) @[WB.scala 18:8]
    node _io_data_T_9 = eq(_io_data_T_8, UInt<5>("h17")) @[WB.scala 18:13]
    node _io_data_T_10 = bits(io_ins, 6, 0) @[WB.scala 19:8]
    node _io_data_T_11 = eq(_io_data_T_10, UInt<7>("h6f")) @[WB.scala 19:13]
    node _io_data_T_12 = asSInt(io_pcout) @[WB.scala 19:45]
    node _io_data_T_13 = add(_io_data_T_12, asSInt(UInt<4>("h4"))) @[WB.scala 19:51]
    node _io_data_T_14 = tail(_io_data_T_13, 1) @[WB.scala 19:51]
    node _io_data_T_15 = asSInt(_io_data_T_14) @[WB.scala 19:51]
    node _io_data_T_16 = bits(io_ins, 6, 0) @[WB.scala 20:8]
    node _io_data_T_17 = eq(_io_data_T_16, UInt<7>("h67")) @[WB.scala 20:13]
    node _io_data_T_18 = asSInt(io_pcout) @[WB.scala 20:45]
    node _io_data_T_19 = add(_io_data_T_18, asSInt(UInt<4>("h4"))) @[WB.scala 20:51]
    node _io_data_T_20 = tail(_io_data_T_19, 1) @[WB.scala 20:51]
    node _io_data_T_21 = asSInt(_io_data_T_20) @[WB.scala 20:51]
    node _io_data_T_22 = bits(io_ins, 6, 0) @[WB.scala 21:8]
    node _io_data_T_23 = eq(_io_data_T_22, UInt<7>("h63")) @[WB.scala 21:13]
    node _io_data_T_24 = mux(_io_data_T_23, io_alu_out, asSInt(UInt<1>("h0"))) @[Mux.scala 98:16]
    node _io_data_T_25 = mux(_io_data_T_17, _io_data_T_21, _io_data_T_24) @[Mux.scala 98:16]
    node _io_data_T_26 = mux(_io_data_T_11, _io_data_T_15, _io_data_T_25) @[Mux.scala 98:16]
    node _io_data_T_27 = mux(_io_data_T_9, io_alu_out, _io_data_T_26) @[Mux.scala 98:16]
    node _io_data_T_28 = mux(_io_data_T_7, io_alu_out, _io_data_T_27) @[Mux.scala 98:16]
    node _io_data_T_29 = mux(_io_data_T_5, io_alu_out, _io_data_T_28) @[Mux.scala 98:16]
    node _io_data_T_30 = mux(_io_data_T_3, io_alu_out, _io_data_T_29) @[Mux.scala 98:16]
    node _io_data_T_31 = mux(_io_data_T_1, io_lout, _io_data_T_30) @[Mux.scala 98:16]
    io_data <= _io_data_T_31 @[WB.scala 13:10]

  module CPU :
    input clock : Clock
    input reset : UInt<1>
    input io_rdata : UInt<32>

    inst fetch of Fetch @[CPU.scala 13:21]
    inst decode of Decode @[CPU.scala 16:22]
    inst execute of Execute @[CPU.scala 19:23]
    inst mem of Mem @[CPU.scala 22:19]
    inst wback of WB @[CPU.scala 25:21]
    node _fetch_io_in_T = bits(decode.io_instout, 6, 0) @[CPU.scala 30:38]
    node _fetch_io_in_T_1 = eq(_fetch_io_in_T, UInt<7>("h6f")) @[CPU.scala 30:43]
    node _fetch_io_in_T_2 = asUInt(decode.io_immout) @[CPU.scala 30:78]
    node _fetch_io_in_T_3 = bits(decode.io_instout, 6, 0) @[CPU.scala 31:26]
    node _fetch_io_in_T_4 = eq(_fetch_io_in_T_3, UInt<7>("h63")) @[CPU.scala 31:31]
    node _fetch_io_in_T_5 = eq(execute.io_alu_out, asSInt(UInt<2>("h1"))) @[CPU.scala 32:27]
    node _fetch_io_in_T_6 = dshl(decode.io_immout, UInt<1>("h1")) @[CPU.scala 32:51]
    node _fetch_io_in_T_7 = asUInt(_fetch_io_in_T_6) @[CPU.scala 32:58]
    node _fetch_io_in_T_8 = mux(_fetch_io_in_T_5, _fetch_io_in_T_7, UInt<3>("h4")) @[CPU.scala 32:8]
    node _fetch_io_in_T_9 = bits(decode.io_instout, 6, 0) @[CPU.scala 33:26]
    node _fetch_io_in_T_10 = eq(_fetch_io_in_T_9, UInt<7>("h67")) @[CPU.scala 33:31]
    node _fetch_io_in_T_11 = asUInt(execute.io_alu_out) @[CPU.scala 33:69]
    node _fetch_io_in_T_12 = mux(_fetch_io_in_T_10, _fetch_io_in_T_11, UInt<3>("h4")) @[CPU.scala 33:8]
    node _fetch_io_in_T_13 = mux(_fetch_io_in_T_4, _fetch_io_in_T_8, _fetch_io_in_T_12) @[CPU.scala 31:8]
    node _fetch_io_in_T_14 = mux(_fetch_io_in_T_1, _fetch_io_in_T_2, _fetch_io_in_T_13) @[CPU.scala 30:20]
    node _execute_io_opcode_T = bits(decode.io_instout, 6, 0) @[CPU.scala 45:41]
    node _execute_io_arg_y_T = bits(decode.io_instout, 6, 0) @[CPU.scala 48:45]
    node _execute_io_arg_y_T_1 = eq(_execute_io_arg_y_T, UInt<6>("h33")) @[CPU.scala 48:50]
    node _execute_io_arg_y_T_2 = bits(decode.io_instout, 6, 0) @[CPU.scala 49:23]
    node _execute_io_arg_y_T_3 = eq(_execute_io_arg_y_T_2, UInt<6>("h23")) @[CPU.scala 49:28]
    node _execute_io_arg_y_T_4 = or(_execute_io_arg_y_T_1, _execute_io_arg_y_T_3) @[CPU.scala 48:66]
    node _execute_io_arg_y_T_5 = bits(decode.io_instout, 6, 0) @[CPU.scala 50:23]
    node _execute_io_arg_y_T_6 = eq(_execute_io_arg_y_T_5, UInt<7>("h63")) @[CPU.scala 50:28]
    node _execute_io_arg_y_T_7 = or(_execute_io_arg_y_T_4, _execute_io_arg_y_T_6) @[CPU.scala 49:46]
    node _execute_io_arg_y_T_8 = bits(decode.io_instout, 6, 0) @[CPU.scala 51:27]
    node _execute_io_arg_y_T_9 = eq(_execute_io_arg_y_T_8, UInt<5>("h13")) @[CPU.scala 51:32]
    node _execute_io_arg_y_T_10 = bits(decode.io_instout, 6, 0) @[CPU.scala 51:69]
    node _execute_io_arg_y_T_11 = eq(_execute_io_arg_y_T_10, UInt<2>("h3")) @[CPU.scala 51:74]
    node _execute_io_arg_y_T_12 = or(_execute_io_arg_y_T_9, _execute_io_arg_y_T_11) @[CPU.scala 51:49]
    node _execute_io_arg_y_T_13 = bits(decode.io_instout, 6, 0) @[CPU.scala 51:111]
    node _execute_io_arg_y_T_14 = eq(_execute_io_arg_y_T_13, UInt<7>("h67")) @[CPU.scala 51:116]
    node _execute_io_arg_y_T_15 = or(_execute_io_arg_y_T_12, _execute_io_arg_y_T_14) @[CPU.scala 51:91]
    node _execute_io_arg_y_T_16 = bits(decode.io_instout, 6, 0) @[CPU.scala 52:25]
    node _execute_io_arg_y_T_17 = eq(_execute_io_arg_y_T_16, UInt<6>("h37")) @[CPU.scala 52:30]
    node _execute_io_arg_y_T_18 = or(_execute_io_arg_y_T_15, _execute_io_arg_y_T_17) @[CPU.scala 52:5]
    node _execute_io_arg_y_T_19 = bits(decode.io_instout, 6, 0) @[CPU.scala 52:65]
    node _execute_io_arg_y_T_20 = eq(_execute_io_arg_y_T_19, UInt<5>("h17")) @[CPU.scala 52:70]
    node _execute_io_arg_y_T_21 = or(_execute_io_arg_y_T_18, _execute_io_arg_y_T_20) @[CPU.scala 52:46]
    node _execute_io_arg_y_T_22 = mux(_execute_io_arg_y_T_21, decode.io_immout, asSInt(UInt<1>("h0"))) @[CPU.scala 51:8]
    node _execute_io_arg_y_T_23 = mux(_execute_io_arg_y_T_7, decode.io_read2, _execute_io_arg_y_T_22) @[CPU.scala 48:26]
    node _mem_io_address_T = bits(decode.io_instout, 6, 0) @[CPU.scala 64:42]
    node _mem_io_address_T_1 = eq(_mem_io_address_T, UInt<2>("h3")) @[CPU.scala 64:47]
    node _mem_io_address_T_2 = asUInt(execute.io_alu_out) @[CPU.scala 64:84]
    node _mem_io_address_T_3 = bits(decode.io_instout, 6, 0) @[CPU.scala 65:26]
    node _mem_io_address_T_4 = eq(_mem_io_address_T_3, UInt<6>("h23")) @[CPU.scala 65:31]
    node mem_io_address_hi = bits(decode.io_instout, 31, 25) @[CPU.scala 65:69]
    node mem_io_address_lo = bits(decode.io_instout, 11, 7) @[CPU.scala 65:94]
    node _mem_io_address_T_5 = cat(mem_io_address_hi, mem_io_address_lo) @[Cat.scala 30:58]
    node _mem_io_address_T_6 = asUInt(decode.io_read1) @[CPU.scala 65:120]
    node _mem_io_address_T_7 = add(_mem_io_address_T_5, _mem_io_address_T_6) @[CPU.scala 65:101]
    node _mem_io_address_T_8 = tail(_mem_io_address_T_7, 1) @[CPU.scala 65:101]
    node _mem_io_address_T_9 = mux(_mem_io_address_T_4, _mem_io_address_T_8, UInt<1>("h0")) @[CPU.scala 65:8]
    node _mem_io_address_T_10 = mux(_mem_io_address_T_1, _mem_io_address_T_2, _mem_io_address_T_9) @[CPU.scala 64:24]
    fetch.clock <= clock
    fetch.reset <= reset
    fetch.io_enb <= decode.io_reg_enb @[CPU.scala 29:15]
    fetch.io_in <= bits(_fetch_io_in_T_14, 31, 0) @[CPU.scala 30:14]
    decode.clock <= clock
    decode.reset <= reset
    decode.io_instruction <= io_rdata @[CPU.scala 41:26]
    decode.io_pcout <= fetch.io_out @[CPU.scala 42:20]
    decode.io_regdata <= wback.io_data @[CPU.scala 37:22]
    execute.clock <= clock
    execute.reset <= reset
    execute.io_opcode <= _execute_io_opcode_T @[CPU.scala 45:22]
    execute.io_alu_op <= decode.io_op @[CPU.scala 46:22]
    execute.io_arg_x <= decode.io_read1 @[CPU.scala 47:21]
    execute.io_arg_y <= _execute_io_arg_y_T_23 @[CPU.scala 48:21]
    mem.clock <= clock
    mem.reset <= reset
    mem.io_rdata <= asSInt(UInt<1>("h0")) @[CPU.scala 66:17]
    mem.io_address <= bits(_mem_io_address_T_10, 7, 0) @[CPU.scala 64:19]
    wback.clock <= clock
    wback.reset <= reset
    wback.io_lout <= asSInt(UInt<1>("h0")) @[CPU.scala 72:18]
    wback.io_ins <= decode.io_instruction @[CPU.scala 73:17]
    wback.io_alu_out <= execute.io_alu_out @[CPU.scala 74:21]
    wback.io_pcout <= fetch.io_out @[CPU.scala 75:19]
