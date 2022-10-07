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

entity Register_file is
    Port ( Ra : in std_logic_vector(4 downto 0);
           Rb : in std_logic_vector (4 downto 0);
           Rw : in std_logic_vector (4 downto 0);
           RegWr : in std_logic;
           busW : inout std_logic_vector(31 downto 0);
           Clk : in std_logic;
           busA : inout std_logic_vector(31 downto 0);
           busB : inout std_logic_vector(31 downto 0)
           );
end Register_file;

architecture behavioral of Register_file is
--type reg_data is array(31 downto 0) of bit_vector( 31 downto 0);
type reg_data is array(31 downto 0) of std_logic_vector( 31 downto 0);
shared variable reg_data_bits : reg_data; 
shared variable Rdi, Rsi, Rti  : integer; 
shared variable fill : integer := 0;
shared variable data1 : std_logic_vector(31 downto 0) := x"0000_0000";
begin
default_registers : process is
begin
--reg_data_bits(0) := data1;
reg_data_bits(0) := x"FFFF_FFFFF";
reg_data_bits(1) := x"FFFF_FFFFF";
reg_data_bits(2) := x"FFFF_FFFFF";
reg_data_bits(3) := x"FFFF_FFFF1";
reg_data_bits(4) := x"0000_0000";
reg_data_bits(5) := x"FFFF_1000";
reg_data_bits(6) := x"FFFF_FFFFF";
reg_data_bits(7) := x"FFFF_FFFFF";
reg_data_bits(8) := x"FFFF_FFFFF";
reg_data_bits(9) := x"FFFF_FFFF1";
reg_data_bits(10) := x"0000_0000";
reg_data_bits(11) := x"FFFF_1000";


wait;
end process default_registers;  
decode_input : process (Clk) is
begin

Rdi := to_integer(unsigned(Rw));
Rti := to_integer(unsigned(Rb));
Rsi := to_integer(unsigned(Ra));

--bus output
if falling_edge(Clk)then
busA <= reg_data_bits(Rsi);
busB <= reg_data_bits(Rti);
end if;
end process decode_input;
--writing to registers
writing_to_reg : process (Clk)is
begin
if falling_edge(Clk)then
if RegWr = '1' then
busW <= reg_data_bits(Rdi) ;
end if;
end if;
end process writing_to_reg;


end behavioral;
