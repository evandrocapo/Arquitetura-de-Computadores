LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY reg_instr IS
	PORT (
		clk	: IN BIT;
		regInstructionIn   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		opcode  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		regOne  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		regTwo  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		regThree  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END reg_instr;

ARCHITECTURE reg_instr_arq OF reg_instr IS
BEGIN
PROCESS(clk)
	BEGIN
		IF clk'EVENT and clk='1' THEN
			  	opcode <= regInstructionIn(7 DOWNTO 6);
				regOne <= regInstructionIn(5 DOWNTO 4);
				regTwo <= regInstructionIn(3 DOWNTO 2);
				regThree <= regInstructionIn(1 DOWNTO 0);
		END IF;
	END PROCESS;
END reg_instr_arq;