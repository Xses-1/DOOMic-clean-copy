library ieee;
use ieee.std_logic_1164.all;

entity color_demux is 
	port (
		reset       : in std_logic;
    clk         : in std_logic;
		
		switch      : in std_logic_vector (1 downto 0);
		color_in    : in std_logic_vector (7 downto 0);
		color_out1  : in std_logic_vector (7 downto 0);
		color_out2  : in std_logic_vector (7 downto 0);
	);
end entity;

architecture behavioural of color_demux is

begin
	process (reset, switch, addr_0, addr_1, addr_2)
	begin
		if (reset = '1') then
			addr_out <= "000000000000000000";

		else
			case switch is
				when "00" =>
					addr_out <= addr_0;

				when "01" =>
					addr_out <= addr_1;

				when "10" =>
					addr_out <= addr_2;

				when others =>
					addr_out <= "000000000000000000";
			end case;
		end if;
	end process;
end architecture;
