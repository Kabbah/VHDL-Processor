@echo off

mkdir gtkwave

echo Building add_1
ghdl -a add_1.vhd
ghdl -e add_1

echo Building alu16bits
ghdl -a alu16bits.vhd
ghdl -e alu16bits

echo Building somador8bitsPC
ghdl -a somador8bitsPC.vhd
ghdl -e somador8bitsPC

echo Building controlunit
ghdl -a controlunit.vhd
ghdl -e controlunit

echo Building demux3x8
ghdl -a demux3x8.vhd
ghdl -e demux3x8

echo Building maq_estados
ghdl -a maq_estados.vhd
ghdl -e maq_estados

echo Building mux8x3
ghdl -a mux8x3.vhd
ghdl -e mux8x3

echo Building reg8bits
ghdl -a reg8bits.vhd
ghdl -e reg8bits

echo Building reg16bits
ghdl -a reg16bits.vhd
ghdl -e reg16bits

echo Building regbank16bits
ghdl -a regbank16bits.vhd
ghdl -e regbank16bits

echo Building rom
ghdl -a rom.vhd
ghdl -e rom

echo Building ram
ghdl -a ram.vhd
ghdl -e ram

echo Building sign_extend_imm
ghdl -a sign_extend_imm.vhd
ghdl -e sign_extend_imm

echo Building processador + testbench
ghdl -a processador.vhd
ghdl -e processador
ghdl -a processador_tb.vhd
ghdl -e processador_tb
ghdl -r processador_tb --wave=gtkwave\processador_tb.ghw --stop-time=1ms

pause