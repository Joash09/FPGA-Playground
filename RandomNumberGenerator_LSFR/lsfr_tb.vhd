library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lsfr_tb is
end lsfr_tb;

architecture rtl of lsfr_tb is

	component lsfr is
		Port(
					i_clk: in std_logic;
					i_reset: in std_logic;
					i_init: in std_logic;
					i_seed: in std_logic_vector(7 downto 0);
					o_lsfr: out std_logic_vector(7 downto 0)
				);
	end component;

	constant CLK_PERIOD : time := 5 ns;
	constant SEED: std_logic_vector(7 downto 0) := (others => '0');
	
	signal i_clk, i_reset, i_init: std_logic := '0';
	signal o_lsfr: std_logic_vector(7 downto 0) := (others => '0');

begin

	lsfr_inst: lsfr
	Port map(
		i_clk => i_clk,
		i_reset => i_reset,
		i_init => i_init,
		i_seed => SEED,
		o_lsfr => o_lsfr
	);

	clk_proc: process
	begin
		wait for CLK_PERIOD/2;
		i_clk <= not i_clk;
	end process;

	stim_proc: process
	begin
		i_reset <= '1';
		i_init <= '1';
		wait for 2 ns;
		i_reset <= '0';
		wait for 2 ns;
		i_init <= '0';
		wait;
	end process;

end rtl;
