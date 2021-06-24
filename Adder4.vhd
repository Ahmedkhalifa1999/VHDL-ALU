library ieee;
use ieee.std_logic_1164.all;

entity Adder4 is
    port(
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        S : out std_logic_vector(3 downto 0)
    );
end entity Adder4;

architecture RTL of Adder4 is
    component HalfAdder is 
        port(
            A, B       : in std_logic;
            S, Cout    : out std_logic
        );
    end component;
    component FullAdder is
        port(
        A, B, Cin  : in std_logic;
        S, Cout    : out std_logic
        );
    end component;
    component NoCarryFullAdder is
        port(
        A, B, Cin  : in std_logic;
        S          : out std_logic
        );
    end component;
    signal C0 : std_logic;
    signal C1 : std_logic;
    signal C2 : std_logic;
begin
    HalfAdder0: HalfAdder port map(A => A(0), B => B(0), S => S(0), Cout => C0);
    FullAdder1: FullAdder port map(A => A(1), B => B(1), Cin => C0, S => S(1), Cout => C1);
    FullAdder2: FullAdder port map(A => A(2), B => B(2), Cin => C1, S => S(2), Cout => C2);
    FullAdder3: NoCarryFullAdder port map(A => A(3), B => B(3), Cin => C2, S => S(3));
end architecture RTL;
