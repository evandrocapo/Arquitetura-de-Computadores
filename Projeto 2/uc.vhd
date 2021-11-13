  
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all ;
ENTITY uc IS
	PORT (
		opcode        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		ALUop         : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		regWrite      : OUT STD_LOGIC
	);
END uc;

ARCHITECTURE uc_arq OF uc IS

BEGIN
	PROCESS (opcode)
	BEGIN
		CASE opcode IS
			WHEN "00" => -- add
				ALUop         <= "10";
				regWrite      <= '1';
			WHEN "01" => -- sub
				ALUop         <= "11";
				regWrite      <= '1';
			WHEN "10" => -- beq
				ALUop         <= "01";
				regWrite      <= '0';
			WHEN "11" => -- jmp
				ALUop         <= "00";
				regWrite      <= '0';
			WHEN OTHERS => NULL;
				ALUop         <= "00";
				regWrite      <= '0';
		END CASE;
	END PROCESS;
END uc_arq;