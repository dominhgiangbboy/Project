library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------
entity extension is
	port(
		clk : in std_logic;
		bit_location: in std_logic_vector(39 downto 0);
		data_in : in std_logic_vector(7 downto 0);
		bit_out : out std_logic_vector(31 downto 0);
		ready : in std_logic := '0');
end extension;

----------------------------------------------------------

architecture arch of extension is

component demux_1to32_1 is
	port(
		clk : in std_logic;
		A : in std_logic;
		sel : in std_logic_vector(4 downto 0);
		en : in std_logic := '0';
		B : out std_logic_vector(31 downto 0)
		);
end component;
----------------------------------------------------------
component MUX_8to1 is
	PORT(
		clk : in std_logic;
		DIN:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		SEL:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		enable : in std_logic := '0';
		DOUT:OUT STD_LOGIC);
end component;
--------------------------------------------------------------
component MUX_24to1 is 
	PORT(
		clk : in std_logic;
		DIN:IN STD_LOGIC_VECTOR(23 DOWNTO 0);
		SEL:IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		enable : in std_logic := '0';
		DOUT:OUT STD_LOGIC);
end component;
----------------------------------------------------------------
type mang1 is array (31 downto 0 ) of std_logic_vector(2 downto 0);
signal sel : mang1;
signal start : std_logic;
signal data_out : std_logic_vector(31 downto 0);
signal data_base : std_logic_vector(23 downto 0):= "010101111001111000110110";
type mang2 is array (31 downto 0) of std_logic_vector(4 downto 0);
signal data_came0,data_came1,data_came2,data_came3 : std_logic_vector(23 downto 0);
signal data_came4,data_came5,data_came6,data_came7 : std_logic_vector(23 downto 0);
signal data_came8,data_came9,data_came10,data_came11 : std_logic_vector(23 downto 0);
signal data_came12,data_came13,data_came14,data_came15 : std_logic_vector(23 downto 0);
signal data_came16,data_came17,data_came18,data_came19 : std_logic_vector(23 downto 0);
signal data_came20,data_came21,data_came22,data_came23 : std_logic_vector(23 downto 0);
signal data_came24,data_came25,data_came26,data_came27 : std_logic_vector(23 downto 0);
signal data_came28,data_came29,data_came30,data_came31 : std_logic_vector(23 downto 0);
signal output : std_logic_vector(31 downto 0);
signal sel3 : mang2;
signal output0,output1,output2,output3 : std_logic_vector(31 downto 0);
signal output4,output5,output6,output7 : std_logic_vector(31 downto 0);
signal output8,output9,output10,output11 : std_logic_vector(31 downto 0);
signal output12,output13,output14,output15 : std_logic_vector(31 downto 0);
signal output16,output17,output18,output19 : std_logic_vector(31 downto 0);
signal output20,output21,output22,output23 : std_logic_vector(31 downto 0);
signal index8,index7,index6,index5,index4,index3,index2,index1 : integer range 0 to 31;
signal comparison : mang2 := ("11111","11110","11101","11100","11011","11010","11001","11000","10111","10110","10101","10100","10011","10010","10001","10000","01111","01110","01101","01100","01011","01010","01001","01000","00111","00110","00101","00100","00011","00010","00001","00000");
signal result : mang2     := ("11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111");
signal count : integer range 0 to 80:= 0;
signal count1 : integer range -1 to 31 := 31;
signal count2 : integer range -1 to 23 := 23;
signal count22 : integer range 0 to 23 := 23;
signal count11 : integer range 0 to 31 := 31;
type mang3 is array (23 downto 0) of std_logic_vector(4 downto 0);
signal tmp, tmp1 : mang3;
signal temp8,temp7,temp6,temp5,temp4,temp3,temp2,temp1,temp0 : std_logic_vector(4 downto 0);
-------------------------------------------------------------------------------------------
begin

data_base_demux1: demux_1to32_1 port map (
	clk => clk,
	A => data_base(0),
	sel => tmp1(0),
	en => start,
	B => output0);
-----------------------------------------------------------
data_base_demux2: demux_1to32_1 port map (
	clk => clk,
	A => data_base(1),
	sel => tmp1(1),
	en => start,
	B => output1);
-----------------------------------------------------------
data_base_demux3: demux_1to32_1 port map (
	clk => clk,
	A => data_base(2),
	sel => tmp1(2),
	en => start,
	B => output2);
-----------------------------------------------------------
data_base_demux4: demux_1to32_1 port map (
	clk => clk,
	A => data_base(3),
	sel => tmp1(3),
	en => start,
	B => output3);
-----------------------------------------------------------
data_base_demux5: demux_1to32_1 port map (
	clk => clk,
	A => data_base(4),
	sel => tmp1(4),
	en => start,
	B => output4);
-----------------------------------------------------------
data_base_demux6: demux_1to32_1 port map (
	clk => clk,
	A => data_base(5),
	sel => tmp1(5),
	en => start,
	B => output5);
-----------------------------------------------------------
data_base_demux7: demux_1to32_1 port map (
	clk => clk,
	A => data_base(6),
	sel => tmp1(6),
	en => start,
	B => output6);
-----------------------------------------------------------
data_base_demux8: demux_1to32_1 port map (
	clk => clk,
	A => data_base(7),
	sel => tmp1(7),
	en => start,
	B => output7);
-----------------------------------------------------------
data_base_demux9: demux_1to32_1 port map (
	clk => clk,
	A => data_base(8),
	sel => tmp1(8),
	en => start,
	B => output8);
-----------------------------------------------------------
data_base_demux10: demux_1to32_1 port map (
	clk => clk,
	A => data_base(9),
	sel => tmp1(9),
	en => start,
	B => output9);
-----------------------------------------------------------
data_base_demux11: demux_1to32_1 port map (
	clk => clk,
	A => data_base(10),
	sel => tmp1(10),
	en => start,
	B => output10);
-----------------------------------------------------------
data_base_demux12: demux_1to32_1 port map (
	clk => clk,
	A => data_base(11),
	sel => tmp1(11),
	en => start,
	B => output11);
-----------------------------------------------------------
data_base_demux13: demux_1to32_1 port map (
	clk => clk,
	A => data_base(12),
	sel => tmp1(12),
	en => start,
	B => output12);
-----------------------------------------------------------
data_base_demux14: demux_1to32_1 port map (
	clk => clk,
	A => data_base(13),
	sel => tmp1(13),
	en => start,
	B => output13);
-----------------------------------------------------------
data_base_demux15: demux_1to32_1 port map (
	clk => clk,
	A => data_base(14),
	sel => tmp1(14),
	en => start,
	B => output14);
-----------------------------------------------------------
data_base_demux16: demux_1to32_1 port map (
	clk => clk,
	A => data_base(15),
	sel => tmp1(15),
	en => start,
	B => output15);
-----------------------------------------------------------
data_base_demux17: demux_1to32_1 port map (
	clk => clk,
	A => data_base(16),
	sel => tmp1(16),
	en => start,
	B => output16);
-----------------------------------------------------------
data_base_demux18: demux_1to32_1 port map (
	clk => clk,
	A => data_base(17),
	sel => tmp1(17),
	en => start,
	B => output17);
-----------------------------------------------------------
data_base_demux19: demux_1to32_1 port map (
	clk => clk,
	A => data_base(18),
	sel => tmp1(18),
	en => start,
	B => output18);
-----------------------------------------------------------
data_base_demux20: demux_1to32_1 port map (
	clk => clk,
	A => data_base(19),
	sel => tmp1(19),
	en => start,
	B => output19);
-----------------------------------------------------------
data_base_demux21: demux_1to32_1 port map (
	clk => clk,
	A => data_base(20),
	sel => tmp1(20),
	en => start,
	B => output20);
-----------------------------------------------------------
data_base_demux22: demux_1to32_1 port map (
	clk => clk,
	A => data_base(21),
	sel => tmp1(21),
	en => start,
	B => output21);
-----------------------------------------------------------
data_base_demux23: demux_1to32_1 port map (
	clk => clk,
	A => data_base(22),
	sel => tmp1(22),
	en => start,
	B => output22);
-----------------------------------------------------------
data_base_demux24: demux_1to32_1 port map (
	clk => clk,
	A => data_base(23),
	sel => tmp1(23),
	en => start,
	B => output23);
-----------------------------------------------------------
data_base_mux1: MUX_24to1 port map(
	clk => clk,
	DIN => data_came0,
	SEL => sel3(0),
	enable => start,
	DOUT => output(0));
-------------------------------------------------------------
data_base_mux2: MUX_24to1 port map(
	clk => clk,
	DIN => data_came1,
	SEL => sel3(1),
	enable => start,
	DOUT => output(1));
-------------------------------------------------------------
data_base_mux3: MUX_24to1 port map(
	clk => clk,
	DIN => data_came2,
	SEL => sel3(2),
	enable => start,
	DOUT => output(2));
-------------------------------------------------------------
data_base_mux4: MUX_24to1 port map(
	clk => clk,
	DIN => data_came3,
	SEL => sel3(3),
	enable => start,
	DOUT => output(3));
-------------------------------------------------------------
data_base_mux5: MUX_24to1 port map(
	clk => clk,
	DIN => data_came4,
	SEL => sel3(4),
	enable => start,
	DOUT => output(4));
-------------------------------------------------------------
data_base_mux6: MUX_24to1 port map(
	clk => clk,
	DIN => data_came5,
	SEL => sel3(5),
	enable => start,
	DOUT => output(5));
-------------------------------------------------------------
data_base_mux7: MUX_24to1 port map(
	clk => clk,
	DIN => data_came6,
	SEL => sel3(6),
	enable => start,
	DOUT => output(6));
-------------------------------------------------------------
data_base_mux8: MUX_24to1 port map(
	clk => clk,
	DIN => data_came7,
	SEL => sel3(7),
	enable => start,
	DOUT => output(7));
-------------------------------------------------------------
data_base_mux9: MUX_24to1 port map(
	clk => clk,
	DIN => data_came8,
	SEL => sel3(8),
	enable => start,
	DOUT => output(8));
-------------------------------------------------------------
data_base_mux10: MUX_24to1 port map(
	clk => clk,
	DIN => data_came9,
	SEL => sel3(9),
	enable => start,
	DOUT => output(9));
-------------------------------------------------------------
data_base_mux11: MUX_24to1 port map(
	clk => clk,
	DIN => data_came10,
	SEL => sel3(10),
	enable => start,
	DOUT => output(10));
-------------------------------------------------------------
data_base_mux12: MUX_24to1 port map(
	clk => clk,
	DIN => data_came11,
	SEL => sel3(11),
	enable => start,
	DOUT => output(11));
-------------------------------------------------------------
data_base_mux13: MUX_24to1 port map(
	clk => clk,
	DIN => data_came12,
	SEL => sel3(12),
	enable => start,
	DOUT => output(12));
-------------------------------------------------------------
data_base_mux14: MUX_24to1 port map(
	clk => clk,
	DIN => data_came13,
	SEL => sel3(13),
	enable => start,
	DOUT => output(13));
-------------------------------------------------------------
data_base_mux15: MUX_24to1 port map(
	clk => clk,
	DIN => data_came14,
	SEL => sel3(14),
	enable => start,
	DOUT => output(14));
-------------------------------------------------------------
data_base_mux16: MUX_24to1 port map(
	clk => clk,
	DIN => data_came15,
	SEL => sel3(15),
	enable => start,
	DOUT => output(15));
-------------------------------------------------------------
data_base_mux17: MUX_24to1 port map(
	clk => clk,
	DIN => data_came16,
	SEL => sel3(16),
	enable => start,
	DOUT => output(16));
-------------------------------------------------------------
data_base_mux18: MUX_24to1 port map(
	clk => clk,
	DIN => data_came17,
	SEL => sel3(17),
	enable => start,
	DOUT => output(17));
-------------------------------------------------------------
data_base_mux19: MUX_24to1 port map(
	clk => clk,
	DIN => data_came18,
	SEL => sel3(18),
	enable => start,
	DOUT => output(18));
-------------------------------------------------------------
data_base_mux20: MUX_24to1 port map(
	clk => clk,
	DIN => data_came19,
	SEL => sel3(19),
	enable => start,
	DOUT => output(19));
-------------------------------------------------------------
data_base_mux21: MUX_24to1 port map(
	clk => clk,
	DIN => data_came20,
	SEL => sel3(20),
	enable => start,
	DOUT => output(20));
-------------------------------------------------------------
data_base_mux22: MUX_24to1 port map(
	clk => clk,
	DIN => data_came21,
	SEL => sel3(21),
	enable => start,
	DOUT => output(21));
-------------------------------------------------------------
data_base_mux23: MUX_24to1 port map(
	clk => clk,
	DIN => data_came22,
	SEL => sel3(22),
	enable => start,
	DOUT => output(22));
-------------------------------------------------------------
data_base_mux24: MUX_24to1 port map(
	clk => clk,
	DIN => data_came23,
	SEL => sel3(23),
	enable => start,
	DOUT => output(23));
-------------------------------------------------------------
data_base_mux25: MUX_24to1 port map(
	clk => clk,
	DIN => data_came24,
	SEL => sel3(24),
	enable => start,
	DOUT => output(24));
-------------------------------------------------------------
data_base_mux26: MUX_24to1 port map(
	clk => clk,
	DIN => data_came25,
	SEL => sel3(25),
	enable => start,
	DOUT => output(25));
-------------------------------------------------------------
data_base_mux27: MUX_24to1 port map(
	clk => clk,
	DIN => data_came26,
	SEL => sel3(26),
	enable => start,
	DOUT => output(26));
-------------------------------------------------------------
data_base_mux28: MUX_24to1 port map(
	clk => clk,
	DIN => data_came27,
	SEL => sel3(27),
	enable => start,
	DOUT => output(27));
-------------------------------------------------------------
data_base_mux29: MUX_24to1 port map(
	clk => clk,
	DIN => data_came28,
	SEL => sel3(28),
	enable => start,
	DOUT => output(28));
-------------------------------------------------------------
data_base_mux30: MUX_24to1 port map(
	clk => clk,
	DIN => data_came29,
	SEL => sel3(29),
	enable => start,
	DOUT => output(29));
-------------------------------------------------------------
data_base_mux31: MUX_24to1 port map(
	clk => clk,
	DIN => data_came30,
	SEL => sel3(30),
	enable => start,
	DOUT => output(30));
-------------------------------------------------------------
data_base_mux32: MUX_24to1 port map(
	clk => clk,
	DIN => data_came31,
	SEL => sel3(31),
	enable => start,
	DOUT => output(31));
-------------------------------------------------------------

data_came0 <= output23(0)&output22(0)&output21(0)&output20(0)&output19(0)&output18(0)&output17(0)&output16(0)&output15(0)&output14(0)&output13(0)&output12(0)&output11(0)&output10(0)&output9(0)&output8(0)&output7(0)&output6(0)&output5(0)&output4(0)&output3(0)&output2(0)&output1(0)&output0(0);
data_came1 <= output23(1)&output22(1)&output21(1)&output20(1)&output19(1)&output18(1)&output17(1)&output16(1)&output15(1)&output14(1)&output13(1)&output12(1)&output11(1)&output10(1)&output9(1)&output8(1)&output7(1)&output6(1)&output5(1)&output4(1)&output3(1)&output2(1)&output1(1)&output0(1);
data_came2 <= output23(2)&output22(2)&output21(2)&output20(2)&output19(2)&output18(2)&output17(2)&output16(2)&output15(2)&output14(2)&output13(2)&output12(2)&output11(2)&output10(2)&output9(2)&output8(2)&output7(2)&output6(2)&output5(2)&output4(2)&output3(2)&output2(2)&output1(2)&output0(2);
data_came3 <= output23(3)&output22(3)&output21(3)&output20(3)&output19(3)&output18(3)&output17(3)&output16(3)&output15(3)&output14(3)&output13(3)&output12(3)&output11(3)&output10(3)&output9(3)&output8(3)&output7(3)&output6(3)&output5(3)&output4(3)&output3(3)&output2(3)&output1(3)&output0(3);
data_came4 <= output23(4)&output22(4)&output21(4)&output20(4)&output19(4)&output18(4)&output17(4)&output16(4)&output15(4)&output14(4)&output13(4)&output12(4)&output11(4)&output10(4)&output9(4)&output8(4)&output7(4)&output6(4)&output5(4)&output4(4)&output3(4)&output2(4)&output1(4)&output0(4);
data_came5 <= output23(5)&output22(5)&output21(5)&output20(5)&output19(5)&output18(5)&output17(5)&output16(5)&output15(5)&output14(5)&output13(5)&output12(5)&output11(5)&output10(5)&output9(5)&output8(5)&output7(5)&output6(5)&output5(5)&output4(5)&output3(5)&output2(5)&output1(5)&output0(5);
data_came6 <= output23(6)&output22(6)&output21(6)&output20(6)&output19(6)&output18(6)&output17(6)&output16(6)&output15(6)&output14(6)&output13(6)&output12(6)&output11(6)&output10(6)&output9(6)&output8(6)&output7(6)&output6(6)&output5(6)&output4(6)&output3(6)&output2(6)&output1(6)&output0(6);
data_came7 <= output23(7)&output22(7)&output21(7)&output20(7)&output19(7)&output18(7)&output17(7)&output16(7)&output15(7)&output14(7)&output13(7)&output12(7)&output11(7)&output10(7)&output9(7)&output8(7)&output7(7)&output6(7)&output5(7)&output4(7)&output3(7)&output2(7)&output1(7)&output0(7);
data_came8 <= output23(8)&output22(8)&output21(8)&output20(8)&output19(8)&output18(8)&output17(8)&output16(8)&output15(8)&output14(8)&output13(8)&output12(8)&output11(8)&output10(8)&output9(8)&output8(8)&output7(9)&output6(8)&output5(8)&output4(8)&output3(8)&output2(8)&output1(8)&output0(8);
data_came9 <= output23(9)&output22(9)&output21(9)&output20(9)&output19(9)&output18(9)&output17(9)&output16(9)&output15(9)&output14(9)&output13(9)&output12(9)&output11(9)&output10(9)&output9(9)&output8(9)&output7(9)&output6(9)&output5(9)&output4(9)&output3(9)&output2(9)&output1(9)&output0(9);
data_came10 <= output23(10)&output22(10)&output21(10)&output20(10)&output19(10)&output18(10)&output17(10)&output16(10)&output15(10)&output14(10)&output13(10)&output12(10)&output11(10)&output10(10)&output9(10)&output8(10)&output7(10)&output6(10)&output5(10)&output4(10)&output3(10)&output2(10)&output1(10)&output0(10);
data_came11 <= output23(11)&output22(11)&output21(11)&output20(11)&output19(11)&output18(11)&output17(11)&output16(11)&output15(11)&output14(11)&output13(11)&output12(11)&output11(11)&output10(11)&output9(11)&output8(11)&output7(11)&output6(11)&output5(11)&output4(11)&output3(11)&output2(11)&output1(11)&output0(11);
data_came12 <= output23(12)&output22(12)&output21(12)&output20(12)&output19(12)&output18(12)&output17(12)&output16(12)&output15(12)&output14(12)&output13(12)&output12(12)&output11(12)&output10(12)&output9(12)&output8(12)&output7(12)&output6(12)&output5(12)&output4(12)&output3(12)&output2(12)&output1(12)&output0(12);
data_came13 <= output23(13)&output22(13)&output21(13)&output20(13)&output19(13)&output18(13)&output17(13)&output16(13)&output15(13)&output14(13)&output13(13)&output12(13)&output11(13)&output10(13)&output9(13)&output8(13)&output7(13)&output6(13)&output5(13)&output4(13)&output3(13)&output2(13)&output1(13)&output0(13);
data_came14 <= output23(14)&output22(14)&output21(14)&output20(14)&output19(14)&output18(14)&output17(14)&output16(14)&output15(14)&output14(14)&output13(14)&output12(14)&output11(14)&output10(14)&output9(14)&output8(14)&output7(14)&output6(14)&output5(14)&output4(14)&output3(14)&output2(14)&output1(14)&output0(14);
data_came15 <= output23(15)&output22(15)&output21(15)&output20(15)&output19(15)&output18(15)&output17(15)&output16(15)&output15(15)&output14(15)&output13(15)&output12(15)&output11(15)&output10(15)&output9(15)&output8(15)&output7(15)&output6(15)&output5(15)&output4(15)&output3(15)&output2(15)&output1(15)&output0(15);
data_came16 <= output23(16)&output22(16)&output21(16)&output20(16)&output19(16)&output18(16)&output17(16)&output16(16)&output15(16)&output14(16)&output13(16)&output12(16)&output11(16)&output10(16)&output9(16)&output8(16)&output7(16)&output6(16)&output5(16)&output4(16)&output3(16)&output2(16)&output1(16)&output0(16);
data_came17 <= output23(17)&output22(17)&output21(17)&output20(17)&output19(17)&output18(17)&output17(17)&output16(17)&output15(17)&output14(17)&output13(17)&output12(17)&output11(17)&output10(17)&output9(17)&output8(17)&output7(17)&output6(17)&output5(17)&output4(17)&output3(17)&output2(17)&output1(17)&output0(17);
data_came18 <= output23(18)&output22(18)&output21(18)&output20(18)&output19(18)&output18(18)&output17(18)&output16(18)&output15(18)&output14(18)&output13(18)&output12(18)&output11(18)&output10(18)&output9(18)&output8(18)&output7(18)&output6(18)&output5(18)&output4(18)&output3(18)&output2(18)&output1(18)&output0(18);
data_came19 <= output23(19)&output22(19)&output21(19)&output20(19)&output19(19)&output18(19)&output17(19)&output16(19)&output15(19)&output14(19)&output13(19)&output12(19)&output11(19)&output10(19)&output9(19)&output8(19)&output7(19)&output6(19)&output5(19)&output4(19)&output3(19)&output2(19)&output1(19)&output0(19);
data_came20 <= output23(20)&output22(20)&output21(20)&output20(20)&output19(20)&output18(20)&output17(20)&output16(20)&output15(20)&output14(20)&output13(20)&output12(20)&output11(20)&output10(20)&output9(20)&output8(20)&output7(20)&output6(20)&output5(20)&output4(20)&output3(20)&output2(20)&output1(20)&output0(20);
data_came21 <= output23(21)&output22(21)&output21(21)&output20(21)&output19(21)&output18(21)&output17(21)&output16(21)&output15(21)&output14(21)&output13(21)&output12(21)&output11(21)&output10(21)&output9(21)&output8(21)&output7(21)&output6(21)&output5(21)&output4(21)&output3(21)&output2(21)&output1(21)&output0(21);
data_came22 <= output23(22)&output22(22)&output21(22)&output20(22)&output19(22)&output18(22)&output17(22)&output16(22)&output15(22)&output14(22)&output13(22)&output12(22)&output11(22)&output10(22)&output9(22)&output8(22)&output7(22)&output6(22)&output5(22)&output4(22)&output3(22)&output2(22)&output1(22)&output0(22);
data_came23 <= output23(23)&output22(23)&output21(23)&output20(23)&output19(23)&output18(23)&output17(23)&output16(23)&output15(23)&output14(23)&output13(23)&output12(23)&output11(23)&output10(23)&output9(23)&output8(23)&output7(23)&output6(23)&output5(23)&output4(23)&output3(23)&output2(23)&output1(23)&output0(23);
data_came24 <= output23(24)&output22(24)&output21(24)&output20(24)&output19(24)&output18(24)&output17(24)&output16(24)&output15(24)&output14(24)&output13(24)&output12(24)&output11(24)&output10(24)&output9(24)&output8(24)&output7(24)&output6(24)&output5(24)&output4(24)&output3(24)&output2(24)&output1(24)&output0(24);
data_came25 <= output23(25)&output22(25)&output21(25)&output20(25)&output19(25)&output18(25)&output17(25)&output16(25)&output15(25)&output14(25)&output13(25)&output12(25)&output11(25)&output10(25)&output9(25)&output8(25)&output7(25)&output6(25)&output5(25)&output4(25)&output3(25)&output2(25)&output1(25)&output0(25);
data_came26 <= output23(26)&output22(26)&output21(26)&output20(26)&output19(26)&output18(26)&output17(26)&output16(26)&output15(26)&output14(26)&output13(26)&output12(26)&output11(26)&output10(26)&output9(26)&output8(26)&output7(26)&output6(26)&output5(26)&output4(26)&output3(26)&output2(26)&output1(26)&output0(26);
data_came27 <= output23(27)&output22(27)&output21(27)&output20(27)&output19(27)&output18(27)&output17(27)&output16(27)&output15(27)&output14(27)&output13(27)&output12(27)&output11(27)&output10(27)&output9(27)&output8(27)&output7(27)&output6(27)&output5(27)&output4(27)&output3(27)&output2(27)&output1(27)&output0(27);
data_came28 <= output23(28)&output22(28)&output21(28)&output20(28)&output19(28)&output18(28)&output17(28)&output16(28)&output15(28)&output14(28)&output13(28)&output12(28)&output11(28)&output10(28)&output9(28)&output8(28)&output7(28)&output6(28)&output5(28)&output4(28)&output3(28)&output2(28)&output1(28)&output0(28);
data_came29 <= output23(29)&output22(29)&output21(29)&output20(29)&output19(29)&output18(29)&output17(29)&output16(29)&output15(29)&output14(29)&output13(29)&output12(29)&output11(29)&output10(29)&output9(29)&output8(29)&output7(29)&output6(29)&output5(29)&output4(29)&output3(29)&output2(29)&output1(29)&output0(29);
data_came30 <= output23(30)&output22(30)&output21(30)&output20(30)&output19(30)&output18(30)&output17(30)&output16(30)&output15(30)&output14(30)&output13(30)&output12(30)&output11(30)&output10(30)&output9(30)&output8(30)&output7(30)&output6(30)&output5(30)&output4(30)&output3(30)&output2(30)&output1(30)&output0(30);
data_came31 <= output23(31)&output22(31)&output21(31)&output20(31)&output19(31)&output18(31)&output17(31)&output16(31)&output15(31)&output14(31)&output13(31)&output12(31)&output11(31)&output10(31)&output9(31)&output8(31)&output7(31)&output6(31)&output5(31)&output4(31)&output3(31)&output2(31)&output1(31)&output0(31);
-------------------------------------------------------------------------------------------------------------------------------------
index8 <= to_integer(unsigned(bit_location(39 downto 35)));
index7 <= to_integer(unsigned(bit_location(34 downto 30)));
index6 <= to_integer(unsigned(bit_location(29 downto 25)));
index5 <= to_integer(unsigned(bit_location(24 downto 20)));
index4 <= to_integer(unsigned(bit_location(19 downto 15)));
index3 <= to_integer(unsigned(bit_location(14 downto 10)));
index2 <= to_integer(unsigned(bit_location(9 downto 5)));
index1 <= to_integer(unsigned(bit_location(4 downto 0)));

---------------------------------------------------------------------------
process(clk)
	begin
		if clk'event and clk = '1' then 
			if ready = '1' then
			bit_out(index8) <= data_in(7);
			bit_out(index7) <= data_in(6);
			bit_out(index6) <= data_in(5);
			bit_out(index5) <= data_in(4);
			bit_out(index4) <= data_in(3);
			bit_out(index3) <= data_in(2);
			bit_out(index2) <= data_in(1);
			bit_out(index1) <= data_in(0);
			end if;
			bit_out(to_integer(unsigned(tmp1(0)))) <= output(to_integer(unsigned(tmp1(0))));
			bit_out(to_integer(unsigned(tmp1(1)))) <= output(to_integer(unsigned(tmp1(1))));
			bit_out(to_integer(unsigned(tmp1(2)))) <= output(to_integer(unsigned(tmp1(2))));
			bit_out(to_integer(unsigned(tmp1(3)))) <= output(to_integer(unsigned(tmp1(3))));
			bit_out(to_integer(unsigned(tmp1(4)))) <= output(to_integer(unsigned(tmp1(4))));
			bit_out(to_integer(unsigned(tmp1(5)))) <= output(to_integer(unsigned(tmp1(5))));
			bit_out(to_integer(unsigned(tmp1(6)))) <= output(to_integer(unsigned(tmp1(6))));
			bit_out(to_integer(unsigned(tmp1(7)))) <= output(to_integer(unsigned(tmp1(7))));
			bit_out(to_integer(unsigned(tmp1(8)))) <= output(to_integer(unsigned(tmp1(8))));
			bit_out(to_integer(unsigned(tmp1(9)))) <= output(to_integer(unsigned(tmp1(9))));
			bit_out(to_integer(unsigned(tmp1(10)))) <= output(to_integer(unsigned(tmp1(10))));
			bit_out(to_integer(unsigned(tmp1(11)))) <= output(to_integer(unsigned(tmp1(11))));
			bit_out(to_integer(unsigned(tmp1(12)))) <= output(to_integer(unsigned(tmp1(12))));
			bit_out(to_integer(unsigned(tmp1(13)))) <= output(to_integer(unsigned(tmp1(13))));
			bit_out(to_integer(unsigned(tmp1(14)))) <= output(to_integer(unsigned(tmp1(14))));
			bit_out(to_integer(unsigned(tmp1(15)))) <= output(to_integer(unsigned(tmp1(15))));
			bit_out(to_integer(unsigned(tmp1(16)))) <= output(to_integer(unsigned(tmp1(16))));
			bit_out(to_integer(unsigned(tmp1(17)))) <= output(to_integer(unsigned(tmp1(17))));
			bit_out(to_integer(unsigned(tmp1(18)))) <= output(to_integer(unsigned(tmp1(18))));
			bit_out(to_integer(unsigned(tmp1(19)))) <= output(to_integer(unsigned(tmp1(19))));
			bit_out(to_integer(unsigned(tmp1(20)))) <= output(to_integer(unsigned(tmp1(20))));
			bit_out(to_integer(unsigned(tmp1(21)))) <= output(to_integer(unsigned(tmp1(21))));
			bit_out(to_integer(unsigned(tmp1(22)))) <= output(to_integer(unsigned(tmp1(22))));
			bit_out(to_integer(unsigned(tmp1(23)))) <= output(to_integer(unsigned(tmp1(23))));
			start <= '1';	
			if count > 0 then		
			result(index8) <= temp8;
			temp8 <= comparison(index8) xor bit_location(39 downto 35);
			result(index7) <= temp7;
			temp7 <= comparison(index7) xor bit_location(34 downto 30);
			result(index6) <= temp6; 
			temp6 <= comparison(index6) xor bit_location(29 downto 25);
			result(index5) <= temp5;
			temp5 <= comparison(index5) xor bit_location(24 downto 20);
			result(index4) <= temp4;
			temp4 <= comparison(index4) xor bit_location(19 downto 15);
			result(index3) <= temp3;
			temp3 <= comparison(index3) xor bit_location(14 downto 10);
			result(index2) <= temp2;
			temp2 <= comparison(index2) xor bit_location(9 downto 5);
			result(index1) <= temp1;
			temp1 <= comparison(index1) xor bit_location(4 downto 0);
			end if;
			if (count < 80) then
				count <= count +1;
			else count <= 0;
			end if;
			if (count > 2) then
				if count11 > 0 then
				count11 <= count11 -1;
				end if;
				if (result(count11) = "11111")  then
					tmp(count22) <= comparison(count11);
					
					if count2 > -1 then
					count2 <= count2 - 1;
					
					end if;
					if count22 > 0 then
					count22 <= count22 -1;
					
					end if;
			
				end if;
				if(count2 = -1) then
					tmp1 <= tmp;
				end if;
				if (count2 = -1) then
					count2 <= 23;
					count1 <= 31;
					count22<= 23;
					count11<= 31;
						
				end if;
			end if;
		end if;
		if (falling_edge(clk)) then
			if (count = 37) then
				sel3(to_integer(unsigned(tmp1(23)))) <= "10111";
				sel3(to_integer(unsigned(tmp1(22)))) <= "10110";
				sel3(to_integer(unsigned(tmp1(21)))) <= "10101";
				sel3(to_integer(unsigned(tmp1(20)))) <= "10100";
				sel3(to_integer(unsigned(tmp1(19)))) <= "10011";
				sel3(to_integer(unsigned(tmp1(18)))) <= "10010";
				sel3(to_integer(unsigned(tmp1(17)))) <= "10001";
				sel3(to_integer(unsigned(tmp1(16)))) <= "10000";
				sel3(to_integer(unsigned(tmp1(15)))) <= "01111";
				sel3(to_integer(unsigned(tmp1(14)))) <= "01110";
				sel3(to_integer(unsigned(tmp1(13)))) <= "01101";
				sel3(to_integer(unsigned(tmp1(12)))) <= "01100";
				sel3(to_integer(unsigned(tmp1(11)))) <= "01011";
				sel3(to_integer(unsigned(tmp1(10)))) <= "01010";
				sel3(to_integer(unsigned(tmp1(9))))  <= "01001";
				sel3(to_integer(unsigned(tmp1(8))))  <= "01000";
				sel3(to_integer(unsigned(tmp1(7))))  <= "00111";
				sel3(to_integer(unsigned(tmp1(6))))  <= "00110";
				sel3(to_integer(unsigned(tmp1(5))))  <= "00101";
				sel3(to_integer(unsigned(tmp1(4))))  <= "00100";
				sel3(to_integer(unsigned(tmp1(3))))  <= "00011";
				sel3(to_integer(unsigned(tmp1(2))))  <= "00010";
				sel3(to_integer(unsigned(tmp1(1))))  <= "00001";
				sel3(to_integer(unsigned(tmp1(0))))  <= "00000";
			end if;
		end if;
	end process;
end arch;

