library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.fixed_pkg.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------
entity logistic is 
	port(
		clk : in std_logic;
		C_new : out std_logic_vector(7 downto 0);
		led : out std_logic_vector(7 downto 0));
	end logistic;
-------------------------------------------------------------------
architecture arch of logistic is
---------------------------------------------------------------------------	
	component LogisticMap 
	port(
       Clock        		: in  STD_LOGIC ;
       InitEn      			: in  STD_LOGIC ;
       Parameter_R		   : in ufixed ( 2 downto -31);
       Xn_in     	   		: in ufixed ( 0 downto -31); 
	    Xn_Out					: out ufixed ( 0 downto -31)
       );
	end component;
-----------------------------------------------------------------------------
component reg is 
	port( 
	enable : in STD_LOGIC; 
	D : in STD_LOGIC_VECTOR(31  downto 0);
	clk : in STD_LOGIC; 
	rst : in STD_LOGIC; 
	Q :out STD_LOGIC_VECTOR(31  downto 0));
end component;
------------------------------------------------------------------------------
component extension is
	port(
		clk : in std_logic;
		count : in integer;
		bit_location: in std_logic_vector(39 downto 0);
		data_in : in std_logic_vector(7 downto 0);
		bit_out : out std_logic_vector(31 downto 0);
		ready : in std_logic := '0');
end component;
-----------------------------------------------------------------------------
component extraction is
	port(
		clk : in std_logic;
		data_in : in std_logic_vector(31 downto 0);
		enable : in std_logic := '0';
		bit_location : in std_logic_vector(39 downto 0);
		data_out : out std_logic_vector(7 downto 0));
end component;
---------------------------------------------------------------------------------
component ram is
PORT
	(
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wraddress		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;
------------------------------------------------------------------------------------
component ram2 is
PORT
	(
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wraddress		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;
component hieu1 is
port (
	Bit_out: out std_logic_vector(39 downto 0);
	clk: in std_logic;
	button: in std_logic_vector(7 downto 0)
 );
 end component;
 component hieu2 is
port (
	Bit_out: out std_logic_vector(39 downto 0);
	clk: in std_logic;
	button: in std_logic_vector(7 downto 0)
 );
 end component;
---------------------------------------------------------------
--------------------------------------------------------------------------------
signal X : ufixed(0 downto -31):="00110011001100110011001100110011";
signal R : ufixed(2 downto -31) :="1000000000000000000000000000000000";
signal en : std_logic := '0';
signal X_out,X_in : ufixed ( 0 downto -31);
signal data, data_out,X_n1 : std_logic_vector(31 downto 0);
signal reset : std_logic := '0';
signal ready : std_logic := '0';
signal count : integer range 0 to 52 := 0;
--signal N_loop : integer range 0 to 2 := 2;
signal N_loop2 : integer range 0 to 3 := 3;
signal X_n : ufixed ( 0 downto -31);
signal data_32,data_out1 : std_logic_vector(31 downto 0);
signal start,enable1 : std_logic;
signal data_8,data_in1 : std_logic_vector(7 downto 0);
--signal count1 : integer range 0 to 53;
signal delay_time : std_logic := '0';
signal data_in : std_logic_vector(7 downto 0);
signal bit_location:  std_logic_vector(39 downto 0);
signal X_out1 : std_logic_vector(31 downto 0);
signal data2, data3,data_in2,data_in3  : std_logic_vector(7 downto 0);
signal we, we2 : std_logic;
signal wadd, radd, wadd2 : std_logic_vector(7 downto 0);
signal radd2 :  std_logic_vector( 7 downto 0);
signal address : integer range 0 to 255 := 0;
signal address1 : std_logic_vector(7 downto 0);
type mang is array (255 downto 0) of std_logic_vector(7 downto 0);
signal tmp : mang;
signal dem : integer range 0 to 255 := 0;
signal data_location : std_logic_vector(39 downto 0);
signal count3 : integer := 0;
-------------------------------------------------------------------------------
begin

LogisticMap_block : LogisticMap port map(
	Clock       => clk, 
   InitEn      => en,
   Parameter_R => R,	 
   Xn_in       => X_in,   	   	 
	Xn_Out      => X_out				
       );
reg_block : reg port map(
	enable => ready,
	D      => data,
	clk    => clk,
	rst    => reset,
	Q      => data_out);

extension_block: extension port map(
	clk => clk,
	count => count3,
	bit_location => bit_location,
	data_in => data_in1,
	bit_out => data_32,
	ready => start);

extraction_block: extraction port map(
	clk => clk,
	data_in => data_out1,
	enable => enable1,
	bit_location => data_location,
	data_out => data_8);

ram_block : ram port map(
	clock		=> clk,
	data		=> data2,
	rdaddress	=> radd,	
	wraddress	=> wadd,	
	wren		=> we,
	q	=> data_in3	);
	
ram_block2: ram2 port map(
	clock		=> clk,
	data		=> data3,
	rdaddress	=> radd2,	
	wraddress	=> wadd2,	
	wren		=> we2,
	q	=> led	);
location_block: hieu1 port map(

	Bit_out => bit_location,
	clk => clk,
	button => address1
 );
 
 location_block2: hieu2 port map(

	Bit_out => data_location,
	clk => clk,
	button => address1
 );

--------------------------------------------------------------------------------
process(clk)
	begin
	if clk'event and clk = '1' then
		if count < 52 then
		count <= count +1; 
		else count <= 0;
		end if;
		if (count > 0 or count = 0) and (N_loop2 = 3 or N_loop2 < 3) then
			count3 <= count3 + 1;
		end if;
		if (count = 52 and N_loop2 = 0) then
			count3 <= 0;
		end if;
		if count = 52 and  N_loop2 > 0 then
			N_loop2 <= N_loop2 - 1;
		end if;
		if count = 0 and (N_loop2 = 2)  then
		data_in1 <= data_in;
		end if;
		if count = 0 and (N_loop2 = 3)  then
		address1 <= std_logic_vector(to_unsigned(address,8));
		end if;
		if count = 51 and N_loop2 = 3 then
			delay_time <= '1';
		end if;
		if count = 52 and N_loop2 = 0 then
			delay_time <= '0';
			start <= '0';
		end if;
		if delay_time = '1' then
--		if count < 52 then
--		count <= count +1;
--		end if;
--		if count1 = 52 then
--		count <= 0;
--		end if;
		if count = 0 and N_loop2 = 2 then
			X_in <= X;
			start <= '1';
		end if;

		data <= std_logic_vector(X_out);
		if N_loop2 = 2 then
			radd <= std_logic_vector(to_unsigned(address,8)) ;
		if count = 3 or count = 4 or count = 10 or count = 17 or count = 24 or count = 31 or count = 38 or count = 45 then
			ready <= '1';
		else ready <= '0';
		end if;
		if  count = 5 or count = 6 or count = 12 or count = 13 or count = 19 or count = 20 or count = 26 or count = 27 or count = 33 or count = 34 or count = 40 or count = 41 then
			X_n1 <= data_32 xor data_out;
			X_n <= ufixed(X_n1);
		end if;
		if count > 6 then
			X_in <= X_n;
		end if;
		if count = 0 or count = 1 or count = 7 or count = 14 or count = 21 or count = 28 or count =35 or count = 42 then
			en <= '1';
			else en <= '0';
		end if;
		if count = 47 then
			X_out1 <= data_out;
		end if;
		if count = 47 then
			data_out1 <= data_out;
		end if;
		if count < 47 and count > 42 then
			enable1 <= '1';
		else enable1 <= '0';
		end if;
		end if;
				if N_loop2 < 2 then
		
		if count = 10 or count = 17 or count = 24 or count = 31 or count = 38 or count = 45 then
			ready <= '1';
		else ready <= '0';
		end if;
		if  count = 5 or count = 6 or count = 12 or count = 13 or count = 19 or count = 20 or count = 26 or count = 27 or count = 33 or count = 34 or count = 40 or count = 41 then
			X_n1 <= data_32 xor data_out;
			X_n <= ufixed(X_n1);
		end if;
			X_in <= X_n;
		if count = 7 or count = 14 or count = 21 or count = 28 or count =35 or count = 42 then
			en <= '1';
			else en <= '0';
		end if;
		if count = 47 then
			X_out1 <= data_out;
		end if;
		if count = 47 then
			data_out1 <= data_out;
		end if;
		if count < 47 and count > 42 then
			enable1 <= '1';
		else enable1 <= '0';
		end if;
		end if;
		
		if count = 49 then
			data_in1 <= data_8;
		end if;
--		if count = 52 and N_loop > 0 then
--			N_loop <= N_loop - 1;
--		end if;
		end if;
		if count = 49 and N_loop2 = 0 then
			C_new <= data_8 xor data_in;
			data3 <= data_in;
			wadd2 <= data_8 xor data_in;
			tmp(address) <= data_8 xor data_in;
		end if;
		if count > 49 and N_loop2 = 0 then
			we2 <= '1';
			else
			we2 <= '0';
		end if;
		if count = 50 and N_loop2 = 0 then
			address <= address + 1;
			dem <= dem +1;
		end if;
		if count = 51 and N_loop2 = 0 then
			data_in <= std_logic_vector(to_unsigned(address,8));
		end if;
		if N_loop2 = 0 and count = 52 then
--			N_loop <= 2;
			N_loop2 <= 3;
		end if;
		if dem = 0 then
			data_in <= "00000000";
		end if;
	end if;

end process;
end arch;
