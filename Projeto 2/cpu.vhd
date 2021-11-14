LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.ALL;

ENTITY cpu IS
	PORT (
		clk: IN BIT
	);
END cpu;

ARCHITECTURE cpu_arq OF cpu IS

-- Declare memoria principal component
COMPONENT memoria_principal IS PORT
	(
		ReadAddress : IN STD_LOGIC_VECTOR (7 downto 0);
		Instruction : OUT STD_LOGIC_VECTOR (7 downto 0)
		
	);
END COMPONENT memoria_principal;

-- Declare reg instr component
COMPONENT reg_instr IS
	PORT (
		clk	: IN BIT;
		regInstructionIn   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		opcode  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		regOne  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		regTwo  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		regThree  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		JumpAddress   : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		jmp : IN STD_LOGIC
	);
END COMPONENT reg_instr;

-- Declare uc component
COMPONENT uc IS
	PORT (
		clk			  : IN BIT;
		opcode        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		ALUop         : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		jmp      : OUT STD_LOGIC;
		regWrite      : OUT STD_LOGIC
	);
END COMPONENT uc;

-- Declare banco de registradores component
COMPONENT banco_de_registradores IS
PORT	(
		clk	: IN BIT;
		RegWrite : IN STD_LOGIC;
		ReadRegister1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		ReadRegister2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		WriteRegister : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		WriteData : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		ReadData1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		ReadData2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT banco_de_registradores;


-- Declare ula component
COMPONENT  ula IS
PORT (
		clk	: IN BIT;
		A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		Op : IN STD_LOGIC_VECTOR(1 DOWNTO 0) ;
		R : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT ula;

-- Declare pc component
COMPONENT pc IS
	PORT (
		clk	 : IN BIT;
		pcIn   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		pcJmp  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		jmp	 : IN STD_LOGIC;
		pcOut  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT pc;

-- Signals declaration

SIGNAL memOut : STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL opcode: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL regOne: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL regTwo: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL regThree: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL JumpAddress: STD_LOGIC_VECTOR(5 DOWNTO 0);

SIGNAL ALUop: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL jmp: STD_LOGIC;
SIGNAL regWrite: STD_LOGIC;

SIGNAL regOneValue: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL regTwoValue: STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL resultALu : STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL pcOut : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
--	P_C: pc PORT MAP(clk, "00000000", JumpAddress, jmp, pcOut);
--	MEM: memoria_principal PORT MAP(pcOut, memOut);
--	REG_INST: reg_instr PORT MAP(clk, memOut, opcode, regOne, regTwo, regThree, JumpAddress, jmp);
--	U_C: uc PORT MAP(clk, opcode, ALUop, jmp, regWrite);
--	U_L_A: ula PORT MAP(clk, regOneValue, regTwoValue, ALUop, resultALu);
--	Banco: banco_de_registradores PORT MAP(clk, regWrite, regOne, regTwo, regThree, resultALu, regOneValue, regTwoValue);
	
END cpu_arq;




