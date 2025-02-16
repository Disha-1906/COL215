----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2022 04:15:01 PM
-- Design Name: 
-- Module Name: A1_part2 - Behavioral
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

entity mux is
--  Port ( );
    Port(an00 : in STD_LOGIC;
         an10 : in STD_LOGIC;
         an20 : in STD_LOGIC;
         an30 : in STD_LOGIC;
         an01 : in STD_LOGIC;
         an11 : in STD_LOGIC;
         an21 : in STD_LOGIC;
         an31 : in STD_LOGIC;
         an02 : in STD_LOGIC;
         an12 : in STD_LOGIC;
         an22 : in STD_LOGIC;
         an32 : in STD_LOGIC;
         an03 : in STD_LOGIC;
         an13 : in STD_LOGIC;
         an23 : in STD_LOGIC;
         an33 : in STD_LOGIC;
         o0 : out STD_LOGIC;
         o1 : out STD_LOGIC;
         o2 : out STD_LOGIC;
         o3 : out STD_LOGIC;
         o4 : out std_logic;
         o5 : out std_logic;
         o6 : out std_logic;
         x0 : out std_logic;
         x1 : out std_logic;
         x2 : out std_logic;
         x3 : out std_logic;
--         o7 : out_logic;
         clk : in std_logic);
end mux;

architecture Behavioral of mux is
    component seven_seg
        Port( a: in STD_LOGIC;
           b: in STD_LOGIC;
           c: in STD_LOGIC;
           d: in STD_LOGIC;
           A1: out STD_LOGIC;
           B1: out STD_LOGIC;
           C1: out STD_LOGIC;
           D1: out STD_LOGIC;
           E1: out STD_LOGIC;
           F1: out STD_LOGIC;
           G1: out STD_LOGIC);
    end component;
    component final_clk
        Port( clk : in std_logic;
--             reset : in std_logic;
             o11,o22 : buffer std_logic;
             x0,x1,x2,x3 : out std_logic);
    end component;
--    signal clk:std_logic;
    SIGNAL  s0,s1:STD_LOGIC;
--    signal x0,x1,x2,x3 : std_logic;
    signal p0,p1,p2,p3 : std_logic;
--    signal t: integer :=0;

begin
l1: final_clk port map(clk=> clk,o11=> s0, o22=> s1,x0=>x0,x1=>x1,x2=>x2,x3=>x3);
--    process(clk)
--    begin
--        if rising_edge(clk) then
--            s0<=not s0;
--        t<=t+1;
--        end if;
--    end process;
--    process (clk)
--    begin
--        if rising_edge(clk) or falling_edge(clk) then
--            s1<=not s1;
--        t<=t+1;
--        end if;
--    end process;
            
    p0<=((NOT s0) AND (NOT s1) AND an00) OR (s0 AND (NOT s1) AND an01) OR (s1 AND (NOT s0) AND an02) OR (s1 AND s0 AND an03);
    p1<=((NOT s0) AND (NOT s1) AND an10) OR (s0 AND (NOT s1) AND an11) OR (s1 AND (NOT s0) AND an12) OR (s1 AND s0 AND an13);
    p2<=((NOT s0) AND (NOT s1) AND an20) OR (s0 AND (NOT s1) AND an21) OR (s1 AND (NOT s0) AND an22) OR (s1 AND s0 AND an23);
    p3<=((NOT s0) AND (NOT s1) AND an30) OR (s0 AND (NOT s1) AND an31) OR (s1 AND (NOT s0) AND an32) OR (s1 AND s0 AND an33);
l2 : seven_seg port map ( a=> p0, b=> p1, c=> p2, d=> p3, A1=> o0,B1 => o1, C1 => o2, D1=> o3, E1=> o4, F1 => o5, G1=> o6);
    
end Behavioral;
