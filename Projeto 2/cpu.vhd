LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY cpu IS
PORT (
	clk: IN STD_LOGIC
);
END cpu;

ARCHITECTURE Behavioral OF cpu IS

-- Declare ALU component
COMPONENT ula IS
PORT (
		A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		Op : IN STD_LOGIC_VECTOR(1 DOWNTO 0) ;
		Overflow, Cout : OUT STD_LOGIC ;
		R : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ula ;

-- Declare Memory component
COMPONENT memoria_principal IS PORT
	(
		ReadAddress : IN STD_LOGIC_VECTOR (15 downto 0);
		Instruction : OUT STD_LOGIC_VECTOR (15 downto 0)
		
	);
END memoria_principal;

-- Declare Unit Control component
COMPONENT uc IS
	PORT (
		opcode        : IN std_logic_vector(3 DOWNTO 0);
		regDst        : OUT std_logic;
		ALUop         : OUT std_logic_vector(1 DOWNTO 0);
		ALUsrc        : OUT std_logic;
		regWrite      : OUT std_logic
	);
END uc;

-- Declare Program Counter component
COMPONENT pc IS
	PORT (
		pcIn   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		pcOut  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END pc;

-- Declare Bank Register component
COMPONENT banco_de_registradores IS
PORT	(
		RegWrite : IN std_logic;
		ReadRegister1 : IN std_logic_vector(1 DOWNTO 0);
		ReadRegister2 : IN std_logic_vector(1 DOWNTO 0);
		WriteData : IN std_logic_vector(7 DOWNTO 0);
		WriteRegister : IN std_logic_vector(1 DOWNTO 0);
		ReadData1 : OUT std_logic_vector(7 DOWNTO 0);
		ReadData2 : OUT std_logic_vector(7 DOWNTO 0)
	)
END banco_de_registradores;

-- Declare Instruction Register component
COMPONENT reg_instr IS
	PORT (
		regInstructionIn   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		regInstructionOut  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END reg_instr;

-- Signals declaration




