library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lsfr is
	Port(
		i_clk: in std_logic;
		i_reset: in std_logic;
		i_init: in std_logic;
		i_seed: in std_logic_vector(7 downto 0);
		o_lsfr: out std_logic_vector(7 downto 0)
	);
end lsfr;

architecture rtl of lsfr is

	signal lsfr_buf: std_logic_vector(8 downto 1) := (others => '0');

begin

	process(i_clk)
	begin
		
		-- if (i_reset = '1') then
		--	o_lsfr <= (others => '0');
		-- end if;

		if rising_edge(i_clk) then

			if (i_init = '1') then

				lsfr_buf <= i_seed;

			else
				
				lsfr_buf(8) <= lsfr_buf(7);
				lsfr_buf(7) <= lsfr_buf(6);
				lsfr_buf(6) <= lsfr_buf(5);
				lsfr_buf(5) <= lsfr_buf(4);
				lsfr_buf(4) <= lsfr_buf(3);
				lsfr_buf(3) <= lsfr_buf(2);
				lsfr_buf(2) <= lsfr_buf(1);
				lsfr_buf(1) <= lsfr_buf(8) xnor lsfr_buf(6) xnor lsfr_buf(5) xnor lsfr_buf(4);

			end if;

		end if;

	end process;

	o_lsfr <= lsfr_buf(8 downto 1);

end rtl;
