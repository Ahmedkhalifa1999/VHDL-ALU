library ieee;
use ieee.std_logic_1164.all;

entity NoCarryFullAdder is
    port(
        A, B, Cin  : in std_logic;
        S          : out std_logic
    );
end entity NoCarryFullAdder;

architecture RTL of NoCarryFullAdder is
    signal nA   : std_logic;
    signal nB   : std_logic;
    signal nCin : std_logic;
begin
    nA <= not(A);
    nB <= not(B);
    nCin <= not(Cin);
    S <= not ((Cin and ((nA and B) or (A and nB))) or (nCin and ((A and B) or (nA and nB))));
end architecture RTL;
-- S : Cin(A'.B + B'.A) + Cin'(A.B or A'.B')
