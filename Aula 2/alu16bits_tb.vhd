library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu16bits_tb is
end;

architecture a_alu16bits_tb of alu16bits_tb is
    component alu16bits
		port (
			x, y: in unsigned(15 downto 0);
			operation: in unsigned(3 downto 0);
			saida: out unsigned(15 downto 0);
			zeroFlag, overflowFlag: out std_logic
		);
    end component;
    signal x, y, saida: unsigned(15 downto 0);
	signal operation: unsigned(3 downto 0);
	signal zeroFlag, overflowFlag: std_logic;
    
begin
    uut: alu16bits port map( 
		x => x,
		y => y,
		saida => saida,
		operation => operation,
		zeroFlag => zeroFlag,
		overflowFlag => overflowFlag
	);

    process
	begin
		-- Teste AND
		x <= "1100110011001100"; -- 0xCCCC
		y <= "1010101010101010"; -- 0xAAAA
		operation <= "0000"; -- Operacao AND
		-- saida deve ser 0x8888
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		
		-- Teste OR
		x <= "1100110011001100"; -- 0xCCCC
		y <= "1010101010101010"; -- 0xAAAA
		operation <= "0001"; -- Operacao OR
		-- saida deve ser 0xEEEE
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 0
		wait for 50 ns;
		
		-- Testes +
		x <= "0000000000000001"; -- 0x0001
		y <= "0000000000000001"; -- 0x0001
		operation <= "0010"; -- Operacao +
		-- saida deve ser 0x0002
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "0000000000000001"; -- 0x0001
		y <= "1111111111111111"; -- 0xFFFF
		operation <= "0010"; -- Operacao +
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "1111111111111111"; -- 0xFFFF
		y <= "1111111111111111"; -- 0xFFFF
		operation <= "0010"; -- Operacao +
		-- saida deve ser 0xFFFE
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "0111111111111111"; -- 0x7FFF
		y <= "0111111111111111"; -- 0x7FFF
		operation <= "0010"; -- Operacao +
		-- saida deve ser 0xFFFE
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 1
 		wait for 50 ns;
		x <= "1000000000000001"; -- 0x8001
		y <= "0111111111111111"; -- 0x7FFF
		operation <= "0010"; -- Operacao +
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "1000000000000001"; -- 0x8001
		y <= "1000000000000001"; -- 0x8001
		operation <= "0010"; -- Operacao +
		-- saida deve ser 0x0002
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 1
 		wait for 50 ns;
		x <= "1000000000000000"; -- 0x8000
		y <= "1111111111111111"; -- 0xFFFF
		operation <= "0010"; -- Operacao +
		-- saida deve ser 0x7FFF
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 1
		wait for 50 ns;
		
		-- Testes -
		x <= "0000000000000001"; -- 0x0001
		y <= "0000000000000001"; -- 0x0001
		operation <= "0110"; -- Operacao -
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "0000000000000001"; -- 0x0001
		y <= "1111111111111111"; -- 0xFFFF
		operation <= "0110"; -- Operacao -
		-- saida deve ser 0x0002
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "1111111111111111"; -- 0xFFFF
		y <= "0000000000000001"; -- 0x0001
		operation <= "0110"; -- Operacao -
		-- saida deve ser 0xFFFE
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "1111111111111111"; -- 0xFFFF
		y <= "1111111111111111"; -- 0xFFFF
		operation <= "0110"; -- Operacao -
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "0111111111111111"; -- 0x7FFF
		y <= "0111111111111111"; -- 0x7FFF
		operation <= "0110"; -- Operacao -
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "0111111111111111"; -- 0x7FFF
		y <= "1000000000000001"; -- 0x8001
		operation <= "0110"; -- Operacao -
		-- saida deve ser 0xFFFE
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 1
 		wait for 50 ns;
		x <= "1000000000000001"; -- 0x8001
		y <= "0111111111111111"; -- 0x7FFF
		operation <= "0110"; -- Operacao -
		-- saida deve ser 0x0002
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 1
 		wait for 50 ns;
		x <= "1000000000000001"; -- 0x8001
		y <= "1000000000000001"; -- 0x8001
		operation <= "0110"; -- Operacao -
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "1000000000000000"; -- 0x8000
		y <= "0000000000000001"; -- 0x0001
		operation <= "0110"; -- Operacao -
		-- saida deve ser 0x7FFF
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 1
		wait for 50 ns;
		
		-- Testes SLT
		x <= "0000000000000000"; -- 0x0000
		y <= "0000000000000001"; -- 0x0001
		operation <= "0111"; -- Operacao SLT
		-- saida deve ser 0x0001
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "0000000000000001"; -- 0x0001
		y <= "0000000000000000"; -- 0x0000
		operation <= "0111"; -- Operacao SLT
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "0000000000000001"; -- 0x0001
		y <= "0000000000000001"; -- 0x0001
		operation <= "0111"; -- Operacao SLT
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "1111111111111111"; -- 0xFFFF
		y <= "0000000000000000"; -- 0x0000
		operation <= "0111"; -- Operacao SLT
		-- saida deve ser 0x0001
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "0000000000000000"; -- 0x0000
		y <= "1111111111111111"; -- 0xFFFF
		operation <= "0111"; -- Operacao SLT
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "1111111111111111"; -- 0x0000
		y <= "1111111111111111"; -- 0x0001
		operation <= "0111"; -- Operacao SLT
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "1111111111111110"; -- 0xFFFE
		y <= "1111111111111111"; -- 0xFFFF
		operation <= "0111"; -- Operacao SLT
		-- saida deve ser 0x0001
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "1111111111111111"; -- 0xFFFF
		y <= "1111111111111110"; -- 0xFFFE
		operation <= "0111"; -- Operacao SLT
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		x <= "1111111111111111"; -- 0xFFFF
		y <= "1111111111111110"; -- 0xFFFE
		operation <= "0111"; -- Operacao SLT
		-- saida deve ser 0x0000
		-- zeroFlag deve ser 1
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		
		-- Teste NOR
		x <= "1100110011001100"; -- 0xCCCC
		y <= "1010101010101010"; -- 0xAAAA
		operation <= "1100"; -- Operacao NOR
		-- saida deve ser 0x1111
		-- zeroFlag deve ser 0
		-- overflowFlag deve ser 0
 		wait for 50 ns;
		
		wait;
	end process;
end architecture;
