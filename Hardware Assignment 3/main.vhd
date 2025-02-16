----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2022 10:46:33 PM
-- Design Name: 
-- Module Name: main - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
--  Port ( );
Port ( w1 : in std_logic_vector(13 downto 0);
    clk: in std_logic;
    t0 : out std_logic;
    t1 : out std_logic;
    t2 : out std_logic;
    t3 : out std_logic;
    t4 : out std_logic;
    t5 : out std_logic;
    t6 : out std_logic;
    v0 : out std_logic;
    v1 : out std_logic;
    v2 : out std_logic;
    v3 : out std_logic;
    dp : out std_logic);
end main;

architecture Behavioral of main is
component dist_mem_gen_2
  PORT (
   a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
   d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
   clk : IN STD_LOGIC;
   we : IN STD_LOGIC;
   spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
 );
   end component;
component mux
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
end component;
component fsm
Port(clk : in std_logic;
        out1 : out std_logic_vector(15 downto 0));
end component;
signal wo : std_logic_vector(15 downto 0);
begin
assign1: fsm port map (clk=>clk);
assign2: dist_mem_gen_2 port map(a=>w1,clk=>clk,d=>(others=>'0'),we=>'0',spo=>wo);
assign3: mux port map (an00=>wo(15),an10=>wo(14),an20=>wo(13),an30=>wo(12),an01=>wo(11),an11=>wo(10),an21=>wo(9),an31=>wo(8),an02=>wo(7),an12=>wo(6),an22=>wo(5),an32=>wo(4),an03=>wo(3),an13=>wo(2),an23=>wo(1),an33=>wo(0),clk=>clk);
    




end Behavioral;
