library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity polynomial_tb is
end polynomial_tb;

architecture rtl of polynomial_tb is

	component polynomial
	port(
		i_clk: in std_logic;
		i_reset: in std_logic;
		i_x: in signed(7 downto 0);
		i_coeffients: in std_logic_vector(8*8-1 downto 0);
		o_ready : out std_logic;
		o_y: out signed(31 downto 0)
	    );
	end component polynomial;

	constant CLK_PERIOD : time := 5 ns;

	signal i_clk, i_reset : std_logic := '0';
	signal i_coeffients: std_logic_vector(8*8-1 downto 0);

	signal o_ready: std_logic;
	signal o_y: signed(31 downto 0);

	-- Define your polynomial here
	type t_coeffients is array(0 to 7) of signed(7 downto 0);
	signal coeffients: t_coeffients := (X"00", X"00", X"00", X"00", X"00", X"01", X"02", X"03");
	signal i_x: signed(7 downto 0) := X"00";

begin

	uut : polynomial
	port map(
		i_clk => i_clk,
		i_reset => i_reset,
		i_x => i_x,
		i_coeffients => i_coeffients,
		o_ready => o_ready,
		o_y => o_y
	);

	-- Assign co-effients
	gen_coeff: for i in 0 to 7 generate
		i_coeffients(8*i+7 downto 8*i) <= std_logic_vector(coeffients(i));
	end generate gen_coeff;

	clk_proc: process
	begin
		wait for CLK_PERIOD/2;
		i_clk <= not i_clk;
	end process;

	stim_proc: process
	begin
		i_reset <= '1';
		wait for 10 ns;
		i_reset <= '0';
		wait;
	end process;
end rtl;
