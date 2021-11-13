LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all ;
USE ieee.numeric_std.all ;

ENTITY banco_de_registradores IS
PORT	(
		clk	: IN BIT;
		RegWrite : IN STD_LOGIC;
		ReadRegister1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		ReadRegister2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		WriteRegister : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		WriteData : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		ReadData1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		ReadData2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END banco_de_registradores;

ARCHITECTURE banco_de_registradores_arq OF banco_de_registradores IS 

	TYPE registrador IS ARRAY(0 to 3) OF 
		STD_LOGIC_VECTOR(7 DOWNTO 0);

	signal Registradores : registrador := ("00000000", -- $R1
														"00000001", -- $R2
														"00000010", -- $R3
														"00000011" -- $R4
														);
BEGIN
 PROCESS(RegWrite, Clk)
 BEGIN 
	IF (RegWrite = '1') AND (clk'EVENT and clk='0') THEN
		Registradores(TO_INTEGER(UNSIGNED(WriteRegister))) <= WriteData;
	END IF;
END PROCESS;
	
	ReadData1 <= Registradores(TO_INTEGER(UNSIGNED(ReadRegister1)));
	ReadData2 <= Registradores(TO_INTEGER(UNSIGNED(ReadRegister2)));

END banco_de_registradores_arq;