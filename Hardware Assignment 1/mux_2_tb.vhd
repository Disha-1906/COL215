----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2022 12:50:55 PM
-- Design Name: 
-- Module Name: mux_2_tb - tb
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

entity mux_2_tb is
--  Port ( );
end mux_2_tb;

architecture tb of mux_2_tb is
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
         clk : in std_logic;
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
         x3 : out std_logic);
--         o7 : out_logic;
         
    end component;
    signal an00,an01,an02,an03,an10,an11,an12,an13,an20,an21,an22,an23,an30,an31,an32,an33,clk: std_logic;
    signal o0,o1,o2,o3,o4,o5,o6,x0,x1,x2,x3: std_logic;
--    signal clk : std_logic := '0';
    constant clk_period : time := 20 ns;
begin
    UUT : mux port map( an10=>an10,an20=>an20,an30=>an30,an00=>an00,an11=>an11,an01=>an01,an21=>an21,an31=>an31,an02=>an02,an12=>an12,an22=>an22,an32=>an32,an03=>an03,an13=>an13,an23=>an23,an33=>an33,o0=>o0,o1=>o1,o2=>o2,o3=>o3,o4=>o4,o5=>o5,o6=>o6,x0=>x0,x1=>x1,x2=>x2,x3=>x3,clk=>clk);
    clk_process :process
    begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
    end process;
    an00 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0'  after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0'  after 70 ns, '1' after 75 ns ;
    an01 <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0'  after 60 ns, '1' after 70 ns;
    an02 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    an03 <= '0', '1' after 40 ns;
    an10 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0'  after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0'  after 70 ns, '1' after 75 ns ;
    an11 <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0'  after 60 ns, '1' after 70 ns;
    an12 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    an13 <= '0', '1' after 40 ns;
    an20 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0'  after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0'  after 70 ns, '1' after 75 ns ;
    an21 <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0'  after 60 ns, '1' after 70 ns;
    an22 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    an23 <= '0', '1' after 40 ns;
    an30 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0'  after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0'  after 70 ns, '1' after 75 ns ;
    an31 <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0'  after 60 ns, '1' after 70 ns;
    an32 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    an33 <= '0', '1' after 40 ns;
    


end tb;
