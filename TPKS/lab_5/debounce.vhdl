library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity debounce is 
	port(
		 Clk : in STD_LOGIC;
		 S : in STD_LOGIC;
		 O : out STD_LOGIC 
	     );
end debounce;

architecture debounce of debounce is  
begin
process 
begin
	
if rising_edge(Clk) then
	O<=S;
end if;
wait for 50 ns;
end process;	
end debounce;	
