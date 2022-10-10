----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/10/2022 07:49:36 AM
-- Design Name: 
-- Module Name: Adder_32 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_32 is
Port (  Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
end Adder_32;

architecture structual of Adder_32 is
component Adder 
Port( Carryout : out std_logic;
           Carryin : in std_logic;
           Resultbit : out std_logic;
           A, B : in std_logic);
end component;
signal Carry_vector : std_logic_vector(31 downto 1);
signal Cin0 : std_logic := '0';
signal Co : std_logic;
begin
 FA0: Adder port map( Carryout => Carry_vector(1), Carryin => Cin0, Resultbit => Result(0), A => BusA(0), B => BusB(0));
FA1to29 : for i in 1 to 29 generate
    FA: Adder port map( Carryout => Carry_vector(i+1), Carryin => Carry_vector(i), Resultbit => Result(i), A => BusA(i), B => BusB(i));
    end generate;
 FA30 : Adder port map(Carryout => Carry_vector(31), Carryin => Carry_vector(30), Resultbit => Result(30), A => BusA(30), B => BusB(30));
FA31 : Adder port map(Carryout => Co, Carryin => Carry_vector(31), Resultbit => Result(31), A => BusA(31), B => BusB(31));
Carryout <= Co;
Overflow <= Co xor Carry_vector(31);
end structual;
