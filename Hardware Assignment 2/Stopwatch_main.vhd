----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2022 11:02:43 AM
-- Design Name: 
-- Module Name: Stopwatch_main - Behavioral
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

entity Stopwatch_main is
--  Port ( );
    Port( clk : in STD_LOGIC;
          start : in STD_LOGIC;
          pause : in STD_LOGIC;
          reset : in STD_LOGIC;
          continue : in STD_LOGIC;
--          enable_watch : in std_logic;
--          reset_watch : in std_logic;
          z0 : out STD_LOGIC;
          z1 : out STD_LOGIC;
          z2 : out STD_LOGIC;
          z3 : out STD_LOGIC;
          z4 : out STD_LOGIC;
          z5 : out STD_LOGIC;
          z6 : out STD_LOGIC;
          r0 : out STD_LOGIC;
          r1 : out STD_LOGIC;
          r2 : out STD_LOGIC;
          r3 : out STD_LOGIC;
          dp : out std_logic);
          
--          enable_watch : in STD_LOGIC;
--          reset_watch : in STD_LOGIC;
--          a0 : out STD_LOGIC;
--          b0 : out STD_LOGIC;
--          c0 : out STD_LOGIC;
--          d0 : out STD_LOGIC;
--          a1 : out STD_LOGIC;
--          b1 : out STD_LOGIC;
--          c1 : out STD_LOGIC;
--          d1 : out STD_LOGIC;
--          a2 : out STD_LOGIC;
--          b2 : out STD_LOGIC;
--          c2 : out STD_LOGIC;
--          d2 : out STD_LOGIC;
--          a3 : out STD_LOGIC;
--          b3 : out STD_LOGIC;
--          c3 : out STD_LOGIC;
--          d3 : out STD_LOGIC);     
end Stopwatch_main;

architecture Behavioral of Stopwatch_main is 
    component Clock_Divider port( clk : in std_logic;
                                  clk_o : out std_logic);
    end component;
    component switch port( start : in STD_LOGIC;
                           pause : in STD_LOGIC;
                           reset : in STD_LOGIC;
                           continue : in STD_LOGIC;
                           clk : in std_logic;
                           enable_watch : out STD_LOGIC;
                           reset_watch : out STD_LOGIC);
    end component;
    component Numeric port( enable_watch : in STD_LOGIC;
                          reset_watch : in STD_LOGIC;
                          clk : in STD_LOGIC;
                          out_1: out STD_LOGIC;
                          out_2: out integer);
    end component;
    component Numeric_6 port( enable_watch : in STD_LOGIC;
                          reset_watch : in STD_LOGIC;
                          clk : in STD_LOGIC;
                          out_1: out STD_LOGIC;
                          out_2: out integer);
    end component;
    component int_bin port( num : in integer;
                              b0 : out std_logic;
                              b1 : out std_logic;
                              b2 : out std_logic;
                              b3 : out std_logic);
    end component;
    component mux port (an00 : in STD_LOGIC;
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
                         clk : in std_logic;
                         dp : out std_logic);
    end component;
    signal clk_req, enable_watch, reset_watch : std_logic ;
    signal d_0,d_1,d_2,d_3 : integer;
    signal w_0,w_1,w_2,w_3 : std_logic;
    signal h0,h1,h2,h3,g0,g1,g2,g3,i0,i1,i2,i3,j0,j1,j2,j3: std_logic;
  

begin
--    enable_watch <= (start and NOT reset AND NOT pause) OR (start and continue AND NOT reset);
--    reset_watch <= reset and start;
    pin: switch port map (start=>start, pause=>pause, continue=>continue, reset=>reset, enable_watch=>enable_watch, reset_watch=>reset_watch, clk=>clk);
    clk_1: Clock_Divider port map(clk=>clk, clk_o=>clk_req);
    dig_0: Numeric port map (enable_watch=>enable_watch, reset_watch=>reset_watch, clk =>clk_req, out_1=>w_0, out_2=> d_0);
    dig_1: Numeric port map (enable_watch=>enable_watch, reset_watch=>reset_watch, clk =>w_0, out_1=>w_1, out_2=> d_1);
    dig_2: Numeric_6 port map (enable_watch=>enable_watch, reset_watch=>reset_watch, clk =>w_1, out_1=>w_2, out_2=> d_2);
    dig_3: Numeric port map (enable_watch=>enable_watch, reset_watch=>reset_watch, clk =>w_2, out_1=>w_3, out_2=> d_3);
    bin_0 : int_bin port map (num=>d_0, b0=>h0, b1=>h1, b2=>h2, b3=>h3); 
    bin_1 : int_bin port map (num=>d_1, b0=>g0, b1=>g1, b2=>g2, b3=>g3); 
    bin_2 : int_bin port map (num=>d_2, b0=>i0, b1=>i1, b2=>i2, b3=>i3); 
    bin_3 : int_bin port map (num=>d_3, b0=>j0, b1=>j1, b2=>j2, b3=>j3); 
    m_u_x  : mux port map (dp=>dp,an03=>h0, an13=>h1, an23=>h2, an33=>h3, an02=>g0, an12=>g1, an22=>g2, an32=>g3, an01=>i0, an11=>i1, an21=>i2, an31=>i3, an00=>j0, an10=>j1, an20=>j2, an30=>j3, o0=>z0, o1=>z1, o2=>z2, o3=>z3, o4=>z4, o5=>z5, o6=>z6, x0=>r0, x1=>r1, x2=>r2, x3=>r3, clk=>clk);

end Behavioral;
