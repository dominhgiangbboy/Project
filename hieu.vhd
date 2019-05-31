library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity hieu is 
 port (
	Bit_out: out std_logic_vector(39 downto 0);
	clk: in std_logic;
	button: in std_logic_vector(7 downto 0);
	wren: out std_logic
 );
 end entity;
 architecture arch of hieu is
signal button_reg: integer range 0 to 255 ;
signal Bit_out_reg:  std_logic_vector(39 downto 0);
 
begin

button_reg <= to_integer(unsigned(button));
bit_out <= bit_out_reg;

process (clk)
begin
	if clk'event and clk = '1' then 
		case button_reg is
	when 0|10|15|20|5|25|30|35|40|45|50|55|60|65|70|75|85|90|95|100|105|110|115 =>bit_out_reg<="0110111011110011011110101100111000101111";
        when 3|2|21|6|22|31|34|41|44|48|53|62|66|71|72|26|80|89|94|101|106|114 =>bit_out_reg<="1101110100100010111001011010000010100010";
	when  121 to 130 =>bit_out_reg<="0001001101011000101101010010010100000111";
when  131 to 150 =>bit_out_reg<="1011000010110111101111010110011100010111";
when  151 to 180 =>bit_out_reg<="0001001101011000101101010010010100000111";
when  181 to 200 =>bit_out_reg<="0100010110101001001010000011100110001010";
when  210 to 240 =>bit_out_reg<="1101001011010100100101000001110001011010";
when  241 to 255 =>bit_out_reg<="1101010110100100111001010001100001011010";
when others => bit_out_reg <= "1000010111101101010110100100111001010001";
end case;
end if;
end process;
end arch;