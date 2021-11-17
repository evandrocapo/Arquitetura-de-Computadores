  
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all ;
ENTITY uc IS
	PORT (
		clk			  : IN BIT;
		opcode        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		ALUop         : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		jmp           : OUT STD_LOGIC;
		regWrite      : OUT STD_LOGIC;
		branch		  : OUT STD_LOGIC
	);
END uc;

ARCHITECTURE uc_arq OF uc IS

SIGNAL jmp_realizado : BIT := '0';
SIGNAL branch_realizado : BIT := '0';

BEGIN
	PROCESS (clk, opcode)
	BEGIN
		IF (clk='1') AND (opcode = "11" OR opcode = "10") THEN
			jmp_realizado <= '1';
			branch_realizado <= '1';
		ELSE
			jmp_realizado <= '0';
			branch_realizado <= '0';
		END IF;
	
		CASE opcode IS
			WHEN "00" => -- add
				ALUop         <= "10";
				jmp           <= '0';
				regWrite      <= '1';
				branch		  <= '0';
			WHEN "01" => -- sub
				ALUop         <= "11";
				jmp           <= '0';
				regWrite      <= '1';
				branch		  <= '0';
			WHEN "10" => -- beq
				ALUop         <= "01";
				jmp           <= '0';
				regWrite      <= '0';
				
				IF branch_realizado = '1' THEN
					branch 			  <= '0';
				ELSE
					branch           <= '1';
				END IF;
			WHEN "11" => -- jmp
				ALUop         <= "00";
				regWrite      <= '0';
				branch		  <= '0';
				
				IF jmp_realizado = '1' THEN
					jmp 			  <= '0';
				ELSE
					jmp           <= '1';
				END IF;

			WHEN OTHERS => NULL;
				ALUop         <= "00";
				jmp           <= '0';
				regWrite      <= '0';
				branch 		  <= '0';
		END CASE;
	END PROCESS;
END uc_arq;