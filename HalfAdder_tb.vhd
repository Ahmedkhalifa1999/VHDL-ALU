library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder_tb is
    
end entity HalfAdder_tb;

architecture RTL of HalfAdder_tb is
    component HalfAdder is
        port(
            A, B  : in std_logic;
            S, Cout    : out std_logic
        );
    end component;
    signal A, B, S, Cout : std_logic;
begin
    UUT : HalfAdder port map(A => A, B => B, S => S, Cout => Cout);
    
    process is
    begin
        A <= '0';
        B <= '0';
        wait for 5 ns;
        assert(S = '0' and Cout = '0') report ("Error") severity warning;
        wait for 5 ns;
        
        A <= '0';
        B <= '1';
        wait for 5 ns;
        assert(S = '1' and Cout = '0') report ("Error") severity warning;
        wait for 5 ns;
        
        A <= '1';
        B <= '0';
        wait for 5 ns;
        assert(S = '1' and Cout = '0') report ("Error") severity warning;
        wait for 5 ns;
        
        A <= '1';
        B <= '1';
        wait for 5 ns;
        assert(S = '0' and Cout = '1') report ("Error") severity warning;
        wait for 5 ns;
        
        wait;
    end process;
end architecture RTL;
