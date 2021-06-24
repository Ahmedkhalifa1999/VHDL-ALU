library ieee;
use ieee.std_logic_1164.all;

entity LogicUnit is
    port(
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Output : out std_logic_vector(3 downto 0);
        SEL : in std_logic_vector(2 downto 0)
    );
end entity LogicUnit;

architecture RTL of LogicUnit is
    signal abmux_out   : std_logic_vector(3 downto 0);
    signal opmux_out   : std_logic_vector(3 downto 0);
    signal invmux_out  : std_logic_vector(3 downto 0);
    signal abmux_ctrl  : std_logic;
    signal opmux_ctrl  : std_logic_vector(1 downto 0);
    signal invmux_ctrl : std_logic;
    signal nSEL        : std_logic_vector(2 downto 0);
begin
    with abmux_ctrl select abmux_out <= A when '0',
                                        B when '1',
					                    "----" when others;
    with opmux_ctrl select opmux_out <= abmux_out when "00",
                                        A nand B when "01",
                                        A nor B when "10",
                                        A xor B when "11",
					                    "----" when others;
    with invmux_ctrl select invmux_out <= opmux_out when '0',
                                          not(opmux_out) when '1',
					                      "----" when others;
    Output <= invmux_out;
    
    nSEL <= not(SEL);
    abmux_ctrl    <= not(nSEL(0));
    opmux_ctrl(1) <= not((nSEL(2) and nSEL(1)) or (SEL(1) and nSEL(0)));
    opmux_ctrl(0) <= not((nSEL(2) and nSEL(1)) or (SEL(1) and SEL(0)));
    invmux_ctrl   <= not(SEL(2) and (SEL(1) or nSEL(0)));
end architecture RTL;
-- abmux_ctrl    : SEL0'
-- opmux_ctrl(1) : SEL2'.SEL1' + SEL1.SEL0'
-- opmux_ctrl(0) : SEL2'.SEL1' + SEL1.SEL0
-- invmux_ctrl   : SEL2.(SEL1 + SEL0')