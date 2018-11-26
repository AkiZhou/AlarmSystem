library ieee;
use ieee.numeric_std.all;
entity Fcount is
port(D : in unsigned;
)
-- input signal: clock

architecture rtl of accumulator is
	signal clock, sum, new_sum : unsigned(19 downto 0);
begin
	new_sum <= sum + resize(data_in,sum'length);
	reg: process (clk) is
	begin
		if rising_edge(clk) then
			if reset = '1' then
				sum <= (others => '0');
			elsif data_en = '1' then
				sum <= new_sum;
			end if;
		end if;
	end process reg;
	data_out <= sum;
end architecture rtl;