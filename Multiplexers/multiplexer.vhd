library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux is
port (
			 	i_data_0: in std_logic_vector(3 downto 0);
				i_data_1: in std_logic_vector(3 downto 0);
				i_data_2: in std_logic_vector(3 downto 0);
				i_data_3: in std_logic_vector(3 downto 0);
				s: in integer range 0 to 3;
				o_y: out std_logic_vector(3 downto 0)
			 );
end mux;

architecture arch1 of mux is

begin

	with s select
		o_y <= i_data_0 when 0,
					 i_data_1 when 1,
					 i_data_2 when 2,
					 i_data_3 when 3;

end arch1;
