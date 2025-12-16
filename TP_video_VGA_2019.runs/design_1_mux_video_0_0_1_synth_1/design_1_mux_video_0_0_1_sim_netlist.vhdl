-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Nov 25 22:28:25 2025
-- Host        : LAPTOP-HJ430IGT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_mux_video_0_0_1_sim_netlist.vhdl
-- Design      : design_1_mux_video_0_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mux_video_0 is
  port (
    DOUT : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Sel_ActVideo : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mux_video_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mux_video_0 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DOUT[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \DOUT[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \DOUT[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \DOUT[3]_INST_0\ : label is "soft_lutpair1";
begin
\DOUT[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Sel_ActVideo,
      I1 => DIN(0),
      O => DOUT(0)
    );
\DOUT[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Sel_ActVideo,
      I1 => DIN(1),
      O => DOUT(1)
    );
\DOUT[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Sel_ActVideo,
      I1 => DIN(2),
      O => DOUT(2)
    );
\DOUT[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => Sel_ActVideo,
      I1 => DIN(3),
      O => DOUT(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    DIN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Sel_ActVideo : in STD_LOGIC;
    DOUT : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_mux_video_0_0_1,mux_video_0,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "mux_video_0,Vivado 2019.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mux_video_0
     port map (
      DIN(3 downto 0) => DIN(7 downto 4),
      DOUT(3 downto 0) => DOUT(3 downto 0),
      Sel_ActVideo => Sel_ActVideo
    );
end STRUCTURE;
