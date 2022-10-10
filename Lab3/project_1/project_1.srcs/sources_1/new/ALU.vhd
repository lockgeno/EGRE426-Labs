----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/22/2022 03:31:18 PM
-- Design Name: 
-- Module Name: Register_file - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( ALUctr : in std_logic_vector(2 downto 0); 
           Zero, Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           
end ALU;
architecture behavioral of ALU is
signal Adder_R, Subtractor_R, AND_R, OR_R, LLS_R, LRS_R, ALS_R, ARS_R : std_logic_vector(31 downto 0):= x"0000_0000"; 
signal Adder_CO, Subtractor_CO, AND_CO, OR_CO, LLS_CO, LRS_CO, ALS_CO, ARS_CO : std_logic;
signal Adder_OF, Subtractor_OF, AND_OF, OR_OF, LLS_OF, LRS_OF, ALS_OF, ARS_OF : std_logic;
component Adder 
    Port ( Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           end component;
component Subtractor 
    Port ( Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           end component;
component Bitwise_AND 
    Port ( Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           end component;
 component Bitwise_OR 
    Port ( Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           end component;
 component Logical_Left_Shift 
    Port (  Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           end component;
           
 component Logical_Right_Shift 
    Port (  Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           end component;
 component Arithmetic_Left_Shift 
    Port (  Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           end component;
           
 component Arithmetic_Right_Shift 
    Port (  Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           end component;
function zero_test( C: std_logic_vector (31 downto 0))
    return std_logic is
    variable zeroval : std_logic;
    begin
    for i in 0 to 31 loop
        if (C(i) = '1')then 
            zeroval := '0';
            return zeroval;
        else 
           zeroval := '1';
         end if;
      end loop;
    return zeroval;
    end zero_test;
begin
--F32adder : adder port map( Overflow => Adder_OF, Carryout => Adder_CO, Result => Adder_R, BusA => BusA, BusB => BusB);
--F32subtractor : Subtractor  port map( Overflow => Subtractor_OF, Carryout => Subtractor_CO, Result => Subtractor_R, BusA => BusA, BusB => BusB);
F32ANDgate : Bitwise_AND port map( Overflow => AND_OF, Carryout => AND_CO, Result => AND_R, BusA => BusA, BusB => BusB);
F32ORgate : Bitwise_OR  port map( Overflow => OR_OF, Carryout => OR_CO, Result => OR_R, BusA => BusA, BusB => BusB);
F32LLS : Logical_Left_Shift port map( Overflow => LLS_OF, Carryout => LLS_OF, Result => LLS_R, BusA => BusA, BusB => BusB);
F32LRS : Logical_Right_Shift  port map( Overflow => LRS_OF, Carryout => LRS_CO, Result => LRS_R, BusA => BusA, BusB => BusB);
F32ALS : Arithmetic_Left_Shift  port map( Overflow => ALS_OF, Carryout => ALS_CO, Result => ALS_R, BusA => BusA, BusB => BusB);
F32ARS : Arithmetic_Right_Shift   port map( Overflow => ARS_OF , Carryout => ARS_CO, Result => ARS_R, BusA => BusA, BusB => BusB);

multiplexer: process(BusA, BusB) 
begin
case ALUctr is

    when "000" =>
        
        Result <= BusA + BusB; 
        Zero <= zero_test(Adder_R);
        Overflow <= Adder_OF;
        Carryout <= Adder_CO;
    when "001" => 
        Result <= BusA -BusB;
        Zero <= zero_test(Adder_R);
        Overflow <= Subtractor_OF;
        Carryout <= Subtractor_CO;
     when "010" =>
        Result <= AND_R; 
        Zero <= zero_test(AND_R);
        Overflow <= AND_OF;
        Carryout <= AND_CO;
     when "011" => 
        Result <= OR_R;
        Zero <= zero_test(OR_R);
        Overflow <= OR_OF;
        Carryout <= OR_CO;
     when "100" =>
        Result <= LLS_R; 
        Zero <= zero_test(LLS_R);
        Overflow <= LLS_OF;
        Carryout <= LLS_CO; 
     when "101" => 
        Result <= LRS_R;
        Zero <= zero_test(LRS_R);
        Overflow <= LRS_OF;
        Carryout <= LRS_CO;
     when "110" =>
        Result <= ALS_R; 
        Zero <= zero_test(ALS_R);
        Overflow <= ALS_OF;
        Carryout <= ALS_CO;
     when "111" => 
        Result <= ARS_R;
        Zero <= zero_test(ARS_R);
        Overflow <= ARS_OF;
        Carryout <= ARS_CO;
    when others =>
end case;
end process multiplexer;



end behavioral;