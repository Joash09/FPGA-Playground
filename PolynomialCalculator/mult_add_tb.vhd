library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mult_add_tb is
end mult_add_tb;

architecture rtl of mult_add_tb is

	component mult_add
	generic(
		g_WIDTH: integer := 8;
		g_INT_WIDTH : integer := 0;
		g_FRAC_WIDTH: integer := 8
	);
	port(
		i_x: in std_logic_vector(g_WIDTH-1 downto 0);
		i_a: in std_logic_vector(g_WIDTH-1 downto 0);
		i_b: in std_logic_vector(g_WIDTH-1 downto 0);
		o_result: out std_logic_vector(g_WIDTH-1 downto 0)
	);
	end component mult_add;

	signal i_x : std_logic_vector(7 downto 0) := X"07"; -- 0.875
	signal i_a : std_logic_vector(7 downto 0) := X"03"; -- 0.375
	signal i_b : std_logic_vector(7 downto 0) := X"0F"; -- -0.125
	signal o_result : std_logic_vector(7 downto 0) := (others => '0');

begin
	uut: mult_add
	port map(
		i_x => i_x,
		i_a => i_a,
		i_b => i_b,
		o_result => o_result
	);

end rtl;

