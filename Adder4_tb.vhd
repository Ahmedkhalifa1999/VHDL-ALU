library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- @suppress "Deprecated package"

entity Adder4_tb is
end entity Adder4_tb;

architecture RTL of Adder4_tb is
    component Adder4 is
        port(
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            S : out std_logic_vector(3 downto 0)
        );
    end component;
    signal A, B : std_logic_vector(3 downto 0);
    signal S    : std_logic_vector(3 downto 0);
begin
    UUT : Adder4 port map(A => A, B => B, S => S);
    
    process is
    begin
        A <= "0000";
        L0 : loop
            B <= "0000";
            L1 : loop
                wait for 5 ns;
                assert(S = A + B) report ("Error") severity warning;
                wait for 5 ns;
                exit L1 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L0 when(A = "1111");
            A <= A + 1;
        end loop;
        wait;
    end process;
end architecture RTL;
