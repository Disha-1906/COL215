----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 02:09:46 AM
-- Design Name: 
-- Module Name: final_clk_tb - tb
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


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY final_clk_tb IS
END final_clk_tb;
 
ARCHITECTURE behavior OF final_clk_tb IS
 
-- - Component Declaration for the Unit Under Test (UUT)
 
COMPONENT final_clk
PORT(
clk : IN std_logic;
--reset : IN std_logic;
o11 : buffer std_logic;
o22: buffer std_logic;
x0 : out std_logic;
x1 : out std_logic;
x2 : out std_logic;
x3 : out std_logic
);
END COMPONENT;
 
--Inputs
signal clk : std_logic := '0';
--signal reset : std_logic := '0';
 
--Outputs
signal o11,o22,x0,x1,x2,x3 : std_logic;
 
-- - Clock period definitions
constant clk_period : time := 20 ns;
 
BEGIN
 
-- - Instantiate the Unit Under Test (UUT)
uut: final_clk PORT MAP (
clk => clk,
--reset => reset,
o11 => o11,
o22 => o22, x0 => x0, x1 => x1, x2=> x2, x3=>x3
);
 
-- - Clock process definitions
clk_process :process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;
 
-- - Stimulus process
--stim_proc: process
--begin
--wait for 100 ns;
--reset <= '1';
--wait for 100 ns;
--reset <= '0';
--wait;
--end process;
 
END;

