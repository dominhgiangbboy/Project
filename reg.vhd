library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-------------------------------------------------------------------
entity reg is
	port( 
	enable : in STD_LOGIC; 
	D : in STD_LOGIC_VECTOR(31  downto 0);
	clk : in STD_LOGIC; 
	rst : in STD_LOGIC; 
	Q :out STD_LOGIC_VECTOR(31  downto 0));
end reg;
----------------------------------------------------------------------
architecture arch of reg is 
	begin
	process(clk, rst)
	begin
		if clk'event  and clk = '1' then
			if rst = '1' then
				Q <= (others=> '0');
			elsif enable = '1' then
				Q<= D;
			end if;
		end if;
end process;
end arch;
