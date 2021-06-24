library ieee;
use ieee.std_logic_1164.all;

entity ALU is
    port(
        A   : in std_logic_vector(3 downto 0);
        B   : in std_logic_vector(3 downto 0);
        SEL : in std_logic_vector(3 downto 0);
        Y   : out std_logic_vector(4 downto 0)
    );
end entity ALU;

architecture RTL of ALU is
    component ArithmeticUnit is 
        port(
            A      : in std_logic_vector(3 downto 0);
            B      : in std_logic_vector(3 downto 0);
            Output : out std_logic_vector(4 downto 0);
            SEL    : in std_logic_vector(2 downto 0)
        );
    end component;
    component LogicUnit is 
        port(
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Output : out std_logic_vector(3 downto 0);
            SEL : in std_logic_vector(2 downto 0)
        );
    end component;
    signal LUout : std_logic_vector(3 downto 0);
    signal AUout : std_logic_vector(4 downto 0);
begin
    Logic      : LogicUnit port map(A => A, B => B, Output => LUout, SEL => SEL(2 downto 0));
    Arithmetic : ArithmeticUnit port map(A => A, B => B, Output => AUout, SEL => SEL(2 downto 0));
    
    with SEL(3) select Y <= AUout when '0',
                            '0' & LUout when '1',
			                 "-----" when others;
end architecture RTL;
