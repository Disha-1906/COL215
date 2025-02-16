 ----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 11/10/2022 04:15:27 PM
-- Design Name:
-- Module Name: fsm - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm is
--  Port ( );
    Port(clk : in std_logic;
        out1 : out std_logic_vector(15 downto 0));
--         clk2 : in std_logic;
--         clk3 : in std_logic;
--         rom_cmd : out std_logic;
--         ram_cmd : out std_logic;
--         reg_1_cmd : out std_logic;
--         reg_2_cmd : out std_logic;
--         reg_3_cmd : out std_logic;
--         mac_cmd : out std_logic);
end fsm;

architecture Behavioral of fsm is
component reg_1
Port( REG1_CM : in std_logic;
          din : in std_logic_vector(7 downto 0);
          read : in std_logic;
          write : in std_logic;
          dout: out std_logic_vector(7 downto 0));

end component;
component reg_2
Port ( REG2_CM : in std_logic;
          din : in std_logic_vector(15 downto 0);
          read : in std_logic;
          write : in std_logic;
          dout: out std_logic_vector(15 downto 0));
end component;
component MAC
    Port (num1: in std_logic_vector(7 downto 0);
          num2: in std_logic_vector(7 downto 0);
          MAC_CM : in std_logic;
          
          result : out std_logic_vector(15 downto 0));
end component;
component dist_mem_gen_3
 Port(a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
     spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
  end component;
component dist_mem_gen_1
Port(a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
 end component;
 
 component dist_mem_gen_2
  PORT (
   a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
   d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
   clk : IN STD_LOGIC;
   we : IN STD_LOGIC;
   spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
 );
   end component;

signal re1,re2,re3,we1,we2,we3,we : std_logic;
signal ramcm,rom1cm,rom2cm, reg1cm, reg2cm, reg3cm, maccm : std_logic;
signal do1 , do2 : std_logic_vector(7 downto 0);
signal  p1,p2,p3 :  std_logic_vector(13 downto 0);
 signal sp1,sp2 :  std_logic_vector(7 downto 0);
 signal total,maco : std_logic_vector(15 downto 0);
 signal ramin : std_logic_vector(15 downto 0) := (others=>'0');
 signal c1,c2,reg3_c : integer :=0;
--signal o1 : std_logic_vector(15 downto 0);
type state_type is(offs, roms, regs, macs, reg3s, rams);
signal state : state_type:=offs;
begin
process(clk)
begin
if rising_edge(clk) then
   
--    case state is
--    when offs=>
        if c2=1 then
            rom1cm <= '1';
            rom2cm <= '1';
        end if;
--    when roms=>
        if c2=2 then
            reg1cm<='1';
            reg2cm<='1';
        end if;
--    when regs=>
        if c2=3 then
            maccm<='1';
        end if;
--    when macs=>
        if c2<133 and c2>3 then
--            state<= macs;
        maccm<='1';
        elsif c2=133 then
        reg3cm<='1';
        end if;
--    when reg3s=>
        if c2=134 then
            ramcm<='1';
        end if;
--    when rams=>
     
         c2<=0;
    c2 <= c2 +1;
end if;
end process;


re1 <= '1' when maccm='1' else '0';
re2 <='1' when maccm='1' else '0';
we1 <= '1' when reg1cm ='1' else '0';
we2 <= '1' when reg2cm ='1' else '0';
re3 <= '1' when ramcm ='1' else '0';
we3 <= '1' when reg3cm='1' else '0';
we <= '0' when ramcm ='1' else '0';
process
begin
for m in 0 to 127 loop
    p3 <= std_logic_vector(to_unsigned(m+(c1*128),14));
    for n in 0 to 127 loop
        p1<=std_logic_vector(to_unsigned((n+128)*m,14));
        p2<=std_logic_vector(to_unsigned((n+128)*m,14));
    wait for 10 ns;
    c1<= c1+1;
    end loop;

    wait;
end loop;
c1 <= 0;
wait;
end process;
as0 : dist_mem_gen_3 port map( a=> p1, spo=> sp1);
as1 : dist_mem_gen_1 port map( a=> p2, spo=> sp2);
as2 : reg_1 port map(REG1_CM=>reg1cm, read=> re1, write => we1, dout=> do1,din=>sp1);
as3 : reg_1 port map(REG1_CM=>reg2cm, read=>re2, write=>we2, dout=> do2, din=>sp2);
as4 : mac port map( MAC_CM=> maccm,num1=> do1, num2=> do2,result=>maco);
as5 : reg_2 port map ( REG2_CM=> reg3cm,din=>maco,dout=> ramin,read=>re3,write=>we3);
as6 : dist_mem_gen_2 port map(a=>p3,clk=>clk,we=>we,d=> ramin,spo=>out1);
end Behavioral;