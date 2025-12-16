LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pixel_inversion_v1_0_M00_AXIS IS
	GENERIC (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		C_M_AXIS_TDATA_WIDTH : INTEGER := 8;
		-- Start count is the number of clock cycles the master will wait before initiating/issuing any transaction.
		C_M_START_COUNT : INTEGER := 0
	);
	PORT (
		-- Users to add ports here
		DATA_in : IN STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH - 1 DOWNTO 0);
		READY_out : OUT STD_LOGIC;
		USER_in : IN STD_LOGIC;
		LAST_in : IN STD_LOGIC;
		VALID_in : IN STD_LOGIC;

		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Global ports
		M_AXIS_ACLK : IN STD_LOGIC;
		--  Active low asynchronous reset
		M_AXIS_ARESETN : IN STD_LOGIC;
		-- Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
		M_AXIS_TVALID : OUT STD_LOGIC;
		-- TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		M_AXIS_TDATA : OUT STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH - 1 DOWNTO 0);
		-- TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		M_AXIS_TUSER : OUT STD_LOGIC;
		-- TLAST indicates the boundary of a packet.
		M_AXIS_TLAST : OUT STD_LOGIC;
		-- TREADY indicates that the slave can accept a transfer in the current cycle.
		M_AXIS_TREADY : IN STD_LOGIC;
		VidOrig_nVideoInv : IN STD_LOGIC
	);
END pixel_inversion_v1_0_M00_AXIS;

ARCHITECTURE implementation OF pixel_inversion_v1_0_M00_AXIS IS
BEGIN
	READY_out <= M_AXIS_TREADY;
	M_AXIS_TVALID <= VALID_in;
	M_AXIS_TUSER <= USER_in;
	M_AXIS_TLAST <= LAST_in;
	PROCESS (DATA_in, VidOrig_nVideoInv)
	BEGIN
		IF VidOrig_nVideoInv = '1' THEN
			M_AXIS_TDATA <= NOT DATA_in;
		ELSE
			M_AXIS_TDATA <= DATA_in;
		END IF;
	END PROCESS;
END implementation;