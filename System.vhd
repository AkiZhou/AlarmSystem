library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity System is
	port(Doors : in std_logic_vector(3 downto 0);
			ARM : in std_logic;
			Clk : in std_logic;
			DoorsClosed : out std_logic;
			SysArmed : out std_logic;
			AlarmON : out std_logic);
end;

architecture Basic of System is
	type state_type is (Idle, Armed, Alarming);
	signal state, next_state : state_type;
	signal Ready : std_logic;
begin
	Ready <= '1' when Doors = "0000" else '0';
	DoorsClosed <= Ready;
	
	-- Process 1 - state_register: implements positive- edge- triggered
	state <= next_state when rising_edge(Clk);
	
	-- Process 2 - next_state_function: implements next state as
	-- a function of input X and state.
	next_state_func: process (ARM, Ready, state)
	begin
		case state is   
			when Idle =>
				if ARM = '0' then
				next_state <= Armed;
				else
				next_state <= Idle;
				end if;
			when Armed =>
				if Ready = '0' then
				next_state <= Alarming;
				elsif ARM ='0' then
				next_state <= Idle;
				else
				next_state <= Armed;
				end if;
			when Alarming =>
				if ARM = '0' then
				next_state <= Idle;
				else 
				next_state <= Alarming;
				end if;
		end case;
	end process;
		
	-- Process 3 - output_function: implements output as function
	-- of input X and state.
	output_func: process (state)
	begin
		case state is
			when Idle =>
				SysArmed <= '0';
				AlarmON <= '0';
			when Armed =>
				SysArmed <= '1';
				AlarmON <= '0';
			when Alarming =>
				SysArmed <= '1';
				AlarmON <= '1';
		end case;
	end process;
	
--PreSt <= NxtSt when Rising_Edge( Clock );
	
end Basic;