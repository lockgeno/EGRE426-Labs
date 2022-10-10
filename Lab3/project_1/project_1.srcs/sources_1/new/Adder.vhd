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

entity Adder is
    Port ( Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           
end Adder;
architecture Behavioral of Adder is

begin
adding : process(BusA, BusB)
variable Cin : std_logic := '0';
variable Cin_vector : std_logic_vector(31 downto 1);
variable sum : std_logic_vector(31 downto 0);
variable Co : std_logic;
begin
    sum(0) := BusA(0) xor BusB(0) xor Cin;
    Cin_vector(1) := (BusA(0) and BusB(0)) or (BusA(0) and Cin) or (BusB(0) and Cin);
for i in 1 to 30 loop
    sum(i) := BusA(i) xor BusB(i) xor Cin_vector(i);
    Cin_vector(i+1) := (BusA(i) and BusB(i)) or (BusA(i) and Cin_vector(i)) or (BusB(i) and Cin_vector(i));
end loop;
    sum(31) := BusA(31) xor BusB(31) xor Cin_vector(31);
    Co := (BusA(31) and BusB(31)) or (BusA(31) and Cin_vector(31)) or (BusB(31) and Cin_vector(31));
    Result <= sum;
    Carryout <= Co;
    Overflow <= Co xor Cin_vector(31);
end process adding;

end Behavioral;
      