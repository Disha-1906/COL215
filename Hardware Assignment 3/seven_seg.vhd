----------------------------------------------------------------------------------

-- Company: 

-- Engineer: 

-- 

-- Create Date: 11.10.2022 15:48:47

-- Design Name: 

-- Module Name: func_A - Behavioral

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


entity seven_seg is

    Port ( a: in STD_LOGIC;

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


--  Port ( );                                        

end seven_seg;


architecture Behavioral of seven_seg is


begin

    A1<=((NOT a) AND (NOT b) AND (NOT c) AND d) OR ((NOT a) AND b AND (NOT c) AND (NOT d)) OR (a AND b AND (NOT c) AND d) OR (a AND (NOT b) AND c AND d) ;

    B1<=(a AND b AND (NOT d)) OR (a AND c AND d) OR ((NOT a) AND b AND (NOT c) AND d) OR (b AND c AND (NOT d));

    C1<=((NOT a) AND (NOT b) AND c AND (NOT d)) OR (a AND b AND c) OR (a AND b AND (NOT d));

    D1<=(b AND c AND d) OR ((NOT a) AND b AND (NOT c) AND (NOT d)) OR ((NOT a) AND (NOT b) AND (NOT c) AND d) OR (a AND (NOT b) AND c AND (NOT d)); 

    E1<=((NOT a) AND d) OR ( (NOT b) AND (NOT c) AND (d)) OR ((NOT a) AND b AND (NOT c)) ;

    F1<=(a AND b AND (NOT c) AND d) OR ((NOT a) AND c AND d) OR ((NOT a) AND (NOT b) AND d) OR ((NOT a) AND (NOT b) AND c);

    G1<=((NOT a) AND b AND c AND d) OR (a AND b AND (NOT c) AND (NOT d)) OR ((NOT a) AND (NOT b) AND (NOT c));


    


end Behavioral;