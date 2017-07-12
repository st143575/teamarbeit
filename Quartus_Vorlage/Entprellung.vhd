library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Entprellung is
	Port ( clk    : in  STD_LOGIC;
		Taster  : in  STD_LOGIC;
		Taster_status : out  STD_LOGIC);
end Entprellung;

architecture arch_Entprellung of Entprellung is
	signal status : std_logic := '1';
	signal counter : integer range 0 to 63 := 0;
begin
	process
	begin
		wait until rising_edge(clk);
		if (Taster = status) then 
			counter <= 0;
		else
			counter <= counter + 1;
		end if;

		if (counter = 63) then 
			status <= Taster; 
		end if;

		Taster_status <= status;
	end process;
end arch_Entprellung;