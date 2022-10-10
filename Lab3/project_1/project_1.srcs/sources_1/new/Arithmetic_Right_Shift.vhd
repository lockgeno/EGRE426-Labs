library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Arithmetic_Right_Shift    is
    Port (  Overflow, Carryout : out std_logic;
           Result : out std_logic_vector(31 downto 0);
           BusA, BusB : in std_logic_vector (31 downto 0));
           
end Arithmetic_Right_Shift  ;
architecture behavioral of Arithmetic_Right_Shift is
begin
shift_right_31 : process(BusA, BusB) is
begin

Result(31 downto 0) <= busA(31) & busA(31 downto 1) ;
Overflow <= '0';
Carryout <= '0';
end process;

end behavioral;
