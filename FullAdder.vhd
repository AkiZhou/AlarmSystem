library ieee;
	use ieee.std_logic_1164.all;
	
entity FullAdder is
	port (A : in std_logic; B : in std_logic; C : in std_logic; Sum : out std_logic; Carry : out std_logic);
end FullAdder;

architecture FullFunction of FullAdder is
	begin
	Sum <= C XOR (A XOR B);
	Carry <= ((A XOR B) AND C) OR (A AND B);
end FullFunction;