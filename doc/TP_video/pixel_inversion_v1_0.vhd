LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pixel_inversion_v1_0 IS
	GENERIC (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line
		-- Parameters of Axi Slave Bus Interface S00_AXIS
		C_S00_AXIS_TDATA_WIDTH : INTEGER := 8;

		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH : INTEGER := 8;
		C_M00_AXIS_START_COUNT : INTEGER := 1
	);
	PORT (
		-- Users to add ports here
		VidOrig_nVideoInv : IN STD_LOGIC;
		-- User ports ends
		-- Do not modify the ports beyond this line
		-- Ports of Axi Slave Bus Interface S00_AXIS
		s00_axis_aclk : IN STD_LOGIC;
		s00_axis_aresetn : IN STD_LOGIC;
		s00_axis_tready : OUT STD_LOGIC;
		s00_axis_tdata : IN STD_LOGIC_VECTOR(C_S00_AXIS_TDATA_WIDTH - 1 DOWNTO 0);
		s00_axis_tuser : IN STD_LOGIC;
		s00_axis_tlast : IN STD_LOGIC;
		s00_axis_tvalid : IN STD_LOGIC;

		-- Ports of Axi Master Bus Interface M00_AXIS
		m00_axis_aclk : IN STD_LOGIC;
		m00_axis_aresetn : IN STD_LOGIC;
		m00_axis_tvalid : OUT STD_LOGIC;
		m00_axis_tdata : OUT STD_LOGIC_VECTOR(C_M00_AXIS_TDATA_WIDTH - 1 DOWNTO 0);
		m00_axis_tuser : OUT STD_LOGIC;
		m00_axis_tlast : OUT STD_LOGIC;
		m00_axis_tready : IN STD_LOGIC
	);
END pixel_inversion_v1_0;

ARCHITECTURE arch_imp OF pixel_inversion_v1_0 IS
	SIGNAL DATA_wire : STD_LOGIC_VECTOR(8 - 1 DOWNTO 0);
	SIGNAL READY_wire : STD_LOGIC;
	SIGNAL USER_wire : STD_LOGIC;
	SIGNAL LAST_wire : STD_LOGIC;
	SIGNAL VALID_wire : STD_LOGIC;
	-- component declaration
	COMPONENT pixel_inversion_v1_0_S00_AXIS IS
		GENERIC (
			C_S_AXIS_TDATA_WIDTH : INTEGER := 8
		);
		PORT (
			DATA : OUT STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH - 1 DOWNTO 0);
			READY : IN STD_LOGIC;
			USER : OUT STD_LOGIC;
			LAST : OUT STD_LOGIC;
			VALID : OUT STD_LOGIC;
			S_AXIS_ACLK : IN STD_LOGIC;
			S_AXIS_ARESETN : IN STD_LOGIC;
			S_AXIS_TREADY : OUT STD_LOGIC;
			S_AXIS_TDATA : IN STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH - 1 DOWNTO 0);
			S_AXIS_TUSER : IN STD_LOGIC;
			S_AXIS_TLAST : IN STD_LOGIC;
			S_AXIS_TVALID : IN STD_LOGIC

		);
	END COMPONENT pixel_inversion_v1_0_S00_AXIS;

	COMPONENT pixel_inversion_v1_0_M00_AXIS IS
		GENERIC (
			C_M_AXIS_TDATA_WIDTH : INTEGER := 8;
			C_M_START_COUNT : INTEGER := 0
		);
		PORT (
			DATA_in : IN STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH - 1 DOWNTO 0);
			M_AXIS_ACLK : IN STD_LOGIC;
			M_AXIS_ARESETN : IN STD_LOGIC;
			M_AXIS_TVALID : OUT STD_LOGIC;
			M_AXIS_TDATA : OUT STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH - 1 DOWNTO 0);
			M_AXIS_TUSER : OUT STD_LOGIC;
			M_AXIS_TLAST : OUT STD_LOGIC;
			M_AXIS_TREADY : IN STD_LOGIC;
			VidOrig_nVideoInv : IN STD_LOGIC;
			READY_out : OUT STD_LOGIC;
			USER_in : IN STD_LOGIC;
			LAST_in : IN STD_LOGIC;
			VALID_in : IN STD_LOGIC

		);
	END COMPONENT pixel_inversion_v1_0_M00_AXIS;
BEGIN

	-- Instantiation of Axi Bus Interface S00_AXIS
	pixel_inversion_v1_0_S00_AXIS_inst : pixel_inversion_v1_0_S00_AXIS
	GENERIC MAP(
		C_S_AXIS_TDATA_WIDTH => C_S00_AXIS_TDATA_WIDTH
	)
	PORT MAP(
		S_AXIS_ACLK => s00_axis_aclk,
		S_AXIS_ARESETN => s00_axis_aresetn,
		S_AXIS_TREADY => s00_axis_tready,
		S_AXIS_TDATA => s00_axis_tdata,
		S_AXIS_TUSER => s00_axis_tuser,
		S_AXIS_TLAST => s00_axis_tlast,
		S_AXIS_TVALID => s00_axis_tvalid,
		DATA => DATA_wire,
		READY => READY_wire,
		USER => USER_wire,
		LAST => LAST_wire,
		VALID => VALID_wire

	);

	-- Instantiation of Axi Bus Interface M00_AXIS
	pixel_inversion_v1_0_M00_AXIS_inst : pixel_inversion_v1_0_M00_AXIS
	GENERIC MAP(
		C_M_AXIS_TDATA_WIDTH => C_M00_AXIS_TDATA_WIDTH,
		C_M_START_COUNT => C_M00_AXIS_START_COUNT
	)
	PORT MAP(
		M_AXIS_ACLK => m00_axis_aclk,
		M_AXIS_ARESETN => m00_axis_aresetn,
		M_AXIS_TVALID => m00_axis_tvalid,
		M_AXIS_TDATA => m00_axis_tdata,
		M_AXIS_TUSER => m00_axis_tuser,
		M_AXIS_TLAST => m00_axis_tlast,
		M_AXIS_TREADY => m00_axis_tready,
		DATA_in => DATA_wire,
		VidOrig_nVideoInv => VidOrig_nVideoInv,
		READY_out => READY_wire,
		USER_in => USER_wire,
		LAST_in => LAST_wire,
		VALID_in => VALID_wire

	);

	-- Add user logic here

	-- User logic ends

END arch_imp;