Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity modSecCount is
   Port( clock : in std_logic;
		en, clr : in std_logic;
	 Y : out unsigned(5 downto 0) );
End Entity modSecCount;

architecture first of modSecCount is
	 Signal Q, D : unsigned(5 downto 0) := to_unsigned(58, 6);
	 Signal MuxOut, Ch0, Ch1 : unsigned(5 downto 0);
	 Signal MuxOutRESET, Ch0res, Ch1res : unsigned(5 downto 0);
	 Signal MuxOutENABLE, Ch0enable, Ch1enable : unsigned(5 downto 0);
	 signal ChanSel : std_logic;
begin
StateRegister : Q <= D when Rising_Edge(clock);
	Y <= Q;
	
	MUX : MuxOut <= ch0 when ChanSel = '0' else Ch1;
			Ch0ENABLE <= MuxOut;
			Ch1 <= (others => '0');
			
	MUXenable : MuxOutENABLE <= Ch0ENABLE when en = '0' else Ch1enable;
			Ch0Res <= MuxOutENABLE;
			Ch1enable <= (others => '0');
			
	MUXreset : MuxOutRESET <= Ch0res when clr = '0' else Ch1res;
			D <= MuxOutRESET;
			Ch1res <= (others => '0');
	
	Ch0 <= Q + 1;
	ChanSel <= '1' when Ch0 >= to_unsigned(60,6) else '0';
end first;