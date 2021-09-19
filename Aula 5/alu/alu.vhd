USE work.ripple_carry;

ENTITY alu IS
	PORT (op: IN BIT_VECTOR (1 DOWNTO 0);        
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
			overflow: OUT BIT
	);
END ENTITY;


ARCHITECTURE alu_arch OF alu IS

	component ripple_carry is port(
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
		t: IN BIT;
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
	
	SIGNAL 		t: BIT;
	SIGNAL 		yt1: BIT;
	SIGNAL		yt2: BIT;
	SIGNAL		yt3: BIT;
	SIGNAL		yt4: BIT;
	SIGNAL		yt5: BIT;
	SIGNAL		yt6: BIT;
	SIGNAL		yt7: BIT;

BEGIN
	PROCESS(op)
	BEGIN
		IF op = "10" THEN
		  t <= '0';
		ELSIF op = "11" THEN
		  t <= '1';
		END IF;
	END PROCESS;
	
	ripple: ripple_carry PORT MAP(x1, x2, x3, x4, x5, x6, x7, x8, y1, y2, y3, y4, y5, y6, y7, y8, t, s1, s2, s3, s4, s5, s6, s7, s8, overflow);
END ARCHITECTURE;