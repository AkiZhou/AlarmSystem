library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PreScale is
	port(ClkIn : in std_logic;
			ClkOut : out std_logic);
end PreScale;

architecture func of PreScale is
	signal w0 : unsigned(23 downto 0);
begin
	
	w0 <= w0 + 1 when rising_edge(ClkIn);
	ClkOut <= w0(23);
end architecture func;