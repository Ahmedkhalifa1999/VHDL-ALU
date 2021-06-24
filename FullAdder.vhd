library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port(
        A, B, Cin  : in std_logic;
        S, Cout    : out std_logic
    );
end entity FullAdder;

architecture RTL of FullAdder is
    signal nA   : std_logic;
    signal nB   : std_logic;
    signal nCin : std_logic;
begin
    nA <= not(A);
    nB <= not(B);
    nCin <= not(Cin);
    S <= not ((Cin and ((nA and B) or (A and nB))) or (nCin and ((A and B) or (nA and nB))));
    Cout <= not((nA and nB) or (nCin and (nA or nB)));
end architecture RTL;
-- S : Cin(A'.B + B'.A) + Cin'(A.B or A'.B')
-- Cout : A'.B' + Cin'(A' + B')
