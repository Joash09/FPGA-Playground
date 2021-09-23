library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fibonacci_tb is
end fibonacci_tb;

architecture rtl of fibonacci_tb is

	component fibonacci is
	Port (
	     clk : in std_logic;
	     reset : in std_logic;
	     counter : out unsigned(7 downto 0)
	);
	end component;

	constant CLK_PERIOD : time := 2 ns;

	signal clk: std_logic := '0';
	signal reset: std_logic := '1';
	signal counter: unsigned(7 downto 0) := X"00";

begin

	uut: fibonacci
	port map(
		clk => clk,
		reset => reset,
		counter => counter
	);

	clk_proc: process
	begin
		wait for CLK_PERIOD/2;
		clk <= not clk;
	end process;

	stim_proc: process
	begin
		wait for 5 ns;
		reset <= '0';
	end process;

end rtl;

