library ieee;
use ieee.std_logic_1164.all;

entity ArithmeticUnit is
    port(
        A      : in std_logic_vector(3 downto 0);
        B      : in std_logic_vector(3 downto 0);
        Output : out std_logic_vector(4 downto 0);
        SEL    : in std_logic_vector(2 downto 0)
    );
end entity ArithmeticUnit;

architecture RTL of ArithmeticUnit is
    component Adder4 is
        port(
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            S : out std_logic_vector(3 downto 0)
        );
    end component;
    signal AdderInput1 : std_logic_vector(3 downto 0);
    signal AdderInput2 : std_logic_vector(3 downto 0);
    signal AdderOutput : std_logic_vector(3 downto 0);
    signal Input1mux   : std_logic_vector(1 downto 0);
    signal Input2mux   : std_logic_vector(1 downto 0);
    signal Outputmux   : std_logic;
    signal nSEL        : std_logic_vector(2 downto 0);
begin
    Adder : Adder4 port map(A => AdderInput1, B => AdderInput2, S => AdderOutput);
    with Input1mux select AdderInput1 <= A when "00",
                                         "0001" when "01",
                                         "1111" when "10",
                                         "0000" when "11",
					                     "----" when others;
    with Input2mux select AdderInput2 <= B when "00",
                                         "0001" when "01",
                                         "1111" when "10",
                                         "0000" when "11",
					                     "----" when others;
    with Outputmux select Output <= AdderOutput(3) & AdderOutput when '0',
                                    (AdderOutput & '0') when '1',
				                    "-----" when others;
    
    nSEL <= not(SEL);
    Input1mux(1) <= not(SEL(0) or (SEL(2) and SEL(1)) or (nSEL(2) and nSEL(1)));
    Input1mux(0) <= not(SEL(2) or nSEL(1));
    Input2mux(1) <= not(nSEL(0) or (nSEL(2) and SEL(1)));
    Input2mux(0) <= not((nSEL(2) and SEL(0)) or (nSEL(0) and (SEL(2) or (SEL(1)))));
    Outputmux    <= not(nSEL(2) or nSEL(1) or nSEL(0));
end architecture RTL;
-- Input1mux(1) : SEL0 + SEL2.SEL1 + SEL2'.SEL1'
-- Input1mux(0) : SEL2 + SEL1'
-- Input2mux(1) : SEL0' + SEL2'.SEL1
-- Input2mux(0) : SEL2'.SEL0 + SEL0'.(SEL2+SEL1)
-- Outputmux    : SEL2' + SEL1' + SEL0'