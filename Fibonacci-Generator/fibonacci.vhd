library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fibonacci is
Port (
	clk : in std_logic;
	reset : in std_logic;
	counter : out unsigned(7 downto 0)
);
end fibonacci;

architecture rtl of fibonacci is

	signal prev_counter: unsigned(7 downto 0) := X"00";
	signal curr_counter: unsigned(7 downto 0) := X"01";

begin

	counter <= prev_counter;

	process(clk)
	begin
		if rising_edge(clk) then

			if (reset = '1') then
				prev_counter <= X"00";
				curr_counter <= X"01";
			else
				curr_counter <= curr_counter + prev_counter;
				prev_counter <= curr_counter;
			end if;

		end if;
	end process;

end rtl;
