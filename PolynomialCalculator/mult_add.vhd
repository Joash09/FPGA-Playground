library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Module produces the result : a*x + b 
-- Inputs are signed fixed point numbers of the form f<g_WIDTH, g_FRAC_WIDTH>
-- g_WIDTH is number of bits in number
-- g_FRAC_WIDTH is number of bits which represent the fractional part of the number
entity mult_add is
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
end mult_add;

architecture rtl of mult_add is

	signal cnt : std_logic := '0';
	signal a_x : std_logic_vector((g_WIDTH*2)-1 downto 0);
	signal truncated_prod : std_logic_vector(g_WIDTH-1 downto 0);

	-- Constants for truncating
	constant INT_WIDTH : integer := g_WIDTH - g_FRAC_WIDTH;
	constant INTGER_MSB_INDEX : integer := a_x'high-1;
	constant INTGER_LSB_INDEX : integer := INTGER_MSB_INDEX-INT_WIDTH;
	constant FRAC_MSB_INDEX : integer := INTGER_LSB_INDEX-1;
	constant FRAC_LSB_INDEX : integer := INTGER_MSB_INDEX - g_FRAC_WIDTH;

begin

	-- Using inference for arithmetic operations

	mult: process(i_x, i_a)
	begin
		a_x <= std_logic_vector(signed(i_a)*signed(i_x));
	end process;

	truncate: process(a_x)
	begin
		truncated_prod <= a_x(a_x'high) & -- Keep sign bit
				  a_x(INTGER_MSB_INDEX downto INTGER_LSB_INDEX) & -- Truncated integer part
				  a_x(FRAC_MSB_INDEX downto FRAC_LSB_INDEX); -- Truncated fractional part
	end process;

	add: process(truncated_prod)
	begin
		o_result <= std_logic_vector(signed(truncated_prod)+signed(i_b));
	end process;

end rtl;
