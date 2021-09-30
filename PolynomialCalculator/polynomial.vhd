library IEEE;

use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity polynomial is
	port(
		i_clk: in std_logic;
		i_reset: in std_logic;
		i_x: in signed(7 downto 0);
		i_coeffients: in std_logic_vector(8*7-1 downto 0);
		o_ready : out std_logic;
		o_y: out signed(31 downto 0)
	    );
end polynomial;

architecture rtl of polynomial is

	signal cntrl: integer range 0 to 7 := 0;
	signal stage_result: signed(31 downto 0) := X"00000000";
	signal ready: std_logic := '0';

begin
	
	process(i_clk) 
	begin
		if i_reset = '1' then

			cntrl <= 0;
			stage_result <= X"00000000";
			ready <= '0';
			o_y <= (others => '0');

		elsif rising_edge(i_clk) then

			if cntrl = 0 and ready = '0' then
				stage_result <= signed(i_coeffients(7 downto 0)) * i_x;

			elsif cntrl = 8 then -- Manage overflow
				cntrl <= 0;
				ready <= '1';
				o_y <= stage_result;
			else
				stage_result <= signed(i_coeffients(8*cntrl+7 downto 8*cntrl)) + stage_result * i_x;
			end if;

			cntrl <= cntrl + 1;

		end if;
	end process;

	o_ready <= ready;

end architecture;
