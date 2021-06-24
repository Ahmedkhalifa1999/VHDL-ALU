library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is
    port(
        A, B       : in std_logic;
        S, Cout    : out std_logic
    );
end entity HalfAdder;

architecture RTL of HalfAdder is
    signal nA : std_logic;
    signal nB : std_logic;
begin
    nA <= not(A);
    nB <= not(B);
    S <= not((A and B) or (nA and nB));
    Cout <= not(nA or nB);
end architecture RTL;
-- S : A B + A' B' 
-- Cout : A'  + B' 
