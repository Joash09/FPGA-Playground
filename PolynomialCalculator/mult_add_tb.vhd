library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mult_add_tb is
end mult_add_tb;

architecture rtl of mult_add_tb is

	component mult_add
	generic(
		g_WIDTH: integer := 32;
		g_FRAC_WIDTH: integer := 30
	);
	port(
		i_x: in std_logic_vector(g_WIDTH-1 downto 0);
		i_a: in std_logic_vector(g_WIDTH-1 downto 0);
		i_b: in std_logic_vector(g_WIDTH-1 downto 0);
		o_result: out std_logic_vector(g_WIDTH-1 downto 0)
	);
	end component mult_add;

	signal i_x : std_logic_vector(31 downto 0) := X"00050007"; -- 0.875
	signal i_a : std_logic_vector(31 downto 0) := X"000A0003"; -- 0.375
	signal i_b : std_logic_vector(31 downto 0) := X"000B000F"; -- -0.125
	signal o_result : std_logic_vector(31 downto 0) := (others => '0');

	constant CLK_PERIOD : time := 5 ns;
	signal clk: std_logic := '0';

begin
	uut: mult_add
	generic map(
		g_WIDTH => 32,
		g_FRAC_WIDTH => 30
	)
	port map(
		i_x => i_x,
		i_a => i_a,
		i_b => i_b,
		o_result => o_result
	);

	clk_proc : process
	begin
		wait for CLK_PERIOD/2;
		clk <= not clk;
	end process;

end rtl;

