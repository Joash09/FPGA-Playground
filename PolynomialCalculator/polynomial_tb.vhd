library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity polynomial_tb is
end polynomial_tb;

architecture rtl of polynomial_tb is

	component polynomial
	generic(
		g_DEGREE: integer := 2;
		g_FP_SIZE: integer := 32;
		g_FP_FRAC_SIZE: integer := 30
	);
	port(
		i_x: in std_logic_vector(g_FP_SIZE-1 downto 0);
		i_coeffients: in std_logic_vector((g_DEGREE*g_FP_SIZE)-1 downto 0);
		o_result: out std_logic_vector(g_FP_SIZE-1 downto 0)
	);
	end component polynomial;

	-- For simulation
	constant CLK_PERIOD : time := 5 ns;
	signal clk : std_logic := '0';

	-- Define your polynomial here
	constant DEGREE : integer := 2;
	constant FP_SIZE: integer := 32;
	constant FP_FRAC_SIZE: integer := 30;

	signal i_x, o_result : std_logic_vector(FP_SIZE-1 downto 0);
	type t_coeffients_arr is array (0 to DEGREE) of std_logic_vector(FP_SIZE-1 downto 0);
	constant coeffients_arr : t_coeffients_arr := (
		X"00000000",
		X"00000000",
		X"00000000"
	);
	signal i_coeffients : std_logic_vector((FP_SIZE*DEGREE)-1 downto 0);

begin
	-- Unit under test
	uut : polynomial
	generic map(
		g_DEGREE => DEGREE,
		g_FP_SIZE => FP_SIZE,
		g_FP_FRAC_SIZE => FP_FRAC_SIZE
	)
	port map(
		i_x => i_x,
		i_coeffients => i_coeffients,
		o_result => o_result
	);

	-- Serialize the coeffients
	gen_coeff: for i in 0 to DEGREE-1 generate
		i_coeffients((i*FP_SIZE)+FP_SIZE-1 downto i*FP_SIZE) <= std_logic_vector(coeffients_arr(i));
	end generate gen_coeff;

	clk_proc: process
	begin
		wait for CLK_PERIOD/2;
		clk <= not clk;
	end process;

end rtl;
