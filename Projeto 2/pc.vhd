LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY pc IS
	PORT (
		pcIn   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		pcOut  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END pc;

ARCHITECTURE pc_arq OF pc IS
BEGIN
	pcOut <= pcIn;
END pc_arq;