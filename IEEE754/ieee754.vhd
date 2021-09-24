library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ieee754 is
	Port(
		i_a: in std_logic_vector(31 downto 0);
		i_b: in std_logic_vector(31 downto 0);

		o_output: out std_logic_vector(31 downto 0)
	);
end ieee754;

architecture rtl of ieee754 is 

	constant offset: unsigned(7 downto 0) := D"127";
	signal exp_a, exp_b, add_exp : unsigned(7 downto 0);
	signal frac_a, frac_b: unsigned(22 downto 0);
	signal mult_frac: unsigned(47 downto 0);

begin

	-- This is only for the multiplication process. Need to add adder

	-- Unpack
	exp_a <= unsigned(i_a(30 downto 23));
	exp_b <= unsigned(i_b(30 downto 23));
	frac_a <= unsigned(i_a(22 downto 0));
	frac_b <= unsigned(i_b(22 downto 0));

	process
	begin

		add_exp <= exp_a + exp_b;
		mult_frac <= frac_a * frac_b;

		-- Normalize mantissa
		if mult_frac(47) = '1' then
			add_exp <= add_exp + 1;
			mult_frac <= shift_left(mult_frac, 1);
		end if;

		-- Check for overflow

	end process;

	-- Pack
	o_output(7 downto 0) <= std_logic_vector(add_exp);

	o_output(31) <= i_a(0) xnor i_b(0);

end architecture;
