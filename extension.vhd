library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------
entity extension is
	port(
		clk : in std_logic;
		count : in integer;
		bit_location: in std_logic_vector(39 downto 0);
		data_in : in std_logic_vector(7 downto 0);
		bit_out : out std_logic_vector(31 downto 0);
		ready : in std_logic := '0');
end extension;

----------------------------------------------------------

architecture arch of extension is


----------------------------------------------------------------
type mang1 is array (31 downto 0 ) of std_logic_vector(2 downto 0);
signal start : std_logic;
signal data_out : std_logic_vector(31 downto 0);
signal data_base : std_logic_vector(23 downto 0):= "010101111001111000110110";
type mang2 is array (31 downto 0) of std_logic_vector(4 downto 0);
signal index8,index7,index6,index5,index4,index3,index2,index1 : integer range 0 to 31;
signal comparison : mang2 := ("11111","11110","11101","11100","11011","11010","11001","11000","10111","10110","10101","10100","10011","10010","10001","10000","01111","01110","01101","01100","01011","01010","01001","01000","00111","00110","00101","00100","00011","00010","00001","00000");
signal result : mang2     := ("11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111","11111");
--signal count : integer range 0 to 213:= 0;
signal count1 : integer range -1 to 31 := 31;
signal count2 : integer range -1 to 23 := 23;
signal count22 : integer range 0 to 23 := 23;
signal count11 : integer range 0 to 31 := 31;
type mang3 is array (23 downto 0) of std_logic_vector(4 downto 0);
signal tmp, tmp1 : mang3;
signal temp8,temp7,temp6,temp5,temp4,temp3,temp2,temp1,temp0 : std_logic_vector(4 downto 0);
-------------------------------------------------------------------------------------------
begin 

-------------------------------------------------------------------------------------------------------------------------------------
process(clk)
begin
IF falling_edge(clk) then
			index8 <= to_integer(unsigned(bit_location(39 downto 35)));
			index7 <= to_integer(unsigned(bit_location(34 downto 30)));
			index6 <= to_integer(unsigned(bit_location(29 downto 25)));
			index5 <= to_integer(unsigned(bit_location(24 downto 20)));
			index4 <= to_integer(unsigned(bit_location(19 downto 15)));
			index3 <= to_integer(unsigned(bit_location(14 downto 10)));
			index2 <= to_integer(unsigned(bit_location(9 downto 5)));
			index1 <= to_integer(unsigned(bit_location(4 downto 0)));
end if;
end process;

---------------------------------------------------------------------------
process(clk)
	begin
		if clk'event and clk = '1' then 
			if count = 38 then
				bit_out(to_integer(unsigned(tmp(23)))) <= data_base(23);
				bit_out(to_integer(unsigned(tmp(22)))) <= data_base(22);
				bit_out(to_integer(unsigned(tmp(21)))) <= data_base(21);
				bit_out(to_integer(unsigned(tmp(20)))) <= data_base(20);
				bit_out(to_integer(unsigned(tmp(19)))) <= data_base(19);
				bit_out(to_integer(unsigned(tmp(18)))) <= data_base(18);
				bit_out(to_integer(unsigned(tmp(17)))) <= data_base(17);
				bit_out(to_integer(unsigned(tmp(16)))) <= data_base(16);
				bit_out(to_integer(unsigned(tmp(15)))) <= data_base(15);
				bit_out(to_integer(unsigned(tmp(14)))) <= data_base(14);
				bit_out(to_integer(unsigned(tmp(13)))) <= data_base(13);
				bit_out(to_integer(unsigned(tmp(12)))) <= data_base(12);
				bit_out(to_integer(unsigned(tmp(11)))) <= data_base(11);
				bit_out(to_integer(unsigned(tmp(10)))) <= data_base(10);
				bit_out(to_integer(unsigned(tmp(9)))) <= data_base(9);
				bit_out(to_integer(unsigned(tmp(8)))) <= data_base(8);
				bit_out(to_integer(unsigned(tmp(7)))) <= data_base(7);
				bit_out(to_integer(unsigned(tmp(6)))) <= data_base(6);
				bit_out(to_integer(unsigned(tmp(5)))) <= data_base(5);
				bit_out(to_integer(unsigned(tmp(4)))) <= data_base(4);
				bit_out(to_integer(unsigned(tmp(3)))) <= data_base(3);
				bit_out(to_integer(unsigned(tmp(2)))) <= data_base(2);
				bit_out(to_integer(unsigned(tmp(1)))) <= data_base(1);
				bit_out(to_integer(unsigned(tmp(0)))) <= data_base(0);
				end if;
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
			if count > 2  and count < 39 then		
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
--			if (count < 213) then
--				count <= count +1;
--			else count <= 0;
--			end if;
			if (count > 4) and count < 39 then
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
				if count = 5 then
					count2 <= 23;
					count1 <= 31;
					count22<= 23;
					count11<= 31;
				end if;
			end if;
		end if;
				
		if count = 41 then
			tmp <= (others => "00000");
			tmp1 <= (others => "00000");
			result <= (others => "11111");
		end if;
	end process;
end arch;

