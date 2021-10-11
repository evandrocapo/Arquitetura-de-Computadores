-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "10/11/2021 18:47:41"

-- 
-- Device: Altera EP4CE6E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	BancoDeRegistradores IS
    PORT (
	reg1 : IN STD.STANDARD.bit_vector(1 DOWNTO 0);
	reg2 : IN STD.STANDARD.bit_vector(1 DOWNTO 0);
	regWrite : IN STD.STANDARD.bit_vector(1 DOWNTO 0);
	dataIn : IN STD.STANDARD.bit_vector(7 DOWNTO 0);
	regWriteCond : IN std_logic;
	dataOut1 : OUT STD.STANDARD.bit_vector(7 DOWNTO 0);
	dataOut2 : OUT STD.STANDARD.bit_vector(7 DOWNTO 0)
	);
END BancoDeRegistradores;

-- Design Ports Information
-- dataOut1[0]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut1[1]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut1[2]	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut1[3]	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut1[4]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut1[5]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut1[6]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut1[7]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut2[0]	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut2[1]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut2[2]	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut2[3]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut2[4]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut2[5]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut2[6]	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut2[7]	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[1]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg1[0]	=>  Location: PIN_137,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[1]	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg2[0]	=>  Location: PIN_38,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[0]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[1]	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[2]	=>  Location: PIN_138,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[3]	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[4]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[5]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[6]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[7]	=>  Location: PIN_73,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regWriteCond	=>  Location: PIN_104,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regWrite[0]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regWrite[1]	=>  Location: PIN_70,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF BancoDeRegistradores IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reg1 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_reg2 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_regWrite : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_dataIn : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_regWriteCond : std_logic;
SIGNAL ww_dataOut1 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_dataOut2 : std_logic_vector(7 DOWNTO 0);
SIGNAL \reg4_writeCond~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reg1_writeCond~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reg3_writeCond~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reg2_writeCond~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dataOut1[0]~output_o\ : std_logic;
SIGNAL \dataOut1[1]~output_o\ : std_logic;
SIGNAL \dataOut1[2]~output_o\ : std_logic;
SIGNAL \dataOut1[3]~output_o\ : std_logic;
SIGNAL \dataOut1[4]~output_o\ : std_logic;
SIGNAL \dataOut1[5]~output_o\ : std_logic;
SIGNAL \dataOut1[6]~output_o\ : std_logic;
SIGNAL \dataOut1[7]~output_o\ : std_logic;
SIGNAL \dataOut2[0]~output_o\ : std_logic;
SIGNAL \dataOut2[1]~output_o\ : std_logic;
SIGNAL \dataOut2[2]~output_o\ : std_logic;
SIGNAL \dataOut2[3]~output_o\ : std_logic;
SIGNAL \dataOut2[4]~output_o\ : std_logic;
SIGNAL \dataOut2[5]~output_o\ : std_logic;
SIGNAL \dataOut2[6]~output_o\ : std_logic;
SIGNAL \dataOut2[7]~output_o\ : std_logic;
SIGNAL \regWrite[0]~input_o\ : std_logic;
SIGNAL \regWrite[1]~input_o\ : std_logic;
SIGNAL \regWriteCond~input_o\ : std_logic;
SIGNAL \comb~4_combout\ : std_logic;
SIGNAL \comb~5_combout\ : std_logic;
SIGNAL \reg4_writeCond~combout\ : std_logic;
SIGNAL \reg4_writeCond~clkctrl_outclk\ : std_logic;
SIGNAL \dataIn[0]~input_o\ : std_logic;
SIGNAL \reg1[1]~input_o\ : std_logic;
SIGNAL \reg1[0]~input_o\ : std_logic;
SIGNAL \comb~2_combout\ : std_logic;
SIGNAL \comb~1_combout\ : std_logic;
SIGNAL \reg2_writeCond~combout\ : std_logic;
SIGNAL \reg2_writeCond~clkctrl_outclk\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \comb~3_combout\ : std_logic;
SIGNAL \reg1_writeCond~combout\ : std_logic;
SIGNAL \reg1_writeCond~clkctrl_outclk\ : std_logic;
SIGNAL \dataOut1[0]~0_combout\ : std_logic;
SIGNAL \comb~0_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \reg3_writeCond~combout\ : std_logic;
SIGNAL \reg3_writeCond~clkctrl_outclk\ : std_logic;
SIGNAL \dataOut1[0]~1_combout\ : std_logic;
SIGNAL \dataIn[1]~input_o\ : std_logic;
SIGNAL \dataOut1[1]~2_combout\ : std_logic;
SIGNAL \dataOut1[1]~3_combout\ : std_logic;
SIGNAL \dataIn[2]~input_o\ : std_logic;
SIGNAL \dataOut1[2]~4_combout\ : std_logic;
SIGNAL \dataOut1[2]~5_combout\ : std_logic;
SIGNAL \dataIn[3]~input_o\ : std_logic;
SIGNAL \dataOut1[3]~6_combout\ : std_logic;
SIGNAL \dataOut1[3]~7_combout\ : std_logic;
SIGNAL \dataIn[4]~input_o\ : std_logic;
SIGNAL \dataOut1[4]~8_combout\ : std_logic;
SIGNAL \dataOut1[4]~9_combout\ : std_logic;
SIGNAL \dataIn[5]~input_o\ : std_logic;
SIGNAL \dataOut1[5]~10_combout\ : std_logic;
SIGNAL \dataOut1[5]~11_combout\ : std_logic;
SIGNAL \dataIn[6]~input_o\ : std_logic;
SIGNAL \dataOut1[6]~12_combout\ : std_logic;
SIGNAL \dataOut1[6]~13_combout\ : std_logic;
SIGNAL \dataIn[7]~input_o\ : std_logic;
SIGNAL \dataOut1[7]~14_combout\ : std_logic;
SIGNAL \dataOut1[7]~15_combout\ : std_logic;
SIGNAL \reg2[1]~input_o\ : std_logic;
SIGNAL \reg2[0]~input_o\ : std_logic;
SIGNAL \dataOut2[0]~0_combout\ : std_logic;
SIGNAL \dataOut2[0]~1_combout\ : std_logic;
SIGNAL \dataOut2[1]~2_combout\ : std_logic;
SIGNAL \dataOut2[1]~3_combout\ : std_logic;
SIGNAL \dataOut2[2]~4_combout\ : std_logic;
SIGNAL \dataOut2[2]~5_combout\ : std_logic;
SIGNAL \dataOut2[3]~6_combout\ : std_logic;
SIGNAL \dataOut2[3]~7_combout\ : std_logic;
SIGNAL \dataOut2[4]~8_combout\ : std_logic;
SIGNAL \dataOut2[4]~9_combout\ : std_logic;
SIGNAL \dataOut2[5]~10_combout\ : std_logic;
SIGNAL \dataOut2[5]~11_combout\ : std_logic;
SIGNAL \dataOut2[6]~12_combout\ : std_logic;
SIGNAL \dataOut2[6]~13_combout\ : std_logic;
SIGNAL \dataOut2[7]~14_combout\ : std_logic;
SIGNAL \dataOut2[7]~15_combout\ : std_logic;
SIGNAL \registrador1|data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \registrador3|data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \registrador2|data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \registrador4|data\ : std_logic_vector(7 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_reg1 <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(reg1);
ww_reg2 <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(reg2);
ww_regWrite <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(regWrite);
ww_dataIn <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(dataIn);
ww_regWriteCond <= regWriteCond;
dataOut1 <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_dataOut1);
dataOut2 <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_dataOut2);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reg4_writeCond~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reg4_writeCond~combout\);

\reg1_writeCond~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reg1_writeCond~combout\);

\reg3_writeCond~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reg3_writeCond~combout\);

\reg2_writeCond~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reg2_writeCond~combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X18_Y0_N16
\dataOut1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut1[0]~1_combout\,
	devoe => ww_devoe,
	o => \dataOut1[0]~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\dataOut1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut1[1]~3_combout\,
	devoe => ww_devoe,
	o => \dataOut1[1]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\dataOut1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut1[2]~5_combout\,
	devoe => ww_devoe,
	o => \dataOut1[2]~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\dataOut1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut1[3]~7_combout\,
	devoe => ww_devoe,
	o => \dataOut1[3]~output_o\);

-- Location: IOOBUF_X21_Y0_N9
\dataOut1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut1[4]~9_combout\,
	devoe => ww_devoe,
	o => \dataOut1[4]~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\dataOut1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut1[5]~11_combout\,
	devoe => ww_devoe,
	o => \dataOut1[5]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\dataOut1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut1[6]~13_combout\,
	devoe => ww_devoe,
	o => \dataOut1[6]~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\dataOut1[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut1[7]~15_combout\,
	devoe => ww_devoe,
	o => \dataOut1[7]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\dataOut2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut2[0]~1_combout\,
	devoe => ww_devoe,
	o => \dataOut2[0]~output_o\);

-- Location: IOOBUF_X28_Y0_N2
\dataOut2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut2[1]~3_combout\,
	devoe => ww_devoe,
	o => \dataOut2[1]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\dataOut2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut2[2]~5_combout\,
	devoe => ww_devoe,
	o => \dataOut2[2]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\dataOut2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut2[3]~7_combout\,
	devoe => ww_devoe,
	o => \dataOut2[3]~output_o\);

-- Location: IOOBUF_X13_Y0_N16
\dataOut2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut2[4]~9_combout\,
	devoe => ww_devoe,
	o => \dataOut2[4]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\dataOut2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut2[5]~11_combout\,
	devoe => ww_devoe,
	o => \dataOut2[5]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\dataOut2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut2[6]~13_combout\,
	devoe => ww_devoe,
	o => \dataOut2[6]~output_o\);

-- Location: IOOBUF_X34_Y4_N16
\dataOut2[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dataOut2[7]~15_combout\,
	devoe => ww_devoe,
	o => \dataOut2[7]~output_o\);

-- Location: IOIBUF_X34_Y10_N8
\regWrite[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regWrite(0),
	o => \regWrite[0]~input_o\);

-- Location: IOIBUF_X32_Y0_N22
\regWrite[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regWrite(1),
	o => \regWrite[1]~input_o\);

-- Location: IOIBUF_X34_Y18_N1
\regWriteCond~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regWriteCond,
	o => \regWriteCond~input_o\);

-- Location: LCCOMB_X29_Y12_N12
\comb~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~4_combout\ = (\regWriteCond~input_o\ & ((!\regWrite[1]~input_o\) # (!\regWrite[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regWrite[0]~input_o\,
	datab => \regWrite[1]~input_o\,
	datad => \regWriteCond~input_o\,
	combout => \comb~4_combout\);

-- Location: LCCOMB_X29_Y12_N14
\comb~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~5_combout\ = (\regWrite[0]~input_o\ & (\regWrite[1]~input_o\ & \regWriteCond~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regWrite[0]~input_o\,
	datab => \regWrite[1]~input_o\,
	datad => \regWriteCond~input_o\,
	combout => \comb~5_combout\);

-- Location: LCCOMB_X33_Y12_N10
reg4_writeCond : cycloneive_lcell_comb
-- Equation(s):
-- \reg4_writeCond~combout\ = (!\comb~4_combout\ & ((\comb~5_combout\) # (\reg4_writeCond~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comb~4_combout\,
	datac => \comb~5_combout\,
	datad => \reg4_writeCond~combout\,
	combout => \reg4_writeCond~combout\);

-- Location: CLKCTRL_G7
\reg4_writeCond~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reg4_writeCond~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reg4_writeCond~clkctrl_outclk\);

-- Location: IOIBUF_X34_Y9_N1
\dataIn[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(0),
	o => \dataIn[0]~input_o\);

-- Location: FF_X9_Y5_N19
\registrador4|data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg4_writeCond~clkctrl_outclk\,
	asdata => \dataIn[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador4|data\(0));

-- Location: IOIBUF_X34_Y7_N8
\reg1[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(1),
	o => \reg1[1]~input_o\);

-- Location: IOIBUF_X7_Y24_N1
\reg1[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg1(0),
	o => \reg1[0]~input_o\);

-- Location: LCCOMB_X29_Y12_N22
\comb~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~2_combout\ = (\regWrite[0]~input_o\ & (!\regWrite[1]~input_o\ & \regWriteCond~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regWrite[0]~input_o\,
	datab => \regWrite[1]~input_o\,
	datad => \regWriteCond~input_o\,
	combout => \comb~2_combout\);

-- Location: LCCOMB_X29_Y12_N28
\comb~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~1_combout\ = (\regWriteCond~input_o\ & ((\regWrite[1]~input_o\) # (!\regWrite[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regWrite[0]~input_o\,
	datab => \regWrite[1]~input_o\,
	datad => \regWriteCond~input_o\,
	combout => \comb~1_combout\);

-- Location: LCCOMB_X33_Y12_N2
reg2_writeCond : cycloneive_lcell_comb
-- Equation(s):
-- \reg2_writeCond~combout\ = (!\comb~1_combout\ & ((\comb~2_combout\) # (\reg2_writeCond~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \comb~2_combout\,
	datac => \comb~1_combout\,
	datad => \reg2_writeCond~combout\,
	combout => \reg2_writeCond~combout\);

-- Location: CLKCTRL_G6
\reg2_writeCond~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reg2_writeCond~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reg2_writeCond~clkctrl_outclk\);

-- Location: FF_X9_Y5_N1
\registrador2|data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg2_writeCond~clkctrl_outclk\,
	asdata => \dataIn[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador2|data\(0));

-- Location: LCCOMB_X29_Y12_N10
\process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~1_combout\ = (!\regWrite[0]~input_o\ & (!\regWrite[1]~input_o\ & \regWriteCond~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regWrite[0]~input_o\,
	datab => \regWrite[1]~input_o\,
	datad => \regWriteCond~input_o\,
	combout => \process_0~1_combout\);

-- Location: LCCOMB_X29_Y12_N16
\comb~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~3_combout\ = ((!\regWrite[0]~input_o\ & !\regWrite[1]~input_o\)) # (!\regWriteCond~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regWrite[0]~input_o\,
	datab => \regWrite[1]~input_o\,
	datad => \regWriteCond~input_o\,
	combout => \comb~3_combout\);

-- Location: LCCOMB_X33_Y12_N4
reg1_writeCond : cycloneive_lcell_comb
-- Equation(s):
-- \reg1_writeCond~combout\ = (\comb~3_combout\ & ((\process_0~1_combout\) # (\reg1_writeCond~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~1_combout\,
	datac => \reg1_writeCond~combout\,
	datad => \comb~3_combout\,
	combout => \reg1_writeCond~combout\);

-- Location: CLKCTRL_G8
\reg1_writeCond~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reg1_writeCond~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reg1_writeCond~clkctrl_outclk\);

-- Location: FF_X8_Y5_N11
\registrador1|data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg1_writeCond~clkctrl_outclk\,
	asdata => \dataIn[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador1|data\(0));

-- Location: LCCOMB_X9_Y5_N0
\dataOut1[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[0]~0_combout\ = (\reg1[1]~input_o\ & (\reg1[0]~input_o\)) # (!\reg1[1]~input_o\ & ((\reg1[0]~input_o\ & (\registrador2|data\(0))) # (!\reg1[0]~input_o\ & ((\registrador1|data\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1[1]~input_o\,
	datab => \reg1[0]~input_o\,
	datac => \registrador2|data\(0),
	datad => \registrador1|data\(0),
	combout => \dataOut1[0]~0_combout\);

-- Location: LCCOMB_X29_Y12_N0
\comb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~0_combout\ = (\regWriteCond~input_o\ & ((\regWrite[0]~input_o\) # (!\regWrite[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regWrite[0]~input_o\,
	datab => \regWrite[1]~input_o\,
	datad => \regWriteCond~input_o\,
	combout => \comb~0_combout\);

-- Location: LCCOMB_X29_Y12_N26
\process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (!\regWrite[0]~input_o\ & (\regWrite[1]~input_o\ & \regWriteCond~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regWrite[0]~input_o\,
	datab => \regWrite[1]~input_o\,
	datad => \regWriteCond~input_o\,
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X33_Y12_N12
reg3_writeCond : cycloneive_lcell_comb
-- Equation(s):
-- \reg3_writeCond~combout\ = (!\comb~0_combout\ & ((\process_0~0_combout\) # (\reg3_writeCond~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comb~0_combout\,
	datab => \process_0~0_combout\,
	datad => \reg3_writeCond~combout\,
	combout => \reg3_writeCond~combout\);

-- Location: CLKCTRL_G5
\reg3_writeCond~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reg3_writeCond~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reg3_writeCond~clkctrl_outclk\);

-- Location: FF_X8_Y5_N25
\registrador3|data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg3_writeCond~clkctrl_outclk\,
	asdata => \dataIn[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador3|data\(0));

-- Location: LCCOMB_X8_Y5_N24
\dataOut1[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[0]~1_combout\ = (\dataOut1[0]~0_combout\ & ((\registrador4|data\(0)) # ((!\reg1[1]~input_o\)))) # (!\dataOut1[0]~0_combout\ & (((\registrador3|data\(0) & \reg1[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador4|data\(0),
	datab => \dataOut1[0]~0_combout\,
	datac => \registrador3|data\(0),
	datad => \reg1[1]~input_o\,
	combout => \dataOut1[0]~1_combout\);

-- Location: IOIBUF_X0_Y7_N1
\dataIn[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(1),
	o => \dataIn[1]~input_o\);

-- Location: FF_X9_Y5_N31
\registrador4|data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg4_writeCond~clkctrl_outclk\,
	asdata => \dataIn[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador4|data\(1));

-- Location: FF_X9_Y5_N29
\registrador2|data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg2_writeCond~clkctrl_outclk\,
	asdata => \dataIn[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador2|data\(1));

-- Location: FF_X8_Y5_N5
\registrador3|data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg3_writeCond~clkctrl_outclk\,
	asdata => \dataIn[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador3|data\(1));

-- Location: FF_X8_Y5_N7
\registrador1|data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg1_writeCond~clkctrl_outclk\,
	asdata => \dataIn[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador1|data\(1));

-- Location: LCCOMB_X8_Y5_N4
\dataOut1[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[1]~2_combout\ = (\reg1[0]~input_o\ & (\reg1[1]~input_o\)) # (!\reg1[0]~input_o\ & ((\reg1[1]~input_o\ & (\registrador3|data\(1))) # (!\reg1[1]~input_o\ & ((\registrador1|data\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1[0]~input_o\,
	datab => \reg1[1]~input_o\,
	datac => \registrador3|data\(1),
	datad => \registrador1|data\(1),
	combout => \dataOut1[1]~2_combout\);

-- Location: LCCOMB_X9_Y5_N28
\dataOut1[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[1]~3_combout\ = (\reg1[0]~input_o\ & ((\dataOut1[1]~2_combout\ & (\registrador4|data\(1))) # (!\dataOut1[1]~2_combout\ & ((\registrador2|data\(1)))))) # (!\reg1[0]~input_o\ & (((\dataOut1[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador4|data\(1),
	datab => \reg1[0]~input_o\,
	datac => \registrador2|data\(1),
	datad => \dataOut1[1]~2_combout\,
	combout => \dataOut1[1]~3_combout\);

-- Location: IOIBUF_X7_Y24_N8
\dataIn[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(2),
	o => \dataIn[2]~input_o\);

-- Location: FF_X9_Y5_N27
\registrador4|data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg4_writeCond~clkctrl_outclk\,
	asdata => \dataIn[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador4|data\(2));

-- Location: FF_X9_Y5_N17
\registrador2|data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg2_writeCond~clkctrl_outclk\,
	asdata => \dataIn[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador2|data\(2));

-- Location: FF_X8_Y5_N3
\registrador1|data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg1_writeCond~clkctrl_outclk\,
	asdata => \dataIn[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador1|data\(2));

-- Location: LCCOMB_X9_Y5_N16
\dataOut1[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[2]~4_combout\ = (\reg1[1]~input_o\ & (\reg1[0]~input_o\)) # (!\reg1[1]~input_o\ & ((\reg1[0]~input_o\ & (\registrador2|data\(2))) # (!\reg1[0]~input_o\ & ((\registrador1|data\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1[1]~input_o\,
	datab => \reg1[0]~input_o\,
	datac => \registrador2|data\(2),
	datad => \registrador1|data\(2),
	combout => \dataOut1[2]~4_combout\);

-- Location: FF_X8_Y5_N17
\registrador3|data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg3_writeCond~clkctrl_outclk\,
	asdata => \dataIn[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador3|data\(2));

-- Location: LCCOMB_X8_Y5_N16
\dataOut1[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[2]~5_combout\ = (\dataOut1[2]~4_combout\ & ((\registrador4|data\(2)) # ((!\reg1[1]~input_o\)))) # (!\dataOut1[2]~4_combout\ & (((\registrador3|data\(2) & \reg1[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador4|data\(2),
	datab => \dataOut1[2]~4_combout\,
	datac => \registrador3|data\(2),
	datad => \reg1[1]~input_o\,
	combout => \dataOut1[2]~5_combout\);

-- Location: IOIBUF_X13_Y0_N1
\dataIn[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(3),
	o => \dataIn[3]~input_o\);

-- Location: FF_X8_Y5_N15
\registrador1|data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg1_writeCond~clkctrl_outclk\,
	asdata => \dataIn[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador1|data\(3));

-- Location: FF_X8_Y5_N21
\registrador3|data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg3_writeCond~clkctrl_outclk\,
	asdata => \dataIn[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador3|data\(3));

-- Location: LCCOMB_X8_Y5_N20
\dataOut1[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[3]~6_combout\ = (\reg1[0]~input_o\ & (((\reg1[1]~input_o\)))) # (!\reg1[0]~input_o\ & ((\reg1[1]~input_o\ & ((\registrador3|data\(3)))) # (!\reg1[1]~input_o\ & (\registrador1|data\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1[0]~input_o\,
	datab => \registrador1|data\(3),
	datac => \registrador3|data\(3),
	datad => \reg1[1]~input_o\,
	combout => \dataOut1[3]~6_combout\);

-- Location: FF_X9_Y5_N15
\registrador4|data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg4_writeCond~clkctrl_outclk\,
	asdata => \dataIn[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador4|data\(3));

-- Location: FF_X9_Y5_N5
\registrador2|data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg2_writeCond~clkctrl_outclk\,
	asdata => \dataIn[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador2|data\(3));

-- Location: LCCOMB_X9_Y5_N4
\dataOut1[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[3]~7_combout\ = (\dataOut1[3]~6_combout\ & ((\registrador4|data\(3)) # ((!\reg1[0]~input_o\)))) # (!\dataOut1[3]~6_combout\ & (((\registrador2|data\(3) & \reg1[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dataOut1[3]~6_combout\,
	datab => \registrador4|data\(3),
	datac => \registrador2|data\(3),
	datad => \reg1[0]~input_o\,
	combout => \dataOut1[3]~7_combout\);

-- Location: IOIBUF_X11_Y24_N15
\dataIn[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(4),
	o => \dataIn[4]~input_o\);

-- Location: FF_X8_Y5_N27
\registrador1|data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg1_writeCond~clkctrl_outclk\,
	asdata => \dataIn[4]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador1|data\(4));

-- Location: FF_X9_Y5_N9
\registrador2|data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg2_writeCond~clkctrl_outclk\,
	asdata => \dataIn[4]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador2|data\(4));

-- Location: LCCOMB_X9_Y5_N8
\dataOut1[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[4]~8_combout\ = (\reg1[0]~input_o\ & (((\registrador2|data\(4)) # (\reg1[1]~input_o\)))) # (!\reg1[0]~input_o\ & (\registrador1|data\(4) & ((!\reg1[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador1|data\(4),
	datab => \reg1[0]~input_o\,
	datac => \registrador2|data\(4),
	datad => \reg1[1]~input_o\,
	combout => \dataOut1[4]~8_combout\);

-- Location: FF_X9_Y5_N11
\registrador4|data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg4_writeCond~clkctrl_outclk\,
	asdata => \dataIn[4]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador4|data\(4));

-- Location: FF_X8_Y5_N1
\registrador3|data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg3_writeCond~clkctrl_outclk\,
	asdata => \dataIn[4]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador3|data\(4));

-- Location: LCCOMB_X8_Y5_N0
\dataOut1[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[4]~9_combout\ = (\dataOut1[4]~8_combout\ & ((\registrador4|data\(4)) # ((!\reg1[1]~input_o\)))) # (!\dataOut1[4]~8_combout\ & (((\registrador3|data\(4) & \reg1[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dataOut1[4]~8_combout\,
	datab => \registrador4|data\(4),
	datac => \registrador3|data\(4),
	datad => \reg1[1]~input_o\,
	combout => \dataOut1[4]~9_combout\);

-- Location: IOIBUF_X5_Y0_N15
\dataIn[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(5),
	o => \dataIn[5]~input_o\);

-- Location: FF_X8_Y5_N31
\registrador1|data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg1_writeCond~clkctrl_outclk\,
	asdata => \dataIn[5]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador1|data\(5));

-- Location: FF_X8_Y5_N13
\registrador3|data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg3_writeCond~clkctrl_outclk\,
	asdata => \dataIn[5]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador3|data\(5));

-- Location: LCCOMB_X8_Y5_N12
\dataOut1[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[5]~10_combout\ = (\reg1[0]~input_o\ & (((\reg1[1]~input_o\)))) # (!\reg1[0]~input_o\ & ((\reg1[1]~input_o\ & ((\registrador3|data\(5)))) # (!\reg1[1]~input_o\ & (\registrador1|data\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1[0]~input_o\,
	datab => \registrador1|data\(5),
	datac => \registrador3|data\(5),
	datad => \reg1[1]~input_o\,
	combout => \dataOut1[5]~10_combout\);

-- Location: FF_X9_Y5_N13
\registrador2|data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg2_writeCond~clkctrl_outclk\,
	asdata => \dataIn[5]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador2|data\(5));

-- Location: FF_X9_Y5_N7
\registrador4|data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg4_writeCond~clkctrl_outclk\,
	asdata => \dataIn[5]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador4|data\(5));

-- Location: LCCOMB_X9_Y5_N12
\dataOut1[5]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[5]~11_combout\ = (\dataOut1[5]~10_combout\ & (((\registrador4|data\(5))) # (!\reg1[0]~input_o\))) # (!\dataOut1[5]~10_combout\ & (\reg1[0]~input_o\ & (\registrador2|data\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dataOut1[5]~10_combout\,
	datab => \reg1[0]~input_o\,
	datac => \registrador2|data\(5),
	datad => \registrador4|data\(5),
	combout => \dataOut1[5]~11_combout\);

-- Location: IOIBUF_X18_Y0_N22
\dataIn[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(6),
	o => \dataIn[6]~input_o\);

-- Location: FF_X9_Y5_N25
\registrador2|data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg2_writeCond~clkctrl_outclk\,
	asdata => \dataIn[6]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador2|data\(6));

-- Location: FF_X8_Y5_N19
\registrador1|data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg1_writeCond~clkctrl_outclk\,
	asdata => \dataIn[6]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador1|data\(6));

-- Location: LCCOMB_X9_Y5_N24
\dataOut1[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[6]~12_combout\ = (\reg1[1]~input_o\ & (\reg1[0]~input_o\)) # (!\reg1[1]~input_o\ & ((\reg1[0]~input_o\ & (\registrador2|data\(6))) # (!\reg1[0]~input_o\ & ((\registrador1|data\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1[1]~input_o\,
	datab => \reg1[0]~input_o\,
	datac => \registrador2|data\(6),
	datad => \registrador1|data\(6),
	combout => \dataOut1[6]~12_combout\);

-- Location: FF_X8_Y5_N9
\registrador3|data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg3_writeCond~clkctrl_outclk\,
	asdata => \dataIn[6]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador3|data\(6));

-- Location: FF_X9_Y5_N3
\registrador4|data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg4_writeCond~clkctrl_outclk\,
	asdata => \dataIn[6]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador4|data\(6));

-- Location: LCCOMB_X8_Y5_N8
\dataOut1[6]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[6]~13_combout\ = (\reg1[1]~input_o\ & ((\dataOut1[6]~12_combout\ & ((\registrador4|data\(6)))) # (!\dataOut1[6]~12_combout\ & (\registrador3|data\(6))))) # (!\reg1[1]~input_o\ & (\dataOut1[6]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1[1]~input_o\,
	datab => \dataOut1[6]~12_combout\,
	datac => \registrador3|data\(6),
	datad => \registrador4|data\(6),
	combout => \dataOut1[6]~13_combout\);

-- Location: IOIBUF_X34_Y2_N22
\dataIn[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(7),
	o => \dataIn[7]~input_o\);

-- Location: FF_X9_Y5_N23
\registrador4|data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg4_writeCond~clkctrl_outclk\,
	asdata => \dataIn[7]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador4|data\(7));

-- Location: FF_X9_Y5_N21
\registrador2|data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg2_writeCond~clkctrl_outclk\,
	asdata => \dataIn[7]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador2|data\(7));

-- Location: FF_X8_Y5_N23
\registrador1|data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg1_writeCond~clkctrl_outclk\,
	asdata => \dataIn[7]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador1|data\(7));

-- Location: FF_X8_Y5_N29
\registrador3|data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \reg3_writeCond~clkctrl_outclk\,
	asdata => \dataIn[7]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \registrador3|data\(7));

-- Location: LCCOMB_X8_Y5_N28
\dataOut1[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[7]~14_combout\ = (\reg1[1]~input_o\ & (((\registrador3|data\(7)) # (\reg1[0]~input_o\)))) # (!\reg1[1]~input_o\ & (\registrador1|data\(7) & ((!\reg1[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador1|data\(7),
	datab => \reg1[1]~input_o\,
	datac => \registrador3|data\(7),
	datad => \reg1[0]~input_o\,
	combout => \dataOut1[7]~14_combout\);

-- Location: LCCOMB_X9_Y5_N20
\dataOut1[7]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut1[7]~15_combout\ = (\reg1[0]~input_o\ & ((\dataOut1[7]~14_combout\ & (\registrador4|data\(7))) # (!\dataOut1[7]~14_combout\ & ((\registrador2|data\(7)))))) # (!\reg1[0]~input_o\ & (((\dataOut1[7]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador4|data\(7),
	datab => \reg1[0]~input_o\,
	datac => \registrador2|data\(7),
	datad => \dataOut1[7]~14_combout\,
	combout => \dataOut1[7]~15_combout\);

-- Location: IOIBUF_X23_Y0_N15
\reg2[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(1),
	o => \reg2[1]~input_o\);

-- Location: IOIBUF_X1_Y0_N22
\reg2[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg2(0),
	o => \reg2[0]~input_o\);

-- Location: LCCOMB_X8_Y5_N10
\dataOut2[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[0]~0_combout\ = (\reg2[1]~input_o\ & (((\reg2[0]~input_o\)))) # (!\reg2[1]~input_o\ & ((\reg2[0]~input_o\ & (\registrador2|data\(0))) # (!\reg2[0]~input_o\ & ((\registrador1|data\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg2[1]~input_o\,
	datab => \registrador2|data\(0),
	datac => \registrador1|data\(0),
	datad => \reg2[0]~input_o\,
	combout => \dataOut2[0]~0_combout\);

-- Location: LCCOMB_X9_Y5_N18
\dataOut2[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[0]~1_combout\ = (\dataOut2[0]~0_combout\ & (((\registrador4|data\(0)) # (!\reg2[1]~input_o\)))) # (!\dataOut2[0]~0_combout\ & (\registrador3|data\(0) & ((\reg2[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador3|data\(0),
	datab => \dataOut2[0]~0_combout\,
	datac => \registrador4|data\(0),
	datad => \reg2[1]~input_o\,
	combout => \dataOut2[0]~1_combout\);

-- Location: LCCOMB_X8_Y5_N6
\dataOut2[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[1]~2_combout\ = (\reg2[0]~input_o\ & (((\reg2[1]~input_o\)))) # (!\reg2[0]~input_o\ & ((\reg2[1]~input_o\ & (\registrador3|data\(1))) # (!\reg2[1]~input_o\ & ((\registrador1|data\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador3|data\(1),
	datab => \reg2[0]~input_o\,
	datac => \registrador1|data\(1),
	datad => \reg2[1]~input_o\,
	combout => \dataOut2[1]~2_combout\);

-- Location: LCCOMB_X9_Y5_N30
\dataOut2[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[1]~3_combout\ = (\reg2[0]~input_o\ & ((\dataOut2[1]~2_combout\ & (\registrador4|data\(1))) # (!\dataOut2[1]~2_combout\ & ((\registrador2|data\(1)))))) # (!\reg2[0]~input_o\ & (\dataOut2[1]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg2[0]~input_o\,
	datab => \dataOut2[1]~2_combout\,
	datac => \registrador4|data\(1),
	datad => \registrador2|data\(1),
	combout => \dataOut2[1]~3_combout\);

-- Location: LCCOMB_X8_Y5_N2
\dataOut2[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[2]~4_combout\ = (\reg2[0]~input_o\ & ((\registrador2|data\(2)) # ((\reg2[1]~input_o\)))) # (!\reg2[0]~input_o\ & (((\registrador1|data\(2) & !\reg2[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador2|data\(2),
	datab => \reg2[0]~input_o\,
	datac => \registrador1|data\(2),
	datad => \reg2[1]~input_o\,
	combout => \dataOut2[2]~4_combout\);

-- Location: LCCOMB_X9_Y5_N26
\dataOut2[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[2]~5_combout\ = (\dataOut2[2]~4_combout\ & (((\registrador4|data\(2)) # (!\reg2[1]~input_o\)))) # (!\dataOut2[2]~4_combout\ & (\registrador3|data\(2) & ((\reg2[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dataOut2[2]~4_combout\,
	datab => \registrador3|data\(2),
	datac => \registrador4|data\(2),
	datad => \reg2[1]~input_o\,
	combout => \dataOut2[2]~5_combout\);

-- Location: LCCOMB_X8_Y5_N14
\dataOut2[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[3]~6_combout\ = (\reg2[1]~input_o\ & ((\reg2[0]~input_o\) # ((\registrador3|data\(3))))) # (!\reg2[1]~input_o\ & (!\reg2[0]~input_o\ & (\registrador1|data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg2[1]~input_o\,
	datab => \reg2[0]~input_o\,
	datac => \registrador1|data\(3),
	datad => \registrador3|data\(3),
	combout => \dataOut2[3]~6_combout\);

-- Location: LCCOMB_X9_Y5_N14
\dataOut2[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[3]~7_combout\ = (\dataOut2[3]~6_combout\ & (((\registrador4|data\(3)) # (!\reg2[0]~input_o\)))) # (!\dataOut2[3]~6_combout\ & (\registrador2|data\(3) & ((\reg2[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dataOut2[3]~6_combout\,
	datab => \registrador2|data\(3),
	datac => \registrador4|data\(3),
	datad => \reg2[0]~input_o\,
	combout => \dataOut2[3]~7_combout\);

-- Location: LCCOMB_X8_Y5_N26
\dataOut2[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[4]~8_combout\ = (\reg2[1]~input_o\ & (((\reg2[0]~input_o\)))) # (!\reg2[1]~input_o\ & ((\reg2[0]~input_o\ & (\registrador2|data\(4))) # (!\reg2[0]~input_o\ & ((\registrador1|data\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg2[1]~input_o\,
	datab => \registrador2|data\(4),
	datac => \registrador1|data\(4),
	datad => \reg2[0]~input_o\,
	combout => \dataOut2[4]~8_combout\);

-- Location: LCCOMB_X9_Y5_N10
\dataOut2[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[4]~9_combout\ = (\dataOut2[4]~8_combout\ & (((\registrador4|data\(4)) # (!\reg2[1]~input_o\)))) # (!\dataOut2[4]~8_combout\ & (\registrador3|data\(4) & ((\reg2[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador3|data\(4),
	datab => \dataOut2[4]~8_combout\,
	datac => \registrador4|data\(4),
	datad => \reg2[1]~input_o\,
	combout => \dataOut2[4]~9_combout\);

-- Location: LCCOMB_X8_Y5_N30
\dataOut2[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[5]~10_combout\ = (\reg2[1]~input_o\ & ((\reg2[0]~input_o\) # ((\registrador3|data\(5))))) # (!\reg2[1]~input_o\ & (!\reg2[0]~input_o\ & (\registrador1|data\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg2[1]~input_o\,
	datab => \reg2[0]~input_o\,
	datac => \registrador1|data\(5),
	datad => \registrador3|data\(5),
	combout => \dataOut2[5]~10_combout\);

-- Location: LCCOMB_X9_Y5_N6
\dataOut2[5]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[5]~11_combout\ = (\dataOut2[5]~10_combout\ & (((\registrador4|data\(5)) # (!\reg2[0]~input_o\)))) # (!\dataOut2[5]~10_combout\ & (\registrador2|data\(5) & ((\reg2[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador2|data\(5),
	datab => \dataOut2[5]~10_combout\,
	datac => \registrador4|data\(5),
	datad => \reg2[0]~input_o\,
	combout => \dataOut2[5]~11_combout\);

-- Location: LCCOMB_X8_Y5_N18
\dataOut2[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[6]~12_combout\ = (\reg2[1]~input_o\ & (\reg2[0]~input_o\)) # (!\reg2[1]~input_o\ & ((\reg2[0]~input_o\ & ((\registrador2|data\(6)))) # (!\reg2[0]~input_o\ & (\registrador1|data\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg2[1]~input_o\,
	datab => \reg2[0]~input_o\,
	datac => \registrador1|data\(6),
	datad => \registrador2|data\(6),
	combout => \dataOut2[6]~12_combout\);

-- Location: LCCOMB_X9_Y5_N2
\dataOut2[6]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[6]~13_combout\ = (\dataOut2[6]~12_combout\ & (((\registrador4|data\(6)) # (!\reg2[1]~input_o\)))) # (!\dataOut2[6]~12_combout\ & (\registrador3|data\(6) & ((\reg2[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \registrador3|data\(6),
	datab => \dataOut2[6]~12_combout\,
	datac => \registrador4|data\(6),
	datad => \reg2[1]~input_o\,
	combout => \dataOut2[6]~13_combout\);

-- Location: LCCOMB_X8_Y5_N22
\dataOut2[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[7]~14_combout\ = (\reg2[1]~input_o\ & ((\registrador3|data\(7)) # ((\reg2[0]~input_o\)))) # (!\reg2[1]~input_o\ & (((\registrador1|data\(7) & !\reg2[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg2[1]~input_o\,
	datab => \registrador3|data\(7),
	datac => \registrador1|data\(7),
	datad => \reg2[0]~input_o\,
	combout => \dataOut2[7]~14_combout\);

-- Location: LCCOMB_X9_Y5_N22
\dataOut2[7]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \dataOut2[7]~15_combout\ = (\reg2[0]~input_o\ & ((\dataOut2[7]~14_combout\ & (\registrador4|data\(7))) # (!\dataOut2[7]~14_combout\ & ((\registrador2|data\(7)))))) # (!\reg2[0]~input_o\ & (\dataOut2[7]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg2[0]~input_o\,
	datab => \dataOut2[7]~14_combout\,
	datac => \registrador4|data\(7),
	datad => \registrador2|data\(7),
	combout => \dataOut2[7]~15_combout\);

ww_dataOut1(0) <= \dataOut1[0]~output_o\;

ww_dataOut1(1) <= \dataOut1[1]~output_o\;

ww_dataOut1(2) <= \dataOut1[2]~output_o\;

ww_dataOut1(3) <= \dataOut1[3]~output_o\;

ww_dataOut1(4) <= \dataOut1[4]~output_o\;

ww_dataOut1(5) <= \dataOut1[5]~output_o\;

ww_dataOut1(6) <= \dataOut1[6]~output_o\;

ww_dataOut1(7) <= \dataOut1[7]~output_o\;

ww_dataOut2(0) <= \dataOut2[0]~output_o\;

ww_dataOut2(1) <= \dataOut2[1]~output_o\;

ww_dataOut2(2) <= \dataOut2[2]~output_o\;

ww_dataOut2(3) <= \dataOut2[3]~output_o\;

ww_dataOut2(4) <= \dataOut2[4]~output_o\;

ww_dataOut2(5) <= \dataOut2[5]~output_o\;

ww_dataOut2(6) <= \dataOut2[6]~output_o\;

ww_dataOut2(7) <= \dataOut2[7]~output_o\;
END structure;


