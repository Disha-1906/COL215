----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2022 10:43:44 AM
-- Design Name: 
-- Module Name: Numeric - Behavioral
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

entity Numeric_6 is
--  Port ( );
    Port (enable_watch : in STD_LOGIC;
          reset_watch : in STD_LOGIC;
          clk : in STD_LOGIC;
          out_1: out STD_LOGIC;
          out_2: out integer);
end Numeric_6;

architecture Behavioral of Numeric_6 is
    signal tmp: STD_LOGIC :='1';
    signal count : integer :=0;
begin
    process(clk,enable_watch)
    begin
        if reset_watch='1' then
            count <= 0;
            tmp <= '1';
        elsif enable_watch = '1' and rising_edge(clk) then
            count <= count+1;
            if count = 5 then
                tmp <= not tmp;
                count <= 0;
            elsif count = 3 then
                tmp <= not tmp;
            end if;
--        elsif reset_watch='1' then
--            count <= 0;
--            tmp <= '1';
        end if;
        out_1 <= tmp;
        out_2 <= count;
    end process; 
end Behavioral;
