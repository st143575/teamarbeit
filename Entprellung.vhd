library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Entprellung is
	Port(clk : in std_logic;
		 input : in std_logic;
		 output : out std_logic;
		 riseedge : out std_logic;
		 falledge : out std_logic);
end Entprellung;

architecture arch_Entprellung of Entprellung is
	signal prescaler : integer range 0 to 63;
	signal inputsr : std_logic_vector(3 downto 0);
	begin
		process
			begin
				wait until rising_edge(clk);

				if(prescaler = 0) then
					prescaler <= 63;
					if(inputsr = "0000") then output <= '0'; end if;
					if(inputsr = "1111") then output <= '1'; end if;

					riseedge <= '0';
					if(inputsr = "0111") then riseedge <= '1'; end if;
					if(inputsr = "1000") then falledge <= '1'; end if;
					inputsr <= inputsr(2 downto 0) & input;
				else
					prescaler <= prescaler - 1;
				end if;
			end process;
end arch_Entprellung;