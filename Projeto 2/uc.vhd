  
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all ;
ENTITY uc IS
	PORT (
		opcode        : IN std_logic_vector(3 DOWNTO 0);
		regDst        : OUT std_logic;
		ALUop         : OUT std_logic_vector(1 DOWNTO 0);
		ALUsrc        : OUT std_logic;
		regWrite      : OUT std_logic
	);
END uc;

ARCHITECTURE uc_arq OF uc IS

BEGIN
	PROCESS (opcode)
	BEGIN
		CASE opcode IS
			WHEN "00" => -- add
				regDst        <= '0';
				ALUop         <= "10";
				ALUsrc        <= '0';
				regWrite      <= '0';
			WHEN "01" => -- sub
				regDst        <= '0';
				ALUop         <= "11";
				ALUsrc        <= '0';
				regWrite      <= '0';
			WHEN "10" => -- beq
				regDst        <= '0';
				ALUop         <= "01";
				ALUsrc        <= '0';
				regWrite      <= '0';
			WHEN "11" => -- jmp
				regDst        <= '0';
				ALUop         <= "00";
				ALUsrc        <= '0';
				regWrite      <= '0';
			WHEN OTHERS => NULL;
				regDst        <= '0';
				ALUop         <= "00";
				ALUsrc        <= '0';
				regWrite      <= '0';
		END CASE;
	END PROCESS;
END uc_arq;