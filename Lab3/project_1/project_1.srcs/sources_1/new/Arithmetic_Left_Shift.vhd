library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Arithmetic_Left_Shift    is
    Port (  Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           
end Arithmetic_Left_Shift  ;
architecture behavioral of Arithmetic_Left_Shift is
begin
shift_left_31 : process is
begin

for i in 31 downto 1 loop
Result(i) <= BusA(i - 1);
end loop;
Result(0) <= '0';
Overflow <= '0';
Carryout <= '0';
wait;
end process; 
end behavioral;