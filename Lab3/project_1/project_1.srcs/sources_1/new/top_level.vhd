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
           busW : inout std_logic_vector(31 downto 0);
           Clk : in std_logic;
           busA : inout std_logic_vector(31 downto 0);
           busB : inout std_logic_vector(31 downto 0) );   

end component;
component ALU 
Port( ALUctr : in std_logic_vector(2 downto 0); 
           Zero, Overflow, Carryout : out std_logic;
           Result : inout std_logic_vector(31 downto 0);
           BusA, BusB : inout std_logic_vector (31 downto 0));
end component;
--signals and variables
signal busWrite, bus_A, bus_B : std_logic_vector(31 downto 0); 
signal Ra_i, Rb_i, Rw_i : std_logic_vector(4 downto 0);
signal Result_i : std_logic_vector(31 downto 0);
begin
Ra_i <= std_logic_vector(Rs);
Rb_i <= std_logic_vector(Rt);
Rw_i <= std_logic_vector(Rd);

Reg_file : Register_file port map (Ra => Ra_i, Rb => Rb_i, Rw => Rw_i, RegWr => RegWr, busW => busWrite, Clk => clk, busA => bus_A, busB => bus_B);
end simple;
