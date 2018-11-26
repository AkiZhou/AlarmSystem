library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testSystem is
 port( 
		KEY : in std_logic_vector(3 downto 0); --ARM(3) --reset(0)
		SW : in std_logic_vector(3 downto 0); --door control 
		CLOCK_50 : in std_logic;
		HEX2,HEX1,HEX0 : out std_logic_vector(6 downto 0);
		LEDG : out std_logic_vector(2 downto 0); --Ready --SysArmed --AlarmON
		LEDR : out std_logic_vector(3 downto 0)); --door
end;

architecture basic of testSystem is
	signal Clock : std_logic;
	signal Trigger : std_logic;
begin
	Prescaling : entity work.PreScale port map(ClkIn => CLOCK_50, ClkOut => Clock);
	
	--LEDR(3 downto 0) <= SW(3 downto 0); --State of doors
	
	--SystemState : entity work.System port map(Doors => SW(3 downto 0), ARM => KEY(3), Clk => Clock, DoorsClosed => LEDG(2),
															--SysArmed => LEDG(1), AlarmON => Trigger);
	--LEDG(0) <= Trigger;
	
	--AlarmSystem : entity work.Alarm port map(Enable => Trigger, Clk => Clock, Seg2 => HEX2, Seg1 => HEX1, Seg0 => HEX0);
	testDelay : entity work.TenSecDelay port map(load => KEY(0), Clk => Clock, TC => LEDG(0));
end basic;