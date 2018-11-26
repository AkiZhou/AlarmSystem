Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity TBSecCount is
	port(KEY : in std_logic_vector(0 downto 0);
			SW : std_logic_vector(1 downto 0);
			HEX0, HEX1 : out unsigned(6 downto 0));
End Entity TBSecCount;

Architecture rtl of TBSecCount is
--	Constant PERIOD : time := 10 ns;
	--Signal tbClock : std_logic := '1';
	Signal tbY1, tbY2 : unsigned(5 downto 0);
	signal shiftedtbY1 : unsigned(3 downto 0); 
Begin
	
	--tbClock <= not tbClock after PERIOD;

DUT1 : Entity work.modSecCount port map ( clock => KEY(0), en => SW(1), clr => SW(0), Y => tbY1);
--DUT2:	Entity work.SecCount(Second) port map ( clock => KEY(0), Y => tbY2 ); 
Disp1 : Entity work.SegDecoder port map ( D => tbY1(3 downto 0), Y => HEX0 );
Disp2 : Entity work.SegDecoder port map ( D(1 downto 0) => tbY1(5 downto 4), Y => HEX1 );
End  rtl;