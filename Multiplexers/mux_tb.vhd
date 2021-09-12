library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_tb is
end mux_tb;

architecture arch1 of mux_tb is

	component mux is
	port (i_data_0: in std_logic_vector(3 downto 0);
				i_data_1: in std_logic_vector(3 downto 0);
				i_data_2: in std_logic_vector(3 downto 0);
				i_data_3: in std_logic_vector(3 downto 0);
				s: in integer range 0 to 3;
				o_y: out std_logic_vector(3 downto 0)
	);
	end component;

	signal i_data_0, i_data_1, i_data_2, i_data_3, o_y: std_logic_vector(3 downto 0) := (others => '0');
	signal s: integer range 0 to 3 := 0;

begin

	mux_inst: mux
	port map(i_data_0 => i_data_0,
						i_data_1 => i_data_1,
						i_data_2 => i_data_2,
						i_data_3 => i_data_3,
						s => s,
						o_y => o_y
					);

	stim: process begin

		i_data_0 <= std_logic_vector(to_unsigned(2, i_data_0'length));
		i_data_1 <= std_logic_vector(to_unsigned(5, i_data_1'length));
		i_data_2 <= std_logic_vector(to_unsigned(10, i_data_2'length));
		i_data_3 <= std_logic_vector(to_unsigned(15, i_data_3'length));

		wait for 5 ns;
		s <= 1;

		wait for 5 ns;
		s <= 2;

		wait for 5 ns;
		s <= 3;

	end process;

end arch1;
