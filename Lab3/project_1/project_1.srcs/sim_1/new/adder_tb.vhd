----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/10/2022 07:09:58 AM
-- Design Name: 
-- Module Name: adder_tb - Behavioral
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

entity adder_tb is
--  Port ( );
end adder_tb;

architecture Behavioral of adder_tb is
--BusAValues
type BusAVal is array(0 to 1) of std_logic_vector(31 downto 0);
type BusBVal is array (0 to 1) of std_logic_vector(31 downto 0);

constant IBusAVals : BusAVal := ( x"0000_0001",
                                  x"0000_0010");
constant IBusBVals : BusBVal := ( x"0000_0011",
                                  x"0000_0110");

signal BusAT : std_logic_vector(31 downto 0);
signal BusBT : std_logic_vector(31 downto 0) ;
signal Cout, Overflow :std_logic;
signal Result : std_logic_vector(31 downto 0);
begin
DUT : entity work.Adder(behavioral)
port map( Overflow => Overflow,
          Carryout => Cout,
          Result => Result,
          BusA => BusAT,
          BusB => BusBT);
stimulus : process
begin
for i in 0 to 1 loop
BusAT <= IBusAVals(i);
BusBT <= IBusBVals(i);
wait for 10ns;
end loop;
wait; 
end process stimulus;
end Behavioral;
