library ieee;
use ieee.std_logic_1164.all;

entity FullAdder_tb is
    
end entity FullAdder_tb;

architecture RTL of FullAdder_tb is
    component FullAdder is
        port(
            A, B, Cin  : in std_logic;
            S, Cout    : out std_logic
        );
    end component;
    signal A, B, Cin, S, Cout : std_logic;
begin
    UUT : FullAdder port map(A => A, B => B, Cin => Cin, S => S, Cout => Cout);
    
    process is
    begin
        A <= '0';
        B <= '0';
        Cin <= '0';
        wait for 5 ns;
        assert(S = '0' and Cout = '0') report ("Error") severity warning;
        wait for 5 ns;
        
        A <= '0';
        B <= '0';
        Cin <= '1';
        wait for 5 ns;
        assert(S = '1' and Cout = '0') report ("Error") severity warning;
        wait for 5 ns;
        
        A <= '0';
        B <= '1';
        Cin <= '0';
        wait for 5 ns;
        assert(S = '1' and Cout = '0') report ("Error") severity warning;
        wait for 5 ns;
        
        A <= '0';
        B <= '1';
        Cin <= '1';
        wait for 5 ns;
        assert(S = '0' and Cout = '1') report ("Error") severity warning;
        wait for 5 ns;
        
        A <= '1';
        B <= '0';
        Cin <= '0';
        wait for 5 ns;
        assert(S = '1' and Cout = '0') report ("Error") severity warning;
        wait for 5 ns;
        
        A <= '1';
        B <= '0';
        Cin <= '1';
        wait for 5 ns;
        assert(S = '0' and Cout = '1') report ("Error") severity warning;
        wait for 5 ns;
        
        A <= '1';
        B <= '1';
        Cin <= '0';
        wait for 5 ns;
        assert(S = '0' and Cout = '1') report ("Error") severity warning;
        wait for 5 ns;
        
        A <= '1';
        B <= '1';
        Cin <= '1';
        wait for 5 ns;
        assert(S = '1' and Cout = '1') report ("Error") severity warning;
        wait for 5 ns;
        
        wait;
    end process;
end architecture RTL;
