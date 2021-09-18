ENTITY full_adder_tb IS
END ENTITY;	

ARCHITECTURE full_adder_tb_arch OF full_adder_tb IS
	COMPONENT full_adder
		PORT(
			x: IN BIT;
			y: IN BIT;
			cin: IN BIT;
			
			s: OUT BIT;
			cout: OUT BIT
		);
	END COMPONENT;
	
	SIGNAL x1,x2,cin1: BIT;
	SIGNAL cout1, S : BIT;
BEGIN
	f0: full_adder PORT MAP (x1,x2,cin1,S,cout1);
	
	PROCESS
	BEGIN
		x1 <= '0'; x2 <= '0'; cin1 <= '0';
		WAIT FOR 10ns;
		x1 <= '0'; x2 <= '0'; cin1 <= '1';
		WAIT FOR 10ns;
		x1 <= '0'; x2 <= '1'; cin1 <= '0';
		WAIT FOR 10ns;
		x1 <= '0'; x2 <= '1'; cin1 <= '1';
		WAIT FOR 10ns;
		
		x1 <= '1'; x2 <= '0'; cin1 <= '0';
		WAIT FOR 10ns;
		x1 <= '1'; x2 <= '0'; cin1 <= '1';
		WAIT FOR 10ns;
		x1 <= '1'; x2 <= '1'; cin1 <= '0';
		WAIT FOR 10ns;
		x1 <= '1'; x2 <= '1'; cin1 <= '1';
		WAIT FOR 10ns;
		WAIT;
		
	END PROCESS;
END ARCHITECTURE;