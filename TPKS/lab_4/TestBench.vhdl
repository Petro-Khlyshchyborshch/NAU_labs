library ieee;
use ieee.std_logic_1164.all;
entity EX1_tb is
end EX1_tb;
architecture arch_tb of EX1_tb is
component lab_4 is
port (
	   S0 : in STD_LOGIC;
       S1 : in STD_LOGIC;
       S2 : in STD_LOGIC;
       S3 : in STD_LOGIC;
       Z0 : out STD_LOGIC;
       Z1 : out STD_LOGIC;
       Z2 : out STD_LOGIC
);
end component;
signal test : std_logic_vector (3 downto 0);
signal Res0 : std_logic;
signal Res1 : std_logic;
signal Res2 : std_logic;
begin

UUT: lab_4
port map (S0 => test (3), S1 => test (2), S2 => test (1),S3 => test (0), Z0 => Res0, Z1 => Res1, Z2 => Res2);
test <= "0000", "0001" after 10 ns, "0010" after 20 ns, "0011" after 30 ns, "0100" after 40 ns,
"0101" after 50 ns, "0110" after 60 ns, "0111" after 70 ns , "1000" after 80 ns, "1001" after 90 ns, "1010" after 100 ns, "1011" after 110 ns,
"1100" after 120 ns,"1101" after 130 ns,"1110" after 140 ns,"1111" after 150 ns;

end arch_tb;
