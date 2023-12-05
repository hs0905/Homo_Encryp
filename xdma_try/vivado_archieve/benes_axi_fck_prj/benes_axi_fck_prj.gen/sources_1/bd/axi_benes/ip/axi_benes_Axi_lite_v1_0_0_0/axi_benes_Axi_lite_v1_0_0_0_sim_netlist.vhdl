-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
-- Date        : Wed Nov 15 22:45:18 2023
-- Host        : baldur running 64-bit Ubuntu 18.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/hs/Desktop/benes_axi_fck_prj/benes_axi_fck_prj.gen/sources_1/bd/axi_benes/ip/axi_benes_Axi_lite_v1_0_0_0/axi_benes_Axi_lite_v1_0_0_0_sim_netlist.vhdl
-- Design      : axi_benes_Axi_lite_v1_0_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcu280-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module is
  port (
    \stage_in_reg_reg[3][1][3]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \axi_rdata_reg[27]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_rdata[24]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \axi_rdata[25]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \axi_rdata[26]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \axi_rdata[27]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \axi_rdata[28]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \axi_rdata[29]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \axi_rdata[30]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \axi_rdata[31]_i_1\ : label is "soft_lutpair77";
begin
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[27]\(0),
      I1 => s00_axi_wdata(0),
      I2 => Q(0),
      O => \stage_in_reg_reg[3][1][3]\(0)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[27]\(1),
      I1 => s00_axi_wdata(0),
      I2 => Q(1),
      O => \stage_in_reg_reg[3][1][3]\(1)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[27]\(2),
      I1 => s00_axi_wdata(0),
      I2 => Q(2),
      O => \stage_in_reg_reg[3][1][3]\(2)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[27]\(3),
      I1 => s00_axi_wdata(0),
      I2 => Q(3),
      O => \stage_in_reg_reg[3][1][3]\(3)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(0),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[27]\(0),
      O => \stage_in_reg_reg[3][1][3]\(4)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(1),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[27]\(1),
      O => \stage_in_reg_reg[3][1][3]\(5)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(2),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[27]\(2),
      O => \stage_in_reg_reg[3][1][3]\(6)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(3),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[27]\(3),
      O => \stage_in_reg_reg[3][1][3]\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_10 is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][0][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[2][2][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_10 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_10;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_10 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[2][0][0]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \stage_in_reg[2][0][1]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \stage_in_reg[2][0][2]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \stage_in_reg[2][0][3]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \stage_in_reg[2][2][0]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \stage_in_reg[2][2][1]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \stage_in_reg[2][2][2]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \stage_in_reg[2][2][3]_i_1\ : label is "soft_lutpair45";
begin
\stage_in_reg[2][0][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][2][3]\(0),
      O => D(0)
    );
\stage_in_reg[2][0][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][2][3]\(1),
      O => D(1)
    );
\stage_in_reg[2][0][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][2][3]\(2),
      O => D(2)
    );
\stage_in_reg[2][0][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][2][3]\(3),
      O => D(3)
    );
\stage_in_reg[2][2][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][2][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => Q(0),
      O => \stage_in_reg_reg[1][0][3]\(0)
    );
\stage_in_reg[2][2][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][2][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => Q(1),
      O => \stage_in_reg_reg[1][0][3]\(1)
    );
\stage_in_reg[2][2][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][2][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => Q(2),
      O => \stage_in_reg_reg[1][0][3]\(2)
    );
\stage_in_reg[2][2][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][2][3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => Q(3),
      O => \stage_in_reg_reg[1][0][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_11 is
  port (
    \stage_in_reg_reg[1][3][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][2][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][3][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[2][3][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_11 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_11;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_11 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[2][1][0]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \stage_in_reg[2][1][1]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \stage_in_reg[2][1][2]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \stage_in_reg[2][1][3]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \stage_in_reg[2][3][0]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \stage_in_reg[2][3][1]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \stage_in_reg[2][3][2]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \stage_in_reg[2][3][3]_i_1\ : label is "soft_lutpair49";
begin
\stage_in_reg[2][1][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][3][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][3][3]_0\(0),
      O => \stage_in_reg_reg[1][3][3]\(0)
    );
\stage_in_reg[2][1][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][3][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][3][3]_0\(1),
      O => \stage_in_reg_reg[1][3][3]\(1)
    );
\stage_in_reg[2][1][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][3][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][3][3]_0\(2),
      O => \stage_in_reg_reg[1][3][3]\(2)
    );
\stage_in_reg[2][1][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][3][3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][3][3]_0\(3),
      O => \stage_in_reg_reg[1][3][3]\(3)
    );
\stage_in_reg[2][3][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][3][3]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][3][3]\(0),
      O => \stage_in_reg_reg[1][2][3]\(0)
    );
\stage_in_reg[2][3][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][3][3]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][3][3]\(1),
      O => \stage_in_reg_reg[1][2][3]\(1)
    );
\stage_in_reg[2][3][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][3][3]_0\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][3][3]\(2),
      O => \stage_in_reg_reg[1][2][3]\(2)
    );
\stage_in_reg[2][3][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][3][3]_0\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][3][3]\(3),
      O => \stage_in_reg_reg[1][2][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_12 is
  port (
    \stage_in_reg_reg[1][5][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][4][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][6][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[2][6][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_12 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_12;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_12 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[2][4][0]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \stage_in_reg[2][4][1]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \stage_in_reg[2][4][2]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \stage_in_reg[2][4][3]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \stage_in_reg[2][6][0]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \stage_in_reg[2][6][1]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \stage_in_reg[2][6][2]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \stage_in_reg[2][6][3]_i_1\ : label is "soft_lutpair53";
begin
\stage_in_reg[2][4][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][6][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][6][3]_0\(0),
      O => \stage_in_reg_reg[1][5][3]\(0)
    );
\stage_in_reg[2][4][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][6][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][6][3]_0\(1),
      O => \stage_in_reg_reg[1][5][3]\(1)
    );
\stage_in_reg[2][4][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][6][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][6][3]_0\(2),
      O => \stage_in_reg_reg[1][5][3]\(2)
    );
\stage_in_reg[2][4][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][6][3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][6][3]_0\(3),
      O => \stage_in_reg_reg[1][5][3]\(3)
    );
\stage_in_reg[2][6][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][6][3]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][6][3]\(0),
      O => \stage_in_reg_reg[1][4][3]\(0)
    );
\stage_in_reg[2][6][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][6][3]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][6][3]\(1),
      O => \stage_in_reg_reg[1][4][3]\(1)
    );
\stage_in_reg[2][6][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][6][3]_0\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][6][3]\(2),
      O => \stage_in_reg_reg[1][4][3]\(2)
    );
\stage_in_reg[2][6][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][6][3]_0\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][6][3]\(3),
      O => \stage_in_reg_reg[1][4][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_13 is
  port (
    \stage_in_reg_reg[1][7][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][6][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][7][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[2][7][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_13 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_13;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_13 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[2][5][0]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \stage_in_reg[2][5][1]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \stage_in_reg[2][5][2]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \stage_in_reg[2][5][3]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \stage_in_reg[2][7][0]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \stage_in_reg[2][7][1]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \stage_in_reg[2][7][2]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \stage_in_reg[2][7][3]_i_1\ : label is "soft_lutpair57";
begin
\stage_in_reg[2][5][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][7][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][7][3]_0\(0),
      O => \stage_in_reg_reg[1][7][3]\(0)
    );
\stage_in_reg[2][5][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][7][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][7][3]_0\(1),
      O => \stage_in_reg_reg[1][7][3]\(1)
    );
\stage_in_reg[2][5][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][7][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][7][3]_0\(2),
      O => \stage_in_reg_reg[1][7][3]\(2)
    );
\stage_in_reg[2][5][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][7][3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][7][3]_0\(3),
      O => \stage_in_reg_reg[1][7][3]\(3)
    );
\stage_in_reg[2][7][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][7][3]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][7][3]\(0),
      O => \stage_in_reg_reg[1][6][3]\(0)
    );
\stage_in_reg[2][7][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][7][3]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][7][3]\(1),
      O => \stage_in_reg_reg[1][6][3]\(1)
    );
\stage_in_reg[2][7][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][7][3]_0\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][7][3]\(2),
      O => \stage_in_reg_reg[1][6][3]\(2)
    );
\stage_in_reg[2][7][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[2][7][3]_0\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[2][7][3]\(3),
      O => \stage_in_reg_reg[1][6][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_14 is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][0][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[1][2][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_14 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_14;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_14 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[1][0][0]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \stage_in_reg[1][0][1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \stage_in_reg[1][0][2]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \stage_in_reg[1][0][3]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \stage_in_reg[1][2][0]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \stage_in_reg[1][2][1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \stage_in_reg[1][2][2]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \stage_in_reg[1][2][3]_i_1\ : label is "soft_lutpair29";
begin
\stage_in_reg[1][0][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][2][3]\(0),
      O => D(0)
    );
\stage_in_reg[1][0][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][2][3]\(1),
      O => D(1)
    );
\stage_in_reg[1][0][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][2][3]\(2),
      O => D(2)
    );
\stage_in_reg[1][0][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][2][3]\(3),
      O => D(3)
    );
\stage_in_reg[1][2][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][2][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => Q(0),
      O => \stage_in_reg_reg[0][0][3]\(0)
    );
\stage_in_reg[1][2][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][2][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => Q(1),
      O => \stage_in_reg_reg[0][0][3]\(1)
    );
\stage_in_reg[1][2][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][2][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => Q(2),
      O => \stage_in_reg_reg[0][0][3]\(2)
    );
\stage_in_reg[1][2][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][2][3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => Q(3),
      O => \stage_in_reg_reg[0][0][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_15 is
  port (
    \stage_in_reg_reg[0][3][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][2][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][3][0]\ : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[1][3][0]_0\ : in STD_LOGIC;
    \stage_in_reg_reg[1][3][1]\ : in STD_LOGIC;
    \stage_in_reg_reg[1][3][3]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \stage_in_reg_reg[1][3][3]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_15 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_15;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_15 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[1][1][0]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \stage_in_reg[1][1][1]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \stage_in_reg[1][1][2]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \stage_in_reg[1][1][3]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \stage_in_reg[1][3][0]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \stage_in_reg[1][3][1]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \stage_in_reg[1][3][2]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \stage_in_reg[1][3][3]_i_1\ : label is "soft_lutpair33";
begin
\stage_in_reg[1][1][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][3][0]\,
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][3][0]_0\,
      O => \stage_in_reg_reg[0][3][3]\(0)
    );
\stage_in_reg[1][1][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][3][1]\,
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][3][3]\(0),
      O => \stage_in_reg_reg[0][3][3]\(1)
    );
\stage_in_reg[1][1][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][3][3]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][3][3]\(1),
      O => \stage_in_reg_reg[0][3][3]\(2)
    );
\stage_in_reg[1][1][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][3][3]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][3][3]\(2),
      O => \stage_in_reg_reg[0][3][3]\(3)
    );
\stage_in_reg[1][3][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][3][0]_0\,
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][3][0]\,
      O => \stage_in_reg_reg[0][2][3]\(0)
    );
\stage_in_reg[1][3][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][3][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][3][1]\,
      O => \stage_in_reg_reg[0][2][3]\(1)
    );
\stage_in_reg[1][3][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][3][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][3][3]_0\(0),
      O => \stage_in_reg_reg[0][2][3]\(2)
    );
\stage_in_reg[1][3][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][3][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][3][3]_0\(1),
      O => \stage_in_reg_reg[0][2][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_16 is
  port (
    \stage_in_reg_reg[0][5][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][4][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][6][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[1][6][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_16 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_16;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_16 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[1][4][0]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \stage_in_reg[1][4][1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \stage_in_reg[1][4][2]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \stage_in_reg[1][4][3]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \stage_in_reg[1][6][0]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \stage_in_reg[1][6][1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \stage_in_reg[1][6][2]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \stage_in_reg[1][6][3]_i_1\ : label is "soft_lutpair37";
begin
\stage_in_reg[1][4][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][6][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][6][3]_0\(0),
      O => \stage_in_reg_reg[0][5][3]\(0)
    );
\stage_in_reg[1][4][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][6][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][6][3]_0\(1),
      O => \stage_in_reg_reg[0][5][3]\(1)
    );
\stage_in_reg[1][4][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][6][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][6][3]_0\(2),
      O => \stage_in_reg_reg[0][5][3]\(2)
    );
\stage_in_reg[1][4][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][6][3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][6][3]_0\(3),
      O => \stage_in_reg_reg[0][5][3]\(3)
    );
\stage_in_reg[1][6][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][6][3]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][6][3]\(0),
      O => \stage_in_reg_reg[0][4][3]\(0)
    );
\stage_in_reg[1][6][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][6][3]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][6][3]\(1),
      O => \stage_in_reg_reg[0][4][3]\(1)
    );
\stage_in_reg[1][6][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][6][3]_0\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][6][3]\(2),
      O => \stage_in_reg_reg[0][4][3]\(2)
    );
\stage_in_reg[1][6][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][6][3]_0\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][6][3]\(3),
      O => \stage_in_reg_reg[0][4][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_17 is
  port (
    \stage_in_reg_reg[0][7][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][6][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][7][0]\ : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[1][7][0]_0\ : in STD_LOGIC;
    \stage_in_reg_reg[1][7][1]\ : in STD_LOGIC;
    \stage_in_reg_reg[1][7][3]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \stage_in_reg_reg[1][7][3]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_17 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_17;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_17 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[1][5][0]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \stage_in_reg[1][5][1]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \stage_in_reg[1][5][2]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \stage_in_reg[1][5][3]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \stage_in_reg[1][7][0]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \stage_in_reg[1][7][1]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \stage_in_reg[1][7][2]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \stage_in_reg[1][7][3]_i_1\ : label is "soft_lutpair41";
begin
\stage_in_reg[1][5][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][7][0]\,
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][7][0]_0\,
      O => \stage_in_reg_reg[0][7][3]\(0)
    );
\stage_in_reg[1][5][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][7][1]\,
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][7][3]\(0),
      O => \stage_in_reg_reg[0][7][3]\(1)
    );
\stage_in_reg[1][5][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][7][3]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][7][3]\(1),
      O => \stage_in_reg_reg[0][7][3]\(2)
    );
\stage_in_reg[1][5][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][7][3]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][7][3]\(2),
      O => \stage_in_reg_reg[0][7][3]\(3)
    );
\stage_in_reg[1][7][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][7][0]_0\,
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][7][0]\,
      O => \stage_in_reg_reg[0][6][3]\(0)
    );
\stage_in_reg[1][7][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][7][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][7][1]\,
      O => \stage_in_reg_reg[0][6][3]\(1)
    );
\stage_in_reg[1][7][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][7][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][7][3]_0\(0),
      O => \stage_in_reg_reg[0][6][3]\(2)
    );
\stage_in_reg[1][7][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[1][7][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[1][7][3]_0\(1),
      O => \stage_in_reg_reg[0][6][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_3 is
  port (
    \stage_in_reg_reg[3][3][3]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \axi_rdata_reg[19]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \axi_rdata_reg[19]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_3 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_3;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_3 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_rdata[16]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \axi_rdata[17]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \axi_rdata[18]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \axi_rdata[19]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \axi_rdata[20]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \axi_rdata[21]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \axi_rdata[22]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \axi_rdata[23]_i_1\ : label is "soft_lutpair81";
begin
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[19]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[19]\(0),
      O => \stage_in_reg_reg[3][3][3]\(0)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[19]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[19]\(1),
      O => \stage_in_reg_reg[3][3][3]\(1)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[19]_0\(2),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[19]\(2),
      O => \stage_in_reg_reg[3][3][3]\(2)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[19]_0\(3),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[19]\(3),
      O => \stage_in_reg_reg[3][3][3]\(3)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[19]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[19]_0\(0),
      O => \stage_in_reg_reg[3][3][3]\(4)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[19]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[19]_0\(1),
      O => \stage_in_reg_reg[3][3][3]\(5)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[19]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[19]_0\(2),
      O => \stage_in_reg_reg[3][3][3]\(6)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[19]\(3),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[19]_0\(3),
      O => \stage_in_reg_reg[3][3][3]\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_4 is
  port (
    \stage_in_reg_reg[3][5][3]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \axi_rdata_reg[11]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \axi_rdata_reg[11]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_4 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_4;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_4 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_rdata[10]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \axi_rdata[11]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \axi_rdata[12]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \axi_rdata[13]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \axi_rdata[14]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \axi_rdata[15]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \axi_rdata[8]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \axi_rdata[9]_i_1\ : label is "soft_lutpair83";
begin
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[11]_0\(2),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[11]\(2),
      O => \stage_in_reg_reg[3][5][3]\(2)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[11]_0\(3),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[11]\(3),
      O => \stage_in_reg_reg[3][5][3]\(3)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[11]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[11]_0\(0),
      O => \stage_in_reg_reg[3][5][3]\(4)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[11]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[11]_0\(1),
      O => \stage_in_reg_reg[3][5][3]\(5)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[11]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[11]_0\(2),
      O => \stage_in_reg_reg[3][5][3]\(6)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[11]\(3),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[11]_0\(3),
      O => \stage_in_reg_reg[3][5][3]\(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[11]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[11]\(0),
      O => \stage_in_reg_reg[3][5][3]\(0)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[11]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[11]\(1),
      O => \stage_in_reg_reg[3][5][3]\(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_5 is
  port (
    \stage_in_reg_reg[3][7][3]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \axi_rdata_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \axi_rdata_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_5 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_5;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_5 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_rdata[0]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \axi_rdata[1]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \axi_rdata[2]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \axi_rdata[3]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \axi_rdata[4]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \axi_rdata[5]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \axi_rdata[6]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \axi_rdata[7]_i_1\ : label is "soft_lutpair89";
begin
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[3]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[3]\(0),
      O => \stage_in_reg_reg[3][7][3]\(0)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[3]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[3]\(1),
      O => \stage_in_reg_reg[3][7][3]\(1)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[3]_0\(2),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[3]\(2),
      O => \stage_in_reg_reg[3][7][3]\(2)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[3]_0\(3),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[3]\(3),
      O => \stage_in_reg_reg[3][7][3]\(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[3]_0\(0),
      O => \stage_in_reg_reg[3][7][3]\(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[3]_0\(1),
      O => \stage_in_reg_reg[3][7][3]\(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[3]_0\(2),
      O => \stage_in_reg_reg[3][7][3]\(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \axi_rdata_reg[3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => \axi_rdata_reg[3]_0\(3),
      O => \stage_in_reg_reg[3][7][3]\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_6 is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][0][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[3][2][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_6 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_6;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_6 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[3][0][0]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \stage_in_reg[3][0][1]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \stage_in_reg[3][0][2]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \stage_in_reg[3][0][3]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \stage_in_reg[3][2][0]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \stage_in_reg[3][2][1]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \stage_in_reg[3][2][2]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \stage_in_reg[3][2][3]_i_1\ : label is "soft_lutpair61";
begin
\stage_in_reg[3][0][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][2][3]\(0),
      O => D(0)
    );
\stage_in_reg[3][0][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][2][3]\(1),
      O => D(1)
    );
\stage_in_reg[3][0][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][2][3]\(2),
      O => D(2)
    );
\stage_in_reg[3][0][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Q(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][2][3]\(3),
      O => D(3)
    );
\stage_in_reg[3][2][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][2][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => Q(0),
      O => \stage_in_reg_reg[2][0][3]\(0)
    );
\stage_in_reg[3][2][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][2][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => Q(1),
      O => \stage_in_reg_reg[2][0][3]\(1)
    );
\stage_in_reg[3][2][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][2][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => Q(2),
      O => \stage_in_reg_reg[2][0][3]\(2)
    );
\stage_in_reg[3][2][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][2][3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => Q(3),
      O => \stage_in_reg_reg[2][0][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_7 is
  port (
    \stage_in_reg_reg[2][3][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][2][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[3][6][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[3][6][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_7 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_7;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_7 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[3][4][0]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \stage_in_reg[3][4][1]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \stage_in_reg[3][4][2]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \stage_in_reg[3][4][3]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \stage_in_reg[3][6][0]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \stage_in_reg[3][6][1]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \stage_in_reg[3][6][2]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \stage_in_reg[3][6][3]_i_1\ : label is "soft_lutpair65";
begin
\stage_in_reg[3][4][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][6][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][6][3]_0\(0),
      O => \stage_in_reg_reg[2][3][3]\(0)
    );
\stage_in_reg[3][4][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][6][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][6][3]_0\(1),
      O => \stage_in_reg_reg[2][3][3]\(1)
    );
\stage_in_reg[3][4][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][6][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][6][3]_0\(2),
      O => \stage_in_reg_reg[2][3][3]\(2)
    );
\stage_in_reg[3][4][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][6][3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][6][3]_0\(3),
      O => \stage_in_reg_reg[2][3][3]\(3)
    );
\stage_in_reg[3][6][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][6][3]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][6][3]\(0),
      O => \stage_in_reg_reg[2][2][3]\(0)
    );
\stage_in_reg[3][6][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][6][3]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][6][3]\(1),
      O => \stage_in_reg_reg[2][2][3]\(1)
    );
\stage_in_reg[3][6][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][6][3]_0\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][6][3]\(2),
      O => \stage_in_reg_reg[2][2][3]\(2)
    );
\stage_in_reg[3][6][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][6][3]_0\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][6][3]\(3),
      O => \stage_in_reg_reg[2][2][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_8 is
  port (
    \stage_in_reg_reg[2][5][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][4][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[3][3][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[3][3][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_8 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_8;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_8 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[3][1][0]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \stage_in_reg[3][1][1]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \stage_in_reg[3][1][2]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \stage_in_reg[3][1][3]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \stage_in_reg[3][3][0]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \stage_in_reg[3][3][1]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \stage_in_reg[3][3][2]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \stage_in_reg[3][3][3]_i_1\ : label is "soft_lutpair69";
begin
\stage_in_reg[3][1][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][3][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][3][3]_0\(0),
      O => \stage_in_reg_reg[2][5][3]\(0)
    );
\stage_in_reg[3][1][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][3][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][3][3]_0\(1),
      O => \stage_in_reg_reg[2][5][3]\(1)
    );
\stage_in_reg[3][1][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][3][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][3][3]_0\(2),
      O => \stage_in_reg_reg[2][5][3]\(2)
    );
\stage_in_reg[3][1][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][3][3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][3][3]_0\(3),
      O => \stage_in_reg_reg[2][5][3]\(3)
    );
\stage_in_reg[3][3][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][3][3]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][3][3]\(0),
      O => \stage_in_reg_reg[2][4][3]\(0)
    );
\stage_in_reg[3][3][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][3][3]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][3][3]\(1),
      O => \stage_in_reg_reg[2][4][3]\(1)
    );
\stage_in_reg[3][3][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][3][3]_0\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][3][3]\(2),
      O => \stage_in_reg_reg[2][4][3]\(2)
    );
\stage_in_reg[3][3][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][3][3]_0\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][3][3]\(3),
      O => \stage_in_reg_reg[2][4][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_switch_module_9 is
  port (
    \stage_in_reg_reg[2][7][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][6][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[3][7][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[3][7][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_switch_module_9 : entity is "switch_module";
end axi_benes_Axi_lite_v1_0_0_0_switch_module_9;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_switch_module_9 is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[3][5][0]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \stage_in_reg[3][5][1]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \stage_in_reg[3][5][2]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \stage_in_reg[3][5][3]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \stage_in_reg[3][7][0]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \stage_in_reg[3][7][1]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \stage_in_reg[3][7][2]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \stage_in_reg[3][7][3]_i_1\ : label is "soft_lutpair73";
begin
\stage_in_reg[3][5][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][7][3]\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][7][3]_0\(0),
      O => \stage_in_reg_reg[2][7][3]\(0)
    );
\stage_in_reg[3][5][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][7][3]\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][7][3]_0\(1),
      O => \stage_in_reg_reg[2][7][3]\(1)
    );
\stage_in_reg[3][5][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][7][3]\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][7][3]_0\(2),
      O => \stage_in_reg_reg[2][7][3]\(2)
    );
\stage_in_reg[3][5][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][7][3]\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][7][3]_0\(3),
      O => \stage_in_reg_reg[2][7][3]\(3)
    );
\stage_in_reg[3][7][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][7][3]_0\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][7][3]\(0),
      O => \stage_in_reg_reg[2][6][3]\(0)
    );
\stage_in_reg[3][7][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][7][3]_0\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][7][3]\(1),
      O => \stage_in_reg_reg[2][6][3]\(1)
    );
\stage_in_reg[3][7][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][7][3]_0\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][7][3]\(2),
      O => \stage_in_reg_reg[2][6][3]\(2)
    );
\stage_in_reg[3][7][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \stage_in_reg_reg[3][7][3]_0\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[3][7][3]\(3),
      O => \stage_in_reg_reg[2][6][3]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_test_counter_2minus is
  port (
    Q : out STD_LOGIC_VECTOR ( 2 downto 0 );
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[0][2][3]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    \out_reg_reg[3]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_test_counter_2minus : entity is "test_counter_2minus";
end axi_benes_Axi_lite_v1_0_0_0_test_counter_2minus;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_test_counter_2minus is
  signal \^q\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal out_reg0 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \out_reg[2]_i_1__6_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \out_reg[1]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \out_reg[2]_i_1__6\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \out_reg[3]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \stage_in_reg[0][2][1]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \stage_in_reg[0][2][2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \stage_in_reg[0][2][3]_i_1\ : label is "soft_lutpair19";
begin
  Q(2 downto 0) <= \^q\(2 downto 0);
\out_reg[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => out_reg0(1)
    );
\out_reg[2]_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \out_reg[2]_i_1__6_n_0\
    );
\out_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => out_reg0(3)
    );
\out_reg_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => out_reg0(1),
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(0)
    );
\out_reg_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \out_reg[2]_i_1__6_n_0\,
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(1)
    );
\out_reg_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => out_reg0(3),
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(2)
    );
\stage_in_reg[0][2][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][2][3]\(0),
      O => D(0)
    );
\stage_in_reg[0][2][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][2][3]\(1),
      O => D(1)
    );
\stage_in_reg[0][2][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][2][3]\(2),
      O => D(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_test_counter_2plus is
  port (
    Q : out STD_LOGIC_VECTOR ( 2 downto 0 );
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[0][0][3]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    \out_reg_reg[3]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_test_counter_2plus : entity is "test_counter_2plus";
end axi_benes_Axi_lite_v1_0_0_0_test_counter_2plus;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_test_counter_2plus is
  signal \^q\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \out_reg[1]_i_1__1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \out_reg[2]_i_1__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \out_reg[3]_i_1__1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \stage_in_reg[0][0][1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \stage_in_reg[0][0][2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \stage_in_reg[0][0][3]_i_1\ : label is "soft_lutpair5";
begin
  Q(2 downto 0) <= \^q\(2 downto 0);
\out_reg[1]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \p_0_in__0\(1)
    );
\out_reg[2]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \p_0_in__0\(2)
    );
\out_reg[3]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => \p_0_in__0\(3)
    );
\out_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \out_reg_reg[3]_0\,
      D => \p_0_in__0\(1),
      Q => \^q\(0)
    );
\out_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \out_reg_reg[3]_0\,
      D => \p_0_in__0\(2),
      Q => \^q\(1)
    );
\out_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \out_reg_reg[3]_0\,
      D => \p_0_in__0\(3),
      Q => \^q\(2)
    );
\stage_in_reg[0][0][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][0][3]\(0),
      O => D(0)
    );
\stage_in_reg[0][0][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][0][3]\(1),
      O => D(1)
    );
\stage_in_reg[0][0][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][0][3]\(2),
      O => D(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_test_counter_3minus is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[0][7][3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    \out_reg_reg[3]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_test_counter_3minus : entity is "test_counter_3minus";
end axi_benes_Axi_lite_v1_0_0_0_test_counter_3minus;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_test_counter_3minus is
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \out_reg0__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \out_reg[2]_i_1__4_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \out_reg[0]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \out_reg[1]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \out_reg[2]_i_1__4\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \out_reg[3]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \stage_in_reg[0][7][2]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \stage_in_reg[0][7][3]_i_1\ : label is "soft_lutpair22";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
\out_reg[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \out_reg0__0\(0)
    );
\out_reg[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \out_reg0__0\(1)
    );
\out_reg[2]_i_1__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"95"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => \out_reg[2]_i_1__4_n_0\
    );
\out_reg[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA95"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      O => \out_reg0__0\(3)
    );
\out_reg_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \out_reg0__0\(0),
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(0)
    );
\out_reg_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \out_reg0__0\(1),
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(1)
    );
\out_reg_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \out_reg[2]_i_1__4_n_0\,
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(2)
    );
\out_reg_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \out_reg0__0\(3),
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(3)
    );
\stage_in_reg[0][7][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][7][3]\(0),
      O => D(0)
    );
\stage_in_reg[0][7][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][7][3]\(1),
      O => D(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_test_counter_3plus is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aresetn_0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \out_reg_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[0][5][3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_test_counter_3plus : entity is "test_counter_3plus";
end axi_benes_Axi_lite_v1_0_0_0_test_counter_3plus;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_test_counter_3plus is
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal net_in2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \out_reg[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \out_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \out_reg[2]_i_1__5_n_0\ : STD_LOGIC;
  signal \out_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal out_reg_reg : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \^s00_axi_aresetn_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \out_reg[2]_i_1__5\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \out_reg[3]_i_1__2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \out_reg[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \out_reg[6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \out_reg[7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \out_reg[7]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \stage_in_reg[0][1][0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \stage_in_reg[0][1][1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \stage_in_reg[0][5][0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \stage_in_reg[0][5][1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \stage_in_reg[0][5][2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \stage_in_reg[0][5][3]_i_1\ : label is "soft_lutpair10";
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
  s00_axi_aresetn_0 <= \^s00_axi_aresetn_0\;
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \^s00_axi_aresetn_0\
    );
\out_reg[0]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555555555555"
    )
        port map (
      I0 => net_in2(0),
      I1 => out_reg_reg(6),
      I2 => out_reg_reg(4),
      I3 => \out_reg[7]_i_2_n_0\,
      I4 => out_reg_reg(5),
      I5 => out_reg_reg(7),
      O => \out_reg[0]_i_1__2_n_0\
    );
\out_reg[1]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09999999"
    )
        port map (
      I0 => net_in2(1),
      I1 => net_in2(0),
      I2 => out_reg_reg(6),
      I3 => \out_reg[1]_i_2_n_0\,
      I4 => out_reg_reg(7),
      O => \p_0_in__1\(1)
    );
\out_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080800000000000"
    )
        port map (
      I0 => out_reg_reg(5),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => net_in2(0),
      I4 => net_in2(1),
      I5 => out_reg_reg(4),
      O => \out_reg[1]_i_2_n_0\
    );
\out_reg[2]_i_1__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"56"
    )
        port map (
      I0 => \^q\(0),
      I1 => net_in2(1),
      I2 => net_in2(0),
      O => \out_reg[2]_i_1__5_n_0\
    );
\out_reg[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FE0"
    )
        port map (
      I0 => net_in2(1),
      I1 => net_in2(0),
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => \p_0_in__1\(3)
    );
\out_reg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"56AAAAAA"
    )
        port map (
      I0 => out_reg_reg(4),
      I1 => net_in2(1),
      I2 => net_in2(0),
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \p_0_in__1\(4)
    );
\out_reg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A6A6AAAAAAAAAAA"
    )
        port map (
      I0 => out_reg_reg(5),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => net_in2(0),
      I4 => net_in2(1),
      I5 => out_reg_reg(4),
      O => \p_0_in__1\(5)
    );
\out_reg[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => out_reg_reg(6),
      I1 => out_reg_reg(4),
      I2 => \out_reg[7]_i_2_n_0\,
      I3 => out_reg_reg(5),
      O => \p_0_in__1\(6)
    );
\out_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => out_reg_reg(7),
      I1 => out_reg_reg(5),
      I2 => \out_reg[7]_i_2_n_0\,
      I3 => out_reg_reg(4),
      I4 => out_reg_reg(6),
      O => \p_0_in__1\(7)
    );
\out_reg[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8880"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => net_in2(0),
      I3 => net_in2(1),
      O => \out_reg[7]_i_2_n_0\
    );
\out_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \out_reg[0]_i_1__2_n_0\,
      Q => net_in2(0)
    );
\out_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \p_0_in__1\(1),
      Q => net_in2(1)
    );
\out_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \out_reg[2]_i_1__5_n_0\,
      Q => \^q\(0)
    );
\out_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \p_0_in__1\(3),
      Q => \^q\(1)
    );
\out_reg_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \p_0_in__1\(4),
      Q => out_reg_reg(4)
    );
\out_reg_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \p_0_in__1\(5),
      Q => out_reg_reg(5)
    );
\out_reg_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \p_0_in__1\(6),
      Q => out_reg_reg(6)
    );
\out_reg_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \p_0_in__1\(7),
      Q => out_reg_reg(7)
    );
\stage_in_reg[0][1][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => net_in2(0),
      I1 => s00_axi_wdata(0),
      O => D(0)
    );
\stage_in_reg[0][1][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => net_in2(1),
      I1 => s00_axi_wdata(0),
      O => D(1)
    );
\stage_in_reg[0][5][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => net_in2(0),
      I1 => s00_axi_wdata(0),
      O => \out_reg_reg[3]_0\(0)
    );
\stage_in_reg[0][5][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => net_in2(1),
      I1 => s00_axi_wdata(0),
      O => \out_reg_reg[3]_0\(1)
    );
\stage_in_reg[0][5][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][5][3]\(0),
      O => \out_reg_reg[3]_0\(2)
    );
\stage_in_reg[0][5][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][5][3]\(1),
      O => \out_reg_reg[3]_0\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_test_counter_4minus is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[0][3][3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    \out_reg_reg[3]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_test_counter_4minus : entity is "test_counter_4minus";
end axi_benes_Axi_lite_v1_0_0_0_test_counter_4minus;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_test_counter_4minus is
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \out_reg0__1\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \out_reg[3]_i_1__6_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \out_reg[2]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \out_reg[3]_i_1__6\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \stage_in_reg[0][3][2]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \stage_in_reg[0][3][3]_i_1\ : label is "soft_lutpair24";
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
\out_reg[2]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \out_reg0__1\(2)
    );
\out_reg[3]_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \out_reg[3]_i_1__6_n_0\
    );
\out_reg_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \out_reg0__1\(2),
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(0)
    );
\out_reg_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \out_reg[3]_i_1__6_n_0\,
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(1)
    );
\stage_in_reg[0][3][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][3][3]\(0),
      O => D(0)
    );
\stage_in_reg[0][3][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][3][3]\(1),
      O => D(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_test_counter_4plus is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[0][1][3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    \out_reg_reg[3]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_test_counter_4plus : entity is "test_counter_4plus";
end axi_benes_Axi_lite_v1_0_0_0_test_counter_4plus;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_test_counter_4plus is
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \p_0_in__2\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \out_reg[2]_i_1__1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \out_reg[3]_i_1__3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \stage_in_reg[0][1][2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \stage_in_reg[0][1][3]_i_1\ : label is "soft_lutpair13";
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
\out_reg[2]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \p_0_in__2\(2)
    );
\out_reg[3]_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \p_0_in__2\(3)
    );
\out_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \out_reg_reg[3]_0\,
      D => \p_0_in__2\(2),
      Q => \^q\(0)
    );
\out_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \out_reg_reg[3]_0\,
      D => \p_0_in__2\(3),
      Q => \^q\(1)
    );
\stage_in_reg[0][1][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][1][3]\(0),
      O => D(0)
    );
\stage_in_reg[0][1][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][1][3]\(1),
      O => D(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_test_counter_minus is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[0][6][3]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    \out_reg_reg[3]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_test_counter_minus : entity is "test_counter_minus";
end axi_benes_Axi_lite_v1_0_0_0_test_counter_minus;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_test_counter_minus is
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal out_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \out_reg[1]_i_1__4_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \out_reg[1]_i_1__4\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \out_reg[2]_i_1__3\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \out_reg[3]_i_1__5\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \stage_in_reg[0][6][1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \stage_in_reg[0][6][2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \stage_in_reg[0][6][3]_i_1\ : label is "soft_lutpair16";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
\out_reg[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => out_reg(0)
    );
\out_reg[1]_i_1__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \out_reg[1]_i_1__4_n_0\
    );
\out_reg[2]_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => out_reg(2)
    );
\out_reg[3]_i_1__5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(3),
      O => out_reg(3)
    );
\out_reg_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => out_reg(0),
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(0)
    );
\out_reg_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \out_reg[1]_i_1__4_n_0\,
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(1)
    );
\out_reg_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => out_reg(2),
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(2)
    );
\out_reg_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => out_reg(3),
      PRE => \out_reg_reg[3]_0\,
      Q => \^q\(3)
    );
\stage_in_reg[0][6][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][6][3]\(0),
      O => D(0)
    );
\stage_in_reg[0][6][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][6][3]\(1),
      O => D(1)
    );
\stage_in_reg[0][6][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(3),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][6][3]\(2),
      O => D(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_test_counter_plus is
  port (
    Q : out STD_LOGIC_VECTOR ( 2 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \out_reg_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    \stage_in_reg_reg[0][4][3]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    \out_reg_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_test_counter_plus : entity is "test_counter_plus";
end axi_benes_Axi_lite_v1_0_0_0_test_counter_plus;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_test_counter_plus is
  signal \^q\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal net_in0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal out_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \out_reg[0]_i_1__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \out_reg[1]_i_1__3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \out_reg[2]_i_1__2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \out_reg[3]_i_1__4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \stage_in_reg[0][0][0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \stage_in_reg[0][4][1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \stage_in_reg[0][4][2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \stage_in_reg[0][4][3]_i_1\ : label is "soft_lutpair1";
begin
  Q(2 downto 0) <= \^q\(2 downto 0);
\out_reg[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => net_in0(0),
      O => out_reg(0)
    );
\out_reg[1]_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => net_in0(0),
      I1 => \^q\(0),
      O => out_reg(1)
    );
\out_reg[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^q\(1),
      I1 => net_in0(0),
      I2 => \^q\(0),
      O => out_reg(2)
    );
\out_reg[3]_i_1__4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => net_in0(0),
      I3 => \^q\(1),
      O => out_reg(3)
    );
\out_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \out_reg_reg[3]_1\,
      D => out_reg(0),
      Q => net_in0(0)
    );
\out_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \out_reg_reg[3]_1\,
      D => out_reg(1),
      Q => \^q\(0)
    );
\out_reg_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \out_reg_reg[3]_1\,
      D => out_reg(2),
      Q => \^q\(1)
    );
\out_reg_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \out_reg_reg[3]_1\,
      D => out_reg(3),
      Q => \^q\(2)
    );
\stage_in_reg[0][0][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => net_in0(0),
      I1 => s00_axi_wdata(0),
      O => D(0)
    );
\stage_in_reg[0][4][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => net_in0(0),
      I1 => s00_axi_wdata(0),
      O => \out_reg_reg[3]_0\(0)
    );
\stage_in_reg[0][4][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(0),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][4][3]\(0),
      O => \out_reg_reg[3]_0\(1)
    );
\stage_in_reg[0][4][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(1),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][4][3]\(1),
      O => \out_reg_reg[3]_0\(2)
    );
\stage_in_reg[0][4][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^q\(2),
      I1 => s00_axi_wdata(0),
      I2 => \stage_in_reg_reg[0][4][3]\(2),
      O => \out_reg_reg[3]_0\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_stage_module is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][0][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][3][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][2][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][5][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][4][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][7][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][6][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][2][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][3][0]\ : in STD_LOGIC;
    \stage_in_reg_reg[1][3][0]_0\ : in STD_LOGIC;
    \stage_in_reg_reg[1][3][1]\ : in STD_LOGIC;
    \stage_in_reg_reg[1][3][3]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \stage_in_reg_reg[1][3][3]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \stage_in_reg_reg[1][6][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][6][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][7][0]\ : in STD_LOGIC;
    \stage_in_reg_reg[1][7][0]_0\ : in STD_LOGIC;
    \stage_in_reg_reg[1][7][1]\ : in STD_LOGIC;
    \stage_in_reg_reg[1][7][3]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \stage_in_reg_reg[1][7][3]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_stage_module : entity is "stage_module";
end axi_benes_Axi_lite_v1_0_0_0_stage_module;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_stage_module is
begin
\switch_instance[0].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_14
     port map (
      D(3 downto 0) => D(3 downto 0),
      Q(3 downto 0) => Q(3 downto 0),
      s00_axi_wdata(0) => s00_axi_wdata(0),
      \stage_in_reg_reg[0][0][3]\(3 downto 0) => \stage_in_reg_reg[0][0][3]\(3 downto 0),
      \stage_in_reg_reg[1][2][3]\(3 downto 0) => \stage_in_reg_reg[1][2][3]\(3 downto 0)
    );
\switch_instance[1].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_15
     port map (
      s00_axi_wdata(0) => s00_axi_wdata(1),
      \stage_in_reg_reg[0][2][3]\(3 downto 0) => \stage_in_reg_reg[0][2][3]\(3 downto 0),
      \stage_in_reg_reg[0][3][3]\(3 downto 0) => \stage_in_reg_reg[0][3][3]\(3 downto 0),
      \stage_in_reg_reg[1][3][0]\ => \stage_in_reg_reg[1][3][0]\,
      \stage_in_reg_reg[1][3][0]_0\ => \stage_in_reg_reg[1][3][0]_0\,
      \stage_in_reg_reg[1][3][1]\ => \stage_in_reg_reg[1][3][1]\,
      \stage_in_reg_reg[1][3][3]\(2 downto 0) => \stage_in_reg_reg[1][3][3]\(2 downto 0),
      \stage_in_reg_reg[1][3][3]_0\(1 downto 0) => \stage_in_reg_reg[1][3][3]_0\(1 downto 0)
    );
\switch_instance[2].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_16
     port map (
      s00_axi_wdata(0) => s00_axi_wdata(2),
      \stage_in_reg_reg[0][4][3]\(3 downto 0) => \stage_in_reg_reg[0][4][3]\(3 downto 0),
      \stage_in_reg_reg[0][5][3]\(3 downto 0) => \stage_in_reg_reg[0][5][3]\(3 downto 0),
      \stage_in_reg_reg[1][6][3]\(3 downto 0) => \stage_in_reg_reg[1][6][3]\(3 downto 0),
      \stage_in_reg_reg[1][6][3]_0\(3 downto 0) => \stage_in_reg_reg[1][6][3]_0\(3 downto 0)
    );
\switch_instance[3].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_17
     port map (
      s00_axi_wdata(0) => s00_axi_wdata(3),
      \stage_in_reg_reg[0][6][3]\(3 downto 0) => \stage_in_reg_reg[0][6][3]\(3 downto 0),
      \stage_in_reg_reg[0][7][3]\(3 downto 0) => \stage_in_reg_reg[0][7][3]\(3 downto 0),
      \stage_in_reg_reg[1][7][0]\ => \stage_in_reg_reg[1][7][0]\,
      \stage_in_reg_reg[1][7][0]_0\ => \stage_in_reg_reg[1][7][0]_0\,
      \stage_in_reg_reg[1][7][1]\ => \stage_in_reg_reg[1][7][1]\,
      \stage_in_reg_reg[1][7][3]\(2 downto 0) => \stage_in_reg_reg[1][7][3]\(2 downto 0),
      \stage_in_reg_reg[1][7][3]_0\(1 downto 0) => \stage_in_reg_reg[1][7][3]_0\(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_stage_module_0 is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][0][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][3][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][2][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][5][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][4][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][7][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[1][6][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][2][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][3][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][3][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][6][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][6][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][7][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][7][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_stage_module_0 : entity is "stage_module";
end axi_benes_Axi_lite_v1_0_0_0_stage_module_0;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_stage_module_0 is
begin
\switch_instance[0].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_10
     port map (
      D(3 downto 0) => D(3 downto 0),
      Q(3 downto 0) => Q(3 downto 0),
      s00_axi_wdata(0) => s00_axi_wdata(0),
      \stage_in_reg_reg[1][0][3]\(3 downto 0) => \stage_in_reg_reg[1][0][3]\(3 downto 0),
      \stage_in_reg_reg[2][2][3]\(3 downto 0) => \stage_in_reg_reg[2][2][3]\(3 downto 0)
    );
\switch_instance[1].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_11
     port map (
      s00_axi_wdata(0) => s00_axi_wdata(1),
      \stage_in_reg_reg[1][2][3]\(3 downto 0) => \stage_in_reg_reg[1][2][3]\(3 downto 0),
      \stage_in_reg_reg[1][3][3]\(3 downto 0) => \stage_in_reg_reg[1][3][3]\(3 downto 0),
      \stage_in_reg_reg[2][3][3]\(3 downto 0) => \stage_in_reg_reg[2][3][3]\(3 downto 0),
      \stage_in_reg_reg[2][3][3]_0\(3 downto 0) => \stage_in_reg_reg[2][3][3]_0\(3 downto 0)
    );
\switch_instance[2].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_12
     port map (
      s00_axi_wdata(0) => s00_axi_wdata(2),
      \stage_in_reg_reg[1][4][3]\(3 downto 0) => \stage_in_reg_reg[1][4][3]\(3 downto 0),
      \stage_in_reg_reg[1][5][3]\(3 downto 0) => \stage_in_reg_reg[1][5][3]\(3 downto 0),
      \stage_in_reg_reg[2][6][3]\(3 downto 0) => \stage_in_reg_reg[2][6][3]\(3 downto 0),
      \stage_in_reg_reg[2][6][3]_0\(3 downto 0) => \stage_in_reg_reg[2][6][3]_0\(3 downto 0)
    );
\switch_instance[3].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_13
     port map (
      s00_axi_wdata(0) => s00_axi_wdata(3),
      \stage_in_reg_reg[1][6][3]\(3 downto 0) => \stage_in_reg_reg[1][6][3]\(3 downto 0),
      \stage_in_reg_reg[1][7][3]\(3 downto 0) => \stage_in_reg_reg[1][7][3]\(3 downto 0),
      \stage_in_reg_reg[2][7][3]\(3 downto 0) => \stage_in_reg_reg[2][7][3]\(3 downto 0),
      \stage_in_reg_reg[2][7][3]_0\(3 downto 0) => \stage_in_reg_reg[2][7][3]_0\(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_stage_module_1 is
  port (
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][0][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][3][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][2][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][5][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][4][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][7][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[2][6][3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[3][2][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[3][6][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[3][6][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[3][3][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[3][3][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[3][7][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[3][7][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_stage_module_1 : entity is "stage_module";
end axi_benes_Axi_lite_v1_0_0_0_stage_module_1;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_stage_module_1 is
begin
\switch_instance[0].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_6
     port map (
      D(3 downto 0) => D(3 downto 0),
      Q(3 downto 0) => Q(3 downto 0),
      s00_axi_wdata(0) => s00_axi_wdata(0),
      \stage_in_reg_reg[2][0][3]\(3 downto 0) => \stage_in_reg_reg[2][0][3]\(3 downto 0),
      \stage_in_reg_reg[3][2][3]\(3 downto 0) => \stage_in_reg_reg[3][2][3]\(3 downto 0)
    );
\switch_instance[1].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_7
     port map (
      s00_axi_wdata(0) => s00_axi_wdata(1),
      \stage_in_reg_reg[2][2][3]\(3 downto 0) => \stage_in_reg_reg[2][2][3]\(3 downto 0),
      \stage_in_reg_reg[2][3][3]\(3 downto 0) => \stage_in_reg_reg[2][3][3]\(3 downto 0),
      \stage_in_reg_reg[3][6][3]\(3 downto 0) => \stage_in_reg_reg[3][6][3]\(3 downto 0),
      \stage_in_reg_reg[3][6][3]_0\(3 downto 0) => \stage_in_reg_reg[3][6][3]_0\(3 downto 0)
    );
\switch_instance[2].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_8
     port map (
      s00_axi_wdata(0) => s00_axi_wdata(2),
      \stage_in_reg_reg[2][4][3]\(3 downto 0) => \stage_in_reg_reg[2][4][3]\(3 downto 0),
      \stage_in_reg_reg[2][5][3]\(3 downto 0) => \stage_in_reg_reg[2][5][3]\(3 downto 0),
      \stage_in_reg_reg[3][3][3]\(3 downto 0) => \stage_in_reg_reg[3][3][3]\(3 downto 0),
      \stage_in_reg_reg[3][3][3]_0\(3 downto 0) => \stage_in_reg_reg[3][3][3]_0\(3 downto 0)
    );
\switch_instance[3].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_9
     port map (
      s00_axi_wdata(0) => s00_axi_wdata(3),
      \stage_in_reg_reg[2][6][3]\(3 downto 0) => \stage_in_reg_reg[2][6][3]\(3 downto 0),
      \stage_in_reg_reg[2][7][3]\(3 downto 0) => \stage_in_reg_reg[2][7][3]\(3 downto 0),
      \stage_in_reg_reg[3][7][3]\(3 downto 0) => \stage_in_reg_reg[3][7][3]\(3 downto 0),
      \stage_in_reg_reg[3][7][3]_0\(3 downto 0) => \stage_in_reg_reg[3][7][3]_0\(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_stage_module_2 is
  port (
    \stage_in_reg_reg[3][1][3]\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axi_rdata_reg[27]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axi_rdata_reg[19]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axi_rdata_reg[19]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axi_rdata_reg[11]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axi_rdata_reg[11]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axi_rdata_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \axi_rdata_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_stage_module_2 : entity is "stage_module";
end axi_benes_Axi_lite_v1_0_0_0_stage_module_2;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_stage_module_2 is
begin
\switch_instance[0].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module
     port map (
      Q(3 downto 0) => Q(3 downto 0),
      \axi_rdata_reg[27]\(3 downto 0) => \axi_rdata_reg[27]\(3 downto 0),
      s00_axi_wdata(0) => s00_axi_wdata(0),
      \stage_in_reg_reg[3][1][3]\(7 downto 0) => \stage_in_reg_reg[3][1][3]\(31 downto 24)
    );
\switch_instance[1].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_3
     port map (
      \axi_rdata_reg[19]\(3 downto 0) => \axi_rdata_reg[19]\(3 downto 0),
      \axi_rdata_reg[19]_0\(3 downto 0) => \axi_rdata_reg[19]_0\(3 downto 0),
      s00_axi_wdata(0) => s00_axi_wdata(1),
      \stage_in_reg_reg[3][3][3]\(7 downto 0) => \stage_in_reg_reg[3][1][3]\(23 downto 16)
    );
\switch_instance[2].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_4
     port map (
      \axi_rdata_reg[11]\(3 downto 0) => \axi_rdata_reg[11]\(3 downto 0),
      \axi_rdata_reg[11]_0\(3 downto 0) => \axi_rdata_reg[11]_0\(3 downto 0),
      s00_axi_wdata(0) => s00_axi_wdata(2),
      \stage_in_reg_reg[3][5][3]\(7 downto 0) => \stage_in_reg_reg[3][1][3]\(15 downto 8)
    );
\switch_instance[3].s\: entity work.axi_benes_Axi_lite_v1_0_0_0_switch_module_5
     port map (
      \axi_rdata_reg[3]\(3 downto 0) => \axi_rdata_reg[3]\(3 downto 0),
      \axi_rdata_reg[3]_0\(3 downto 0) => \axi_rdata_reg[3]_0\(3 downto 0),
      s00_axi_wdata(0) => s00_axi_wdata(3),
      \stage_in_reg_reg[3][7][3]\(7 downto 0) => \stage_in_reg_reg[3][1][3]\(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_network_module is
  port (
    \stage_in_reg_reg[3][1][3]_0\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][1][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][2][3]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 17 downto 0 );
    \stage_in_reg_reg[0][3][3]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \stage_in_reg_reg[0][3][1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \stage_in_reg_reg[0][4][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][5][3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \stage_in_reg_reg[0][6][3]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \stage_in_reg_reg[0][7][3]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_network_module : entity is "network_module";
end axi_benes_Axi_lite_v1_0_0_0_network_module;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_network_module is
  signal \stage_in_reg[0][2][0]_i_1_n_0\ : STD_LOGIC;
  signal \stage_in_reg[0][6][0]_i_1_n_0\ : STD_LOGIC;
  signal \stage_in_reg[0][7][1]_i_1_n_0\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][0][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][0][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][0][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][0][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][1][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][1][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][1][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][1][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][2][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][2][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][2][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][2][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][3][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][3][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][3][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][3][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][4][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][4][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][4][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][4][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][5][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][5][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][5][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][5][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][6][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][6][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][6][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][6][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][7][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][7][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][7][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[0][7][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][0][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][0][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][0][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][0][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][1][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][1][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][1][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][1][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][2][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][2][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][2][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][2][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][3][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][3][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][3][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][3][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][4][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][4][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][4][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][4][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][5][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][5][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][5][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][5][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][6][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][6][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][6][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][6][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][7][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][7][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][7][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[1][7][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][0][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][0][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][0][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][0][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][1][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][1][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][1][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][1][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][2][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][2][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][2][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][2][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][3][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][3][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][3][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][3][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][4][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][4][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][4][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][4][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][5][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][5][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][5][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][5][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][6][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][6][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][6][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][6][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][7][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][7][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][7][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[2][7][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][0][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][0][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][0][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][0][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][1][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][1][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][1][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][1][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][2][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][2][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][2][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][2][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][3][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][3][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][3][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][3][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][4][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][4][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][4][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][4][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][5][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][5][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][5][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][5][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][6][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][6][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][6][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][6][3]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][7][0]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][7][1]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][7][2]\ : STD_LOGIC;
  signal \stage_in_reg_reg_n_0_[3][7][3]\ : STD_LOGIC;
  signal \stage_out_reg[1][0]_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[1][1]_1\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[1][2]_2\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[1][3]_3\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[1][4]_4\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[1][5]_5\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[1][6]_6\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[1][7]_7\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[2][0]_8\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[2][1]_9\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[2][2]_10\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[2][3]_11\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[2][4]_12\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[2][5]_13\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[2][6]_14\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[2][7]_15\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[3][0]_16\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[3][1]_17\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[3][2]_18\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[3][3]_19\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[3][4]_20\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[3][5]_21\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[3][6]_22\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[3][7]_23\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \stage_in_reg[0][2][0]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \stage_in_reg[0][6][0]_i_1\ : label is "soft_lutpair90";
begin
\genblk1[1].stage_inst\: entity work.axi_benes_Axi_lite_v1_0_0_0_stage_module
     port map (
      D(3 downto 0) => \stage_out_reg[1][0]_0\(3 downto 0),
      Q(3) => \stage_in_reg_reg_n_0_[0][1][3]\,
      Q(2) => \stage_in_reg_reg_n_0_[0][1][2]\,
      Q(1) => \stage_in_reg_reg_n_0_[0][1][1]\,
      Q(0) => \stage_in_reg_reg_n_0_[0][1][0]\,
      s00_axi_wdata(3 downto 0) => s00_axi_wdata(15 downto 12),
      \stage_in_reg_reg[0][0][3]\(3 downto 0) => \stage_out_reg[1][1]_1\(3 downto 0),
      \stage_in_reg_reg[0][2][3]\(3 downto 0) => \stage_out_reg[1][3]_3\(3 downto 0),
      \stage_in_reg_reg[0][3][3]\(3 downto 0) => \stage_out_reg[1][2]_2\(3 downto 0),
      \stage_in_reg_reg[0][4][3]\(3 downto 0) => \stage_out_reg[1][5]_5\(3 downto 0),
      \stage_in_reg_reg[0][5][3]\(3 downto 0) => \stage_out_reg[1][4]_4\(3 downto 0),
      \stage_in_reg_reg[0][6][3]\(3 downto 0) => \stage_out_reg[1][7]_7\(3 downto 0),
      \stage_in_reg_reg[0][7][3]\(3 downto 0) => \stage_out_reg[1][6]_6\(3 downto 0),
      \stage_in_reg_reg[1][2][3]\(3) => \stage_in_reg_reg_n_0_[0][0][3]\,
      \stage_in_reg_reg[1][2][3]\(2) => \stage_in_reg_reg_n_0_[0][0][2]\,
      \stage_in_reg_reg[1][2][3]\(1) => \stage_in_reg_reg_n_0_[0][0][1]\,
      \stage_in_reg_reg[1][2][3]\(0) => \stage_in_reg_reg_n_0_[0][0][0]\,
      \stage_in_reg_reg[1][3][0]\ => \stage_in_reg_reg_n_0_[0][3][0]\,
      \stage_in_reg_reg[1][3][0]_0\ => \stage_in_reg_reg_n_0_[0][2][0]\,
      \stage_in_reg_reg[1][3][1]\ => \stage_in_reg_reg_n_0_[0][3][1]\,
      \stage_in_reg_reg[1][3][3]\(2) => \stage_in_reg_reg_n_0_[0][2][3]\,
      \stage_in_reg_reg[1][3][3]\(1) => \stage_in_reg_reg_n_0_[0][2][2]\,
      \stage_in_reg_reg[1][3][3]\(0) => \stage_in_reg_reg_n_0_[0][2][1]\,
      \stage_in_reg_reg[1][3][3]_0\(1) => \stage_in_reg_reg_n_0_[0][3][3]\,
      \stage_in_reg_reg[1][3][3]_0\(0) => \stage_in_reg_reg_n_0_[0][3][2]\,
      \stage_in_reg_reg[1][6][3]\(3) => \stage_in_reg_reg_n_0_[0][5][3]\,
      \stage_in_reg_reg[1][6][3]\(2) => \stage_in_reg_reg_n_0_[0][5][2]\,
      \stage_in_reg_reg[1][6][3]\(1) => \stage_in_reg_reg_n_0_[0][5][1]\,
      \stage_in_reg_reg[1][6][3]\(0) => \stage_in_reg_reg_n_0_[0][5][0]\,
      \stage_in_reg_reg[1][6][3]_0\(3) => \stage_in_reg_reg_n_0_[0][4][3]\,
      \stage_in_reg_reg[1][6][3]_0\(2) => \stage_in_reg_reg_n_0_[0][4][2]\,
      \stage_in_reg_reg[1][6][3]_0\(1) => \stage_in_reg_reg_n_0_[0][4][1]\,
      \stage_in_reg_reg[1][6][3]_0\(0) => \stage_in_reg_reg_n_0_[0][4][0]\,
      \stage_in_reg_reg[1][7][0]\ => \stage_in_reg_reg_n_0_[0][7][0]\,
      \stage_in_reg_reg[1][7][0]_0\ => \stage_in_reg_reg_n_0_[0][6][0]\,
      \stage_in_reg_reg[1][7][1]\ => \stage_in_reg_reg_n_0_[0][7][1]\,
      \stage_in_reg_reg[1][7][3]\(2) => \stage_in_reg_reg_n_0_[0][6][3]\,
      \stage_in_reg_reg[1][7][3]\(1) => \stage_in_reg_reg_n_0_[0][6][2]\,
      \stage_in_reg_reg[1][7][3]\(0) => \stage_in_reg_reg_n_0_[0][6][1]\,
      \stage_in_reg_reg[1][7][3]_0\(1) => \stage_in_reg_reg_n_0_[0][7][3]\,
      \stage_in_reg_reg[1][7][3]_0\(0) => \stage_in_reg_reg_n_0_[0][7][2]\
    );
\genblk1[2].stage_inst\: entity work.axi_benes_Axi_lite_v1_0_0_0_stage_module_0
     port map (
      D(3 downto 0) => \stage_out_reg[2][0]_8\(3 downto 0),
      Q(3) => \stage_in_reg_reg_n_0_[1][1][3]\,
      Q(2) => \stage_in_reg_reg_n_0_[1][1][2]\,
      Q(1) => \stage_in_reg_reg_n_0_[1][1][1]\,
      Q(0) => \stage_in_reg_reg_n_0_[1][1][0]\,
      s00_axi_wdata(3 downto 0) => s00_axi_wdata(11 downto 8),
      \stage_in_reg_reg[1][0][3]\(3 downto 0) => \stage_out_reg[2][1]_9\(3 downto 0),
      \stage_in_reg_reg[1][2][3]\(3 downto 0) => \stage_out_reg[2][3]_11\(3 downto 0),
      \stage_in_reg_reg[1][3][3]\(3 downto 0) => \stage_out_reg[2][2]_10\(3 downto 0),
      \stage_in_reg_reg[1][4][3]\(3 downto 0) => \stage_out_reg[2][5]_13\(3 downto 0),
      \stage_in_reg_reg[1][5][3]\(3 downto 0) => \stage_out_reg[2][4]_12\(3 downto 0),
      \stage_in_reg_reg[1][6][3]\(3 downto 0) => \stage_out_reg[2][7]_15\(3 downto 0),
      \stage_in_reg_reg[1][7][3]\(3 downto 0) => \stage_out_reg[2][6]_14\(3 downto 0),
      \stage_in_reg_reg[2][2][3]\(3) => \stage_in_reg_reg_n_0_[1][0][3]\,
      \stage_in_reg_reg[2][2][3]\(2) => \stage_in_reg_reg_n_0_[1][0][2]\,
      \stage_in_reg_reg[2][2][3]\(1) => \stage_in_reg_reg_n_0_[1][0][1]\,
      \stage_in_reg_reg[2][2][3]\(0) => \stage_in_reg_reg_n_0_[1][0][0]\,
      \stage_in_reg_reg[2][3][3]\(3) => \stage_in_reg_reg_n_0_[1][3][3]\,
      \stage_in_reg_reg[2][3][3]\(2) => \stage_in_reg_reg_n_0_[1][3][2]\,
      \stage_in_reg_reg[2][3][3]\(1) => \stage_in_reg_reg_n_0_[1][3][1]\,
      \stage_in_reg_reg[2][3][3]\(0) => \stage_in_reg_reg_n_0_[1][3][0]\,
      \stage_in_reg_reg[2][3][3]_0\(3) => \stage_in_reg_reg_n_0_[1][2][3]\,
      \stage_in_reg_reg[2][3][3]_0\(2) => \stage_in_reg_reg_n_0_[1][2][2]\,
      \stage_in_reg_reg[2][3][3]_0\(1) => \stage_in_reg_reg_n_0_[1][2][1]\,
      \stage_in_reg_reg[2][3][3]_0\(0) => \stage_in_reg_reg_n_0_[1][2][0]\,
      \stage_in_reg_reg[2][6][3]\(3) => \stage_in_reg_reg_n_0_[1][5][3]\,
      \stage_in_reg_reg[2][6][3]\(2) => \stage_in_reg_reg_n_0_[1][5][2]\,
      \stage_in_reg_reg[2][6][3]\(1) => \stage_in_reg_reg_n_0_[1][5][1]\,
      \stage_in_reg_reg[2][6][3]\(0) => \stage_in_reg_reg_n_0_[1][5][0]\,
      \stage_in_reg_reg[2][6][3]_0\(3) => \stage_in_reg_reg_n_0_[1][4][3]\,
      \stage_in_reg_reg[2][6][3]_0\(2) => \stage_in_reg_reg_n_0_[1][4][2]\,
      \stage_in_reg_reg[2][6][3]_0\(1) => \stage_in_reg_reg_n_0_[1][4][1]\,
      \stage_in_reg_reg[2][6][3]_0\(0) => \stage_in_reg_reg_n_0_[1][4][0]\,
      \stage_in_reg_reg[2][7][3]\(3) => \stage_in_reg_reg_n_0_[1][7][3]\,
      \stage_in_reg_reg[2][7][3]\(2) => \stage_in_reg_reg_n_0_[1][7][2]\,
      \stage_in_reg_reg[2][7][3]\(1) => \stage_in_reg_reg_n_0_[1][7][1]\,
      \stage_in_reg_reg[2][7][3]\(0) => \stage_in_reg_reg_n_0_[1][7][0]\,
      \stage_in_reg_reg[2][7][3]_0\(3) => \stage_in_reg_reg_n_0_[1][6][3]\,
      \stage_in_reg_reg[2][7][3]_0\(2) => \stage_in_reg_reg_n_0_[1][6][2]\,
      \stage_in_reg_reg[2][7][3]_0\(1) => \stage_in_reg_reg_n_0_[1][6][1]\,
      \stage_in_reg_reg[2][7][3]_0\(0) => \stage_in_reg_reg_n_0_[1][6][0]\
    );
\genblk1[3].stage_inst\: entity work.axi_benes_Axi_lite_v1_0_0_0_stage_module_1
     port map (
      D(3 downto 0) => \stage_out_reg[3][0]_16\(3 downto 0),
      Q(3) => \stage_in_reg_reg_n_0_[2][1][3]\,
      Q(2) => \stage_in_reg_reg_n_0_[2][1][2]\,
      Q(1) => \stage_in_reg_reg_n_0_[2][1][1]\,
      Q(0) => \stage_in_reg_reg_n_0_[2][1][0]\,
      s00_axi_wdata(3 downto 0) => s00_axi_wdata(7 downto 4),
      \stage_in_reg_reg[2][0][3]\(3 downto 0) => \stage_out_reg[3][1]_17\(3 downto 0),
      \stage_in_reg_reg[2][2][3]\(3 downto 0) => \stage_out_reg[3][3]_19\(3 downto 0),
      \stage_in_reg_reg[2][3][3]\(3 downto 0) => \stage_out_reg[3][2]_18\(3 downto 0),
      \stage_in_reg_reg[2][4][3]\(3 downto 0) => \stage_out_reg[3][5]_21\(3 downto 0),
      \stage_in_reg_reg[2][5][3]\(3 downto 0) => \stage_out_reg[3][4]_20\(3 downto 0),
      \stage_in_reg_reg[2][6][3]\(3 downto 0) => \stage_out_reg[3][7]_23\(3 downto 0),
      \stage_in_reg_reg[2][7][3]\(3 downto 0) => \stage_out_reg[3][6]_22\(3 downto 0),
      \stage_in_reg_reg[3][2][3]\(3) => \stage_in_reg_reg_n_0_[2][0][3]\,
      \stage_in_reg_reg[3][2][3]\(2) => \stage_in_reg_reg_n_0_[2][0][2]\,
      \stage_in_reg_reg[3][2][3]\(1) => \stage_in_reg_reg_n_0_[2][0][1]\,
      \stage_in_reg_reg[3][2][3]\(0) => \stage_in_reg_reg_n_0_[2][0][0]\,
      \stage_in_reg_reg[3][3][3]\(3) => \stage_in_reg_reg_n_0_[2][5][3]\,
      \stage_in_reg_reg[3][3][3]\(2) => \stage_in_reg_reg_n_0_[2][5][2]\,
      \stage_in_reg_reg[3][3][3]\(1) => \stage_in_reg_reg_n_0_[2][5][1]\,
      \stage_in_reg_reg[3][3][3]\(0) => \stage_in_reg_reg_n_0_[2][5][0]\,
      \stage_in_reg_reg[3][3][3]_0\(3) => \stage_in_reg_reg_n_0_[2][4][3]\,
      \stage_in_reg_reg[3][3][3]_0\(2) => \stage_in_reg_reg_n_0_[2][4][2]\,
      \stage_in_reg_reg[3][3][3]_0\(1) => \stage_in_reg_reg_n_0_[2][4][1]\,
      \stage_in_reg_reg[3][3][3]_0\(0) => \stage_in_reg_reg_n_0_[2][4][0]\,
      \stage_in_reg_reg[3][6][3]\(3) => \stage_in_reg_reg_n_0_[2][3][3]\,
      \stage_in_reg_reg[3][6][3]\(2) => \stage_in_reg_reg_n_0_[2][3][2]\,
      \stage_in_reg_reg[3][6][3]\(1) => \stage_in_reg_reg_n_0_[2][3][1]\,
      \stage_in_reg_reg[3][6][3]\(0) => \stage_in_reg_reg_n_0_[2][3][0]\,
      \stage_in_reg_reg[3][6][3]_0\(3) => \stage_in_reg_reg_n_0_[2][2][3]\,
      \stage_in_reg_reg[3][6][3]_0\(2) => \stage_in_reg_reg_n_0_[2][2][2]\,
      \stage_in_reg_reg[3][6][3]_0\(1) => \stage_in_reg_reg_n_0_[2][2][1]\,
      \stage_in_reg_reg[3][6][3]_0\(0) => \stage_in_reg_reg_n_0_[2][2][0]\,
      \stage_in_reg_reg[3][7][3]\(3) => \stage_in_reg_reg_n_0_[2][7][3]\,
      \stage_in_reg_reg[3][7][3]\(2) => \stage_in_reg_reg_n_0_[2][7][2]\,
      \stage_in_reg_reg[3][7][3]\(1) => \stage_in_reg_reg_n_0_[2][7][1]\,
      \stage_in_reg_reg[3][7][3]\(0) => \stage_in_reg_reg_n_0_[2][7][0]\,
      \stage_in_reg_reg[3][7][3]_0\(3) => \stage_in_reg_reg_n_0_[2][6][3]\,
      \stage_in_reg_reg[3][7][3]_0\(2) => \stage_in_reg_reg_n_0_[2][6][2]\,
      \stage_in_reg_reg[3][7][3]_0\(1) => \stage_in_reg_reg_n_0_[2][6][1]\,
      \stage_in_reg_reg[3][7][3]_0\(0) => \stage_in_reg_reg_n_0_[2][6][0]\
    );
stage_8: entity work.axi_benes_Axi_lite_v1_0_0_0_stage_module_2
     port map (
      Q(3) => \stage_in_reg_reg_n_0_[3][1][3]\,
      Q(2) => \stage_in_reg_reg_n_0_[3][1][2]\,
      Q(1) => \stage_in_reg_reg_n_0_[3][1][1]\,
      Q(0) => \stage_in_reg_reg_n_0_[3][1][0]\,
      \axi_rdata_reg[11]\(3) => \stage_in_reg_reg_n_0_[3][5][3]\,
      \axi_rdata_reg[11]\(2) => \stage_in_reg_reg_n_0_[3][5][2]\,
      \axi_rdata_reg[11]\(1) => \stage_in_reg_reg_n_0_[3][5][1]\,
      \axi_rdata_reg[11]\(0) => \stage_in_reg_reg_n_0_[3][5][0]\,
      \axi_rdata_reg[11]_0\(3) => \stage_in_reg_reg_n_0_[3][4][3]\,
      \axi_rdata_reg[11]_0\(2) => \stage_in_reg_reg_n_0_[3][4][2]\,
      \axi_rdata_reg[11]_0\(1) => \stage_in_reg_reg_n_0_[3][4][1]\,
      \axi_rdata_reg[11]_0\(0) => \stage_in_reg_reg_n_0_[3][4][0]\,
      \axi_rdata_reg[19]\(3) => \stage_in_reg_reg_n_0_[3][3][3]\,
      \axi_rdata_reg[19]\(2) => \stage_in_reg_reg_n_0_[3][3][2]\,
      \axi_rdata_reg[19]\(1) => \stage_in_reg_reg_n_0_[3][3][1]\,
      \axi_rdata_reg[19]\(0) => \stage_in_reg_reg_n_0_[3][3][0]\,
      \axi_rdata_reg[19]_0\(3) => \stage_in_reg_reg_n_0_[3][2][3]\,
      \axi_rdata_reg[19]_0\(2) => \stage_in_reg_reg_n_0_[3][2][2]\,
      \axi_rdata_reg[19]_0\(1) => \stage_in_reg_reg_n_0_[3][2][1]\,
      \axi_rdata_reg[19]_0\(0) => \stage_in_reg_reg_n_0_[3][2][0]\,
      \axi_rdata_reg[27]\(3) => \stage_in_reg_reg_n_0_[3][0][3]\,
      \axi_rdata_reg[27]\(2) => \stage_in_reg_reg_n_0_[3][0][2]\,
      \axi_rdata_reg[27]\(1) => \stage_in_reg_reg_n_0_[3][0][1]\,
      \axi_rdata_reg[27]\(0) => \stage_in_reg_reg_n_0_[3][0][0]\,
      \axi_rdata_reg[3]\(3) => \stage_in_reg_reg_n_0_[3][7][3]\,
      \axi_rdata_reg[3]\(2) => \stage_in_reg_reg_n_0_[3][7][2]\,
      \axi_rdata_reg[3]\(1) => \stage_in_reg_reg_n_0_[3][7][1]\,
      \axi_rdata_reg[3]\(0) => \stage_in_reg_reg_n_0_[3][7][0]\,
      \axi_rdata_reg[3]_0\(3) => \stage_in_reg_reg_n_0_[3][6][3]\,
      \axi_rdata_reg[3]_0\(2) => \stage_in_reg_reg_n_0_[3][6][2]\,
      \axi_rdata_reg[3]_0\(1) => \stage_in_reg_reg_n_0_[3][6][1]\,
      \axi_rdata_reg[3]_0\(0) => \stage_in_reg_reg_n_0_[3][6][0]\,
      s00_axi_wdata(3 downto 0) => s00_axi_wdata(3 downto 0),
      \stage_in_reg_reg[3][1][3]\(31 downto 0) => \stage_in_reg_reg[3][1][3]_0\(31 downto 0)
    );
\stage_in_reg[0][2][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Q(0),
      I1 => s00_axi_wdata(16),
      O => \stage_in_reg[0][2][0]_i_1_n_0\
    );
\stage_in_reg[0][6][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => Q(0),
      I1 => s00_axi_wdata(16),
      O => \stage_in_reg[0][6][0]_i_1_n_0\
    );
\stage_in_reg[0][7][1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_wdata(17),
      O => \stage_in_reg[0][7][1]_i_1_n_0\
    );
\stage_in_reg_reg[0][0][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(0),
      Q => \stage_in_reg_reg_n_0_[0][0][0]\,
      R => '0'
    );
\stage_in_reg_reg[0][0][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(1),
      Q => \stage_in_reg_reg_n_0_[0][0][1]\,
      R => '0'
    );
\stage_in_reg_reg[0][0][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(2),
      Q => \stage_in_reg_reg_n_0_[0][0][2]\,
      R => '0'
    );
\stage_in_reg_reg[0][0][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => D(3),
      Q => \stage_in_reg_reg_n_0_[0][0][3]\,
      R => '0'
    );
\stage_in_reg_reg[0][1][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][1][3]_0\(0),
      Q => \stage_in_reg_reg_n_0_[0][1][0]\,
      R => '0'
    );
\stage_in_reg_reg[0][1][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][1][3]_0\(1),
      Q => \stage_in_reg_reg_n_0_[0][1][1]\,
      R => '0'
    );
\stage_in_reg_reg[0][1][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][1][3]_0\(2),
      Q => \stage_in_reg_reg_n_0_[0][1][2]\,
      R => '0'
    );
\stage_in_reg_reg[0][1][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][1][3]_0\(3),
      Q => \stage_in_reg_reg_n_0_[0][1][3]\,
      R => '0'
    );
\stage_in_reg_reg[0][2][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg[0][2][0]_i_1_n_0\,
      Q => \stage_in_reg_reg_n_0_[0][2][0]\,
      R => '0'
    );
\stage_in_reg_reg[0][2][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][2][3]_0\(0),
      Q => \stage_in_reg_reg_n_0_[0][2][1]\,
      R => '0'
    );
\stage_in_reg_reg[0][2][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][2][3]_0\(1),
      Q => \stage_in_reg_reg_n_0_[0][2][2]\,
      R => '0'
    );
\stage_in_reg_reg[0][2][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][2][3]_0\(2),
      Q => \stage_in_reg_reg_n_0_[0][2][3]\,
      R => '0'
    );
\stage_in_reg_reg[0][3][0]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][3][1]_0\(0),
      Q => \stage_in_reg_reg_n_0_[0][3][0]\,
      S => s00_axi_wdata(17)
    );
\stage_in_reg_reg[0][3][1]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][3][1]_0\(1),
      Q => \stage_in_reg_reg_n_0_[0][3][1]\,
      S => s00_axi_wdata(17)
    );
\stage_in_reg_reg[0][3][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][3][3]_0\(0),
      Q => \stage_in_reg_reg_n_0_[0][3][2]\,
      R => '0'
    );
\stage_in_reg_reg[0][3][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][3][3]_0\(1),
      Q => \stage_in_reg_reg_n_0_[0][3][3]\,
      R => '0'
    );
\stage_in_reg_reg[0][4][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][4][3]_0\(0),
      Q => \stage_in_reg_reg_n_0_[0][4][0]\,
      R => '0'
    );
\stage_in_reg_reg[0][4][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][4][3]_0\(1),
      Q => \stage_in_reg_reg_n_0_[0][4][1]\,
      R => '0'
    );
\stage_in_reg_reg[0][4][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][4][3]_0\(2),
      Q => \stage_in_reg_reg_n_0_[0][4][2]\,
      R => '0'
    );
\stage_in_reg_reg[0][4][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][4][3]_0\(3),
      Q => \stage_in_reg_reg_n_0_[0][4][3]\,
      R => '0'
    );
\stage_in_reg_reg[0][5][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][5][3]_0\(0),
      Q => \stage_in_reg_reg_n_0_[0][5][0]\,
      R => '0'
    );
\stage_in_reg_reg[0][5][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][5][3]_0\(1),
      Q => \stage_in_reg_reg_n_0_[0][5][1]\,
      R => '0'
    );
\stage_in_reg_reg[0][5][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][5][3]_0\(2),
      Q => \stage_in_reg_reg_n_0_[0][5][2]\,
      R => '0'
    );
\stage_in_reg_reg[0][5][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][5][3]_0\(3),
      Q => \stage_in_reg_reg_n_0_[0][5][3]\,
      R => '0'
    );
\stage_in_reg_reg[0][6][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg[0][6][0]_i_1_n_0\,
      Q => \stage_in_reg_reg_n_0_[0][6][0]\,
      R => '0'
    );
\stage_in_reg_reg[0][6][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][6][3]_0\(0),
      Q => \stage_in_reg_reg_n_0_[0][6][1]\,
      R => '0'
    );
\stage_in_reg_reg[0][6][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][6][3]_0\(1),
      Q => \stage_in_reg_reg_n_0_[0][6][2]\,
      R => '0'
    );
\stage_in_reg_reg[0][6][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][6][3]_0\(2),
      Q => \stage_in_reg_reg_n_0_[0][6][3]\,
      R => '0'
    );
\stage_in_reg_reg[0][7][0]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][3][1]_0\(0),
      Q => \stage_in_reg_reg_n_0_[0][7][0]\,
      S => \stage_in_reg[0][7][1]_i_1_n_0\
    );
\stage_in_reg_reg[0][7][1]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][3][1]_0\(1),
      Q => \stage_in_reg_reg_n_0_[0][7][1]\,
      S => \stage_in_reg[0][7][1]_i_1_n_0\
    );
\stage_in_reg_reg[0][7][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][7][3]_0\(0),
      Q => \stage_in_reg_reg_n_0_[0][7][2]\,
      R => '0'
    );
\stage_in_reg_reg[0][7][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_in_reg_reg[0][7][3]_0\(1),
      Q => \stage_in_reg_reg_n_0_[0][7][3]\,
      R => '0'
    );
\stage_in_reg_reg[1][0][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][0]_0\(0),
      Q => \stage_in_reg_reg_n_0_[1][0][0]\,
      R => '0'
    );
\stage_in_reg_reg[1][0][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][0]_0\(1),
      Q => \stage_in_reg_reg_n_0_[1][0][1]\,
      R => '0'
    );
\stage_in_reg_reg[1][0][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][0]_0\(2),
      Q => \stage_in_reg_reg_n_0_[1][0][2]\,
      R => '0'
    );
\stage_in_reg_reg[1][0][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][0]_0\(3),
      Q => \stage_in_reg_reg_n_0_[1][0][3]\,
      R => '0'
    );
\stage_in_reg_reg[1][1][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][2]_2\(0),
      Q => \stage_in_reg_reg_n_0_[1][1][0]\,
      R => '0'
    );
\stage_in_reg_reg[1][1][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][2]_2\(1),
      Q => \stage_in_reg_reg_n_0_[1][1][1]\,
      R => '0'
    );
\stage_in_reg_reg[1][1][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][2]_2\(2),
      Q => \stage_in_reg_reg_n_0_[1][1][2]\,
      R => '0'
    );
\stage_in_reg_reg[1][1][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][2]_2\(3),
      Q => \stage_in_reg_reg_n_0_[1][1][3]\,
      R => '0'
    );
\stage_in_reg_reg[1][2][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][1]_1\(0),
      Q => \stage_in_reg_reg_n_0_[1][2][0]\,
      R => '0'
    );
\stage_in_reg_reg[1][2][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][1]_1\(1),
      Q => \stage_in_reg_reg_n_0_[1][2][1]\,
      R => '0'
    );
\stage_in_reg_reg[1][2][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][1]_1\(2),
      Q => \stage_in_reg_reg_n_0_[1][2][2]\,
      R => '0'
    );
\stage_in_reg_reg[1][2][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][1]_1\(3),
      Q => \stage_in_reg_reg_n_0_[1][2][3]\,
      R => '0'
    );
\stage_in_reg_reg[1][3][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][3]_3\(0),
      Q => \stage_in_reg_reg_n_0_[1][3][0]\,
      R => '0'
    );
\stage_in_reg_reg[1][3][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][3]_3\(1),
      Q => \stage_in_reg_reg_n_0_[1][3][1]\,
      R => '0'
    );
\stage_in_reg_reg[1][3][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][3]_3\(2),
      Q => \stage_in_reg_reg_n_0_[1][3][2]\,
      R => '0'
    );
\stage_in_reg_reg[1][3][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][3]_3\(3),
      Q => \stage_in_reg_reg_n_0_[1][3][3]\,
      R => '0'
    );
\stage_in_reg_reg[1][4][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][4]_4\(0),
      Q => \stage_in_reg_reg_n_0_[1][4][0]\,
      R => '0'
    );
\stage_in_reg_reg[1][4][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][4]_4\(1),
      Q => \stage_in_reg_reg_n_0_[1][4][1]\,
      R => '0'
    );
\stage_in_reg_reg[1][4][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][4]_4\(2),
      Q => \stage_in_reg_reg_n_0_[1][4][2]\,
      R => '0'
    );
\stage_in_reg_reg[1][4][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][4]_4\(3),
      Q => \stage_in_reg_reg_n_0_[1][4][3]\,
      R => '0'
    );
\stage_in_reg_reg[1][5][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][6]_6\(0),
      Q => \stage_in_reg_reg_n_0_[1][5][0]\,
      R => '0'
    );
\stage_in_reg_reg[1][5][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][6]_6\(1),
      Q => \stage_in_reg_reg_n_0_[1][5][1]\,
      R => '0'
    );
\stage_in_reg_reg[1][5][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][6]_6\(2),
      Q => \stage_in_reg_reg_n_0_[1][5][2]\,
      R => '0'
    );
\stage_in_reg_reg[1][5][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][6]_6\(3),
      Q => \stage_in_reg_reg_n_0_[1][5][3]\,
      R => '0'
    );
\stage_in_reg_reg[1][6][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][5]_5\(0),
      Q => \stage_in_reg_reg_n_0_[1][6][0]\,
      R => '0'
    );
\stage_in_reg_reg[1][6][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][5]_5\(1),
      Q => \stage_in_reg_reg_n_0_[1][6][1]\,
      R => '0'
    );
\stage_in_reg_reg[1][6][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][5]_5\(2),
      Q => \stage_in_reg_reg_n_0_[1][6][2]\,
      R => '0'
    );
\stage_in_reg_reg[1][6][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][5]_5\(3),
      Q => \stage_in_reg_reg_n_0_[1][6][3]\,
      R => '0'
    );
\stage_in_reg_reg[1][7][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][7]_7\(0),
      Q => \stage_in_reg_reg_n_0_[1][7][0]\,
      R => '0'
    );
\stage_in_reg_reg[1][7][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][7]_7\(1),
      Q => \stage_in_reg_reg_n_0_[1][7][1]\,
      R => '0'
    );
\stage_in_reg_reg[1][7][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][7]_7\(2),
      Q => \stage_in_reg_reg_n_0_[1][7][2]\,
      R => '0'
    );
\stage_in_reg_reg[1][7][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[1][7]_7\(3),
      Q => \stage_in_reg_reg_n_0_[1][7][3]\,
      R => '0'
    );
\stage_in_reg_reg[2][0][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][0]_8\(0),
      Q => \stage_in_reg_reg_n_0_[2][0][0]\,
      R => '0'
    );
\stage_in_reg_reg[2][0][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][0]_8\(1),
      Q => \stage_in_reg_reg_n_0_[2][0][1]\,
      R => '0'
    );
\stage_in_reg_reg[2][0][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][0]_8\(2),
      Q => \stage_in_reg_reg_n_0_[2][0][2]\,
      R => '0'
    );
\stage_in_reg_reg[2][0][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][0]_8\(3),
      Q => \stage_in_reg_reg_n_0_[2][0][3]\,
      R => '0'
    );
\stage_in_reg_reg[2][1][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][2]_10\(0),
      Q => \stage_in_reg_reg_n_0_[2][1][0]\,
      R => '0'
    );
\stage_in_reg_reg[2][1][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][2]_10\(1),
      Q => \stage_in_reg_reg_n_0_[2][1][1]\,
      R => '0'
    );
\stage_in_reg_reg[2][1][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][2]_10\(2),
      Q => \stage_in_reg_reg_n_0_[2][1][2]\,
      R => '0'
    );
\stage_in_reg_reg[2][1][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][2]_10\(3),
      Q => \stage_in_reg_reg_n_0_[2][1][3]\,
      R => '0'
    );
\stage_in_reg_reg[2][2][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][1]_9\(0),
      Q => \stage_in_reg_reg_n_0_[2][2][0]\,
      R => '0'
    );
\stage_in_reg_reg[2][2][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][1]_9\(1),
      Q => \stage_in_reg_reg_n_0_[2][2][1]\,
      R => '0'
    );
\stage_in_reg_reg[2][2][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][1]_9\(2),
      Q => \stage_in_reg_reg_n_0_[2][2][2]\,
      R => '0'
    );
\stage_in_reg_reg[2][2][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][1]_9\(3),
      Q => \stage_in_reg_reg_n_0_[2][2][3]\,
      R => '0'
    );
\stage_in_reg_reg[2][3][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][3]_11\(0),
      Q => \stage_in_reg_reg_n_0_[2][3][0]\,
      R => '0'
    );
\stage_in_reg_reg[2][3][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][3]_11\(1),
      Q => \stage_in_reg_reg_n_0_[2][3][1]\,
      R => '0'
    );
\stage_in_reg_reg[2][3][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][3]_11\(2),
      Q => \stage_in_reg_reg_n_0_[2][3][2]\,
      R => '0'
    );
\stage_in_reg_reg[2][3][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][3]_11\(3),
      Q => \stage_in_reg_reg_n_0_[2][3][3]\,
      R => '0'
    );
\stage_in_reg_reg[2][4][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][4]_12\(0),
      Q => \stage_in_reg_reg_n_0_[2][4][0]\,
      R => '0'
    );
\stage_in_reg_reg[2][4][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][4]_12\(1),
      Q => \stage_in_reg_reg_n_0_[2][4][1]\,
      R => '0'
    );
\stage_in_reg_reg[2][4][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][4]_12\(2),
      Q => \stage_in_reg_reg_n_0_[2][4][2]\,
      R => '0'
    );
\stage_in_reg_reg[2][4][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][4]_12\(3),
      Q => \stage_in_reg_reg_n_0_[2][4][3]\,
      R => '0'
    );
\stage_in_reg_reg[2][5][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][6]_14\(0),
      Q => \stage_in_reg_reg_n_0_[2][5][0]\,
      R => '0'
    );
\stage_in_reg_reg[2][5][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][6]_14\(1),
      Q => \stage_in_reg_reg_n_0_[2][5][1]\,
      R => '0'
    );
\stage_in_reg_reg[2][5][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][6]_14\(2),
      Q => \stage_in_reg_reg_n_0_[2][5][2]\,
      R => '0'
    );
\stage_in_reg_reg[2][5][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][6]_14\(3),
      Q => \stage_in_reg_reg_n_0_[2][5][3]\,
      R => '0'
    );
\stage_in_reg_reg[2][6][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][5]_13\(0),
      Q => \stage_in_reg_reg_n_0_[2][6][0]\,
      R => '0'
    );
\stage_in_reg_reg[2][6][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][5]_13\(1),
      Q => \stage_in_reg_reg_n_0_[2][6][1]\,
      R => '0'
    );
\stage_in_reg_reg[2][6][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][5]_13\(2),
      Q => \stage_in_reg_reg_n_0_[2][6][2]\,
      R => '0'
    );
\stage_in_reg_reg[2][6][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][5]_13\(3),
      Q => \stage_in_reg_reg_n_0_[2][6][3]\,
      R => '0'
    );
\stage_in_reg_reg[2][7][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][7]_15\(0),
      Q => \stage_in_reg_reg_n_0_[2][7][0]\,
      R => '0'
    );
\stage_in_reg_reg[2][7][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][7]_15\(1),
      Q => \stage_in_reg_reg_n_0_[2][7][1]\,
      R => '0'
    );
\stage_in_reg_reg[2][7][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][7]_15\(2),
      Q => \stage_in_reg_reg_n_0_[2][7][2]\,
      R => '0'
    );
\stage_in_reg_reg[2][7][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[2][7]_15\(3),
      Q => \stage_in_reg_reg_n_0_[2][7][3]\,
      R => '0'
    );
\stage_in_reg_reg[3][0][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][0]_16\(0),
      Q => \stage_in_reg_reg_n_0_[3][0][0]\,
      R => '0'
    );
\stage_in_reg_reg[3][0][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][0]_16\(1),
      Q => \stage_in_reg_reg_n_0_[3][0][1]\,
      R => '0'
    );
\stage_in_reg_reg[3][0][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][0]_16\(2),
      Q => \stage_in_reg_reg_n_0_[3][0][2]\,
      R => '0'
    );
\stage_in_reg_reg[3][0][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][0]_16\(3),
      Q => \stage_in_reg_reg_n_0_[3][0][3]\,
      R => '0'
    );
\stage_in_reg_reg[3][1][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][4]_20\(0),
      Q => \stage_in_reg_reg_n_0_[3][1][0]\,
      R => '0'
    );
\stage_in_reg_reg[3][1][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][4]_20\(1),
      Q => \stage_in_reg_reg_n_0_[3][1][1]\,
      R => '0'
    );
\stage_in_reg_reg[3][1][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][4]_20\(2),
      Q => \stage_in_reg_reg_n_0_[3][1][2]\,
      R => '0'
    );
\stage_in_reg_reg[3][1][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][4]_20\(3),
      Q => \stage_in_reg_reg_n_0_[3][1][3]\,
      R => '0'
    );
\stage_in_reg_reg[3][2][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][1]_17\(0),
      Q => \stage_in_reg_reg_n_0_[3][2][0]\,
      R => '0'
    );
\stage_in_reg_reg[3][2][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][1]_17\(1),
      Q => \stage_in_reg_reg_n_0_[3][2][1]\,
      R => '0'
    );
\stage_in_reg_reg[3][2][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][1]_17\(2),
      Q => \stage_in_reg_reg_n_0_[3][2][2]\,
      R => '0'
    );
\stage_in_reg_reg[3][2][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][1]_17\(3),
      Q => \stage_in_reg_reg_n_0_[3][2][3]\,
      R => '0'
    );
\stage_in_reg_reg[3][3][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][5]_21\(0),
      Q => \stage_in_reg_reg_n_0_[3][3][0]\,
      R => '0'
    );
\stage_in_reg_reg[3][3][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][5]_21\(1),
      Q => \stage_in_reg_reg_n_0_[3][3][1]\,
      R => '0'
    );
\stage_in_reg_reg[3][3][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][5]_21\(2),
      Q => \stage_in_reg_reg_n_0_[3][3][2]\,
      R => '0'
    );
\stage_in_reg_reg[3][3][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][5]_21\(3),
      Q => \stage_in_reg_reg_n_0_[3][3][3]\,
      R => '0'
    );
\stage_in_reg_reg[3][4][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][2]_18\(0),
      Q => \stage_in_reg_reg_n_0_[3][4][0]\,
      R => '0'
    );
\stage_in_reg_reg[3][4][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][2]_18\(1),
      Q => \stage_in_reg_reg_n_0_[3][4][1]\,
      R => '0'
    );
\stage_in_reg_reg[3][4][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][2]_18\(2),
      Q => \stage_in_reg_reg_n_0_[3][4][2]\,
      R => '0'
    );
\stage_in_reg_reg[3][4][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][2]_18\(3),
      Q => \stage_in_reg_reg_n_0_[3][4][3]\,
      R => '0'
    );
\stage_in_reg_reg[3][5][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][6]_22\(0),
      Q => \stage_in_reg_reg_n_0_[3][5][0]\,
      R => '0'
    );
\stage_in_reg_reg[3][5][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][6]_22\(1),
      Q => \stage_in_reg_reg_n_0_[3][5][1]\,
      R => '0'
    );
\stage_in_reg_reg[3][5][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][6]_22\(2),
      Q => \stage_in_reg_reg_n_0_[3][5][2]\,
      R => '0'
    );
\stage_in_reg_reg[3][5][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][6]_22\(3),
      Q => \stage_in_reg_reg_n_0_[3][5][3]\,
      R => '0'
    );
\stage_in_reg_reg[3][6][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][3]_19\(0),
      Q => \stage_in_reg_reg_n_0_[3][6][0]\,
      R => '0'
    );
\stage_in_reg_reg[3][6][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][3]_19\(1),
      Q => \stage_in_reg_reg_n_0_[3][6][1]\,
      R => '0'
    );
\stage_in_reg_reg[3][6][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][3]_19\(2),
      Q => \stage_in_reg_reg_n_0_[3][6][2]\,
      R => '0'
    );
\stage_in_reg_reg[3][6][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][3]_19\(3),
      Q => \stage_in_reg_reg_n_0_[3][6][3]\,
      R => '0'
    );
\stage_in_reg_reg[3][7][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][7]_23\(0),
      Q => \stage_in_reg_reg_n_0_[3][7][0]\,
      R => '0'
    );
\stage_in_reg_reg[3][7][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][7]_23\(1),
      Q => \stage_in_reg_reg_n_0_[3][7][1]\,
      R => '0'
    );
\stage_in_reg_reg[3][7][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][7]_23\(2),
      Q => \stage_in_reg_reg_n_0_[3][7][2]\,
      R => '0'
    );
\stage_in_reg_reg[3][7][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \stage_out_reg[3][7]_23\(3),
      Q => \stage_in_reg_reg_n_0_[3][7][3]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_benes_top is
  port (
    p_0_in : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 19 downto 0 );
    s00_axi_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_benes_top : entity is "benes_top";
end axi_benes_Axi_lite_v1_0_0_0_benes_top;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_benes_top is
  signal net_in0 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal net_in1 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal net_in2 : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal net_in3 : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal net_in4 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_in5 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal net_in6 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal net_in7 : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \^p_0_in\ : STD_LOGIC;
  signal \stage_out_reg[0][0]_24\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[0][1]_25\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[0][2]_26\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[0][3]_27\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stage_out_reg[0][4]_28\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \stage_out_reg[0][5]_29\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \stage_out_reg[0][6]_30\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \stage_out_reg[0][7]_31\ : STD_LOGIC_VECTOR ( 3 downto 2 );
begin
  p_0_in <= \^p_0_in\;
counter0: entity work.axi_benes_Axi_lite_v1_0_0_0_test_counter_plus
     port map (
      D(0) => \stage_out_reg[0][0]_24\(0),
      Q(2 downto 0) => net_in0(3 downto 1),
      \out_reg_reg[3]_0\(3 downto 0) => \stage_out_reg[0][1]_25\(3 downto 0),
      \out_reg_reg[3]_1\ => \^p_0_in\,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_wdata(0) => s00_axi_wdata(16),
      \stage_in_reg_reg[0][4][3]\(2 downto 0) => net_in1(3 downto 1)
    );
counter1: entity work.axi_benes_Axi_lite_v1_0_0_0_test_counter_2plus
     port map (
      D(2 downto 0) => \stage_out_reg[0][0]_24\(3 downto 1),
      Q(2 downto 0) => net_in1(3 downto 1),
      \out_reg_reg[3]_0\ => \^p_0_in\,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_wdata(0) => s00_axi_wdata(16),
      \stage_in_reg_reg[0][0][3]\(2 downto 0) => net_in0(3 downto 1)
    );
counter2: entity work.axi_benes_Axi_lite_v1_0_0_0_test_counter_3plus
     port map (
      D(1 downto 0) => \stage_out_reg[0][2]_26\(1 downto 0),
      Q(1 downto 0) => net_in2(3 downto 2),
      \out_reg_reg[3]_0\(3 downto 0) => \stage_out_reg[0][3]_27\(3 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0 => \^p_0_in\,
      s00_axi_wdata(0) => s00_axi_wdata(17),
      \stage_in_reg_reg[0][5][3]\(1 downto 0) => net_in3(3 downto 2)
    );
counter3: entity work.axi_benes_Axi_lite_v1_0_0_0_test_counter_4plus
     port map (
      D(1 downto 0) => \stage_out_reg[0][2]_26\(3 downto 2),
      Q(1 downto 0) => net_in3(3 downto 2),
      \out_reg_reg[3]_0\ => \^p_0_in\,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_wdata(0) => s00_axi_wdata(17),
      \stage_in_reg_reg[0][1][3]\(1 downto 0) => net_in2(3 downto 2)
    );
counter4: entity work.axi_benes_Axi_lite_v1_0_0_0_test_counter_minus
     port map (
      D(2 downto 0) => \stage_out_reg[0][5]_29\(3 downto 1),
      Q(3 downto 0) => net_in4(3 downto 0),
      \out_reg_reg[3]_0\ => \^p_0_in\,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_wdata(0) => s00_axi_wdata(18),
      \stage_in_reg_reg[0][6][3]\(2 downto 0) => net_in5(3 downto 1)
    );
counter5: entity work.axi_benes_Axi_lite_v1_0_0_0_test_counter_2minus
     port map (
      D(2 downto 0) => \stage_out_reg[0][4]_28\(3 downto 1),
      Q(2 downto 0) => net_in5(3 downto 1),
      \out_reg_reg[3]_0\ => \^p_0_in\,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_wdata(0) => s00_axi_wdata(18),
      \stage_in_reg_reg[0][2][3]\(2 downto 0) => net_in4(3 downto 1)
    );
counter6: entity work.axi_benes_Axi_lite_v1_0_0_0_test_counter_3minus
     port map (
      D(1 downto 0) => \stage_out_reg[0][7]_31\(3 downto 2),
      Q(3 downto 0) => net_in6(3 downto 0),
      \out_reg_reg[3]_0\ => \^p_0_in\,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_wdata(0) => s00_axi_wdata(19),
      \stage_in_reg_reg[0][7][3]\(1 downto 0) => net_in7(3 downto 2)
    );
counter7: entity work.axi_benes_Axi_lite_v1_0_0_0_test_counter_4minus
     port map (
      D(1 downto 0) => \stage_out_reg[0][6]_30\(3 downto 2),
      Q(1 downto 0) => net_in7(3 downto 2),
      \out_reg_reg[3]_0\ => \^p_0_in\,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_wdata(0) => s00_axi_wdata(19),
      \stage_in_reg_reg[0][3][3]\(1 downto 0) => net_in6(3 downto 2)
    );
network: entity work.axi_benes_Axi_lite_v1_0_0_0_network_module
     port map (
      D(3 downto 0) => \stage_out_reg[0][0]_24\(3 downto 0),
      Q(0) => net_in4(0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_wdata(17 downto 16) => s00_axi_wdata(19 downto 18),
      s00_axi_wdata(15 downto 0) => s00_axi_wdata(15 downto 0),
      \stage_in_reg_reg[0][1][3]_0\(3 downto 0) => \stage_out_reg[0][2]_26\(3 downto 0),
      \stage_in_reg_reg[0][2][3]_0\(2 downto 0) => \stage_out_reg[0][4]_28\(3 downto 1),
      \stage_in_reg_reg[0][3][1]_0\(1 downto 0) => net_in6(1 downto 0),
      \stage_in_reg_reg[0][3][3]_0\(1 downto 0) => \stage_out_reg[0][6]_30\(3 downto 2),
      \stage_in_reg_reg[0][4][3]_0\(3 downto 0) => \stage_out_reg[0][1]_25\(3 downto 0),
      \stage_in_reg_reg[0][5][3]_0\(3 downto 0) => \stage_out_reg[0][3]_27\(3 downto 0),
      \stage_in_reg_reg[0][6][3]_0\(2 downto 0) => \stage_out_reg[0][5]_29\(3 downto 1),
      \stage_in_reg_reg[0][7][3]_0\(1 downto 0) => \stage_out_reg[0][7]_31\(3 downto 2),
      \stage_in_reg_reg[3][1][3]_0\(31 downto 0) => D(31 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_Axi_lite_v1_0_S00_AXI is
  port (
    s00_axi_wready : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 19 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_Axi_lite_v1_0_S00_AXI : entity is "Axi_lite_v1_0_S00_AXI";
end axi_benes_Axi_lite_v1_0_0_0_Axi_lite_v1_0_S00_AXI;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_Axi_lite_v1_0_S00_AXI is
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal \axi_awready0__0\ : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_wready0__0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal \slv_reg_rden__0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of axi_awready0 : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of axi_rvalid_i_1 : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of axi_wready0 : label is "soft_lutpair91";
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFF700F700F700"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => p_0_in
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => p_0_in
    );
axi_awready0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => aw_en_reg_n_0,
      I1 => \^s_axi_awready\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      O => \axi_awready0__0\
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awready0__0\,
      Q => \^s_axi_awready\,
      R => p_0_in
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => \^s00_axi_wready\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => p_0_in
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => p_0_in
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => p_0_in
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => p_0_in
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => p_0_in
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => p_0_in
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => p_0_in
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => p_0_in
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => p_0_in
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => p_0_in
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => p_0_in
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => p_0_in
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => p_0_in
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => p_0_in
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => p_0_in
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => p_0_in
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => p_0_in
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => p_0_in
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => p_0_in
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => p_0_in
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => p_0_in
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => p_0_in
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => p_0_in
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => p_0_in
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => p_0_in
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => p_0_in
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => p_0_in
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => p_0_in
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => p_0_in
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => p_0_in
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => p_0_in
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => p_0_in
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => p_0_in
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => p_0_in
    );
axi_wready0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => aw_en_reg_n_0,
      I1 => \^s00_axi_wready\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      O => \axi_wready0__0\
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_wready0__0\,
      Q => \^s00_axi_wready\,
      R => p_0_in
    );
benes_inst: entity work.axi_benes_Axi_lite_v1_0_0_0_benes_top
     port map (
      D(31 downto 0) => reg_data_out(31 downto 0),
      p_0_in => p_0_in,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_wdata(19 downto 0) => s00_axi_wdata(19 downto 0)
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^s_axi_arready\,
      O => \slv_reg_rden__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0_Axi_lite_v1_0 is
  port (
    s00_axi_wready : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 19 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of axi_benes_Axi_lite_v1_0_0_0_Axi_lite_v1_0 : entity is "Axi_lite_v1_0";
end axi_benes_Axi_lite_v1_0_0_0_Axi_lite_v1_0;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0_Axi_lite_v1_0 is
begin
Axi_lite_v1_0_S00_AXI_inst: entity work.axi_benes_Axi_lite_v1_0_0_0_Axi_lite_v1_0_S00_AXI
     port map (
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_AWREADY => S_AXI_AWREADY,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(19 downto 0) => s00_axi_wdata(19 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity axi_benes_Axi_lite_v1_0_0_0 is
  port (
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of axi_benes_Axi_lite_v1_0_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of axi_benes_Axi_lite_v1_0_0_0 : entity is "axi_benes_Axi_lite_v1_0_0_0,Axi_lite_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of axi_benes_Axi_lite_v1_0_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of axi_benes_Axi_lite_v1_0_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of axi_benes_Axi_lite_v1_0_0_0 : entity is "Axi_lite_v1_0,Vivado 2020.2.2";
end axi_benes_Axi_lite_v1_0_0_0;

architecture STRUCTURE of axi_benes_Axi_lite_v1_0_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN axi_benes_xdma_0_0_axi_aclk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s00_axi BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s00_axi RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 250000000, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN axi_benes_xdma_0_0_axi_aclk, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s00_axi WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s00_axi WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.axi_benes_Axi_lite_v1_0_0_0_Axi_lite_v1_0
     port map (
      S_AXI_ARREADY => s00_axi_arready,
      S_AXI_AWREADY => s00_axi_awready,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(19 downto 0) => s00_axi_wdata(31 downto 12),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
