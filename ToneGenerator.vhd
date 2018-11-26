library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity ToneGenerator is
port
(
	Freq : in unsigned(15 downto 0);
	Clk : in std_logic;
	Clr : in std_logic;
	WaveOut : out signed(15 downto 0)
);
end ToneGenerator;

architecture audio of ToneGenerator is
	signal Sum : signed(21 downto 0);
	signal MUXOut : signed(21 downto 0);
	signal Q : signed(21 downto 0);
begin
	Sum <= signed("000000" & Freq) + Q(21 downto 0);
	MUXOut <= Sum when Clr = '1' else "0000000000000000000000";
	Q <= MUXOut when rising_edge(Clk);
	WaveOut <= Q(21 downto 6);
		
end architecture audio;