LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY pc IS
	PORT (	
		clk	 : IN BIT;
		pcIn   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		pcJmp  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		jmp	 : IN STD_LOGIC;
		branch : IN STD_LOGIC;
		pcBranch : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		branchValido: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		pcOut  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END pc;

ARCHITECTURE pc_arq OF pc IS
	SIGNAL pcAtual : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
BEGIN
	PROCESS (clk, jmp, pcIn, pcBranch, branch, branchValido, pcAtual)
	BEGIN
		pcOut <= pcAtual;
	
		IF (clk'EVENT and clk='0') THEN
			IF branch = '1' AND branchValido = "00000000" THEN
				pcAtual <= pcBranch;
			ELSIF branch = '1' THEN
				pcAtual <= pcAtual + "00000010";
				pcOut <= pcAtual;
			ELSIF jmp = '0' THEN
				pcAtual <= pcAtual + "00000001";
				pcOut <= pcAtual;				
			ELSE
				pcAtual <= pcAtual(7 DOWNTO 6) & pcJmp(5 DOWNTO 0);
			END IF;
		END IF;
	END PROCESS;
END pc_arq;