library ieee;
use ieee.std_logic_1164.all;

entity zaehler is
	port(
		clock_divider: in std_ulogic;
		NANO_LED0: out std_ulogic := '1';
		NANO_LED1: out std_ulogic := '0';
		NANO_LED2: out std_ulogic := '0';
		NANO_LED3: out std_ulogic := '0';
		NANO_LED4: out std_ulogic := '0';
		NANO_LED5: out std_ulogic := '0';
		NANO_LED6: out std_ulogic := '0';
		NANO_LED7: out std_ulogic := '0'
	);
end entity;
	
architecture arch_zaehler of zaehler is
begin	
	process(clock_divider) is
		variable i: integer range 0 to 7;
		
		begin
				if rising_edge(clock_divider) then
						case i is
							when 0 =>
								NANO_LED0 <= '0';
								NANO_LED1 <= '1';
								i := i + 1;
							when 1 =>
								NANO_LED1 <= '0';
								NANO_LED2 <= '1';
								i := i + 1;
							when 2 =>
								NANO_LED2 <= '0';
								NANO_LED3 <= '1';
								i := i + 1;
							when 3 =>
								NANO_LED3 <= '0';
								NANO_LED4 <= '1';
								i := i + 1;
							when 4 =>
								NANO_LED4 <= '0';
								NANO_LED5 <= '1';
								i := i + 1;
							when 5 =>
								NANO_LED5 <= '0';
								NANO_LED6 <= '1';
								i := i + 1;
							when 6 =>
								NANO_LED6 <= '0';
								NANO_LED7 <= '1';
								i := i + 1;
							when 7 =>
								NANO_LED7 <= '0';
								NANO_LED0 <= '1';
								i := 0;
						end case;
				end if;
		end process;
end architecture arch_zaehler;