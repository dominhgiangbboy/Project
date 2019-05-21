
--**************************************************
--  Ham Logistic Map co dinh dang 
--  Xn=R*Xn(1-Xn)
-----INPUT-----------
--  Wide: dinh dang du lieu cho Xn: 1.(Wide-1)
--  Parameter_R_MSB: 6 bits, dung de ghep thanh R. R dinh dang 3.(Wide-1), trong do 6 bits MSB lay tu Parameter_R_MSB
--  Init_Value_MSB: 4 bits, dung de ghep thanh IniValue dang 0.xxxx000000000000000
------OUTPUT---------
--  Xn_Out: dau ra

--**************************************************


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use ieee.fixed_pkg.all;


ENTITY LogisticMap IS
 generic(Wide: integer :=32);

port (
       Clock        		: in  STD_LOGIC ;
       InitEn      			: in  STD_LOGIC ;
       Parameter_R		   : in ufixed ( 2 downto -(Wide-1));--control parameter a dinh dang 3.(Wide-1), tong la (Wide+2) bits
       Xn_in     	   		: in ufixed ( 0 downto -(Wide-1)); -- dinh dang 0.xxxx
	    Xn_Out					: out ufixed ( 0 downto -(Wide-1))
       );
end LogisticMap;

ARCHITECTURE behavior OF LogisticMap IS

 Signal  Xn , Xn_Reg    : ufixed ( 0 downto -(Wide-1) );    -- , Xn_Reg

----------------- For test only---------------	
 --Signal  Xn_Bits			: std_logic_vector ((Wide-1) downto 0);
------------------------------------------------	
   
Begin 

Process (InitEn, Clock, Xn)    
   Begin
			if rising_edge(Clock) then
				if (InitEn = '1') then
					Xn <= resize(Parameter_R * Xn_in * (1.0-Xn_in), Xn);
				end if;
				Xn_Reg <= Xn;
			end if;
End process;
Xn_Out <= Xn_Reg;
End behavior; 
