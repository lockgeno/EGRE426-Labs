----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2022 01:22:32 PM
-- Design Name: 
-- Module Name: top_level - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
   Port (    clk : in std_logic;
             RegWr : in std_logic;
             Rd : in unsigned (4 downto 0);
             Rs : in unsigned (4 downto 0);
             Rt : in unsigned (4 downto 0);
             ALUctr : in unsigned (2 downto 0);
             Zero : out std_logic;
             Overflow : out std_logic;
             Carryout : out std_logic;
             Result : inout unsigned( 31 downto 0));
end top_level;

architecture simple of top_level is

component Register_file
Port(      Ra : in std_logic_vector(4 downto 0);
           Rb : in std_logic_vector (4 downto 0);
           Rw : in std_logic_vector (4 downto 0);
           RegWr : in std_logic;
           Writebus : in std_logic_vector(31 downto 0);
           Clk : in std_logic;
           busA : out std_logic_vector(31 downto 0);
           busB : out std_logic_vector(31 downto 0) );   

end component;
component ALU 
Port( ALUctr : in std_logic_vector(2 downto 0); 
           Zero, Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
end component; 
--signals and variables
signal  bus_A, bus_B : std_logic_vector(31 downto 0); 
signal Ra_i, Rb_i, Rw_i : std_logic_vector(4 downto 0);
signal Result_i1, Result_i2 : std_logic_vector(31 downto 0);
signal ALUctr_i : std_logic_vector(2 downto 0);

begin
Ra_i <= std_logic_vector(Rs);
Rb_i <= std_logic_vector(Rt);
Rw_i <= std_logic_vector(Rd);
ALUctr_i <= std_logic_vector(ALUctr);

Reg_file : Register_file port map (Ra => Ra_i, Rb => Rb_i, Rw => Rw_i, RegWr => RegWr, Writebus => Result_i1, Clk => clk, busA => bus_A, busB => bus_B);

ALU_F : ALU port map( ALUctr => ALUctr_i, Zero => Zero, Overflow => Overflow, Carryout => Carryout,  Result => Result_i2, BusA => bus_A, busB => bus_B); 
Result <= unsigned(Result_i2);
end simple;
