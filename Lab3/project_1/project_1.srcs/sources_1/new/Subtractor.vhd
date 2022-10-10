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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Subtractor    is
    Port (  Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           
end Subtractor;
architecture behavioral of Subtractor is

begin

subtracting : process(BusA, BusB)
variable Bin : std_logic := '0';
variable Bin_vector : std_logic_vector(31 downto 1);
variable diff : std_logic_vector(31 downto 0);
variable Co : std_logic;
begin
    diff(0) := BusA(0) xor BusB(0) xor Bin;
    Bin_vector(1) := (not(BusA(0)) and BusB(0)) or (not(BusA(0)xor BusB(0)) and Bin);
for i in 1 to 30 loop
    diff(i) := BusA(i) xor BusB(i) xor Bin_vector(i);
    Bin_vector(i+1) := (not(BusA(i)) and BusB(i)) or (not(BusA(i)xor BusB(i)) and Bin_vector(i));
end loop;
    diff(31) := BusA(31) xor BusB(31) xor Bin_vector(31);
    Co := (not(BusA(31)) and BusB(31)) or (not(BusA(31)xor BusB(31)) and Bin_vector(31));
    Result <= diff;
    Carryout <= Co;
    Overflow <= Co xor Bin_vector(31);
end process subtracting;

end behavioral;