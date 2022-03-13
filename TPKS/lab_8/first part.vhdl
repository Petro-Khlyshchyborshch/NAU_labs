entity Adder is
end entity;
architecture arch of Adder is
signal A1, B1: Bit_vector (15 downto 8):="00000001";
signal C1: bit_vector (0 to 7);
signal C2: bit_vector (7 downto 0);
signal A3: bit_vector (10 downto 8):="101";
signal C3, C4: bit_vector (10 downto 8);
signal B3: bit_vector (0 to 2):="001";
signal Cout1, Cout2, Cout3, Cout4: bit;

procedure Add
 (Addl,Add2: in bit_vector;
Cin: in bit;
signal Sum: out bit_vector;
signal Cout: out bit) is
variable C: bit := Cin;
alias nl : bit_vector (Addl'length-1 downto 0) is Addl;
alias n2 : bit_vector (Add2'length-1 downto 0) is Add2;
alias S : bit_vector (Sum'length-1 downto 0) is Sum;
begin
assert ((nl'length = n2'length) and (nl'length = S'length))
report "Vector lengths must be equal!"
severity error;
for i in s'reverse_range loop
S (i) <= nl (i) xor n2 (i) xor C;
C := (nl (i) and n2 (i)) or (nl (i) and C) or (n2 (i) and C) ;
end loop;
Cout <= C; 
end Add; 

begin
Add (A1,B1,'0', C1, Cout1);
Add (A1,B1,'1', C2, Cout2);
Add (A3,B3,'0', C3, Cout3);
Add (A1,B1,'0', C4, Cout4);
end;

