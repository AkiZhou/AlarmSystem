library ieee;
	use ieee.std_logic_1164.all;
	
entity BinaryToDecimal is
	port (SW : in std_logic_vector(5 downto 0); 
			HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0));
end BinaryToDecimal;

architecture Converter of BinaryToDecimal is
	signal p : std_logic_vector(15 downto 0);
	signal np : std_logic_vector(17 downto 0);
begin
	instance1 : entity work.TimesTen
	port map
	(X(5 downto 0) => SW(5 downto 0), TenX(9 downto 6) => p(15 downto 12), TenX(5 downto 0) => np(17 downto 12));
	
	instance2 : entity work.SegDecoder
	port map
	(D => p(15 downto 12),Y => HEX3);
	
	instance3 : entity work.TimesTen
	port map
	(X(5 downto 0) => np(17 downto 12), TenX(9 downto 6) => p(11 downto 8), TenX(5 downto 0) => np(11 downto 6));
	
	instance4 : entity work.SegDecoder
	port map
	(D => p(11 downto 8),Y => HEX2);
	
	instance5 : entity work.TimesTen
	port map
	(X(5 downto 0) => np(11 downto 6), TenX(9 downto 6) => p(7 downto 4), TenX(5 downto 0) => np(5 downto 0));
	
	instance6 : entity work.SegDecoder
	port map
	(D => p(7 downto 4),Y => HEX1);
	
	instance7 : entity work.TimesTen
	port map
	(X(5 downto 0) => np(5 downto 0), TenX(9 downto 6) => p(3 downto 0));
	
	instance8 : entity work.SegDecoder
	port map
	(D => p(3 downto 0),Y => HEX0);
	
end Converter;