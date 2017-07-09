library ieee;
use ieee.std_logic_1164.all;

entity pwm_modulator is
	port (
		clock: in std_ulogic;
		Taster_1: in std_logic;
		Taster_2: in std_logic;
		Taster_3: in std_logic;
		steuer_port: out std_ulogic := '0';
		LED_0: out std_ulogic := '0';
		LED_1: out std_ulogic := '0';
		LED_2: out std_ulogic := '0';
		LED_3: out std_ulogic := '0';
		LED_4: out std_ulogic := '0';
		LED_5: out std_ulogic := '0'
	);
end entity pwm_modulator;

architecture arch_pwm_modulator of pwm_modulator is
begin
	process (clock)
		variable mode: integer range 0 to 3 := 3;
		variable divider: integer range 0 to 3 := 0;
		variable start: integer range 0 to 1 := 0;
		variable taster1: integer range 0 to 1 := 1;
		variable taster2: integer range 0 to 1 := 1;
		variable taster3: integer range 0 to 1 := 1;
	begin
		if clock = '1' then
			if Taster_1 = '1' then
				taster1 := 1;
			else taster1 := 0;
			end if;
			if (Taster_1 = '0' and taster1 = 1) and (start = 0) then
				start := 1;
			elsif (Taster_1 = '0' and taster1 = 1) and (start = 1) then
				start := 0;
			end if;
		end if;

		if clock = '1' then
			if Taster_2 = '1' then
				taster2 := 1;
			else taster2 := 0;
			end if;
			if (Taster_2 = '0' and taster2 = 1) and (mode < 3) then
				mode := mode + 1;
			elsif  (Taster_2 = '0' and taster2 = 1) and (mode = 3) then 
				LED_5 <= '1';
			end if;
		end if;

		if clock = '1' then
			if Taster_3 = '1' then
				taster3 := 1;
			else taster3 := 0;
			end if;
			if (Taster_3 = '0' and taster3 = 1) and (mode > 0) then
				mode := mode - 1;
			elsif (Taster_3 = '0' and taster3 = 1) and (mode = 0) then
				LED_5 <= '1';
			end if;
		end if;

		if clock = '1' and (start = 1) then
			LED_0 <= '1';
			case mode is 
				when 0 =>
					LED_1 <= '1';
					if divider = 4 then
						steuer_port <= '1';
						divider := 0;
					else 
						divider := divider + 1;
						steuer_port <= '0';
					end if;
				when 1 =>
					LED_2 <= '1';
					if divider = 3 then
						steuer_port <= '1';
						divider := 0;
					else 
						divider := divider + 1;
						steuer_port <= '0';
					end if;
				when 2 =>
					LED_3 <= '1';
					if divider = 2 then
						steuer_port <= '1';
						divider := 0;
					else 
						divider := divider + 1;
						steuer_port <= '0';
					end if;
				when 3 =>
					LED_4 <= '1';
					steuer_port <= '1';
			end case;
		else steuer_port <= '0';
		end if;
	end process;
end architecture arch_pwm_modulator;