USE work.full_adder;

ENTITY ripple_carry IS
	PORT (
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
		overflow: OUT BIT
	);
END ENTITY;
	
ARCHITECTURE ripple_carry_arch OF ripple_carry IS
	SIGNAL 		cout1: BIT;
	SIGNAL		cout2: BIT;
	SIGNAL		cout3: BIT;
	
	component full_adder is port(
      x: IN BIT;
		y: IN BIT;
		cin: IN BIT;
			
		s: OUT BIT;
		cout: OUT BIT);
   end component;
	
BEGIN
	SomadorOutput1: full_adder PORT MAP(x1, y1, '0', S1, cout1);
	SomadorOutput2: full_adder PORT MAP(x2, y2, cout1, S2, cout2);
	SomadorOutput3: full_adder PORT MAP(x3, y3, cout2, S3, cout3);
	SomadorOutput4: full_adder PORT MAP(x4, y4, cout3, S4, overflow);
END;