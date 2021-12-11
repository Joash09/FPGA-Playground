library IEEE;

use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity polynomial is
generic(
	g_DEGREE: integer := 2;
	g_FP_SIZE: integer := 32;
	g_FP_FRAC_SIZE: integer := 21
       );
port(
	i_x: in std_logic_vector(g_FP_SIZE-1 downto 0);
	i_coeffients: in std_logic_vector(((g_DEGREE+1)*g_FP_SIZE)-1 downto 0);

	o_result: out std_logic_vector(g_FP_SIZE-1 downto 0)
    );
end polynomial;

architecture rtl of polynomial is

	-- Mult_Add Component
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

	-- Simplifies working with the ceffients
	type t_coeffients_arr is array (0 to g_DEGREE) of std_logic_vector(g_FP_SIZE-1 downto 0);
	signal coeffients_arr : t_coeffients_arr;

	-- Feeds the result from the previous to next mult_stage module
	type t_stage_result is array (0 to g_DEGREE-1) of std_logic_vector(g_FP_SIZE-1 downto 0);
	signal stages_arr : t_stage_result;

begin

	gen_load_coeffients: for i in 0 to g_DEGREE generate
		coeffients_arr(i) <= i_coeffients((i*g_FP_SIZE)+g_FP_SIZE-1 downto i*g_FP_SIZE);
	end generate;

	gen_mult_add: for i in 0 to g_DEGREE-1 generate

		mult_add_0 : if i = 0 generate
			mult_add_0 : mult_add
			generic map(
				g_WIDTH => g_FP_SIZE,
				g_FRAC_WIDTH => g_FP_FRAC_SIZE
			)
			port map(
				i_x => i_x,
				i_a => coeffients_arr(0),
				i_b => coeffients_arr(1),
				o_result => stages_arr(i)
			);
		end generate mult_add_0;

		mult_add_i : if (i > 0) generate
			mult_add_i : mult_add
			generic map(
				g_WIDTH => g_FP_SIZE,
				g_FRAC_WIDTH => g_FP_FRAC_SIZE
			)
			port map(
				i_x => i_x,
				i_a => stages_arr(i-1),
				i_b => coeffients_arr(i+1),
				o_result => stages_arr(i)
			);
		end generate mult_add_i;

	end generate;

	o_result <= stages_arr(g_DEGREE-1);

end architecture;
