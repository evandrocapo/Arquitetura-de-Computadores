LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY reg_instr IS
	PORT (
		regInstructionIn   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		regInstructionOut  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END reg_instr;

ARCHITECTURE reg_instr_arq OF reg_instr IS
BEGIN
	regInstructionOut <= regInstructionIn;
END reg_instr_arq;