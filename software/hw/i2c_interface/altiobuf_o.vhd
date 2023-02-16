-- megafunction wizard: %ALTIOBUF%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altiobuf_out 

-- ============================================================
-- File Name: altiobuf_o.vhd
-- Megafunction Name(s):
-- 			altiobuf_out
--
-- Simulation Library Files(s):
-- 			cyclonev
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 20.1.1 Build 720 11/11/2020 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2020  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and any partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details, at
--https://fpgasoftware.intel.com/eula.


--altiobuf_out CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Cyclone V" ENABLE_BUS_HOLD="FALSE" LEFT_SHIFT_SERIES_TERMINATION_CONTROL="FALSE" NUMBER_OF_CHANNELS=1 OPEN_DRAIN_OUTPUT="TRUE" PSEUDO_DIFFERENTIAL_MODE="FALSE" USE_DIFFERENTIAL_MODE="FALSE" USE_OE="TRUE" USE_TERMINATION_CONTROL="FALSE" datain dataout oe
--VERSION_BEGIN 20.1 cbx_altiobuf_out 2020:11:11:17:06:45:SJ cbx_mgl 2020:11:11:17:08:38:SJ cbx_stratixiii 2020:11:11:17:06:46:SJ cbx_stratixv 2020:11:11:17:06:46:SJ  VERSION_END

 LIBRARY cyclonev;
 USE cyclonev.all;

--synthesis_resources = cyclonev_io_obuf 1 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  altiobuf_o_iobuf_out_krs IS 
	 PORT 
	 ( 
		 datain	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 dataout	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 oe	:	IN  STD_LOGIC_VECTOR (0 DOWNTO 0) := (OTHERS => '1')
	 ); 
 END altiobuf_o_iobuf_out_krs;

 ARCHITECTURE RTL OF altiobuf_o_iobuf_out_krs IS

	 SIGNAL  wire_obufa_o	:	STD_LOGIC;
	 SIGNAL  oe_w :	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 COMPONENT  cyclonev_io_obuf
	 GENERIC 
	 (
		bus_hold	:	STRING := "false";
		open_drain_output	:	STRING := "false";
		shift_series_termination_control	:	STRING := "false";
		lpm_type	:	STRING := "cyclonev_io_obuf"
	 );
	 PORT
	 ( 
		dynamicterminationcontrol	:	IN STD_LOGIC := '0';
		i	:	IN STD_LOGIC := '0';
		o	:	OUT STD_LOGIC;
		obar	:	OUT STD_LOGIC;
		oe	:	IN STD_LOGIC := '1';
		parallelterminationcontrol	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
		seriesterminationcontrol	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
 BEGIN

	dataout(0) <= wire_obufa_o;
	oe_w <= oe;
	obufa :  cyclonev_io_obuf
	  GENERIC MAP (
		bus_hold => "false",
		open_drain_output => "true"
	  )
	  PORT MAP ( 
		i => datain(0),
		o => wire_obufa_o,
		oe => oe_w(0)
	  );

 END RTL; --altiobuf_o_iobuf_out_krs
--VALID FILE


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY altiobuf_o IS
	PORT
	(
		datain		: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
		oe		: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
		dataout		: OUT STD_LOGIC_VECTOR (0 DOWNTO 0)
	);
END altiobuf_o;


ARCHITECTURE RTL OF altiobuf_o IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (0 DOWNTO 0);



	COMPONENT altiobuf_o_iobuf_out_krs
	PORT (
			datain	: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
			oe	: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
			dataout	: OUT STD_LOGIC_VECTOR (0 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	dataout    <= sub_wire0(0 DOWNTO 0);

	altiobuf_o_iobuf_out_krs_component : altiobuf_o_iobuf_out_krs
	PORT MAP (
		datain => datain,
		oe => oe,
		dataout => sub_wire0
	);



END RTL;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: CONSTANT: enable_bus_hold STRING "FALSE"
-- Retrieval info: CONSTANT: left_shift_series_termination_control STRING "FALSE"
-- Retrieval info: CONSTANT: number_of_channels NUMERIC "1"
-- Retrieval info: CONSTANT: open_drain_output STRING "TRUE"
-- Retrieval info: CONSTANT: pseudo_differential_mode STRING "FALSE"
-- Retrieval info: CONSTANT: use_differential_mode STRING "FALSE"
-- Retrieval info: CONSTANT: use_oe STRING "TRUE"
-- Retrieval info: CONSTANT: use_termination_control STRING "FALSE"
-- Retrieval info: USED_PORT: datain 0 0 1 0 INPUT NODEFVAL "datain[0..0]"
-- Retrieval info: USED_PORT: dataout 0 0 1 0 OUTPUT NODEFVAL "dataout[0..0]"
-- Retrieval info: USED_PORT: oe 0 0 1 0 INPUT NODEFVAL "oe[0..0]"
-- Retrieval info: CONNECT: @datain 0 0 1 0 datain 0 0 1 0
-- Retrieval info: CONNECT: @oe 0 0 1 0 oe 0 0 1 0
-- Retrieval info: CONNECT: dataout 0 0 1 0 @dataout 0 0 1 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL altiobuf_o.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL altiobuf_o.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL altiobuf_o.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL altiobuf_o.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL altiobuf_o_inst.vhd TRUE
-- Retrieval info: LIB_FILE: cyclonev
