library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Alarm is
	port(
		Enable : in std_logic; --enable 
		Clk : in std_logic;
      Seg2,Seg1,Seg0 : out std_logic_vector(6 downto 0)
	);
end Alarm;

architecture behavioural of Alarm is
	type state_type is (AlarmOff, AlarmOn);
	signal state, next_state : state_type;
	signal Ready : std_logic;
begin
	--state register
	state <= next_state when rising_edge(Clk);
	
	--next_state function
	next_state_func: process (Enable, state)
	begin
		case state is   
			when AlarmOff =>
				if Enable = '1' then
				next_state <= AlarmOn;
				else
				next_state <= AlarmOff;
				end if;
			when AlarmOn =>
				if Enable = '0' then
				next_state <= AlarmOff;
				else
				next_state <= AlarmOn;
				end if;
		end case;
	end process;
	
	--Output function
	output_func: process (state)
	begin
		case state is
			when AlarmOff =>
				Seg2 <= "1111111"; --0
				Seg1 <= "1111111"; --0
				Seg0 <= "1111111"; --0
			when AlarmOn =>
				Seg2 <= "0010000" OR (Clk & Clk & Clk & Clk & Clk & Clk & Clk); --9 or 0
				Seg1 <= "1111001" OR (Clk & Clk & Clk & Clk & Clk & Clk & Clk); --1 or 0
				Seg0 <= "1111001" OR (Clk & Clk & Clk & Clk & Clk & Clk & Clk); --1 or 0
		end case;
	end process;
	
	
end behavioural;