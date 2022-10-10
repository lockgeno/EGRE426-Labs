library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Logical_Right_Shift is
    Port (  Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           
end Logical_Right_Shift;
architecture behavioral of Logical_Right_Shift is
begin
shift_right_31 : process is
begin

for i in 0 to 30 loop
Result(i) <= BusA(i + 1);
end loop;
Result(31) <= '0';
Overflow <= '0';
Carryout <= '0';
wait;
end process;
end behavioral;