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
    Port (  Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           
end Adder;
architecture behavioral of Adder is
signal Cin : std_logic_vector(31 downto 0) := x"0000_0000";
signal Co : std_logic;
begin
addding : process(BusA, BusB)
begin
for i in 0 to 30 loop 
Result(i) <= BusA(i) xor BusB(i) xor Cin(i);
Cin(i+1) <= (BusA(i) and BusB(i)) or (BusA(i) and Cin(i)) or (BusB(i) and Cin(i));
end loop;
Result(31) <= BusA(31) xor BusB(31) xor Cin(31);
Co <= (BusA(31) and BusB(31)) or (BusA(31) and Cin(31)) or (BusB(31) and Cin(31)); 
Carryout <= Co;
Overflow <= Cin(31) xor Co;
end process;

end behavioral;
      