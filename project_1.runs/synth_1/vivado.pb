
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {E:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/utils_1/imports/synth_1/CPU.dcp}2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2m
YE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/utils_1/imports/synth_1/CPU.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
p
Command: %s
53*	vivadotcl2?
+synth_design -top CPU -part xc7z020clg400-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7z0202default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7z0202default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7z020clg400-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
_
#Helper process launched with PID %s4824*oasys2
69082default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EE:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
clk_divided2default:default2
wire2default:default2c
ME:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/CPU.v2default:default2
852default:default8@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
clk12default:default2
wire2default:default2c
ME:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/CPU.v2default:default2
892default:default8@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
clk22default:default2
wire2default:default2c
ME:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/CPU.v2default:default2
892default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:01 ; elapsed = 00:00:03 . Memory (MB): peak = 1233.996 ; gain = 408.332
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
CPU2default:default2
 2default:default2c
ME:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/CPU.v2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2(
instruction_register2default:default2
 2default:default2t
^E:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/instruction_register.v2default:default2
232default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter WIDTH_REG bound to: 8 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2(
instruction_register2default:default2
 2default:default2
02default:default2
12default:default2t
^E:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/instruction_register.v2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
clock_divided2default:default2
 2default:default2m
WE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/clock_divided.v2default:default2
232default:default8@Z8-6157h px� 
l
%s
*synth2T
@	Parameter clock_frequency bound to: 125000000 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
clock_divided2default:default2
 2default:default2
02default:default2
12default:default2m
WE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/clock_divided.v2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2#
clock_generator2default:default2
 2default:default2o
YE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/clock_generator.v2default:default2
232default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
clock_generator2default:default2
 2default:default2
02default:default2
12default:default2o
YE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/clock_generator.v2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2%
address_mux_trang2default:default2
 2default:default2q
[E:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/Address_mux_trang.v2default:default2
232default:default8@Z8-6157h px� 
f
%s
*synth2N
:	Parameter WIDTH_ADDRESS_BIT bound to: 5 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
address_mux_trang2default:default2
 2default:default2
02default:default2
12default:default2q
[E:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/Address_mux_trang.v2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Decoder2default:default2
 2default:default2g
QE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/Decoder.v2default:default2
232default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter WIDTH_REG bound to: 8 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter OPCODE bound to: 3 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Decoder2default:default2
 2default:default2
02default:default2
12default:default2g
QE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/Decoder.v2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2#
program_counter2default:default2
 2default:default2o
YE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/program_counter.v2default:default2
232default:default8@Z8-6157h px� 
f
%s
*synth2N
:	Parameter WIDTH_ADDRESS_BIT bound to: 5 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
program_counter2default:default2
 2default:default2
02default:default2
12default:default2o
YE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/program_counter.v2default:default2
232default:default8@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
62default:default2
pc_out2default:default2
52default:default2#
program_counter2default:default2c
ME:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/CPU.v2default:default2
1082default:default8@Z8-689h px� 
�
synthesizing module '%s'%s4497*oasys2 
memory_trang2default:default2
 2default:default2l
VE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/Memory_trang.v2default:default2
232default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter WIDTH_REG bound to: 8 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WIDTH_ADDRESS bound to: 5 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
memory_trang2default:default2
 2default:default2
02default:default2
12default:default2l
VE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/Memory_trang.v2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
register2default:default2
 2default:default2h
RE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/register.v2default:default2
232default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter WIDTH_REG bound to: 8 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
register2default:default2
 2default:default2
02default:default2
12default:default2h
RE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/register.v2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ALU_real2default:default2
 2default:default2h
RE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/ALU_real.v2default:default2
232default:default8@Z8-6157h px� 
e
%s
*synth2M
9	Parameter width_bit_opcode bound to: 3 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter width_bit_reg bound to: 8 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2h
RE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/ALU_real.v2default:default2
572default:default8@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ALU_real2default:default2
 2default:default2
02default:default2
12default:default2h
RE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/ALU_real.v2default:default2
232default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

controller2default:default2
 2default:default2j
TE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/controller.v2default:default2
232default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter WIDTH_REG bound to: 8 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter OPCODE bound to: 3 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

controller2default:default2
 2default:default2
02default:default2
12default:default2j
TE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/controller.v2default:default2
232default:default8@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
62default:default2
pc_out2default:default2
52default:default2

controller2default:default2c
ME:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/CPU.v2default:default2
1462default:default8@Z8-689h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CPU2default:default2
 2default:default2
02default:default2
12default:default2c
ME:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/CPU.v2default:default2
232default:default8@Z8-6155h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2"
memory_reg[25]2default:default2 
memory_trang2default:default2l
VE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/Memory_trang.v2default:default2
482default:default8@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2"
memory_reg[29]2default:default2 
memory_trang2default:default2l
VE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.srcs/sources_1/new/Memory_trang.v2default:default2
482default:default8@Z8-7137h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

address[4]2default:default2
ALU_real2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

address[3]2default:default2
ALU_real2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

address[2]2default:default2
ALU_real2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

address[1]2default:default2
ALU_real2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

address[0]2default:default2
ALU_real2default:defaultZ8-7129h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 1331.461 ; gain = 505.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 1331.461 ; gain = 505.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 1331.461 ; gain = 505.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0052default:default2
1331.4612default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
in2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1882default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1882default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
out12default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1892default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1892default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
out22default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1902default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1902default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
out02default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1922default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1922default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
out12default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1932default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1932default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
out22default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1942default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1942default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
out32default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1952default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1952default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
in4[3]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1962default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1962default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
in4[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1972default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1972default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
in4[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1982default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1982default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
in4[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1992default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
1992default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
out02default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2002default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2002default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
out32default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2012default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2012default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
in4[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2022default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2022default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
in4[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2032default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2032default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
in4[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2042default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2042default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
in4[3]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2052default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2052default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
clock2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2072default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2072default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
empty2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2082default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2082default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
full2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2092default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2092default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
read_enable2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2102default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2102default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2 
write_enable2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2122default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2122default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[3]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2172default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2172default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2182default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2182default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2192default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2192default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2202default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2202default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
clock2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2212default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2212default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
empty2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2222default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2222default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
full2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2232default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2232default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw02default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2252default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2252default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw12default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2262default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2262default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
but[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2272default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2272default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
but[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2282default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2282default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
but[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2292default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2292default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
but[3]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2302default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2302default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
left[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2312default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2312default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
left[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2322default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2322default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
left[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2332default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2332default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
right[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2342default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2342default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
right[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2352default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2352default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
right[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2362default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2362default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw02default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2372default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2372default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw12default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2382default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2382default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
but[3]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2392default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2392default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
but[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2402default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2402default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
but[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2412default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2412default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
but[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2422default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2422default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
left[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2432default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2432default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
left[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2442default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2442default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
left[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2452default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2452default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
right[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2462default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2462default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
right[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2472default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2472default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
right[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2482default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2482default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
Q2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2502default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2502default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
Q2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2532default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2532default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2552default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2552default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2562default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2562default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2572default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2572default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[3]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2582default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2582default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
do_clk2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2602default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2602default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
bao_counter2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2642default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2642default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
bao_counter2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2672default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2672default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
enable2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2702default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2702default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[0]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2712default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2712default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[1]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2722default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2722default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[2]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2732default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2732default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[3]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2742default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2742default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[4]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2752default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2752default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[5]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2762default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2762default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[6]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2772default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2772default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
en2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2792default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2792default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
en2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2802default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2802default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[8]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2872default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2872default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[7]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2882default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2882default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[6]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2892default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2892default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[5]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2902default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2902default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[4]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2912default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2912default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[4]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2962default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2962default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[5]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2972default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2972default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[6]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2982default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2982default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[7]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2992default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
2992default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
data_out[8]2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
3002default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2
3002default:default8@Z17-55h px�
�
Finished Parsing XDC File [%s]
178*designutils2g
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2e
QE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Master.xdc2default:default2)
.Xil/CPU_propImpl.xdc2default:defaultZ1-236h px� 
�
Parsing XDC File [%s]
179*designutils2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
read_enable2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
1982default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
1982default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
do_clk2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
1992default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
1992default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
enable2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2012default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2012default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	bin_in[3]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2022default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2022default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	bin_in[2]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2032default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2032default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	bin_in[1]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2042default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2042default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	bin_in[0]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2052default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2052default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[6]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2062default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2062default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[5]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2072default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2072default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[4]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2082default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2082default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[3]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2092default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2092default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[2]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2102default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2102default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[1]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2112default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2112default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

led_out[0]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2122default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2122default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	bin_in[0]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2132default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2132default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	bin_in[1]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2142default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2142default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	bin_in[2]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2152default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2152default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	bin_in[3]2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2162default:default8@Z12-584h px�
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2!
Vivado 12-5842default:default2
1002default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2162default:default8@Z17-14h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2
2162default:default8@Z17-55h px�
�
Finished Parsing XDC File [%s]
178*designutils2w
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2u
aE:/BKU/year_1/semester 2/CO1025 - Logic design with HDL/Lab/Arty-Z7-20-Extension-board-Master.xdc2default:default2)
.Xil/CPU_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1392.0042default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1392.0042default:default2
0.0002default:defaultZ17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EE:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:05 ; elapsed = 00:00:10 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7z020clg400-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:05 ; elapsed = 00:00:10 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:05 ; elapsed = 00:00:10 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:10 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   27 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    7 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    6 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      8 Bit         XORs := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               27 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 37    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                6 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                5 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 15    
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   27 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 39    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 5     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 220 (col length:60)
BRAMs: 280 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:05 ; elapsed = 00:00:13 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:08 ; elapsed = 00:00:19 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:08 ; elapsed = 00:00:19 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:08 ; elapsed = 00:00:19 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:10 ; elapsed = 00:00:25 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:10 ; elapsed = 00:00:25 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:10 ; elapsed = 00:00:25 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:10 ; elapsed = 00:00:25 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:10 ; elapsed = 00:00:25 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:10 ; elapsed = 00:00:25 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     3|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |     9|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |     1|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |    19|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |    51|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |    13|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT5   |    37|
2default:defaulth px� 
D
%s*synth2,
|8     |LUT6   |    91|
2default:defaulth px� 
D
%s*synth2,
|9     |MUXF7  |    32|
2default:defaulth px� 
D
%s*synth2,
|10    |MUXF8  |    16|
2default:defaulth px� 
D
%s*synth2,
|11    |FDCE   |   249|
2default:defaulth px� 
D
%s*synth2,
|12    |FDPE   |    88|
2default:defaulth px� 
D
%s*synth2,
|13    |FDRE   |    16|
2default:defaulth px� 
D
%s*synth2,
|14    |IBUF   |    12|
2default:defaulth px� 
D
%s*synth2,
|15    |OBUF   |     9|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:10 ; elapsed = 00:00:25 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:08 ; elapsed = 00:00:24 . Memory (MB): peak = 1392.004 ; gain = 505.797
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:11 ; elapsed = 00:00:25 . Memory (MB): peak = 1392.004 ; gain = 566.340
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0102default:default2
1392.0042default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
572default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1392.0042default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
2423d8ff2default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
512default:default2
1102default:default2
1002default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:122default:default2
00:00:292default:default2
1392.0042default:default2
972.5512default:defaultZ17-268h px� 
u
%s6*runtcl2Y
ESynthesis results are not added to the cache due to CRITICAL_WARNING
2default:defaulth px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2]
IE:/BKU/year_3/SEMESTER 1/project_HDL/codes/project_1.runs/synth_1/CPU.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2p
\Executing : report_utilization -file CPU_utilization_synth.rpt -pb CPU_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sat Dec 14 11:03:54 20242default:defaultZ17-206h px� 


End Record