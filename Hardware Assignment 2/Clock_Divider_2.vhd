----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2022 04:18:41 PM
-- Design Name: 
-- Module Name: Clock_Divider_2 - Behavioral
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

entity Clock_Divider_2 is
--  Port ( );
    Port ( clk : in std_logic;
           clk_out : buffer std_logic);
end Clock_Divider_2;

architecture Behavioral of Clock_Divider_2 is
    signal tmp : std_logic :='0';
    signal count : integer := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            count <= count +1;
            if count = 500000 then
                tmp <= not tmp;
                count <= 0 ;
            end if;
        end if;
    end process;
    clk_out<= tmp;



end Behavioral;
