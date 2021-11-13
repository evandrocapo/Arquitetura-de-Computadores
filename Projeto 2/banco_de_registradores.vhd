LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all ;
USE ieee.numeric_std.all ;

ENTITY banco_de_registradores IS
PORT	(
		RegWrite : IN std_logic;
		ReadRegister1 : IN std_logic_vector(1 DOWNTO 0);
		ReadRegister2 : IN std_logic_vector(1 DOWNTO 0);
		WriteData : IN std_logic_vector(7 DOWNTO 0);
		WriteRegister : IN std_logic_vector(1 DOWNTO 0);
		ReadData1 : OUT std_logic_vector(7 DOWNTO 0);
		ReadData2 : OUT std_logic_vector(7 DOWNTO 0)
	)
END banco_de_registradores;

ARCHITECTURE banco_de_registradores_arq OF banco_de_registradores IS 

	TYPE registrador IS ARRAY(0 to 3) OF 
		std_logic_vector(7 DOWNTO 0);

	signal Registradores : registrador := ("00000000", -- $R1
														"00000000", -- $R2
														"00000000", -- $R3
														"00000000" -- $R4
														);
BEGIN

 PROCESS(RegWrite)
 BEGIN 
	IF (RegWrite = '1') THEN
		Registradores(to_integer(unsigned(WriteRegister))) <= WriteData;
	END IF;
END PROCESS;
	
	ReadData1 <= Registradores(to_integer(unsigned(ReadRegister1)));
	ReadData2 <= Registradores(to_integer(unsigned(ReadRegister2)));

END banco_de_registradores_arq;