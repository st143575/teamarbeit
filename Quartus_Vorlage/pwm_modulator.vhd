library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;

entity pwm_modulator is
	port (
		clock: in std_ulogic;
		Taster_1: in std_ulogic;
		Taster_2: in std_ulogic;
		Taster_3: in std_ulogic;
		start_port: out std_ulogic := '0';
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
	signal prescaler1: integer range 0 to 10000;
	signal taster1: std_logic_vector(3 downto 0);
	signal prescaler2: integer range 0 to 10000;
	signal taster2: std_logic_vector(3 downto 0);
	signal prescaler3: integer range 0 to 10000;
	signal taster3: std_logic_vector(3 downto 0);
begin
	process (clock)
		variable mode: integer range 0 to 3:= 3;
		variable divider: integer range 0 to 10:= 0;
		variable start: integer range 0 to 1:= 0;
	begin	
	if clock = '1' then
				if prescaler1 = 0 then
					prescaler1 <= 10000;
					if (taster1 = "0111") then
						if (start = 0) then 
							start := 1; 
							start_port <= '1';
						elsif (start = 1) then
							start := 0;
							start_port <= '0';
						end if;
					end if;
					taster1 <= taster1(2 downto 0) & Taster_1;
				else
					prescaler1 <= prescaler1 - 1;
				end if;
		
		
		
				if (taster2 = "0111") then
					if (mode < 3) then 
						mode := mode + 1;
					elsif (mode = 3) then
						if Taster_2 = '1' then
							LED_5 <= '1';
						end if;
					end if;
				elsif (taster2 = "1000") then
					if (mode < 3) then 
						mode := mode + 1;
					elsif (mode = 3) then
						if Taster_2 = '1' then
							LED_5 <= '1';
						end if;
					end if;
				end if;
				taster2 <= taster2(2 downto 0) & Taster_2;
			

			
				if (taster3 = "0111") then
						if (mode > 0) then 
							mode := mode - 1;
						elsif (mode = 0) then
							if Taster_3 = '1' then
								LED_5 <= '1';
							end if;
						end if;
					elsif (taster3 = "1000") then
						if (mode > 0) then 
							mode := mode - 1;
						elsif (mode = 0) then
							if Taster_3 = '1' then
								LED_5 <= '1';
							end if;
						end if;
					end if;
					taster3 <= taster3(2 downto 0) & Taster_3;
				
		
		
			if (start = 1) then
				LED_0 <= '1';
				case mode is 
					when 0 =>
						LED_1 <= '1';
						LED_2 <= '0';
						LED_3 <= '0';
						LED_4 <= '0';
						if divider = 3 then
							steuer_port <= '0';
							divider := 0;
						else 
							divider := divider + 1;
							steuer_port <= '1';
						end if;
					when 1 =>
						LED_2 <= '1';
						LED_1 <= '0';
						LED_3 <= '0';
						LED_4 <= '0';
					if divider = 5 then
							steuer_port <= '0';
							divider := 0;
						else 
							divider := divider + 1;
							steuer_port <= '1';
						end if;
					when 2 =>
						LED_3 <= '1';
						LED_1 <= '0';
						LED_2 <= '0';
						LED_4 <= '0';
						if divider = 7 then
							steuer_port <= '0';
							divider := 0;
						else 
							divider := divider + 1;
							steuer_port <= '1';
						end if;
					when 3 =>
						LED_4 <= '1';
						LED_1 <= '0';
						LED_2 <= '0';
						LED_3 <= '0';
						steuer_port <= '1';
				end case;
			else 
				steuer_port <= '0';
				LED_0 <= '0';
			end if;
		end if;
	end process;
end architecture arch_pwm_modulator;