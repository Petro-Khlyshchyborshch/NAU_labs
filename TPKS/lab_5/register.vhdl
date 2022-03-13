library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg is
	 port(
		 LR : in STD_LOGIC;
		 En : in STD_LOGIC;
		 Clk : in STD_LOGIC;
		 R : in STD_LOGIC;
		 Reg : out std_logic_vector(7 downto 0)
	     );
end reg;

architecture reg of reg is
signal tmp: std_logic_vector(7 downto 0);
signal tmp6 : STD_LOGIC;
signal tmp7 : STD_LOGIC;
begin	
	
process (R,Clk)
begin
	if(R'event and R='1') then
		tmp <="10000000";
		tmp6<='0';
		tmp7<= '0';
	elsif (Clk'event and Clk='1' and LR='0') then  
		tmp6 <=tmp(0);
		tmp7 <=tmp(1);
		tmp(0)<=tmp(2);
		tmp(1)<=tmp(3);
		tmp(2)<=tmp(4);
		tmp(3)<=tmp(5);
		tmp(4)<=tmp(6);
		tmp(5)<=tmp(7);
		tmp(6)<=tmp6;
		tmp(7)<=tmp7;
	elsif (Clk'event and Clk='1' and LR='1') then  
		tmp6<=tmp(6);
		tmp7<=tmp(7);
		tmp(7)<=tmp(5);
		tmp(6)<=tmp(4);
		tmp(5)<=tmp(3);
		tmp(4)<=tmp(2);
		tmp(3)<=tmp(1);
		tmp(2)<=tmp(0);
		tmp(1)<=tmp6;
		tmp(0)<=tmp7;
	end if;	
	tmp(0)<=En;
	Reg <= tmp;
end process; 
end reg;
