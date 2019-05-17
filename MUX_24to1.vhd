LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------
ENTITY MUX_24to1 IS
	PORT(
		clk : in std_logic;
		DIN:IN STD_LOGIC_VECTOR(23 DOWNTO 0);
		SEL:IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		enable : in std_logic := '0';
		DOUT:OUT STD_LOGIC);
END MUX_24to1;
--------------------------------------------------------------------

ARCHITECTURE BEH123 OF MUX_24to1 IS
	BEGIN
		PROCESS(clk)
		BEGIN
		if (enable = '1') and rising_edge(clk) then
			IF (SEL = "00000") THEN DOUT <= DIN(0); 
			ELSIF (SEL = "00001") THEN DOUT <= DIN(1); 
			ELSIF (SEL = "00010") THEN  DOUT <= DIN(2); 
			ELSIF (SEL = "00011") THEN DOUT <= DIN(3);
			ELSIF (SEL = "00100") THEN DOUT <= DIN(4);
			ELSIF (SEL = "00101") THEN DOUT <= DIN(5);
			ELSIF (SEL = "00110") THEN DOUT <= DIN(6);
			ELSIF (SEL = "00111") THEN DOUT <= DIN(7);
			ELSIF (SEL = "01000") THEN DOUT <= DIN(8);
			ELSIF (SEL = "01001") THEN DOUT <= DIN(9);
			ELSIF (SEL = "01010") THEN DOUT <= DIN(10);
			ELSIF (SEL = "01011") THEN DOUT <= DIN(11);
			ELSIF (SEL = "01100") THEN DOUT <= DIN(12);
			ELSIF (SEL = "01101") THEN DOUT <= DIN(13);
			ELSIF (SEL = "01110") THEN DOUT <= DIN(14);
			ELSIF (SEL = "01111") THEN DOUT <= DIN(15);
			ELSIF (SEL = "10000") THEN DOUT <= DIN(16);
			ELSIF (SEL = "10001") THEN DOUT <= DIN(17);
			ELSIF (SEL = "10010") THEN DOUT <= DIN(18);
			ELSIF (SEL = "10011") THEN DOUT <= DIN(19);
			ELSIF (SEL = "10100") THEN DOUT <= DIN(20);
			ELSIF (SEL = "10101") THEN DOUT <= DIN(21);
			ELSIF (SEL = "10110") THEN DOUT <= DIN(22);
			ELSIF (SEL = "10111") THEN DOUT <= DIN(23);
			END IF;
		END IF;
		END PROCESS;
END BEH123;