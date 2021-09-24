library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fifo is
	
	Generic(g_WIDTH : integer := 8;
					g_DEPTH : integer := 1);
	Port(
			reset: in std_logic;
			wr_clk: in std_logic;
			i_data_wr: in unsigned(g_WIDTH-1 downto 0);
			i_write_en: in std_logic;
			o_full: out std_logic;

			rd_clk: in std_logic;
			o_data_rd: out unsigned(g_WIDTH-1 downto 0);
			i_read_en: in std_logic;
			o_empty: out std_logic);

end fifo;

architecture arch of fifo is

	type t_FIFO is array (0 to g_DEPTH-1) of unsigned(g_WIDTH-1 downto 0);
	signal fifo : t_FIFO := (others => (others => '0'));

	signal fifo_wr_index: integer range 0 to g_DEPTH-1 := 0;
	signal fifo_full: std_logic := '0';
	signal fifo_rd_index: integer range 0 to g_DEPTH-1 := 0;
	signal fifo_empty: std_logic := '1';

begin 

	-- Async assignments
	o_data_rd <= fifo(fifo_rd_index);
	o_full <= fifo_full;
	o_empty <= fifo_empty;

	write_proc: process(wr_clk) is
	begin
		if rising_edge(wr_clk) then

			-- Write to FIFO
			if (i_write_en = '1') then 
				fifo(fifo_wr_index) <= i_data_wr;
				if (fifo_empty = '1') then
					fifo_empty <= '0';
				end if;
			end if;

			-- Update write index
			-- Cannot write if FIFO is full
			if (i_write_en = '1' and fifo_full = '0') then
				if (fifo_wr_index = g_DEPTH-1) then
					fifo_wr_index <= 0;
					fifo_full <= '1';
				else
					fifo_wr_index <= fifo_wr_index + 1;
				end if;
			end if;

		end if;
	end process;


	read_proc: process(rd_clk) is
	begin
		if rising_edge(rd_clk) then

			-- Update read index
			-- Cannot read if FIFO is empty
			if (i_read_en = '1' and fifo_empty = '0') then
				if (fifo_rd_index = g_WIDTH-1) then
					fifo_rd_index <= 0;
				else
					fifo_rd_index <= fifo_rd_index + 1;
				end if;
			end if;

		end if;
	end process;

end arch;
