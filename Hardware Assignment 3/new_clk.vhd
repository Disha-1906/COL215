----------------------------------------------------------------------------------

-- Company: 

-- Engineer: 

-- 

-- Create Date: 10/19/2022 01:56:41 AM

-- Design Name: 

-- Module Name: new_clk - Behavioral

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

entity new_clk is

port ( clk: in std_logic;

clock_out: buffer std_logic);

--s0: out std_logic;

--s1: out std_logic);

end new_clk;

  

architecture bhv of new_clk is

  

--signal count: integer:=1;

--signal reset: std_logic;

signal tmp : std_logic := '0';

signal pre_scale: integer := 0;

begin

  

process(clk)

begin

--if(reset='1') then

----count<=1;

--pre_scale<=(others=>'0');

--tmp<='0';

--clock_out<=tmp;

if(clk'event and clk='1') then

--count <=count+1;

    pre_scale <= pre_scale + 1 ;

    if (pre_scale = 250000) then

        tmp <= NOT tmp;

--        clock_out<=tmp;

        --count <= 1;

        pre_scale <= 0;

end if;


end if;

clock_out <= tmp;


--s0 <= pre_scale(18);

--s1<= pre_scale(17);

end process;


  

end bhv;
