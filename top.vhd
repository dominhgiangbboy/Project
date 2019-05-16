library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control is
	port(
		clk: in std_logic;
		reset: in std_logic;
		txD: out std_logic;
		button: in std_logic
		);
end entity;

architecture arc of control is
	signal clk_25: std_logic;
	signal TxD_start: std_logic;
	signal TxD_data: std_logic_vector(7 downto 0);
	signal TxD_a: std_logic;
	signal TxD_busy: std_logic;
component async_transmitter is
port (
	 clk: in std_logic;
	 TxD_start: in std_logic;
	 TxD_data: in std_logic_vector(7 downto 0);
	 TxD: out std_logic;
	 TxD_busy:out std_logic
);
end component;
begin
txd <= txd_a;
a1: async_transmitter port map (clk => clk_25, txd_start => txd_start, txd_data => txd_data, txd_busy => txd_busy,
txd => txd_a);
process(clk)
begin
	if clk'event and clk = '1' then
		if button = '0' then txd_start <= '0';
		else txd_start <= '1';
		end if;
		if txd_start = '0' then txd_data <= "10101010";
		end if;
	end if;
end process;
end arc;
