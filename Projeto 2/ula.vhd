LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ula IS
PORT (
		A, B : IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		Op : IN STD_LOGIC_VECTOR(1 DOWNTO 0) ;
		Overflow, Cout : OUT STD_LOGIC ;
		R : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ula ;
ARCHITECTURE ula_arq OF ula IS
	SIGNAL Sum : STD_LOGIC_VECTOR(8 DOWNTO 0);
	SIGNAL Sub : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL E : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL Ou : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN

	E <= A AND B;
	Ou <= A OR B;
	Sum <= ('0' & A) + B;
	Sub <= A - B;

	Cout <= Sum(8) ;
	Overflow <= Sum(8) XOR A(7) XOR B(7) XOR Sum(7);

PROCESS(A, B, Op, E, Ou, Sum, Sub)
BEGIN
	
	CASE Op IS
		WHEN "00" => R <= E;
		WHEN "01" => R <= Ou;
		WHEN "10" => R <= Sum(7 DOWNTO 0);
		WHEN "11" => R <= Sub;
		WHEN OTHERS => R <= "ZZZZZZZZ";
	END CASE;

END PROCESS;

END ula_arq;