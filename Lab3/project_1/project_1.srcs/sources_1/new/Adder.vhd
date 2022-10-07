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
    Port ( Zero, Overflow, Carryout : out std_logic;
           Result : inout std_logic_vector(31 downto 0);
           BusA, BusB : inout std_logic_vector (31 downto 0));
           
end Adder;
architecture behavioral of Adder is
signal Cin : std_logic_vector(31 downto 0) := x"0";
begin
addding : process(BusA, BusB)
begin
for i in 0 to 31 loop 
Result(i) <= BusA(i) xor BusB(i) xor Cin(i);
Cin(i+1) <= (BusA(i) and BusB(i)) or (BusA(i) and Cin(i)) or (BusB(i) and Cin(i));
end loop;
Carryout <= Cin(31);
Overflow <= Cin(31) xor Cin(30);
end process;

end behavioral;
      