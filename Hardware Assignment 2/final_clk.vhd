----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 02:01:10 AM
-- Design Name: 
-- Module Name: final_clk - Behavioral
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

entity final_clk is
  Port (clk : in std_logic;
--        reset : in std_logic;
        o11 : buffer std_logic;
        o22 : buffer std_logic;
        x0 : out std_logic;
        x1 : out std_logic;
        x2 : out std_logic;
        x3 : out std_logic;
        dp : out std_logic);
end final_clk;

architecture Behavioral of final_clk is
    component Clock_Divider_2 is
        Port( clk: in std_logic;
                clk_out: buffer std_logic);
    end component;
    component new_clk is
        port ( clk: in std_logic;
                clock_out: buffer std_logic);
    end component;
   

begin
l1 : Clock_Divider_2 port map(clk => clk, clk_out => o11);
l2 : new_clk port map (clk => clk, clock_out => o22);
process (o11,o22)
begin 
if o11 = '0' then
    if o22 = '0' then
        x0 <= '0';
        x1 <= '1';
        x2 <= '1';
        x3 <= '1';
        dp <= '0';
    else 
        x0 <= '1';
        x1 <= '0';
        x2 <= '1';
        x3 <= '1';
        dp<= '0';
    end if;
else
    if o22 = '0' then
        x0 <= '1';
        x1 <= '1';
        x2 <= '0';
        x3 <= '1';
        dp<= '1';
    else 
        x0 <= '1';
        x1 <= '1';
        x2 <= '1';
        x3 <= '0';
        dp <= '1';
    end if;
end if;
end process;



end Behavioral;
