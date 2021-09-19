USE work.alu;

ENTITY alu_tb IS
END ENTITY;	

ARCHITECTURE alu_tb_arch OF alu_tb IS
	SIGNAL op: BIT_VECTOR (1 DOWNTO 0);
	SIGNAL x1,x2,x3,x4,x5,x6,x7,x8: BIT;
	SIGNAL y1,y2,y3,y4,y5,y6,y7,y8: BIT;
	SIGNAL s1,s2,s3,s4,s5,s6,s7,s8: BIT;
	SIGNAL overflow: BIT;
	
	component alu is port(
			op: IN BIT_VECTOR (1 DOWNTO 0);        
	      x1: IN BIT;
			x2: IN BIT;
			x3: IN BIT;
			x4: IN BIT;
			x5: IN BIT;
			x6: IN BIT;
			x7: IN BIT;
			x8: IN BIT;
			y1: IN BIT;
			y2: IN BIT;
			y3: IN BIT;
			y4: IN BIT;
			y5: IN BIT;
			y6: IN BIT;
			y7: IN BIT;
			y8: IN BIT;
			s1: OUT BIT;
			s2: OUT BIT;
			s3: OUT BIT;
			s4: OUT BIT;
			s5: OUT BIT;
			s6: OUT BIT;
			s7: OUT BIT;
			s8: OUT BIT;
			overflow: OUT BIT);
   end component;
BEGIN
	aluOutput: alu PORT MAP(op,x1,x2,x3,x4,x5,x6,x7,x8,y1,y2,y3,y4,y5,y6,y7,y8,s1,s2,s3,s4,s5,s6,s7,s8,overflow);
	
	op <= "10" AFTER 0ns, "10" AFTER 10ns, "11" AFTER 20ns, "11" AFTER 30ns, "11" AFTER 40ns;
	
	x1 <= '1' AFTER 0ns, '0' AFTER 10ns, '1' AFTER 20ns, '0' AFTER 30ns;
	x2 <= '1' AFTER 0ns, '0' AFTER 10ns, '1' AFTER 20ns, '0' AFTER 30ns;
	x3 <= '1' AFTER 0ns, '0' AFTER 10ns, '1' AFTER 20ns, '0' AFTER 30ns;
	x4 <= '1' AFTER 0ns, '0' AFTER 10ns, '1' AFTER 20ns, '0' AFTER 30ns;
	x5 <= '1' AFTER 0ns, '0' AFTER 10ns, '1' AFTER 20ns, '0' AFTER 30ns;
	x6 <= '1' AFTER 0ns, '0' AFTER 10ns, '1' AFTER 20ns, '0' AFTER 30ns;
	x7 <= '1' AFTER 0ns, '0' AFTER 10ns, '1' AFTER 20ns, '0' AFTER 30ns;
	x8 <= '1' AFTER 0ns, '0' AFTER 10ns, '1' AFTER 20ns, '0' AFTER 30ns;
	
	y1 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns, '1' AFTER 30ns;
	y2 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns, '1' AFTER 30ns;
	y3 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns, '1' AFTER 30ns;
	y4 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns, '1' AFTER 30ns;
	y5 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns, '1' AFTER 30ns;
	y6 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns, '1' AFTER 30ns;
	y7 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns, '1' AFTER 30ns;
	y8 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns, '1' AFTER 30ns;

END ARCHITECTURE;