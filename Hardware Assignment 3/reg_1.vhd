
----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 11/01/2022 04:09:55 PM
-- Design Name:
-- Module Name: reg_1 - Behavioral
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

entity reg_1 is
--  Port ( );
    Port( din : in std_logic_vector(7 downto 0);
--          clk : in std_logic;
          REG1_CM : IN STD_LOGIC;
          read : in std_logic;
          write : in std_logic;
          dout : out std_logic_vector(7 downto 0));

end reg_1;

architecture Behavioral of reg_1 is


begin
process(REG1_CM)
begin
if REG1_CM='1' then
    if read = '1' then
        dout <=din;
    end if;
    if write = '1' then
        dout <= (others=>'0');
    end if;
 end if;
 end process;


end Behavioral;