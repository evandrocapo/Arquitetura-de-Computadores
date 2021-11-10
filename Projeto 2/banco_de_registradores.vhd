LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all ;
USE ieee.numeric_std.all ;

ENTITY banco_de_registradores IS PORT
	(
		RegWrite : in std_logic;
		ReadRegister1 : in std_logic_vector(1 downto 0);
		ReadRegister2 : in std_logic_vector(1 downto 0);
		WriteData : in std_logic_vector(7 downto 0);
		WriteRegister : in std_logic_vector(1 downto 0);
		ReadData1 : out std_logic_vector(7 downto 0);
		ReadData2 : out std_logic_vector(7 downto 0)
	);

END banco_de_registradores;

ARCHITECTURE banco_de_registradores_arq OF banco_de_registradores IS 

	type registrador is array(0 to 3) of 
		std_logic_vector(7 downto 0);

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