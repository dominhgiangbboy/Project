
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------
ENTITY MUX_8to1 IS
	PORT(
		clk : in std_logic;
		DIN:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		SEL:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		enable : in std_logic := '0';
		DOUT:OUT STD_LOGIC);
END MUX_8to1;
--------------------------------------------------------------------

ARCHITECTURE BEH123 OF MUX_8to1 IS
	BEGIN
		PROCESS(clk)
		BEGIN
		if (enable = '1') and rising_edge(clk) then
			IF (SEL = "000") THEN DOUT <= DIN(0); 
			ELSIF (SEL = "001") THEN DOUT <= DIN(1); 
			ELSIF (SEL = "010") THEN  DOUT <= DIN(2); 
			ELSIF (SEL = "011") THEN DOUT <= DIN(3);
			ELSIF (SEL = "100") THEN DOUT <= DIN(4);
			ELSIF (SEL = "101") THEN DOUT <= DIN(5);
			ELSIF (SEL = "110") THEN DOUT <= DIN(6);
			ELSIF (SEL = "111") THEN DOUT <= DIN(7);
			END IF;
		END IF;
		END PROCESS;
END BEH123;