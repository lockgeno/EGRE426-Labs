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

signal negBusB,Busb2 : std_logic_vector(31 downto 0) := x"0000_0000";
signal Cin1, Cin2 : std_logic_vector(32 downto 0) := "000000000000000000000000000000000";
signal one : std_logic_vector(31 downto 0) := x"0000_0001";
begin
twos_comp: process (BusB, negBusB)
begin
negBusB <= not(BusB);
for i in 0 to 31 loop
Busb2(i) <= one(i) xor negBusB(i) xor Cin1(i);
Cin1(i+1) <= (one(i) and negBusB(i)) or (one(i) and Cin1(i)) or (negBusB(i) and Cin1(i));
end loop;
end process twos_comp;
subtracting : process(BusA, Busb2)
begin

for i in 0 to 31 loop 
Result(i) <= BusA(i) xor Busb2(i) xor Cin2(i);
Cin2(i+1) <= (BusA(i) and Busb2(i)) or (BusA(i) and Cin2(i)) or (Busb2(i) and Cin2(i));
end loop;
Carryout <= Cin2(31);
Overflow <= Cin2(31) xor Cin2(30);
end process subtracting;

end behavioral;