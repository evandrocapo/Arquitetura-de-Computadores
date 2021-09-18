ENTITY full_adder IS
	PORT (
		x: IN BIT;
		y: IN BIT;
		cin: IN BIT;
		
		s: OUT BIT;
		cout: OUT BIT
	);
END ENTITY;
	
ARCHITECTURE full_adder_arch OF full_adder IS
BEGIN
	s <= (x XOR y) XOR cin;
	cout <= ((x XOR y) AND cin) OR (x AND y);
END;