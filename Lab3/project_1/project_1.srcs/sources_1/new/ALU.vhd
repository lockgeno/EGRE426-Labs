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

entity ALU is
    Port ( ALUctr : in std_logic_vector(2 downto 0); 
           Zero, Overflow, Carryout : out std_logic;
           Result : inout std_logic_vector(31 downto 0);
           BusA, BusB : inout std_logic_vector (31 downto 0));
           
end ALU;
architecture behavioral of ALU is
begin
case ALUctr is 
when "000" =>
when "001"=>
when "010" =>
when "011"=>
when "100" =>
when "101"=>
when "110" =>
when "111"=>
when others =>

end case;



end behavioral;