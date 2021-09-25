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

	signal lsfr_buf: std_logic_vector(7 downto 0) := (others => '0');

begin

	process(i_clk)
	begin
		
		if (i_reset = '1') then
			o_lsfr <= (others => '0');
		end if;

		if rising_edge(i_clk) then

			o_lsfr(7) <= lsfr_buf(7);
			o_lsfr(6) <= lsfr_buf(6) xor lsfr_buf(2);
			o_lsfr(5) <= lsfr_buf(5);
			o_lsfr(4) <= lsfr_buf(4);
			o_lsfr(3) <= lsfr_buf(3);
			o_lsfr(2) <= lsfr_buf(2);
			o_lsfr(1) <= lsfr_buf(1);
			o_lsfr(0) <= lsfr_buf(0);

		end if;

	end process;

end rtl;
