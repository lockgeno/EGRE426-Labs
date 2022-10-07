----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2022 01:32:25 PM
-- Design Name: 
-- Module Name: xor_gate - Behavioral
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

entity xor_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : inout STD_LOGIC);
end xor_gate;

architecture Behavioral of xor_gate is
shared variable C1, C2,C3 : std_logic;

function N_A_N_D(A_in : std_logic; B_in : std_logic) return std_logic is 
variable R_out : std_logic;
begin
R_out := not(A_in and B_in);
return R_out;
end function;
begin

C1 := N_A_N_D(A, B);
C2 := N_A_N_D(A, C1);
C3 := N_A_N_D(B, C1);
C <=  N_A_N_D(C1, C2);


end Behavioral;
