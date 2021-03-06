USE work.ripple_carry;

ENTITY ripple_carry_tb IS
END ENTITY;	

ARCHITECTURE ripple_carry_tb_arch OF ripple_carry_tb IS
	SIGNAL x1,x2,x3,x4: BIT;
	SIGNAL y1,y2,y3,y4: BIT;
	SIGNAL s1,s2,s3,s4: BIT;
	SIGNAL overflow: BIT;
	
	component ripple_carry is port(
      x1: IN BIT;
		x2: IN BIT;
		x3: IN BIT;
		x4: IN BIT;
		y1: IN BIT;
		y2: IN BIT;
		y3: IN BIT;
		y4: IN BIT;
		s1: OUT BIT;
		s2: OUT BIT;
		s3: OUT BIT;
		s4: OUT BIT;
		overflow: OUT BIT);
   end component;
BEGIN
	RippleCarryOutput: ripple_carry PORT MAP(x1,x2,x3,x4,y1,y2,y3,y4,s1,s2,s3,s4,overflow);
	
	x1 <= '1' AFTER 0ns, '0' AFTER 10ns, '0' AFTER 20ns;
	x2 <= '1' AFTER 0ns, '0' AFTER 10ns, '0' AFTER 20ns;
	x3 <= '1' AFTER 0ns, '0' AFTER 10ns, '0' AFTER 20ns;
	x4 <= '1' AFTER 0ns, '0' AFTER 10ns, '0' AFTER 20ns;
	
	y1 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns;
	y2 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns;
	y3 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns;
	y4 <= '1' AFTER 0ns, '1' AFTER 10ns, '1' AFTER 20ns;

END ARCHITECTURE;