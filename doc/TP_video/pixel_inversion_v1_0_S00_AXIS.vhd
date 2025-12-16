LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pixel_inversion_v1_0_S00_AXIS IS
	GENERIC (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- AXI4Stream sink: Data Width
		C_S_AXIS_TDATA_WIDTH : INTEGER := 8
	);
	PORT (
		-- Users to add ports here
		DATA : OUT STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH - 1 DOWNTO 0);
		READY : IN STD_LOGIC;
		USER : OUT STD_LOGIC;
		LAST : OUT STD_LOGIC;
		VALID : OUT STD_LOGIC;
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- AXI4Stream sink: Clock
		S_AXIS_ACLK : IN STD_LOGIC;
		-- AXI4Stream sink: Reset
		S_AXIS_ARESETN : IN STD_LOGIC;
		-- Ready to accept data in
		S_AXIS_TREADY : OUT STD_LOGIC;
		-- Data in
		S_AXIS_TDATA : IN STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH - 1 DOWNTO 0);
		-- Byte qualifier
		S_AXIS_TUSER : IN STD_LOGIC;
		-- Indicates boundary of last packet
		S_AXIS_TLAST : IN STD_LOGIC;
		-- Data is in valid
		S_AXIS_TVALID : IN STD_LOGIC
	);
END pixel_inversion_v1_0_S00_AXIS;

ARCHITECTURE arch_imp OF pixel_inversion_v1_0_S00_AXIS IS
	-- pipe all signals to the master :

BEGIN
	-- Users to add signals here
	S_AXIS_TREADY <= S_AXIS_TVALID;
	USER <= S_AXIS_TUSER;
	LAST <= S_AXIS_TLAST;
	VALID <= S_AXIS_TVALID;
	DATA <= S_AXIS_TDATA;
	-- User signals ends
	-- Do not modify the signals beyond this line

END arch_imp;