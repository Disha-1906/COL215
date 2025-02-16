----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2022 10:26:20 AM
-- Design Name: 
-- Module Name: Clock_Divider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--Creating 0.1 sec clock----

entity Clock_Divider is
--  Port ( );
    Port ( clk : in std_logic;
           clk_o : out std_logic);
end Clock_Divider;

architecture Behavioral of Clock_Divider is
    signal tmp : std_logic :='0';
    signal count : integer := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            count <= count +1;
            if count = 5000000 then
                tmp <= not tmp;
                count <= 0 ;
            end if;
        end if;
    end process;
    clk_o<= tmp;
end Behavioral;
