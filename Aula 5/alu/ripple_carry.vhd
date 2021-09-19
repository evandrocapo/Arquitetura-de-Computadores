USE work.full_adder;

ENTITY ripple_carry IS
	PORT (
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
		overflow: OUT BIT
	);
END ENTITY;
	
ARCHITECTURE ripple_carry_arch OF ripple_carry IS
	SIGNAL 		cout1: BIT;
	SIGNAL		cout2: BIT;
	SIGNAL		cout3: BIT;
	SIGNAL		cout4: BIT;
	SIGNAL		cout5: BIT;
	SIGNAL		cout6: BIT;
	SIGNAL		cout7: BIT;
	
	SIGNAL 		yt1: BIT;
	SIGNAL		yt2: BIT;
	SIGNAL		yt3: BIT;
	SIGNAL		yt4: BIT;
	SIGNAL		yt5: BIT;
	SIGNAL		yt6: BIT;
	SIGNAL		yt7: BIT;
	SIGNAL		yt8: BIT;
	
	component full_adder is port(
      x: IN BIT;
		y: IN BIT;
		cin: IN BIT;
			
		s: OUT BIT;
		cout: OUT BIT);
   end component;
	
BEGIN
	yt1 <= ( t XOR y1 );
	yt2 <= ( t XOR y2 );
	yt3 <= ( t XOR y3 );
	yt4 <= ( t XOR y4 );
	yt5 <= ( t XOR y5 );
	yt6 <= ( t XOR y6 );
	yt7 <= ( t XOR y7 );
	yt8 <= ( t XOR y8 );

	SomadorOutput1: full_adder PORT MAP(x1, yt1, t, S1, cout1);
	SomadorOutput2: full_adder PORT MAP(x2, yt2, cout1, S2, cout2);
	SomadorOutput3: full_adder PORT MAP(x3, yt3, cout2, S3, cout3);
	SomadorOutput4: full_adder PORT MAP(x4, yt4, cout3, S4, cout4);
	SomadorOutput5: full_adder PORT MAP(x5, yt5, cout4, S5, cout5);
	SomadorOutput6: full_adder PORT MAP(x6, yt6, cout5, S6, cout6);
	SomadorOutput7: full_adder PORT MAP(x7, yt7, cout6, S7, cout7);
	SomadorOutput8: full_adder PORT MAP(x8, yt8, cout7, S8, overflow);
END;