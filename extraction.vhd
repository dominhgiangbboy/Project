library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------
entity extraction is
	port(
		clk : in std_logic;
		data_in : in std_logic_vector(31 downto 0);
		enable : in std_logic := '0';
		bit_location : in std_logic_vector(39 downto 0);
		data_out : out std_logic_vector(7 downto 0));
	end extraction;
	
------------------------------------------------------
architecture arch of extraction is

signal index1,index2,index3,index4,index5,index6,index7,index8 : integer range 0 to 31 ;
begin
process(clk)
	begin
		if clk'event and clk = '1' then
				data_out(7) <= data_in(index8);
				data_out(6) <= data_in(index7);
				data_out(5) <= data_in(index6);
				data_out(4) <= data_in(index5);
				data_out(3) <= data_in(index4);
				data_out(2) <= data_in(index3);
				data_out(1) <= data_in(index2);
				data_out(0) <= data_in(index1);
			if enable = '1' then
				index8 <= to_integer(unsigned(bit_location(39 downto 35)));
				index7 <= to_integer(unsigned(bit_location(34 downto 30)));
				index6 <= to_integer(unsigned(bit_location(29 downto 25)));
				index5 <= to_integer(unsigned(bit_location(24 downto 20)));
				index4 <= to_integer(unsigned(bit_location(19 downto 15)));
				index3 <= to_integer(unsigned(bit_location(14 downto 10)));
				index2 <= to_integer(unsigned(bit_location(9 downto 5)));
				index1 <= to_integer(unsigned(bit_location(4 downto 0)));
			end if;
		end if;
	end process;
end arch;
	