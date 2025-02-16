----------------------------------------------------------------------------------

-- Company: 

-- Engineer: 

-- 

-- Create Date: 10/19/2022 01:00:12 AM

-- Design Name: 

-- Module Name: Clock_Divider - Behavioral

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

use IEEE.numeric_std.ALL;

  

entity Clock_Divider is

port ( clk: in std_logic;

clock_out: buffer std_logic);

--s0: out std_logic;

--s1: out std_logic);

end Clock_Divider;

  

architecture bhv of Clock_Divider is

--signal reset: std_logic;

--signal count: integer:=1;

signal tmp : std_logic := '0';

signal pre_scale: integer :=0 ;

begin

  

process(clk)

begin

--if(reset='1') then

--count<=1;

--pre_scale<=(others=>'0');

--tmp<='0';

--clock_out<=tmp;

    if rising_edge(clk) then

    --count <=count+1;

        pre_scale <= pre_scale + 1;

        if (pre_scale = 500000) then

            tmp <= NOT tmp;

--            clock_out<=tmp;

            --count <= 1;

            pre_scale <= 0;

        end if;

        

    end if;

    clock_out <= tmp;

--s0 <= pre_scale(18);

--s1<= pre_scale(17);

end process;


  

end bhv;


