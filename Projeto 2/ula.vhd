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
	SIGNAL Ou : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
PROCESS(A, B, Op, E, Ou, Sum, Sub, Clk)
	BEGIN
		IF clk'EVENT and clk='1' THEN
				E <= A AND B;
				Ou <= A OR B;
				Sum <= A + B;
				Sub <= A - B;
		
				CASE Op IS
					WHEN "00" => R <= E;
					WHEN "01" => R <= Ou;
					WHEN "10" => R <= Sum;
					WHEN "11" => R <= Sub;
					WHEN OTHERS => R <= "ZZZZZZZZ";
				END CASE;
		END IF;
	END PROCESS;

END ula_arq;