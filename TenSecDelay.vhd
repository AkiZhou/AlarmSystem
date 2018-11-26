library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TenSecDelay is
	port(load : in std_logic;
			Clk : in std_logic;
			TC : out std_logic;
			LEDG : out std_logic_vector(6 downto 6));
end;

architecture logic of TenSecDelay is
--	signal SlowClock : signed(13 downto 0);
	signal MUXOut : unsigned(4 downto 0);
	signal state : unsigned(4 downto 0);
	signal mode : unsigned(1 downto 0);
	signal Q : std_logic;
	--signal Ch1 : unsigned;
	--type state_type is (TCOn, TCOff);
	--signal state, next_state : state_type;
begin

	--state <= next_state when rising_edge(Clk);
	
	--state <= next_state AND load when rising_edge(Clk);
	state <= MUXOut when rising_edge(Clk);
	
	mode <= "01" when Q = '1' else
				"10" when (Q OR load)= '1' else
				"11" when (Q NAND load)='1';   
	LEDG(6) <= '1' when mode ="11";
	MUXOut <= --"1111" when state = "0001" else
					state - 1 when mode = "01" else
					"11111" when mode = "10" else
					"00000" when mode = "11";
	
	with state select Q <=
	'0' when to_unsigned(0,5),
	'1' when others;
	
	TC <= Q;
	
end;