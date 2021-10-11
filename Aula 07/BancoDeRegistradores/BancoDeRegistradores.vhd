USE work.registradores;

ENTITY BancoDeRegistradores IS
	PORT (
		reg1: IN BIT_VECTOR (1 DOWNTO 0);        
		reg2: IN BIT_VECTOR (1 DOWNTO 0);
		regWrite: IN BIT_VECTOR (1 DOWNTO 0);
		dataIn: IN BIT_VECTOR (7 DOWNTO 0);
		regWriteCond: IN BIT;
		dataOut1: OUT BIT_VECTOR (7 DOWNTO 0);
		dataOut2: OUT BIT_VECTOR (7 DOWNTO 0)
	);
END ENTITY;


ARCHITECTURE BancoDeRegistradores_arch OF BancoDeRegistradores IS

	component registradores is port(
		dataIn: IN BIT_VECTOR(7 downto 0);
		regWrite: IN BIT;
		dataOut: OUT BIT_VECTOR(7 downto 0)
	);
   end component;
	
	SIGNAL		reg1_data: BIT_VECTOR(7 downto 0);
	SIGNAL		reg2_data: BIT_VECTOR(7 downto 0);
	SIGNAL		reg3_data: BIT_VECTOR(7 downto 0);
	SIGNAL		reg4_data: BIT_VECTOR(7 downto 0);
	SIGNAL		reg1_writeCond: BIT;
	SIGNAL		reg2_writeCond: BIT;
	SIGNAL		reg3_writeCond: BIT;
	SIGNAL		reg4_writeCond: BIT;

BEGIN
	PROCESS(reg1, reg2, regWrite, regWriteCond)
	BEGIN
		IF reg1 = "00" THEN
		  dataOut1 <= reg1_data;
		ELSIF reg1 = "01" THEN
		  dataOut1 <= reg2_data;
		ELSIF reg1 = "10" THEN
		  dataOut1 <= reg3_data;
		ELSIF reg1 = "11" THEN
		  dataOut1 <= reg4_data;
		END IF;
		
		IF reg2 = "00" THEN
		  dataOut2 <= reg1_data;
		ELSIF reg2 = "01" THEN
		  dataOut2 <= reg2_data;
		ELSIF reg2 = "10" THEN
		  dataOut2 <= reg3_data;
		ELSIF reg2 = "11" THEN
		  dataOut2 <= reg4_data;
		END IF;
		
		IF regWrite = "00" and regWriteCond = '1' THEN
		  reg1_writeCond <= '1';
		  reg2_writeCond <= '0';
		  reg3_writeCond <= '0';
		  reg4_writeCond <= '0';
		ELSIF regWrite = "01" and regWriteCond = '1' THEN
		  reg1_writeCond <= '0';
		  reg2_writeCond <= '1';
		  reg3_writeCond <= '0';
		  reg4_writeCond <= '0';
		ELSIF regWrite = "10" and regWriteCond = '1' THEN
		  reg1_writeCond <= '0';
		  reg2_writeCond <= '0';
		  reg3_writeCond <= '1';
		  reg4_writeCond <= '0';
		ELSIF regWrite = "11" and regWriteCond = '1' THEN
		  reg1_writeCond <= '0';
		  reg2_writeCond <= '0';
		  reg3_writeCond <= '0';
		  reg4_writeCond <= '1';
		END IF;
	END PROCESS;

	registrador1: registradores PORT MAP(dataIn, reg1_writeCond, reg1_data);
	registrador2: registradores PORT MAP(dataIn, reg2_writeCond, reg2_data);
	registrador3: registradores PORT MAP(dataIn, reg3_writeCond, reg3_data);
	registrador4: registradores PORT MAP(dataIn, reg4_writeCond, reg4_data);
	
END ARCHITECTURE;