library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCDCount2 is
	port
	(
		clk : in std_logic;
		clr : in std_logic;
		en : in std_logic;
		BCD0 : out std_logic_vector(3 downto 0);
		BCD1 : out std_logic_vector(3 downto 0)
	);
end BCDCount2;

architecture BCDCount2_arch of BCDCount2 is
	signal count: unsigned(3 downto 0);
	signal count2: unsigned(3 downto 0);
	signal load : std_logic;
	signal load2 : std_logic;

	signal isNine : std_logic;
		signal isNine2 : std_logic;

begin

		--D(3 downto 0) <= (others=>'0');
		--en => '1';
		BCD0 <= std_logic_vector(count);
		BCD1 <= std_logic_vector(count2);
		-- out1 is middle wire
		isNine <= count(0) and count(3);
		load <= clr or isNine;

		isNine2 <= count2(0) and count2(3) and isNine;
		load2 <= clr or isNine2;
		
	process(clk) is
	begin
		if rising_edge(clk) then
		
			if load = '1' then
				count <= (others => '0');
			elsif (en = '1') then
				count <= count + 1;
			end if;
			
			if load2 = '1' then
				count2 <= (others => '0');
			elsif (isNine = '1') then
				count2 <= count2 + 1;
			end if;

		end if;
	end process;
end architecture BCDCount2_arch;