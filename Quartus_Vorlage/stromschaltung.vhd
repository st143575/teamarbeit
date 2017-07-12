library ieee;
use ieee.std_logic_1164.all;

entity stromschaltung is
	port(
		clock : in std_ulogic;
		SZW_U1 : in std_logic;
		SZW_V1 : in std_logic;
		SZW_W1 : in std_logic;
		freigaben_out0 : out std_ulogic := '0';
		freigaben_out1 : out std_ulogic := '0';
		freigaben_out2 : out std_ulogic := '0'
	);
end entity;

architecture arch_stromschaltung of stromschaltung is
begin
	process (clock)
		begin
		if clock = '1' then
			if (SZW_U1='0' and  SZW_V1='0' and  SZW_W1='1') then
				freigaben_out0 <= '0';
				freigaben_out1 <= '1';
				freigaben_out2 <= '1';
			elsif (SZW_U1='1' and  SZW_V1='0' and  SZW_W1='1') then
				freigaben_out0 <= '1';
				freigaben_out1 <= '1';
				freigaben_out2 <= '0';
			elsif SZW_U1='1' and  SZW_V1='0' and  SZW_W1='0' then
				freigaben_out0 <= '1';
				freigaben_out1 <= '0';
				freigaben_out2 <= '1';
			elsif SZW_U1='1' and  SZW_V1='1' and  SZW_W1='0' then
				freigaben_out0 <= '0';
				freigaben_out1 <= '1';
				freigaben_out2 <= '1';
			elsif SZW_W1='0' and  SZW_V1='1' and  SZW_U1='0' then
				freigaben_out0 <= '1';
				freigaben_out1 <= '1';
				freigaben_out2 <= '0';
			elsif SZW_U1='0' and  SZW_V1='1' and  SZW_W1='1' then
				freigaben_out0 <= '1';
				freigaben_out1 <= '1';
				freigaben_out2 <= '0';
			end if;
		end if;
	end process;
end architecture arch_stromschaltung; 