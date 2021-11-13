LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;

ENTITY memoria_principal IS PORT
	(
		ReadAddress : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		Instruction : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		
	);
END memoria_principal;

ARCHITECTURE memoria_principal_arq OF memoria_principal IS

	TYPE memoria IS ARRAY(0 to 4) OF std_logic_vector(7 DOWNTO 0); -- tipo I e tipo R
	SIGNAL memoria_instrucao : memoria := ("00011000", -- OP = ADD rs = 01 rt = 10 rd = 00
													  "01110110", -- OP = SUB  rs = 11 rt = 01 rd = 10
													  "10110100", -- OP = BEQ  rs = 11 rt = 01 rd = 00
													  "00001000", -- END = 0000 0004
													  "11000000" -- OP = JMP	 end = 0000 00
													 );

BEGIN 
	
	Instruction <= memoria_instrucao((to_integer(unsigned(ReadAddress))));

END memoria_principal_arq;