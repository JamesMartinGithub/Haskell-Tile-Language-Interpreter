{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,389) ([0,24832,2048,240,0,6208,512,0,0,0,0,0,32768,0,16384,5,8224,1936,3719,0,2317,1536,0,0,512,0,1792,0,0,0,0,0,0,0,0,2048,0,0,0,512,0,0,0,128,0,0,0,0,97,28680,0,0,0,0,0,0,0,0,0,1,0,0,16384,0,0,0,4096,0,0,0,0,0,1024,0,0,0,49152,1,7680,0,0,16,8,0,0,0,0,0,0,0,0,0,0,13312,36,24,0,3328,9,6,0,512,30978,59504,0,32896,7744,14876,0,0,57344,0,0,0,0,0,0,514,28793,232,32768,0,0,0,13312,36,24,0,3328,9,6,0,512,30978,59504,0,32896,7744,14876,0,8224,1936,3719,0,2056,49636,929,0,514,28793,232,32768,16512,7198,58,8192,36896,34567,14,2048,58376,41409,3,512,30978,59504,0,0,8,0,56,8192,0,20480,1,2317,1536,0,0,514,28793,232,0,128,0,1344,0,0,0,3584,28672,0,56,0,64512,1,0,256,0,1,0,56,0,97,61448,0,2048,0,21504,0,512,0,5376,0,128,0,1344,13312,36,248,0,3328,9,62,0,17216,32770,15,0,0,32768,1027,0,0,57344,0,0,0,14336,0,0,0,3584,0,0,0,896,0,0,0,224,0,36096,15,6,1024,58176,32771,1,256,0,2,0,0,16384,57344,0,0,2056,49636,929,0,514,28793,232,32768,16512,7198,58,0,0,224,0,0,0,56,0,57344,5,0,256,0,0,0,0,64,0,0,0,2317,1536,0,16384,579,384,0,53248,144,96,0,13312,36,24,0,3328,9,6,0,0,0,1024,0,32768,0,16384,5,9268,6144,0,0,2317,1536,0,0,514,28793,232,0,0,896,0,0,30,0,4096,32768,7,0,1024,0,0,1024,224,32768,0,16384,5,0,0,0,0,0,0,0,0,0,0,0,0,96,0,16384,0,24,0,4096,3328,9,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,30,0,4096,3328,9,6,0,57344,1,0,256,32896,7744,14876,0,15924,6144,0,16,1920,0,0,4,480,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,256,0,0,12,0,0,16384,24,7170,0,0,0,0,0,1,0,0,29696,36,24,0,7424,9,6,0,1024,0,0,0,33152,7744,14876,0,8288,1936,3719,0,0,14336,0,0,514,28793,232,0,0,896,0,8192,36896,34567,14,2048,58376,41409,3,57344,1,0,256,37072,24576,0,0,7680,0,0,16,2317,1536,0,16384,579,384,0,0,0,0,1,0,0,16384,0,0,6208,512,60,0,0,0,0,0,388,49184,3,0,97,61448,0,3981,1536,0,16388,579,3968,0,0,0,0,0,0,0,0,0,33280,7,0,1024,0,0,1024,224,0,0,49152,1,0,0,16,0,0,0,7168,16384,579,384,0,53248,248,96,16384,13312,62,24,4096,0,0,0,0,0,0,0,0,0,32,0,0,0,97,61448,0,16384,24,15362,0,480,0,0,1,120,0,16384,0,30,0,4096,0,0,56,0,0,0,14,0,0,32768,3,0,0,0,0,0,0,0,0,0,0,0,0,0,120,0,16384,0,30,0,4096,32768,7,0,1024,0,4,0,0,0,388,49184,3,0,0,32,0,0,0,4,0,4096,32774,3840,0,0,0,0,0,0,8192,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Prgrm","Stmt2","Stmt","Blck","Exp","TExp","BExp","let","in","int","var","'='","'>'","'<'","'+'","'-'","'*'","'/'","'('","')'","'.'","if","then","else","endif","inputTile","outputTile","outputString","blank","full","rotateR","rotateL","getHeight","getWidth","and","or","xor","not","flipY","flipX","for","do","endfor","':'","place","on","subtile","scaleUp","scaleDown","Tint","Tstring","Ttile","'#'","'!'","\"&&\"","\"||\"","'^'","'%'","%eof"]
        bit_start = st Prelude.* 62
        bit_end = (st Prelude.+ 1) Prelude.* 62
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..61]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (25) = happyShift action_3
action_0 (30) = happyShift action_4
action_0 (31) = happyShift action_5
action_0 (44) = happyShift action_6
action_0 (53) = happyShift action_9
action_0 (54) = happyShift action_10
action_0 (55) = happyShift action_11
action_0 (56) = happyShift action_12
action_0 (4) = happyGoto action_7
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_8
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (25) = happyShift action_3
action_1 (30) = happyShift action_4
action_1 (31) = happyShift action_5
action_1 (44) = happyShift action_6
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (22) = happyShift action_44
action_3 (53) = happyShift action_45
action_3 (55) = happyShift action_46
action_3 (57) = happyShift action_47
action_3 (10) = happyGoto action_43
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (14) = happyShift action_29
action_4 (22) = happyShift action_30
action_4 (29) = happyShift action_31
action_4 (32) = happyShift action_32
action_4 (33) = happyShift action_33
action_4 (34) = happyShift action_34
action_4 (35) = happyShift action_35
action_4 (41) = happyShift action_36
action_4 (42) = happyShift action_37
action_4 (43) = happyShift action_38
action_4 (48) = happyShift action_39
action_4 (50) = happyShift action_40
action_4 (51) = happyShift action_41
action_4 (52) = happyShift action_42
action_4 (9) = happyGoto action_28
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (11) = happyShift action_21
action_5 (13) = happyShift action_22
action_5 (14) = happyShift action_23
action_5 (19) = happyShift action_24
action_5 (22) = happyShift action_25
action_5 (36) = happyShift action_26
action_5 (37) = happyShift action_27
action_5 (8) = happyGoto action_20
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (22) = happyShift action_19
action_6 (53) = happyShift action_9
action_6 (54) = happyShift action_10
action_6 (55) = happyShift action_11
action_6 (6) = happyGoto action_18
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (62) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_2

action_9 (14) = happyShift action_17
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (14) = happyShift action_16
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (14) = happyShift action_15
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (25) = happyShift action_3
action_12 (30) = happyShift action_4
action_12 (31) = happyShift action_5
action_12 (44) = happyShift action_6
action_12 (53) = happyShift action_9
action_12 (54) = happyShift action_10
action_12 (55) = happyShift action_11
action_12 (5) = happyGoto action_13
action_12 (6) = happyGoto action_14
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_3

action_14 _ = happyReduce_4

action_15 (15) = happyShift action_86
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (15) = happyShift action_85
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (15) = happyShift action_84
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (47) = happyShift action_83
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (53) = happyShift action_9
action_19 (54) = happyShift action_10
action_19 (55) = happyShift action_11
action_19 (6) = happyGoto action_82
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (18) = happyShift action_77
action_20 (19) = happyShift action_78
action_20 (20) = happyShift action_79
action_20 (21) = happyShift action_80
action_20 (61) = happyShift action_81
action_20 _ = happyReduce_10

action_21 (14) = happyShift action_76
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_32

action_23 _ = happyReduce_33

action_24 (11) = happyShift action_21
action_24 (13) = happyShift action_22
action_24 (14) = happyShift action_23
action_24 (19) = happyShift action_24
action_24 (22) = happyShift action_25
action_24 (36) = happyShift action_26
action_24 (37) = happyShift action_27
action_24 (8) = happyGoto action_75
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (11) = happyShift action_21
action_25 (13) = happyShift action_22
action_25 (14) = happyShift action_23
action_25 (19) = happyShift action_24
action_25 (22) = happyShift action_25
action_25 (36) = happyShift action_26
action_25 (37) = happyShift action_27
action_25 (8) = happyGoto action_74
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (14) = happyShift action_29
action_26 (22) = happyShift action_30
action_26 (29) = happyShift action_31
action_26 (32) = happyShift action_32
action_26 (33) = happyShift action_33
action_26 (34) = happyShift action_34
action_26 (35) = happyShift action_35
action_26 (41) = happyShift action_36
action_26 (42) = happyShift action_37
action_26 (43) = happyShift action_38
action_26 (48) = happyShift action_39
action_26 (50) = happyShift action_40
action_26 (51) = happyShift action_41
action_26 (52) = happyShift action_42
action_26 (9) = happyGoto action_73
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (14) = happyShift action_29
action_27 (22) = happyShift action_30
action_27 (29) = happyShift action_31
action_27 (32) = happyShift action_32
action_27 (33) = happyShift action_33
action_27 (34) = happyShift action_34
action_27 (35) = happyShift action_35
action_27 (41) = happyShift action_36
action_27 (42) = happyShift action_37
action_27 (43) = happyShift action_38
action_27 (48) = happyShift action_39
action_27 (50) = happyShift action_40
action_27 (51) = happyShift action_41
action_27 (52) = happyShift action_42
action_27 (9) = happyGoto action_72
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (38) = happyShift action_69
action_28 (39) = happyShift action_70
action_28 (40) = happyShift action_71
action_28 _ = happyReduce_9

action_29 _ = happyReduce_50

action_30 (14) = happyShift action_29
action_30 (22) = happyShift action_30
action_30 (29) = happyShift action_31
action_30 (32) = happyShift action_32
action_30 (33) = happyShift action_33
action_30 (34) = happyShift action_34
action_30 (35) = happyShift action_35
action_30 (41) = happyShift action_36
action_30 (42) = happyShift action_37
action_30 (43) = happyShift action_38
action_30 (48) = happyShift action_39
action_30 (50) = happyShift action_40
action_30 (51) = happyShift action_41
action_30 (52) = happyShift action_42
action_30 (9) = happyGoto action_68
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (14) = happyShift action_67
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (11) = happyShift action_21
action_32 (13) = happyShift action_22
action_32 (14) = happyShift action_23
action_32 (19) = happyShift action_24
action_32 (22) = happyShift action_25
action_32 (36) = happyShift action_26
action_32 (37) = happyShift action_27
action_32 (8) = happyGoto action_66
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (11) = happyShift action_21
action_33 (13) = happyShift action_22
action_33 (14) = happyShift action_23
action_33 (19) = happyShift action_24
action_33 (22) = happyShift action_25
action_33 (36) = happyShift action_26
action_33 (37) = happyShift action_27
action_33 (8) = happyGoto action_65
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (14) = happyShift action_29
action_34 (22) = happyShift action_30
action_34 (29) = happyShift action_31
action_34 (32) = happyShift action_32
action_34 (33) = happyShift action_33
action_34 (34) = happyShift action_34
action_34 (35) = happyShift action_35
action_34 (41) = happyShift action_36
action_34 (42) = happyShift action_37
action_34 (43) = happyShift action_38
action_34 (48) = happyShift action_39
action_34 (50) = happyShift action_40
action_34 (51) = happyShift action_41
action_34 (52) = happyShift action_42
action_34 (9) = happyGoto action_64
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (14) = happyShift action_29
action_35 (22) = happyShift action_30
action_35 (29) = happyShift action_31
action_35 (32) = happyShift action_32
action_35 (33) = happyShift action_33
action_35 (34) = happyShift action_34
action_35 (35) = happyShift action_35
action_35 (41) = happyShift action_36
action_35 (42) = happyShift action_37
action_35 (43) = happyShift action_38
action_35 (48) = happyShift action_39
action_35 (50) = happyShift action_40
action_35 (51) = happyShift action_41
action_35 (52) = happyShift action_42
action_35 (9) = happyGoto action_63
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (14) = happyShift action_29
action_36 (22) = happyShift action_30
action_36 (29) = happyShift action_31
action_36 (32) = happyShift action_32
action_36 (33) = happyShift action_33
action_36 (34) = happyShift action_34
action_36 (35) = happyShift action_35
action_36 (41) = happyShift action_36
action_36 (42) = happyShift action_37
action_36 (43) = happyShift action_38
action_36 (48) = happyShift action_39
action_36 (50) = happyShift action_40
action_36 (51) = happyShift action_41
action_36 (52) = happyShift action_42
action_36 (9) = happyGoto action_62
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (14) = happyShift action_29
action_37 (22) = happyShift action_30
action_37 (29) = happyShift action_31
action_37 (32) = happyShift action_32
action_37 (33) = happyShift action_33
action_37 (34) = happyShift action_34
action_37 (35) = happyShift action_35
action_37 (41) = happyShift action_36
action_37 (42) = happyShift action_37
action_37 (43) = happyShift action_38
action_37 (48) = happyShift action_39
action_37 (50) = happyShift action_40
action_37 (51) = happyShift action_41
action_37 (52) = happyShift action_42
action_37 (9) = happyGoto action_61
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (14) = happyShift action_29
action_38 (22) = happyShift action_30
action_38 (29) = happyShift action_31
action_38 (32) = happyShift action_32
action_38 (33) = happyShift action_33
action_38 (34) = happyShift action_34
action_38 (35) = happyShift action_35
action_38 (41) = happyShift action_36
action_38 (42) = happyShift action_37
action_38 (43) = happyShift action_38
action_38 (48) = happyShift action_39
action_38 (50) = happyShift action_40
action_38 (51) = happyShift action_41
action_38 (52) = happyShift action_42
action_38 (9) = happyGoto action_60
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (14) = happyShift action_29
action_39 (22) = happyShift action_30
action_39 (29) = happyShift action_31
action_39 (32) = happyShift action_32
action_39 (33) = happyShift action_33
action_39 (34) = happyShift action_34
action_39 (35) = happyShift action_35
action_39 (41) = happyShift action_36
action_39 (42) = happyShift action_37
action_39 (43) = happyShift action_38
action_39 (48) = happyShift action_39
action_39 (50) = happyShift action_40
action_39 (51) = happyShift action_41
action_39 (52) = happyShift action_42
action_39 (9) = happyGoto action_59
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (14) = happyShift action_29
action_40 (22) = happyShift action_30
action_40 (29) = happyShift action_31
action_40 (32) = happyShift action_32
action_40 (33) = happyShift action_33
action_40 (34) = happyShift action_34
action_40 (35) = happyShift action_35
action_40 (41) = happyShift action_36
action_40 (42) = happyShift action_37
action_40 (43) = happyShift action_38
action_40 (48) = happyShift action_39
action_40 (50) = happyShift action_40
action_40 (51) = happyShift action_41
action_40 (52) = happyShift action_42
action_40 (9) = happyGoto action_58
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (14) = happyShift action_29
action_41 (22) = happyShift action_30
action_41 (29) = happyShift action_31
action_41 (32) = happyShift action_32
action_41 (33) = happyShift action_33
action_41 (34) = happyShift action_34
action_41 (35) = happyShift action_35
action_41 (41) = happyShift action_36
action_41 (42) = happyShift action_37
action_41 (43) = happyShift action_38
action_41 (48) = happyShift action_39
action_41 (50) = happyShift action_40
action_41 (51) = happyShift action_41
action_41 (52) = happyShift action_42
action_41 (9) = happyGoto action_57
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (14) = happyShift action_29
action_42 (22) = happyShift action_30
action_42 (29) = happyShift action_31
action_42 (32) = happyShift action_32
action_42 (33) = happyShift action_33
action_42 (34) = happyShift action_34
action_42 (35) = happyShift action_35
action_42 (41) = happyShift action_36
action_42 (42) = happyShift action_37
action_42 (43) = happyShift action_38
action_42 (48) = happyShift action_39
action_42 (50) = happyShift action_40
action_42 (51) = happyShift action_41
action_42 (52) = happyShift action_42
action_42 (9) = happyGoto action_56
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (26) = happyShift action_52
action_43 (58) = happyShift action_53
action_43 (59) = happyShift action_54
action_43 (60) = happyShift action_55
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (22) = happyShift action_44
action_44 (53) = happyShift action_45
action_44 (55) = happyShift action_46
action_44 (57) = happyShift action_47
action_44 (10) = happyGoto action_51
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (11) = happyShift action_21
action_45 (13) = happyShift action_22
action_45 (14) = happyShift action_23
action_45 (19) = happyShift action_24
action_45 (22) = happyShift action_25
action_45 (36) = happyShift action_26
action_45 (37) = happyShift action_27
action_45 (8) = happyGoto action_50
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (14) = happyShift action_29
action_46 (22) = happyShift action_30
action_46 (29) = happyShift action_31
action_46 (32) = happyShift action_32
action_46 (33) = happyShift action_33
action_46 (34) = happyShift action_34
action_46 (35) = happyShift action_35
action_46 (41) = happyShift action_36
action_46 (42) = happyShift action_37
action_46 (43) = happyShift action_38
action_46 (48) = happyShift action_39
action_46 (50) = happyShift action_40
action_46 (51) = happyShift action_41
action_46 (52) = happyShift action_42
action_46 (9) = happyGoto action_49
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (22) = happyShift action_44
action_47 (53) = happyShift action_45
action_47 (55) = happyShift action_46
action_47 (57) = happyShift action_47
action_47 (10) = happyGoto action_48
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (58) = happyShift action_53
action_48 (59) = happyShift action_54
action_48 (60) = happyShift action_55
action_48 _ = happyReduce_65

action_49 (15) = happyShift action_122
action_49 (16) = happyShift action_123
action_49 (17) = happyShift action_124
action_49 (38) = happyShift action_69
action_49 (39) = happyShift action_70
action_49 (40) = happyShift action_71
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (15) = happyShift action_119
action_50 (16) = happyShift action_120
action_50 (17) = happyShift action_121
action_50 (18) = happyShift action_77
action_50 (19) = happyShift action_78
action_50 (20) = happyShift action_79
action_50 (21) = happyShift action_80
action_50 (61) = happyShift action_81
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (23) = happyShift action_118
action_51 (58) = happyShift action_53
action_51 (59) = happyShift action_54
action_51 (60) = happyShift action_55
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (25) = happyShift action_3
action_52 (30) = happyShift action_4
action_52 (31) = happyShift action_5
action_52 (44) = happyShift action_6
action_52 (53) = happyShift action_9
action_52 (54) = happyShift action_10
action_52 (55) = happyShift action_11
action_52 (56) = happyShift action_117
action_52 (5) = happyGoto action_114
action_52 (6) = happyGoto action_115
action_52 (7) = happyGoto action_116
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (22) = happyShift action_44
action_53 (53) = happyShift action_45
action_53 (55) = happyShift action_46
action_53 (57) = happyShift action_47
action_53 (10) = happyGoto action_113
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (22) = happyShift action_44
action_54 (53) = happyShift action_45
action_54 (55) = happyShift action_46
action_54 (57) = happyShift action_47
action_54 (10) = happyGoto action_112
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (22) = happyShift action_44
action_55 (53) = happyShift action_45
action_55 (55) = happyShift action_46
action_55 (57) = happyShift action_47
action_55 (10) = happyGoto action_111
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (11) = happyShift action_21
action_56 (13) = happyShift action_22
action_56 (14) = happyShift action_23
action_56 (19) = happyShift action_24
action_56 (22) = happyShift action_25
action_56 (36) = happyShift action_26
action_56 (37) = happyShift action_27
action_56 (38) = happyShift action_69
action_56 (39) = happyShift action_70
action_56 (40) = happyShift action_71
action_56 (8) = happyGoto action_110
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (11) = happyShift action_21
action_57 (13) = happyShift action_22
action_57 (14) = happyShift action_23
action_57 (19) = happyShift action_24
action_57 (22) = happyShift action_25
action_57 (36) = happyShift action_26
action_57 (37) = happyShift action_27
action_57 (38) = happyShift action_69
action_57 (39) = happyShift action_70
action_57 (40) = happyShift action_71
action_57 (8) = happyGoto action_109
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (11) = happyShift action_21
action_58 (13) = happyShift action_22
action_58 (14) = happyShift action_23
action_58 (19) = happyShift action_24
action_58 (22) = happyShift action_25
action_58 (36) = happyShift action_26
action_58 (37) = happyShift action_27
action_58 (38) = happyShift action_69
action_58 (39) = happyShift action_70
action_58 (40) = happyShift action_71
action_58 (8) = happyGoto action_108
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (38) = happyShift action_69
action_59 (39) = happyShift action_70
action_59 (40) = happyShift action_71
action_59 (49) = happyShift action_107
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (38) = happyShift action_69
action_60 (39) = happyShift action_70
action_60 (40) = happyShift action_71
action_60 _ = happyReduce_43

action_61 (38) = happyShift action_69
action_61 (39) = happyShift action_70
action_61 (40) = happyShift action_71
action_61 _ = happyReduce_42

action_62 (38) = happyShift action_69
action_62 (39) = happyShift action_70
action_62 (40) = happyShift action_71
action_62 _ = happyReduce_41

action_63 (38) = happyShift action_69
action_63 (39) = happyShift action_70
action_63 (40) = happyShift action_71
action_63 _ = happyReduce_46

action_64 (38) = happyShift action_69
action_64 (39) = happyShift action_70
action_64 (40) = happyShift action_71
action_64 _ = happyReduce_45

action_65 (11) = happyShift action_21
action_65 (13) = happyShift action_22
action_65 (14) = happyShift action_23
action_65 (18) = happyShift action_77
action_65 (19) = happyShift action_105
action_65 (20) = happyShift action_79
action_65 (21) = happyShift action_80
action_65 (22) = happyShift action_25
action_65 (36) = happyShift action_26
action_65 (37) = happyShift action_27
action_65 (61) = happyShift action_81
action_65 (8) = happyGoto action_106
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (11) = happyShift action_21
action_66 (13) = happyShift action_22
action_66 (14) = happyShift action_23
action_66 (18) = happyShift action_77
action_66 (19) = happyShift action_105
action_66 (20) = happyShift action_79
action_66 (21) = happyShift action_80
action_66 (22) = happyShift action_25
action_66 (36) = happyShift action_26
action_66 (37) = happyShift action_27
action_66 (61) = happyShift action_81
action_66 (8) = happyGoto action_104
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (24) = happyShift action_103
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (23) = happyShift action_102
action_68 (38) = happyShift action_69
action_68 (39) = happyShift action_70
action_68 (40) = happyShift action_71
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (14) = happyShift action_29
action_69 (22) = happyShift action_30
action_69 (29) = happyShift action_31
action_69 (32) = happyShift action_32
action_69 (33) = happyShift action_33
action_69 (34) = happyShift action_34
action_69 (35) = happyShift action_35
action_69 (41) = happyShift action_36
action_69 (42) = happyShift action_37
action_69 (43) = happyShift action_38
action_69 (48) = happyShift action_39
action_69 (50) = happyShift action_40
action_69 (51) = happyShift action_41
action_69 (52) = happyShift action_42
action_69 (9) = happyGoto action_101
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (14) = happyShift action_29
action_70 (22) = happyShift action_30
action_70 (29) = happyShift action_31
action_70 (32) = happyShift action_32
action_70 (33) = happyShift action_33
action_70 (34) = happyShift action_34
action_70 (35) = happyShift action_35
action_70 (41) = happyShift action_36
action_70 (42) = happyShift action_37
action_70 (43) = happyShift action_38
action_70 (48) = happyShift action_39
action_70 (50) = happyShift action_40
action_70 (51) = happyShift action_41
action_70 (52) = happyShift action_42
action_70 (9) = happyGoto action_100
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (14) = happyShift action_29
action_71 (22) = happyShift action_30
action_71 (29) = happyShift action_31
action_71 (32) = happyShift action_32
action_71 (33) = happyShift action_33
action_71 (34) = happyShift action_34
action_71 (35) = happyShift action_35
action_71 (41) = happyShift action_36
action_71 (42) = happyShift action_37
action_71 (43) = happyShift action_38
action_71 (48) = happyShift action_39
action_71 (50) = happyShift action_40
action_71 (51) = happyShift action_41
action_71 (52) = happyShift action_42
action_71 (9) = happyGoto action_99
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (38) = happyShift action_69
action_72 (39) = happyShift action_70
action_72 (40) = happyShift action_71
action_72 _ = happyReduce_29

action_73 (38) = happyShift action_69
action_73 (39) = happyShift action_70
action_73 (40) = happyShift action_71
action_73 _ = happyReduce_28

action_74 (18) = happyShift action_77
action_74 (19) = happyShift action_78
action_74 (20) = happyShift action_79
action_74 (21) = happyShift action_80
action_74 (23) = happyShift action_98
action_74 (61) = happyShift action_81
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_31

action_76 (15) = happyShift action_97
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (11) = happyShift action_21
action_77 (13) = happyShift action_22
action_77 (14) = happyShift action_23
action_77 (19) = happyShift action_24
action_77 (22) = happyShift action_25
action_77 (36) = happyShift action_26
action_77 (37) = happyShift action_27
action_77 (8) = happyGoto action_96
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (11) = happyShift action_21
action_78 (13) = happyShift action_22
action_78 (14) = happyShift action_23
action_78 (19) = happyShift action_24
action_78 (22) = happyShift action_25
action_78 (36) = happyShift action_26
action_78 (37) = happyShift action_27
action_78 (8) = happyGoto action_95
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (11) = happyShift action_21
action_79 (13) = happyShift action_22
action_79 (14) = happyShift action_23
action_79 (19) = happyShift action_24
action_79 (22) = happyShift action_25
action_79 (36) = happyShift action_26
action_79 (37) = happyShift action_27
action_79 (8) = happyGoto action_94
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (11) = happyShift action_21
action_80 (13) = happyShift action_22
action_80 (14) = happyShift action_23
action_80 (19) = happyShift action_24
action_80 (22) = happyShift action_25
action_80 (36) = happyShift action_26
action_80 (37) = happyShift action_27
action_80 (8) = happyGoto action_93
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (11) = happyShift action_21
action_81 (13) = happyShift action_22
action_81 (14) = happyShift action_23
action_81 (19) = happyShift action_24
action_81 (22) = happyShift action_25
action_81 (36) = happyShift action_26
action_81 (37) = happyShift action_27
action_81 (8) = happyGoto action_92
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (47) = happyShift action_91
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (22) = happyShift action_44
action_83 (53) = happyShift action_45
action_83 (55) = happyShift action_46
action_83 (57) = happyShift action_47
action_83 (10) = happyGoto action_90
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (11) = happyShift action_21
action_84 (13) = happyShift action_22
action_84 (14) = happyShift action_23
action_84 (19) = happyShift action_24
action_84 (22) = happyShift action_25
action_84 (36) = happyShift action_26
action_84 (37) = happyShift action_27
action_84 (8) = happyGoto action_89
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (11) = happyShift action_21
action_85 (13) = happyShift action_22
action_85 (14) = happyShift action_23
action_85 (19) = happyShift action_24
action_85 (22) = happyShift action_25
action_85 (36) = happyShift action_26
action_85 (37) = happyShift action_27
action_85 (8) = happyGoto action_88
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (14) = happyShift action_29
action_86 (22) = happyShift action_30
action_86 (29) = happyShift action_31
action_86 (32) = happyShift action_32
action_86 (33) = happyShift action_33
action_86 (34) = happyShift action_34
action_86 (35) = happyShift action_35
action_86 (41) = happyShift action_36
action_86 (42) = happyShift action_37
action_86 (43) = happyShift action_38
action_86 (48) = happyShift action_39
action_86 (50) = happyShift action_40
action_86 (51) = happyShift action_41
action_86 (52) = happyShift action_42
action_86 (9) = happyGoto action_87
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (38) = happyShift action_69
action_87 (39) = happyShift action_70
action_87 (40) = happyShift action_71
action_87 _ = happyReduce_13

action_88 (18) = happyShift action_77
action_88 (19) = happyShift action_78
action_88 (20) = happyShift action_79
action_88 (21) = happyShift action_80
action_88 (61) = happyShift action_81
action_88 _ = happyReduce_12

action_89 (18) = happyShift action_77
action_89 (19) = happyShift action_78
action_89 (20) = happyShift action_79
action_89 (21) = happyShift action_80
action_89 (61) = happyShift action_81
action_89 _ = happyReduce_11

action_90 (47) = happyShift action_147
action_90 (58) = happyShift action_53
action_90 (59) = happyShift action_54
action_90 (60) = happyShift action_55
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (22) = happyShift action_44
action_91 (53) = happyShift action_45
action_91 (55) = happyShift action_46
action_91 (57) = happyShift action_47
action_91 (10) = happyGoto action_146
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_27

action_93 _ = happyReduce_26

action_94 _ = happyReduce_25

action_95 (20) = happyShift action_79
action_95 (21) = happyShift action_80
action_95 (61) = happyShift action_81
action_95 _ = happyReduce_24

action_96 (20) = happyShift action_79
action_96 (21) = happyShift action_80
action_96 (61) = happyShift action_81
action_96 _ = happyReduce_23

action_97 (11) = happyShift action_21
action_97 (13) = happyShift action_22
action_97 (14) = happyShift action_23
action_97 (19) = happyShift action_24
action_97 (22) = happyShift action_25
action_97 (36) = happyShift action_26
action_97 (37) = happyShift action_27
action_97 (8) = happyGoto action_145
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_30

action_99 (38) = happyFail []
action_99 (39) = happyFail []
action_99 (40) = happyFail []
action_99 _ = happyReduce_40

action_100 (38) = happyFail []
action_100 (39) = happyFail []
action_100 (40) = happyFail []
action_100 _ = happyReduce_39

action_101 (38) = happyFail []
action_101 (39) = happyFail []
action_101 (40) = happyFail []
action_101 _ = happyReduce_38

action_102 _ = happyReduce_49

action_103 (14) = happyShift action_144
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (18) = happyShift action_77
action_104 (19) = happyShift action_78
action_104 (20) = happyShift action_79
action_104 (21) = happyShift action_80
action_104 (61) = happyShift action_81
action_104 _ = happyReduce_35

action_105 (11) = happyShift action_21
action_105 (13) = happyShift action_22
action_105 (14) = happyShift action_23
action_105 (19) = happyShift action_24
action_105 (22) = happyShift action_25
action_105 (36) = happyShift action_26
action_105 (37) = happyShift action_27
action_105 (8) = happyGoto action_143
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (18) = happyShift action_77
action_106 (19) = happyShift action_78
action_106 (20) = happyShift action_79
action_106 (21) = happyShift action_80
action_106 (61) = happyShift action_81
action_106 _ = happyReduce_36

action_107 (14) = happyShift action_29
action_107 (22) = happyShift action_30
action_107 (29) = happyShift action_31
action_107 (32) = happyShift action_32
action_107 (33) = happyShift action_33
action_107 (34) = happyShift action_34
action_107 (35) = happyShift action_35
action_107 (41) = happyShift action_36
action_107 (42) = happyShift action_37
action_107 (43) = happyShift action_38
action_107 (48) = happyShift action_39
action_107 (50) = happyShift action_40
action_107 (51) = happyShift action_41
action_107 (52) = happyShift action_42
action_107 (9) = happyGoto action_142
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (11) = happyShift action_21
action_108 (13) = happyShift action_22
action_108 (14) = happyShift action_23
action_108 (18) = happyShift action_77
action_108 (19) = happyShift action_105
action_108 (20) = happyShift action_79
action_108 (21) = happyShift action_80
action_108 (22) = happyShift action_25
action_108 (36) = happyShift action_26
action_108 (37) = happyShift action_27
action_108 (61) = happyShift action_81
action_108 (8) = happyGoto action_141
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (18) = happyShift action_77
action_109 (19) = happyShift action_78
action_109 (20) = happyShift action_79
action_109 (21) = happyShift action_80
action_109 (61) = happyShift action_81
action_109 _ = happyReduce_47

action_110 (18) = happyShift action_77
action_110 (19) = happyShift action_78
action_110 (20) = happyShift action_79
action_110 (21) = happyShift action_80
action_110 (61) = happyShift action_81
action_110 _ = happyReduce_48

action_111 (58) = happyFail []
action_111 (59) = happyFail []
action_111 (60) = happyFail []
action_111 _ = happyReduce_64

action_112 (58) = happyFail []
action_112 (59) = happyFail []
action_112 (60) = happyFail []
action_112 _ = happyReduce_63

action_113 (58) = happyFail []
action_113 (59) = happyFail []
action_113 (60) = happyFail []
action_113 _ = happyReduce_62

action_114 (47) = happyShift action_140
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (47) = happyShift action_139
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (27) = happyShift action_137
action_116 (28) = happyShift action_138
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (25) = happyShift action_3
action_117 (30) = happyShift action_4
action_117 (31) = happyShift action_5
action_117 (44) = happyShift action_6
action_117 (53) = happyShift action_9
action_117 (54) = happyShift action_10
action_117 (55) = happyShift action_11
action_117 (5) = happyGoto action_135
action_117 (6) = happyGoto action_136
action_117 _ = happyFail (happyExpListPerState 117)

action_118 _ = happyReduce_61

action_119 (15) = happyShift action_134
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (11) = happyShift action_21
action_120 (13) = happyShift action_22
action_120 (14) = happyShift action_23
action_120 (15) = happyShift action_133
action_120 (19) = happyShift action_24
action_120 (22) = happyShift action_25
action_120 (36) = happyShift action_26
action_120 (37) = happyShift action_27
action_120 (8) = happyGoto action_132
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (11) = happyShift action_21
action_121 (13) = happyShift action_22
action_121 (14) = happyShift action_23
action_121 (15) = happyShift action_131
action_121 (19) = happyShift action_24
action_121 (22) = happyShift action_25
action_121 (36) = happyShift action_26
action_121 (37) = happyShift action_27
action_121 (8) = happyGoto action_130
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (15) = happyShift action_129
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (14) = happyShift action_29
action_123 (15) = happyShift action_128
action_123 (22) = happyShift action_30
action_123 (29) = happyShift action_31
action_123 (32) = happyShift action_32
action_123 (33) = happyShift action_33
action_123 (34) = happyShift action_34
action_123 (35) = happyShift action_35
action_123 (41) = happyShift action_36
action_123 (42) = happyShift action_37
action_123 (43) = happyShift action_38
action_123 (48) = happyShift action_39
action_123 (50) = happyShift action_40
action_123 (51) = happyShift action_41
action_123 (52) = happyShift action_42
action_123 (9) = happyGoto action_127
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (14) = happyShift action_29
action_124 (15) = happyShift action_126
action_124 (22) = happyShift action_30
action_124 (29) = happyShift action_31
action_124 (32) = happyShift action_32
action_124 (33) = happyShift action_33
action_124 (34) = happyShift action_34
action_124 (35) = happyShift action_35
action_124 (41) = happyShift action_36
action_124 (42) = happyShift action_37
action_124 (43) = happyShift action_38
action_124 (48) = happyShift action_39
action_124 (50) = happyShift action_40
action_124 (51) = happyShift action_41
action_124 (52) = happyShift action_42
action_124 (9) = happyGoto action_125
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (38) = happyShift action_69
action_125 (39) = happyShift action_70
action_125 (40) = happyShift action_71
action_125 _ = happyReduce_56

action_126 (14) = happyShift action_29
action_126 (22) = happyShift action_30
action_126 (29) = happyShift action_31
action_126 (32) = happyShift action_32
action_126 (33) = happyShift action_33
action_126 (34) = happyShift action_34
action_126 (35) = happyShift action_35
action_126 (41) = happyShift action_36
action_126 (42) = happyShift action_37
action_126 (43) = happyShift action_38
action_126 (48) = happyShift action_39
action_126 (50) = happyShift action_40
action_126 (51) = happyShift action_41
action_126 (52) = happyShift action_42
action_126 (9) = happyGoto action_163
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (38) = happyShift action_69
action_127 (39) = happyShift action_70
action_127 (40) = happyShift action_71
action_127 _ = happyReduce_55

action_128 (14) = happyShift action_29
action_128 (22) = happyShift action_30
action_128 (29) = happyShift action_31
action_128 (32) = happyShift action_32
action_128 (33) = happyShift action_33
action_128 (34) = happyShift action_34
action_128 (35) = happyShift action_35
action_128 (41) = happyShift action_36
action_128 (42) = happyShift action_37
action_128 (43) = happyShift action_38
action_128 (48) = happyShift action_39
action_128 (50) = happyShift action_40
action_128 (51) = happyShift action_41
action_128 (52) = happyShift action_42
action_128 (9) = happyGoto action_162
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (14) = happyShift action_29
action_129 (22) = happyShift action_30
action_129 (29) = happyShift action_31
action_129 (32) = happyShift action_32
action_129 (33) = happyShift action_33
action_129 (34) = happyShift action_34
action_129 (35) = happyShift action_35
action_129 (41) = happyShift action_36
action_129 (42) = happyShift action_37
action_129 (43) = happyShift action_38
action_129 (48) = happyShift action_39
action_129 (50) = happyShift action_40
action_129 (51) = happyShift action_41
action_129 (52) = happyShift action_42
action_129 (9) = happyGoto action_161
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (18) = happyShift action_77
action_130 (19) = happyShift action_78
action_130 (20) = happyShift action_79
action_130 (21) = happyShift action_80
action_130 (61) = happyShift action_81
action_130 _ = happyReduce_52

action_131 (11) = happyShift action_21
action_131 (13) = happyShift action_22
action_131 (14) = happyShift action_23
action_131 (19) = happyShift action_24
action_131 (22) = happyShift action_25
action_131 (36) = happyShift action_26
action_131 (37) = happyShift action_27
action_131 (8) = happyGoto action_160
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (18) = happyShift action_77
action_132 (19) = happyShift action_78
action_132 (20) = happyShift action_79
action_132 (21) = happyShift action_80
action_132 (61) = happyShift action_81
action_132 _ = happyReduce_51

action_133 (11) = happyShift action_21
action_133 (13) = happyShift action_22
action_133 (14) = happyShift action_23
action_133 (19) = happyShift action_24
action_133 (22) = happyShift action_25
action_133 (36) = happyShift action_26
action_133 (37) = happyShift action_27
action_133 (8) = happyGoto action_159
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (11) = happyShift action_21
action_134 (13) = happyShift action_22
action_134 (14) = happyShift action_23
action_134 (19) = happyShift action_24
action_134 (22) = happyShift action_25
action_134 (36) = happyShift action_26
action_134 (37) = happyShift action_27
action_134 (8) = happyGoto action_158
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (47) = happyShift action_157
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (47) = happyShift action_156
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (25) = happyShift action_3
action_137 (30) = happyShift action_4
action_137 (31) = happyShift action_5
action_137 (44) = happyShift action_6
action_137 (53) = happyShift action_9
action_137 (54) = happyShift action_10
action_137 (55) = happyShift action_11
action_137 (56) = happyShift action_117
action_137 (5) = happyGoto action_114
action_137 (6) = happyGoto action_115
action_137 (7) = happyGoto action_155
action_137 _ = happyFail (happyExpListPerState 137)

action_138 _ = happyReduce_6

action_139 (25) = happyShift action_3
action_139 (30) = happyShift action_4
action_139 (31) = happyShift action_5
action_139 (44) = happyShift action_6
action_139 (53) = happyShift action_9
action_139 (54) = happyShift action_10
action_139 (55) = happyShift action_11
action_139 (56) = happyShift action_117
action_139 (5) = happyGoto action_114
action_139 (6) = happyGoto action_115
action_139 (7) = happyGoto action_154
action_139 _ = happyReduce_14

action_140 (25) = happyShift action_3
action_140 (30) = happyShift action_4
action_140 (31) = happyShift action_5
action_140 (44) = happyShift action_6
action_140 (53) = happyShift action_9
action_140 (54) = happyShift action_10
action_140 (55) = happyShift action_11
action_140 (56) = happyShift action_117
action_140 (5) = happyGoto action_114
action_140 (6) = happyGoto action_115
action_140 (7) = happyGoto action_153
action_140 _ = happyReduce_15

action_141 (11) = happyShift action_21
action_141 (13) = happyShift action_22
action_141 (14) = happyShift action_23
action_141 (18) = happyShift action_77
action_141 (19) = happyShift action_105
action_141 (20) = happyShift action_79
action_141 (21) = happyShift action_80
action_141 (22) = happyShift action_25
action_141 (36) = happyShift action_26
action_141 (37) = happyShift action_27
action_141 (61) = happyShift action_81
action_141 (8) = happyGoto action_152
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (11) = happyShift action_21
action_142 (13) = happyShift action_22
action_142 (14) = happyShift action_23
action_142 (19) = happyShift action_24
action_142 (22) = happyShift action_25
action_142 (36) = happyShift action_26
action_142 (37) = happyShift action_27
action_142 (38) = happyShift action_69
action_142 (39) = happyShift action_70
action_142 (40) = happyShift action_71
action_142 (8) = happyGoto action_151
action_142 _ = happyFail (happyExpListPerState 142)

action_143 _ = happyReduce_31

action_144 _ = happyReduce_34

action_145 (12) = happyShift action_150
action_145 (18) = happyShift action_77
action_145 (19) = happyShift action_78
action_145 (20) = happyShift action_79
action_145 (21) = happyShift action_80
action_145 (61) = happyShift action_81
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (47) = happyShift action_149
action_146 (58) = happyShift action_53
action_146 (59) = happyShift action_54
action_146 (60) = happyShift action_55
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (53) = happyShift action_9
action_147 (54) = happyShift action_10
action_147 (55) = happyShift action_11
action_147 (6) = happyGoto action_148
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (45) = happyShift action_171
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (53) = happyShift action_9
action_149 (54) = happyShift action_10
action_149 (55) = happyShift action_11
action_149 (6) = happyGoto action_170
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (11) = happyShift action_21
action_150 (13) = happyShift action_22
action_150 (14) = happyShift action_23
action_150 (19) = happyShift action_24
action_150 (22) = happyShift action_25
action_150 (36) = happyShift action_26
action_150 (37) = happyShift action_27
action_150 (8) = happyGoto action_169
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (11) = happyShift action_21
action_151 (13) = happyShift action_22
action_151 (14) = happyShift action_23
action_151 (18) = happyShift action_77
action_151 (19) = happyShift action_105
action_151 (20) = happyShift action_79
action_151 (21) = happyShift action_80
action_151 (22) = happyShift action_25
action_151 (36) = happyShift action_26
action_151 (37) = happyShift action_27
action_151 (61) = happyShift action_81
action_151 (8) = happyGoto action_168
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (11) = happyShift action_21
action_152 (13) = happyShift action_22
action_152 (14) = happyShift action_23
action_152 (18) = happyShift action_77
action_152 (19) = happyShift action_105
action_152 (20) = happyShift action_79
action_152 (21) = happyShift action_80
action_152 (22) = happyShift action_25
action_152 (36) = happyShift action_26
action_152 (37) = happyShift action_27
action_152 (61) = happyShift action_81
action_152 (8) = happyGoto action_167
action_152 _ = happyFail (happyExpListPerState 152)

action_153 _ = happyReduce_17

action_154 _ = happyReduce_16

action_155 (28) = happyShift action_166
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (25) = happyShift action_3
action_156 (30) = happyShift action_4
action_156 (31) = happyShift action_5
action_156 (44) = happyShift action_6
action_156 (53) = happyShift action_9
action_156 (54) = happyShift action_10
action_156 (55) = happyShift action_11
action_156 (56) = happyShift action_117
action_156 (5) = happyGoto action_114
action_156 (6) = happyGoto action_115
action_156 (7) = happyGoto action_165
action_156 _ = happyReduce_18

action_157 (25) = happyShift action_3
action_157 (30) = happyShift action_4
action_157 (31) = happyShift action_5
action_157 (44) = happyShift action_6
action_157 (53) = happyShift action_9
action_157 (54) = happyShift action_10
action_157 (55) = happyShift action_11
action_157 (56) = happyShift action_117
action_157 (5) = happyGoto action_114
action_157 (6) = happyGoto action_115
action_157 (7) = happyGoto action_164
action_157 _ = happyReduce_19

action_158 (18) = happyShift action_77
action_158 (19) = happyShift action_78
action_158 (20) = happyShift action_79
action_158 (21) = happyShift action_80
action_158 (61) = happyShift action_81
action_158 _ = happyReduce_59

action_159 (18) = happyShift action_77
action_159 (19) = happyShift action_78
action_159 (20) = happyShift action_79
action_159 (21) = happyShift action_80
action_159 (61) = happyShift action_81
action_159 _ = happyReduce_53

action_160 (18) = happyShift action_77
action_160 (19) = happyShift action_78
action_160 (20) = happyShift action_79
action_160 (21) = happyShift action_80
action_160 (61) = happyShift action_81
action_160 _ = happyReduce_54

action_161 (38) = happyShift action_69
action_161 (39) = happyShift action_70
action_161 (40) = happyShift action_71
action_161 _ = happyReduce_60

action_162 (38) = happyShift action_69
action_162 (39) = happyShift action_70
action_162 (40) = happyShift action_71
action_162 _ = happyReduce_57

action_163 (38) = happyShift action_69
action_163 (39) = happyShift action_70
action_163 (40) = happyShift action_71
action_163 _ = happyReduce_58

action_164 _ = happyReduce_21

action_165 _ = happyReduce_20

action_166 _ = happyReduce_5

action_167 (18) = happyShift action_77
action_167 (19) = happyShift action_78
action_167 (20) = happyShift action_79
action_167 (21) = happyShift action_80
action_167 (61) = happyShift action_81
action_167 _ = happyReduce_37

action_168 (18) = happyShift action_77
action_168 (19) = happyShift action_78
action_168 (20) = happyShift action_79
action_168 (21) = happyShift action_80
action_168 (61) = happyShift action_81
action_168 _ = happyReduce_44

action_169 (18) = happyShift action_77
action_169 (19) = happyShift action_78
action_169 (20) = happyShift action_79
action_169 (21) = happyShift action_80
action_169 (61) = happyShift action_81
action_169 _ = happyReduce_22

action_170 (23) = happyShift action_173
action_170 _ = happyFail (happyExpListPerState 170)

action_171 (25) = happyShift action_3
action_171 (30) = happyShift action_4
action_171 (31) = happyShift action_5
action_171 (44) = happyShift action_6
action_171 (53) = happyShift action_9
action_171 (54) = happyShift action_10
action_171 (55) = happyShift action_11
action_171 (56) = happyShift action_117
action_171 (5) = happyGoto action_114
action_171 (6) = happyGoto action_115
action_171 (7) = happyGoto action_172
action_171 _ = happyFail (happyExpListPerState 171)

action_172 (46) = happyShift action_175
action_172 _ = happyFail (happyExpListPerState 172)

action_173 (45) = happyShift action_174
action_173 _ = happyFail (happyExpListPerState 173)

action_174 (25) = happyShift action_3
action_174 (30) = happyShift action_4
action_174 (31) = happyShift action_5
action_174 (44) = happyShift action_6
action_174 (53) = happyShift action_9
action_174 (54) = happyShift action_10
action_174 (55) = happyShift action_11
action_174 (56) = happyShift action_117
action_174 (5) = happyGoto action_114
action_174 (6) = happyGoto action_115
action_174 (7) = happyGoto action_176
action_174 _ = happyFail (happyExpListPerState 174)

action_175 _ = happyReduce_7

action_176 (46) = happyShift action_177
action_176 _ = happyFail (happyExpListPerState 176)

action_177 _ = happyReduce_8

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Program2 happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (Program1 happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  4 happyReduction_3
happyReduction_3 _
	_
	 =  HappyAbsSyn4
		 (Comment
	)

happyReduce_4 = happySpecReduce_2  4 happyReduction_4
happyReduction_4 _
	_
	 =  HappyAbsSyn4
		 (Comment
	)

happyReduce_5 = happyReduce 7 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (IfElse happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 5 5 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (If happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 9 5 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (For happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 11 5 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (For happy_var_3 happy_var_5 happy_var_7 happy_var_10
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_2  5 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (OutputTile happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  5 happyReduction_10
happyReduction_10 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (OutputString happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 4 6 happyReduction_11
happyReduction_11 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (AssignInt happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 4 6 happyReduction_12
happyReduction_12 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (AssignString happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 6 happyReduction_13
happyReduction_13 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (AssignTile happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_2  7 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (Block1 happy_var_1
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  7 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn7
		 (Block2 happy_var_1
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (Block11 happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  7 happyReduction_17
happyReduction_17 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn7
		 (Block22 happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  7 happyReduction_18
happyReduction_18 _
	_
	_
	 =  HappyAbsSyn7
		 (BComment
	)

happyReduce_19 = happySpecReduce_3  7 happyReduction_19
happyReduction_19 _
	_
	_
	 =  HappyAbsSyn7
		 (BComment
	)

happyReduce_20 = happyReduce 4 7 happyReduction_20
happyReduction_20 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BDComment happy_var_4
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 7 happyReduction_21
happyReduction_21 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (BDComment happy_var_4
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 6 8 happyReduction_22
happyReduction_22 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  8 happyReduction_23
happyReduction_23 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  8 happyReduction_24
happyReduction_24 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  8 happyReduction_25
happyReduction_25 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Times happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  8 happyReduction_26
happyReduction_26 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Div happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  8 happyReduction_27
happyReduction_27 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Modulo happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  8 happyReduction_28
happyReduction_28 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (GetHeight happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  8 happyReduction_29
happyReduction_29 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (GetWidth happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  8 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  8 happyReduction_31
happyReduction_31 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Negate happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  8 happyReduction_32
happyReduction_32 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn8
		 (Int happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  8 happyReduction_33
happyReduction_33 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn8
		 (Var happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happyReduce 4 9 happyReduction_34
happyReduction_34 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (InputTile happy_var_2
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_3  9 happyReduction_35
happyReduction_35 (HappyAbsSyn8  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Blank happy_var_2 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  9 happyReduction_36
happyReduction_36 (HappyAbsSyn8  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Full happy_var_2 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happyReduce 6 9 happyReduction_37
happyReduction_37 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Subtile happy_var_2 happy_var_3 happy_var_4 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_3  9 happyReduction_38
happyReduction_38 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (And happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  9 happyReduction_39
happyReduction_39 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Or happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  9 happyReduction_40
happyReduction_40 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Xor happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_2  9 happyReduction_41
happyReduction_41 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Not happy_var_2
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_2  9 happyReduction_42
happyReduction_42 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (FlipY happy_var_2
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_2  9 happyReduction_43
happyReduction_43 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (FlipX happy_var_2
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happyReduce 6 9 happyReduction_44
happyReduction_44 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Place happy_var_2 happy_var_4 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_45 = happySpecReduce_2  9 happyReduction_45
happyReduction_45 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (RotateR happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_2  9 happyReduction_46
happyReduction_46 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (RotateL happy_var_2
	)
happyReduction_46 _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  9 happyReduction_47
happyReduction_47 (HappyAbsSyn8  happy_var_3)
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (ScaleUp happy_var_2 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  9 happyReduction_48
happyReduction_48 (HappyAbsSyn8  happy_var_3)
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (ScaleDown happy_var_2 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  9 happyReduction_49
happyReduction_49 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  9 happyReduction_50
happyReduction_50 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn9
		 (TVar happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happyReduce 4 10 happyReduction_51
happyReduction_51 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (MoreThanI happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 4 10 happyReduction_52
happyReduction_52 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (LessThanI happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 5 10 happyReduction_53
happyReduction_53 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (MoreThanEqualsI happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_54 = happyReduce 5 10 happyReduction_54
happyReduction_54 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (LessThanEqualsI happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_55 = happyReduce 4 10 happyReduction_55
happyReduction_55 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (MoreThanT happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_56 = happyReduce 4 10 happyReduction_56
happyReduction_56 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (LessThanT happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_57 = happyReduce 5 10 happyReduction_57
happyReduction_57 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (MoreThanEqualsT happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_58 = happyReduce 5 10 happyReduction_58
happyReduction_58 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (LessThanEqualsT happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_59 = happyReduce 5 10 happyReduction_59
happyReduction_59 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (EqualsI happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_60 = happyReduce 5 10 happyReduction_60
happyReduction_60 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (EqualsT happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_61 = happySpecReduce_3  10 happyReduction_61
happyReduction_61 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  10 happyReduction_62
happyReduction_62 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (BAnd happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  10 happyReduction_63
happyReduction_63 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (BOr happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  10 happyReduction_64
happyReduction_64 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (BXor happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_2  10 happyReduction_65
happyReduction_65 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (BNot happy_var_2
	)
happyReduction_65 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 62 62 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenLet -> cont 11;
	TokenIn -> cont 12;
	TokenInt happy_dollar_dollar -> cont 13;
	TokenVar happy_dollar_dollar -> cont 14;
	TokenEq -> cont 15;
	TokenMT -> cont 16;
	TokenLT -> cont 17;
	TokenPlus -> cont 18;
	TokenMinus -> cont 19;
	TokenTimes -> cont 20;
	TokenDiv -> cont 21;
	TokenOB -> cont 22;
	TokenCB -> cont 23;
	TokenDot -> cont 24;
	TokenIf -> cont 25;
	TokenThen -> cont 26;
	TokenElse -> cont 27;
	TokenEndif -> cont 28;
	TokenInputTile -> cont 29;
	TokenOutputTile -> cont 30;
	TokenOutputString -> cont 31;
	TokenBlank -> cont 32;
	TokenFull -> cont 33;
	TokenRotateR -> cont 34;
	TokenRotateL -> cont 35;
	TokenGetHeight -> cont 36;
	TokenGetWidth -> cont 37;
	TokenAnd -> cont 38;
	TokenOr -> cont 39;
	TokenXor -> cont 40;
	TokenNot -> cont 41;
	TokenFlipY -> cont 42;
	TokenFlipX -> cont 43;
	TokenFor -> cont 44;
	TokenDo -> cont 45;
	TokenEndfor -> cont 46;
	TokenColon -> cont 47;
	TokenPlace -> cont 48;
	TokenOn -> cont 49;
	TokenSubtile -> cont 50;
	TokenScaleUp -> cont 51;
	TokenScaleDown -> cont 52;
	TokenTInt -> cont 53;
	TokenTString -> cont 54;
	TokenTTile -> cont 55;
	TokenHash -> cont 56;
	TokenExclamation -> cont 57;
	TokenAmpersand -> cont 58;
	TokenVerticalBar -> cont 59;
	TokenCaret -> cont 60;
	TokenPercent -> cont 61;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 62 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. parseError
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: ([Token], [String]) -> a
parseError (ts, ss) = error ("Parse error: " ++ (show ts) ++ (show ss))

data Exp
      = Let String Exp Exp
	  | MoreThan Exp Exp
	  | LessThan Exp Exp
	  | Plus Exp Exp
	  | Minus Exp Exp
	  | Times Exp Exp
	  | Div Exp Exp
	  | Modulo Exp Exp
	  | GetHeight TExp
	  | GetWidth TExp
	  | Negate Exp
	  | Int Int
	  | Var String
      deriving Show

data Stmt
	  = AssignInt String Exp
	  | AssignString String Exp
	  | AssignTile String TExp
	  deriving Show

data Stmt2
	  = IfElse BExp Blck Blck
	  | If BExp Blck
	  | For Stmt BExp Stmt Blck
	  | OutputTile TExp
	  | OutputString Exp
	  deriving Show

data Blck
	  = Block1 Stmt
	  | Block2 Stmt2
	  | Block11 Stmt Blck
	  | Block22 Stmt2 Blck
	  | BComment
	  | BDComment Blck
	  deriving Show

data TExp
	  = InputTile String
	  | Blank Exp Exp
	  | Full Exp Exp
	  | Subtile TExp Exp Exp Exp Exp
	  | And TExp TExp
	  | Or TExp TExp
	  | Xor TExp TExp
	  | Not TExp
	  | FlipY TExp
	  | FlipX TExp
	  | Place TExp TExp Exp Exp
	  | RotateR TExp
	  | RotateL TExp
	  | ScaleUp TExp Exp
	  | ScaleDown TExp Exp
	  | TVar String
	  deriving Show

data BExp
	  = MoreThanI Exp Exp
	  | LessThanI Exp Exp
	  | MoreThanEqualsI Exp Exp
	  | LessThanEqualsI Exp Exp
	  | MoreThanT TExp TExp
	  | LessThanT TExp TExp
	  | MoreThanEqualsT TExp TExp
	  | LessThanEqualsT TExp TExp
	  | EqualsI Exp Exp
	  | EqualsT TExp TExp
	  | BAnd BExp BExp
	  | BOr BExp BExp
	  | BXor BExp BExp
	  | BNot BExp
	  deriving Show
	  
data Prgrm
	  = Program2 Stmt2
	  | Program1 Stmt
	  | Comment
	  deriving Show
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
