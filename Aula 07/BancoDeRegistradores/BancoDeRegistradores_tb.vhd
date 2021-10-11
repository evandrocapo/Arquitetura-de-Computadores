USE work.BancoDeRegistradores;

ENTITY BancoDeRegistradores_tb IS
END ENTITY;	

ARCHITECTURE BancoDeRegistradores_tb_arch OF BancoDeRegistradores_tb IS
	SIGNAL reg1, reg2, regWrite: BIT_VECTOR(1 DOWNTO 0);
	SIGNAL dataIn: BIT_VECTOR (7 DOWNTO 0);
	SIGNAL regWriteCond: BIT;
	SIGNAL dataOut1: BIT_VECTOR (7 DOWNTO 0);
	SIGNAL dataOut2: BIT_VECTOR (7 DOWNTO 0);
	
	component BancoDeRegistradores is port (
		reg1: IN BIT_VECTOR (1 DOWNTO 0);        
		reg2: IN BIT_VECTOR (1 DOWNTO 0);
		regWrite: IN BIT_VECTOR (1 DOWNTO 0);
		dataIn: IN BIT_VECTOR (7 DOWNTO 0);
		regWriteCond: IN BIT;
		dataOut1: OUT BIT_VECTOR (7 DOWNTO 0);
		dataOut2: OUT BIT_VECTOR (7 DOWNTO 0)
	);
   end component;
	
BEGIN
	BancoDeRegistradores_function: BancoDeRegistradores PORT MAP(reg1,reg2,regWrite,dataIn,regWriteCond,dataOut1,dataOut2);
	
	reg1 <= "00" AFTER 0ns, "00" AFTER 10ns, "00" AFTER 20ns, "00" AFTER 30ns, "00" AFTER 40ns;
	
	reg2 <= "01" AFTER 0ns, "01" AFTER 10ns, "01" AFTER 20ns, "01" AFTER 30ns, "01" AFTER 40ns;
	
	regWrite <= "00" AFTER 0ns, "01" AFTER 10ns, "10" AFTER 20ns, "11" AFTER 30ns, "11" AFTER 40ns;
	
	dataIn <= "00000001" AFTER 0ns, "00000010" AFTER 10ns, "00000000" AFTER 20ns, "00000000" AFTER 30ns, "00000000" AFTER 40ns;
	
	regWriteCond <= '1' AFTER 0ns, '1' AFTER 10ns, '0' AFTER 20ns, '0' AFTER 30ns, '0' AFTER 40ns;

END ARCHITECTURE;