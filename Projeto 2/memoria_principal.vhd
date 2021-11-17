LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
use ieee.numeric_std.all;

ENTITY memoria_principal IS PORT
	(
		ReadAddress : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		Instruction : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		AddressBranch : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END memoria_principal;

ARCHITECTURE memoria_principal_arq OF memoria_principal IS

	TYPE memoria IS ARRAY(0 to 8) OF std_logic_vector(7 DOWNTO 0); -- tipo I e tipo R
	SIGNAL memoria_instrucao : memoria := ("00011000", -- OP = ADD rs = 01 rt = 10 rd = 00         
													  "01001100", -- OP = SUB  rs = 00 rt = 11 rd = 00         
													  "11000100", -- OP = JMP	 end = 000100 ( endereço 4 )    
													  "01001100", -- OP = SUB  rs = 00 rt = 11 rd = 00			  
													  "00011000", -- OP = ADD rs = 01 rt = 10 rd = 00         
													  "10001100", -- OP = BEQ  rs = 00 rt = 11 rd = 00 		 
													  "00000000", -- END = 0000 0000             
													  "01001100",
													  "00000000" -- FIM DO PROGRAMA
													 );

--	TYPE memoria IS ARRAY(0 to 9) OF std_logic_vector(7 DOWNTO 0); -- tipo I e tipo R
--	SIGNAL memoria_instrucao : memoria := ("00011000", -- OP = ADD rs = 01 rt = 10 rd = 00         
--													  "01001100", -- OP = SUB  rs = 00 rt = 11 rd = 00         
--													  "11000100", -- OP = JMP	 end = 000100 ( endereço 4 )    
--													  "01001100", -- OP = SUB  rs = 00 rt = 11 rd = 00			  
--													  "00011100", -- OP = ADD rs = 01 rt = 11 rd = 00         
--													  "10001100", -- OP = BEQ  rs = 00 rt = 11 rd = 00 		 
--													  "00000000", -- END = 0000 0000                     
--													  "01001100", -- OP = SUB  rs = 00 rt = 11 rd = 00        
--													  "01000100", -- OP = SUB  rs = 00 rt = 01 rd = 00        
--													  "00000000" -- FIM DO PROGRAMA
--													 );

BEGIN 
	
	Instruction <= memoria_instrucao((to_integer(unsigned(ReadAddress))));
	AddressBranch <= memoria_instrucao((to_integer(unsigned(ReadAddress)) + 1));

END memoria_principal_arq;