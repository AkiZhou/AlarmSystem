library ieee;
	use ieee.std_logic_1164.all;
	
entity HalfAdder is
	port (A : in std_logic; B : in std_logic; Sum : out std_logic; Carry : out std_logic);
end HalfAdder;

architecture HalfFunction of HalfAdder is
	begin
	Sum <= A XOR B;
	Carry <= A AND B;
end HalfFunction;