library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity reg is 
	port(C : in std_logic;
         SO : out std_logic_vector(7 downto 0));	
end reg;

architecture reg of reg is	 
signal tmp: std_logic_vector(7 downto 0);
signal SI: std_logic; 
signal r_Done      : std_logic := '0';
begin
 process(C) 
 begin
	case tmp(7) is
    when '0' =>
    	r_Done <= '1';
	when others =>
	r_Done <= '0'; 
	end case;
        
            if (C'event and C='1') then
                for i in 0 to 6 loop
                    tmp(i+1) <= tmp(i);
                end loop;
                tmp(0) <= r_Done;
            end if;		
    end process;
      SO <= tmp;
end reg;
