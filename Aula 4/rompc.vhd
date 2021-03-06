library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rompc is
	port (
		wr_en    : in std_logic;
		rom_en   : in std_logic;
		clk      : in std_logic;
		rst      : in std_logic;
		mem_data : out unsigned(13 downto 0)
	);
end entity;

architecture a_rompc of rompc is
	component program_counter is
		port (
			wr_en    : in std_logic;
			clk      : in std_logic;
			rst      : in std_logic;
			data_out : out unsigned(7 downto 0)
		);
	end component;
	
	component rom is
		port (
			clk      : in std_logic;
			enable   : in std_logic;
			endereco : in unsigned(7 downto 0);
			dado     : out unsigned(13 downto 0)
		);
	end component;
	
	signal address: unsigned(7 downto 0);

begin
	pc: program_counter port map (
		wr_en => wr_en,
		clk => clk,
		rst => rst,
		data_out => address
	);
	
	mem: rom port map (
		clk => clk,
		enable => rom_en,
		endereco => address,
		dado => mem_data
	);
end architecture;