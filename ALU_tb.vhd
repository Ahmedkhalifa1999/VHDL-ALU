library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all; -- @suppress "Deprecated package"

entity ALU_tb is

end entity ALU_tb;

architecture RTL of ALU_tb is
    component ALU is
        port(
            A   : in std_logic_vector(3 downto 0);
            B   : in std_logic_vector(3 downto 0);
            SEL : in std_logic_vector(3 downto 0);
            Y   : out std_logic_vector(4 downto 0)
        );
    end component;
    signal A   : std_logic_vector(3 downto 0);
    signal B   : std_logic_vector(3 downto 0);
    signal SEL : std_logic_vector(3 downto 0);
    signal Y   : std_logic_vector(4 downto 0);
begin
    UUT : ALU port map(A => A, B => B, SEL => SEL, Y => Y);
    
    process is
    begin
        -- 0-Increment A
        SEL <= "0000";
        A <= "0000";
        L000 : loop
            B <= "0000";
            L001 : loop
                wait for 5 ns;
                assert(Y = A + 1) report ("Error in Increment A") severity warning;
                wait for 5 ns;
                exit L001 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L000 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 1-Decrement A
        SEL <= "0001";
        A <= "0000";
        L010 : loop
            B <= "0000";
            L011 : loop
                wait for 5 ns;
                assert(Y = A - 1) report ("Error in Decrement A") severity warning;
                wait for 5 ns;
                exit L011 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L010 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 2-Pass B
        SEL <= "0010";
        A <= "0000";
        L020 : loop
            B <= "0000";
            L021 : loop
                SEL <= "0010";
                wait for 5 ns;
                assert(Y = B) report ("Error in Pass B") severity warning;
                wait for 5 ns;
                exit L021 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L020 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 3-Increment B
        SEL <= "0011";
        A <= "0000";
        L030 : loop
            B <= "0000";
            L031 : loop
                wait for 5 ns;
                assert(Y = B + 1) report ("Error in Increment B") severity warning;
                wait for 5 ns;
                exit L031 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L030 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 4-Decrement B
        SEL <= "0100";
        A <= "0000";
        L040 : loop
            B <= "0000";
            L041 : loop
                wait for 5 ns;
                assert(Y = B - 1) report ("Error in Decrement B") severity warning;
                wait for 5 ns;
                exit L041 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L040 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 5-Pass A
        SEL <= "0101";
        A <= "0000";
        L050 : loop
            B <= "0000";
            L051 : loop
                wait for 5 ns;
                assert(Y = A) report ("Error in Pass A") severity warning;
                wait for 5 ns;
                exit L051 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L050 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 6-Addition
        SEL <= "0110";
        A <= "0000";
        L060 : loop
            B <= "0000";
           L061 : loop
                wait for 5 ns;
                assert(Y = A + B) report ("Error in Addition") severity warning;
                wait for 5 ns;
                exit L061 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L060 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 7-A*2
        SEL <= "0111";
        A <= "0000";
        L070 : loop
            B <= "0000";
            L071 : loop
                wait for 5 ns;
                assert(Y = (A(3 downto 0) & '0')) report ("Error in A x 2") severity warning;
                wait for 5 ns;
                exit L071 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L070 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 8-A'
        SEL <= "1000";
        A <= "0000";
        L080 : loop
            B <= "0000";
            L081 : loop
                wait for 5 ns;
                assert(Y = ('0' & not(A(3 downto 0)))) report ("Error in Complement A") severity warning;
                wait for 5 ns;
                exit L081 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L080 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 9-B'
        SEL <= "1001";
        A <= "0000";
        L090 : loop
            B <= "0000";
            L091 : loop
                wait for 5 ns;
                assert(Y = ('0' & not(B(3 downto 0)))) report ("Error in Complement B") severity warning;
                wait for 5 ns;
                exit L091 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L090 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 10-and
        SEL <= "1010";
        A <= "0000";
        L100 : loop
            B <= "0000";
            L101 : loop
                wait for 5 ns;
                assert(Y = ('0' & (A(3 downto 0) and B(3 downto 0)))) report ("Error in AND") severity warning;
                wait for 5 ns;
                exit L101 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L100 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 11-or
        SEL <= "1011";
        A <= "0000";
        L110 : loop
            B <= "0000";
            L111 : loop
                wait for 5 ns;
                assert(Y = ('0' & (A(3 downto 0) or B(3 downto 0)))) report ("Error in OR") severity warning;
                wait for 5 ns;
                exit L111 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L110 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 12-xor
        SEL <= "1100";
        A <= "0000";
        L120 :  loop
            B <= "0000";
            L121 : loop
                wait for 5 ns;
                assert(Y = ('0' & (A(3 downto 0) xor B(3 downto 0)))) report ("Error in XOR") severity warning;
                wait for 5 ns;
                exit L121 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L120 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 13-xnor
        SEL <= "1101";
        A <= "0000";
        L130 : loop
            B <= "0000";
            L131 : loop
                wait for 5 ns;
                assert(Y = ('0' & not(A(3 downto 0) xor B(3 downto 0)))) report ("Error in XNOR") severity warning;
                wait for 5 ns;
                exit L131 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L130 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 14-nand
        SEL <= "1110";
        A <= "0000";
        L140 : loop
            B <= "0000";
            L141 : loop
                wait for 5 ns;
                assert(Y = ('0' & not(A(3 downto 0) and B(3 downto 0)))) report ("Error in NAND") severity warning;
                wait for 5 ns;
                exit L141 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L140 when(A = "1111");
            A <= A + 1;
        end loop;
        
        -- 15-nor
        SEL <= "1111";
        A <= "0000";
        L150 : loop
            B <= "0000";
            L151 : loop
                wait for 5 ns;
                assert(Y = ('0' & not(A(3 downto 0) or B(3 downto 0)))) report ("Error in NOR") severity warning;
                wait for 5 ns;
                exit L151 when(B = "1111");
                B <= B + 1;
            end loop;
            exit L150 when(A = "1111");
            A <= A + 1;
        end loop;
        
        report ("Simulation Finished");
	wait;
    end process;
end architecture RTL;
