library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity subtract is
	 port(
		 A : in STD_LOGIC;
		 B : in STD_LOGIC;
		 C_in : in STD_LOGIC;
		 Clk : in STD_LOGIC;
		 Cout : out STD_LOGIC;
		 Sub : out STD_LOGIC
	     );
end subtract;

--}} End of automatically maintained section


architecture subtract of subtract is   
signal F1 : STD_LOGIC;
signal F2 : STD_LOGIC;
signal F3 : STD_LOGIC; 
begin
process (Clk)
begin

	F1<= A xor not B;
	F2<= A and not B;
	if(Clk'event and Clk='1') then
		Sub<= F1 xor C_in;
	end if;
	F3<=F1 and C_in;
	Cout<=F3 or F2;
   end process;
end subtract;
