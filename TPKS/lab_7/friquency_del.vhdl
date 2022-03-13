library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  
		
entity del_frequency is
	port (clk_in, rst: in std_logic;
	clk_out: out std_logic);
end entity;	 

architecture arch of del_frequency is
constant size: integer:=3;
constant div: integer:=2;
signal cnt: std_logic_vector (size-1 downto 0);
begin
process (clk_in, rst)
begin
if rst='1' then
	cnt<= (others =>'0');
elsif clk_in='1' and clk_in'event then
	if cnt< (div-1) then
		cnt<=cnt +1;
	else
		cnt<= (others =>'0');
	end if;
end if;
end process;
	clk_out<='1' when cnt = 0 else '0';
end architecture;
