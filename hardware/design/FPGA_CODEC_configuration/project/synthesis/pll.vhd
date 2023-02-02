-- pll.vhd

-- Generated using ACDS version 16.1 196

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pll is
	port (
		clk_clk                           : in  std_logic                     := '0';             --                     clk.clk
		clock_12_clk                      : out std_logic;                                        --                clock_12.clk
		onchip_memory2_0_reset1_reset     : in  std_logic                     := '0';             -- onchip_memory2_0_reset1.reset
		onchip_memory2_0_reset1_reset_req : in  std_logic                     := '0';             --                        .reset_req
		onchip_memory2_0_s1_address       : in  std_logic_vector(17 downto 0) := (others => '0'); --     onchip_memory2_0_s1.address
		onchip_memory2_0_s1_debugaccess   : in  std_logic                     := '0';             --                        .debugaccess
		onchip_memory2_0_s1_clken         : in  std_logic                     := '0';             --                        .clken
		onchip_memory2_0_s1_chipselect    : in  std_logic                     := '0';             --                        .chipselect
		onchip_memory2_0_s1_write         : in  std_logic                     := '0';             --                        .write
		onchip_memory2_0_s1_readdata      : out std_logic_vector(15 downto 0);                    --                        .readdata
		onchip_memory2_0_s1_writedata     : in  std_logic_vector(15 downto 0) := (others => '0'); --                        .writedata
		onchip_memory2_0_s1_byteenable    : in  std_logic_vector(1 downto 0)  := (others => '0'); --                        .byteenable
		reset_reset_n                     : in  std_logic                     := '0'              --                   reset.reset_n
	);
end entity pll;

architecture rtl of pll is
	component pll_onchip_memory2_0 is
		port (
			clk         : in  std_logic                     := 'X';             -- clk
			address     : in  std_logic_vector(17 downto 0) := (others => 'X'); -- address
			debugaccess : in  std_logic                     := 'X';             -- debugaccess
			clken       : in  std_logic                     := 'X';             -- clken
			chipselect  : in  std_logic                     := 'X';             -- chipselect
			write       : in  std_logic                     := 'X';             -- write
			readdata    : out std_logic_vector(15 downto 0);                    -- readdata
			writedata   : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			byteenable  : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			reset       : in  std_logic                     := 'X';             -- reset
			reset_req   : in  std_logic                     := 'X';             -- reset_req
			freeze      : in  std_logic                     := 'X'              -- freeze
		);
	end component pll_onchip_memory2_0;

	component pll_pll_0 is
		port (
			refclk   : in  std_logic := 'X'; -- clk
			rst      : in  std_logic := 'X'; -- reset
			outclk_0 : out std_logic;        -- clk
			outclk_1 : out std_logic;        -- clk
			locked   : out std_logic         -- export
		);
	end component pll_pll_0;

	signal pll_0_outclk1_clk       : std_logic; -- pll_0:outclk_1 -> onchip_memory2_0:clk
	signal reset_reset_n_ports_inv : std_logic; -- reset_reset_n:inv -> pll_0:rst

begin

	onchip_memory2_0 : component pll_onchip_memory2_0
		port map (
			clk         => pll_0_outclk1_clk,                 --   clk1.clk
			address     => onchip_memory2_0_s1_address,       --     s1.address
			debugaccess => onchip_memory2_0_s1_debugaccess,   --       .debugaccess
			clken       => onchip_memory2_0_s1_clken,         --       .clken
			chipselect  => onchip_memory2_0_s1_chipselect,    --       .chipselect
			write       => onchip_memory2_0_s1_write,         --       .write
			readdata    => onchip_memory2_0_s1_readdata,      --       .readdata
			writedata   => onchip_memory2_0_s1_writedata,     --       .writedata
			byteenable  => onchip_memory2_0_s1_byteenable,    --       .byteenable
			reset       => onchip_memory2_0_reset1_reset,     -- reset1.reset
			reset_req   => onchip_memory2_0_reset1_reset_req, --       .reset_req
			freeze      => '0'                                -- (terminated)
		);

	pll_0 : component pll_pll_0
		port map (
			refclk   => clk_clk,                 --  refclk.clk
			rst      => reset_reset_n_ports_inv, --   reset.reset
			outclk_0 => clock_12_clk,            -- outclk0.clk
			outclk_1 => pll_0_outclk1_clk,       -- outclk1.clk
			locked   => open                     -- (terminated)
		);

	reset_reset_n_ports_inv <= not reset_reset_n;

end architecture rtl; -- of pll
