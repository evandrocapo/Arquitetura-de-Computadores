LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all ;
use ieee.numeric_std.all ;

ENTITY memoria_principal IS PORT
	(
		ReadAddress : in STD_LOGIC_VECTOR (15 downto 0);
		Instruction : out STD_LOGIC_VECTOR (15 downto 0)
		
	);
END memoria_principal;

ARCHITECTURE memoria_principal_arq OF memoria_principal IS

	type memoria is array(0 to 254) of std_logic_vector(15 downto 0); -- tipo I e tipo R
	signal memoria_instrucao : memoria := ("00 11 10 01 0000 0000", -- OP = ADD rs = 11 rt = 10 rd = 01
													  "01 11 01 10 0000 0000", -- OP = SUB  rs = 11 rt = 01 rd = 10
													  "10 11 01 10 0000 0000", -- OP = BEQ  rs = 11 rt = 01 rd = 00 end = 0000 0000
													  "11 0000 00 0000 0000", -- OP = JMP	 end = 0000 00
													 );

BEGIN 
	
	Instruction <= memoria_instrucao((to_integer(unsigned(ReadAddress))));

END memoria_principal_arq;