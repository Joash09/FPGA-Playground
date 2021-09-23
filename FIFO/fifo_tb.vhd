library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fifo_tb is
end fifo_tb;

architecture arch of fifo_tb is

	component fifo is
		Generic(g_WIDTH : integer := 8;
						g_DEPTH : integer := 1);
		Port(
				 reset: in std_logic;
				 wr_clk: in std_logic;
				 i_data_wr: in std_logic_vector(g_WIDTH-1 downto 0);
				 i_write_en: in std_logic;
				 o_full: out std_logic;
				 rd_clk: in std_logic;
				 o_data_rd: out std_logic_vector(g_WIDTH-1 downto 0);
				 i_read_en: in std_logic;
				 o_empty: out std_logic);
	end component;

	constant WR_CLK_PERIOD: time := 1 ns;
	constant RD_CLK_PERIOD: time := 2 ns;
	signal wr_clk, rd_clk: std_logic := '0';

	signal clk: std_logic := '0';
	signal reset: std_logic := '1'; -- Low active

	signal i_data_wr: std_logic_vector(7 downto 0) := (others => '0');
	signal o_data_rd: std_logic_vector(7 downto 0);
	signal i_write_en, i_read_en: std_logic := '0';
	signal o_full, o_empty: std_logic;


begin

	fifo_inst: fifo
	generic map(g_WIDTH => 8,
	g_DEPTH => 8)
	port map(
	reset=>not reset,
	wr_clk=>wr_clk,
	i_data_wr=>i_data_wr,
	i_write_en=>i_write_en,
	o_full=>o_full,

	rd_clk=>rd_clk,
	o_data_rd=>o_data_rd,
	i_read_en=>i_read_en,
	o_empty=>o_empty
	);

	wr_clk_proc: process
	begin
		wait for WR_CLK_PERIOD/2;
		wr_clk <= not wr_clk;
	end process;

	rd_clk_proc: process
	begin
		wait for RD_CLK_PERIOD/2;
		rd_clk <= not rd_clk;
	end process;


	stim_proc: process
	begin
		wait until wr_clk <= '1';
		i_data_wr  <= X'5';
		i_write_en <= '1';

	end process;


end arch;
