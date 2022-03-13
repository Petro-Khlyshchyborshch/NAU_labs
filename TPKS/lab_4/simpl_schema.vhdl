library IEEE;
use IEEE.std_logic_1164.all;

entity lab_4 is
  	port (
	  S0,S1,S2,S3: in std_logic;
	  Z0,Z1,Z2: out std_logic 
  );
end lab_4;

architecture lab_4 of lab_4 is

signal F1 : STD_LOGIC;
signal F2 : STD_LOGIC;
signal F3 : STD_LOGIC; 
begin
  
F1 <= S2 and S3;
Z0 <= not(S3 and F1);
F2 <= not(S0 or S1);
Z1 <= not(S1 and F2);
F3 <= (not S1) and F2;
Z2 <= F1 and F3;

end lab_4;
