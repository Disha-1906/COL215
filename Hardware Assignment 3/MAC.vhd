----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 11/09/2022 01:21:54 AM
-- Design Name:
-- Module Name: MAC - Behavioral
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
use IEEE.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MAC is
--  Port ( );
    Port (num1: in std_logic_vector(7 downto 0);
          num2: in std_logic_vector(7 downto 0);
          MAC_CM : in std_logic;
          result : out std_logic_vector(15 downto 0));
end MAC;

architecture Behavioral of MAC is
signal v : integer:=0;
signal i_product : std_logic_vector(15 downto 0);
signal f_product: std_logic_vector(15 downto 0);


begin

process(MAC_CM,f_product)
begin
if MAC_CM='1' then
    i_product <= std_logic_vector(unsigned(num1) * unsigned(num2));
    f_product<=  i_product;
elsif MAC_CM ='0' then
f_product<=f_product + i_product;
end if;
result<=f_product;
END PROCESS;
end Behavioral;