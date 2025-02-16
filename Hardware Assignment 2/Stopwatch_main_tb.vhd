
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- entity declaration for your testbench.
--Notice that the entity port list is empty here.
entity Stopwatch_main_tb is
end Stopwatch_main_tb;

architecture tb of Stopwatch_main_tb is

    component Stopwatch_main is
    Port ( start : in STD_LOGIC;
           pause : in STD_LOGIC;
           continue : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;

           z0: out STD_LOGIC;
           z1: out STD_LOGIC;
           z2: out STD_LOGIC;
           z3: out STD_LOGIC;
           z4: out STD_LOGIC;
           z5: out STD_LOGIC;
           z6: out STD_LOGIC;
           r0 : out STD_LOGIC;
           r1 : out STD_LOGIC;
           r2 : out STD_LOGIC;
           r3 : out STD_LOGIC);
     end component;

     signal start, pause, continue, reset : STD_LOGIC;

     signal z0,z1,z2,z3,z4,z5,z6,r0,r1,r2,r3: STD_LOGIC;

--declare inputs and initialize them to zero.
signal clk : std_logic := '0';
-- signal reset : std_logic := '0';

--declare outputs

-- define the period of clock here.
-- It's recommended to use CAPITAL letters to define constants.
constant CLK_PERIOD : time := 10 ns;

begin

    -- instantiate the unit under test (uut)
   uut : Stopwatch_main port map (
            start => start,
            pause => pause,
            continue => continue,
            reset => reset,
            clk => clk,
           z0 => z0,
            z1 => z1,
            z2 => z2,
            z3 => z3,
            z4 => z4,
            z5 => z5,
            z6 => z6,
            r0 => r0,
            r1 => r1,
            r2 => r2,
            r3 => r3
        );

--     input_arr_16 <= "0010010100100101" ;

   -- Clock process definitions( clock with 50% duty cycle is generated here.
   Clk_process :process
   begin
        Clk <= '0';
        wait for CLK_PERIOD/2;  --for half of clock period clk stays at '0'.
        Clk <= '1';
        wait for CLK_PERIOD/2;  --for next half of clock period clk stays at '1'.
   end process;

    start <= '0', '1' after 30 ms, '0' after 60 ms, '1' after 70 ms;
    pause <= '0', '1' after 10 ms, '0' after 20 ms, '1' after 30 ms, '0' after 40 ms;
    continue <= '0', '1' after 5 ms, '0' after 9 ms, '1' after 15 ms, '0' after 35 ms;
    reset <= '0', '1' after 65 ms;

   -- Stimulus process, Apply inputs here.
--  stim_proc: process
--   begin
--        wait for CLK_PERIOD*10; --wait for 10 clock cycles.
--        reset <='1';                    --then apply reset for 2 clock cycles.
--        wait for CLK_PERIOD*2;
--        reset <='0';                    --then pull down reset for 20 clock cycles.
--        wait for CLK_PERIOD*20;
--        reset <= '1';               --then apply reset for one clock cycle.
--        wait for CLK_PERIOD;
--        reset <= '0';               --pull down reset and let the counter run.
--        wait;
--  end process;
END tb;
