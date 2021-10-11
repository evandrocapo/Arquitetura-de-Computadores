ENTITY registradores IS
	PORT (
		dataIn: IN BIT_VECTOR(7 downto 0);
		regWrite: IN BIT;
		dataOut: OUT BIT_VECTOR(7 downto 0)
	);
END ENTITY;
	
ARCHITECTURE registradores_arch OF registradores IS
	SIGNAL	data: BIT_VECTOR(7 downto 0);

BEGIN
process(regWrite)
	begin
		if regWrite = '1' then
			data <= dataIn;
		end if;
	end process;
	
	dataOut <= data;
END;