library ieee;
use ieee.std_logic_1164.all;

entity frequenzumrichter is
	port (
		SWZ_U: in std_ulogic;
		SWZ_V: in std_ulogic;
		SWZ_W: in std_ulogic;
		freigabe_0: in std_ulogic;
		freigabe_1: in std_ulogic;
		freigabe_2: in std_ulogic;
		steuer_port: in std_ulogic;
		SWZ_U1: out std_ulogic;
		SWZ_V1: out std_ulogic;
		SWZ_W1: out std_ulogic;
		freigabe_01: out std_ulogic;
		freigabe_11: out std_ulogic;
		freigabe_21: out std_ulogic
	);
end entity frequenzumrichter;

architecture arch_frequenzumrichter of frequenzumrichter is
begin
	process (steuer_port)
		begin
			SWZ_U1 <= SWZ_U;
			SWZ_V1 <= SWZ_V;
			SWZ_W1 <= SWZ_W;

			if steuer_port = '1' then
				freigabe_01 <= freigabe_0;
				freigabe_11 <= freigabe_1;
				freigabe_21 <= freigabe_2;
			else
				freigabe_01 <= '0';
				freigabe_11 <= '0';
				freigabe_21 <= '0';
			end if;
	end process;
end architecture arch_frequenzumrichter;