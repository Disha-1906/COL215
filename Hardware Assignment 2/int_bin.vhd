----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2022 02:57:48 PM
-- Design Name: 
-- Module Name: int_bin - Behavioral
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

entity int_bin is
--  Port ( );
    port( num : in integer;
          b0 : out std_logic;
          b1 : out std_logic;
          b2 : out std_logic;
          b3 : out std_logic);
end int_bin;

architecture Behavioral of int_bin is

begin
process 
begin
     if num = 0 then
        b0 <= '0';
        b1 <= '0';
        b2 <= '0';
        b3 <= '0';
     elsif num = 1 then
        b0 <= '0';
        b1 <= '0';
        b2 <= '0';
        b3 <= '1';
     elsif num = 2 then
        b0 <= '0';
        b1 <= '0';
        b2 <= '1';
        b3 <= '0';
     elsif num = 3 then
        b0 <= '0';
        b1 <= '0';
        b2 <= '1';
        b3 <= '1';
     elsif num = 4 then
        b0 <= '0';
        b1 <= '1';
        b2 <= '0';
        b3 <= '0';
      elsif num = 5 then
        b0 <= '0';
        b1 <= '1';
        b2 <= '0';
        b3 <= '1';
     elsif num = 6 then
        b0 <= '0';
        b1 <= '1';
        b2 <= '1';
        b3 <= '0';
     elsif num = 7 then
        b0 <= '0';
        b1 <= '1';
        b2 <= '1';
        b3 <= '1';
     elsif num = 8 then
        b0 <= '1';
        b1 <= '0';
        b2 <= '0';
        b3 <= '0';   
     elsif num = 9 then
        b0 <= '1';
        b1 <= '0';
        b2 <= '0';
        b3 <= '1';
     end if;
        
end process;         


end Behavioral;
