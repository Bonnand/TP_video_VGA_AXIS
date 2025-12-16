library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_3bits is
    Port (
        tready1 : in  STD_LOGIC;
        tready2 : in  STD_LOGIC;
        tready3 : in  STD_LOGIC;
        tready_out : out STD_LOGIC
    );
end and_3bits;

architecture Behavioral of and_3bits is
begin
    tready_out <= tready1 and tready2 and tready3;
end Behavioral;
