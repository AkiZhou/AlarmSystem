library ieee;
	use ieee.std_logic_1164.all;
	
entity TimesTen is
	port (X : in std_logic_vector(5 downto 0); TenX : out std_logic_vector(9 downto 0));
end TimesTen;

architecture SumAndCarry of TimesTen is
	signal C : std_logic_vector(4 downto 0);
begin
	TenX(0) <= '0';
	TenX(1) <= X(0);
	TenX(2) <= X(1);

	Obj1 : entity work.HalfAdder
	port map
	(A => X(2), B => X(0), Sum => Tenx(3), Carry => C(0));
	
	Obj2 : entity work.FullAdder
	port map
	(A => X(3), B => X(1), C => C(0), Sum => Tenx(4), Carry => C(1));
	
	Obj3 : entity work.FullAdder
	port map
	(A => X(4), B => X(2), C => C(1), Sum => Tenx(5), Carry => C(2));
	
	Obj4 : entity work.FullAdder
	port map
	(A => X(5), B => X(3), C => C(2), Sum => Tenx(6), Carry => C(3));
	
	Obj5 : entity work.HalfAdder
	port map
	(A => X(4), B => C(3), Sum => Tenx(7), Carry => C(4));
	
	Obj6 : entity work.HalfAdder
	port map
	(A => X(5), B => C(4), Sum => Tenx(8), Carry => Tenx(9));

	end sumAndCarry;