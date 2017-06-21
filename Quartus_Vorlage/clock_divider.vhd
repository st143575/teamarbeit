library ieee;
use ieee.std_logic_1164.all;

entity clock_divider is
	generic (
		clock_faktor: integer :=1
	);
	port (
		clock_in: in std_ulogic;
		clock_out: out std_ulogic
	);
	end entity clock_divider;
	
architecture arch_clock_divider of clock_divider is
begin
	process(clock_in) is
		variable i: integer range 0 to clock_faktor-1;
	begin
		if rising_edge(clock_in) then
			if i >= (clock_faktor-1) then
				i := 0;
			else
				i := i + 1;
			end if;
			
			if i <= (clock_faktor/2) then
				clock_out <= '1';
			else
				clock_out <= '0';
			end if;
		end if;
	end process;
end architecture arch_clock_divider;
			
				
				