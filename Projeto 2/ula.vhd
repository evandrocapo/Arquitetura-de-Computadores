LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ula IS
PORT (
		clk	: IN BIT;
		A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		Op : IN STD_LOGIC_VECTOR(1 DOWNTO 0) ;
		R : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ula ;

ARCHITECTURE ula_arq OF ula IS
	SIGNAL Sum : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL Sub : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL E : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL calculoBranch : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
PROCESS(clk, A, B, Op, E, calculoBranch, Sum, Sub)
	BEGIN
		IF clk='1' THEN
				E <= A AND B;
				calculoBranch <= A XOR B;
				Sum <= A + B;
				Sub <= A - B;
		
				IF Op = "00" THEN
					R <= E;
				ELSIF Op = "01" THEN
				   R <= calculoBranch;
				ELSIF Op = "10" THEN
				   R <= Sum;
				ELSE
				   R <= Sub;
				END IF;
		END IF;
	END PROCESS;

END ula_arq;