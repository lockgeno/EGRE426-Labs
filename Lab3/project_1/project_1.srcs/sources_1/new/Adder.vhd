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
    Port ( Carryout : out std_logic;
           Carryin : in std_logic;
           Resultbit : out std_logic;
           A, B : in std_logic);
           
end Adder;
architecture behavioral of Adder is
signal Cin : std_logic_vector(31 downto 0) := x"0000_0000";
signal Co : std_logic;
signal Result_sig : std_logic_vector(31 downto 0) := x"0000_0000";
begin
adding : process(BusA, BusB)
begin
for i in 0 to 30 loop
Result_sig(i) <= BusA(i) xor BusB(i) xor Cin(i);
Cin(i+1) <= (BusA(i) and BusB(i)) or (BusA(i) and Cin(i)) or (BusB(i) and Cin(i));
end loop;
Result_sig(31) <= BusA(31) xor BusB(31) xor Cin(31);
Co <= (BusA(31) and BusB(31)) or (BusA(31) and Cin(31)) or (BusB(31) and Cin(31)); 
Carryout <= Co;
Overflow <= Cin(31) xor Co;
Result <= Result_sig;
end process adding;

end behavioral;
      