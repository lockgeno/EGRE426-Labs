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
           Writebus : in std_logic_vector(31 downto 0);
           Clk : in std_logic;
           busA : out std_logic_vector(31 downto 0);
           busB : out std_logic_vector(31 downto 0)
           );
end Register_file;

architecture behavioral of Register_file is
--type reg_data is array(31 downto 0) of bit_vector( 31 downto 0);
type reg_data is array(31 downto 0) of std_logic_vector( 31 downto 0);
shared variable reg_data_bits : reg_data := (x"00000000", --$zero0
                                     x"11111111", --$at 1
                                     x"ffffffff", --$v0 2
                                     x"33333333", --$v1 3
                                     x"44444444", --$a0 4
                                     x"55555555", --$a1 5
                                     x"66666666", --$a2 6
                                     x"77777777", --$a3 7 
                                     x"88888888", --$t0 8
                                     x"99999999", --$t1 9
                                     x"aaaaaaaa", --$t2 10
                                     x"bbbbbbbb", --$t3 11
                                     x"cccccccc", --$t4 12
                                     x"dddddddd", --$t5 13
                                     x"00000000", --$t6 14
                                     x"ffffffff", --$t7 15
                                     x"11111111", --$s0 16
                                     x"22222222", --$s1 17
                                     x"33333333", --$s2 18
                                     x"44444444", --$s3 19
                                     x"55555555", --$s4 20
                                     x"66666666", --$s5 21
                                     x"77777777", --$s6 22 
                                     x"88888888", --$s7 23
                                     x"99999999", --$t8 24
                                     x"aaaaaaaa", --$t9 25
                                     x"bbbbbbbb", --$k0 26
                                     x"cccccccc", --$k1 27
                                     x"10008000", 
                                     x"7ffff1ec", 
                                     x"00000000",  
                                     x"eeeeeeee"  
                                     ); 
shared variable Rdi, Rsi, Rti  : integer; 
shared variable fill : integer := 0;
--shared variable data1 : std_logic_vector(31 downto 0) := x"0000_0000";
begin
  
decode_input : process (Clk, RegWr) is
begin

Rdi := to_integer(unsigned(Rw));
Rti := to_integer(unsigned(Rb));
Rsi := to_integer(unsigned(Ra));
if falling_edge(Clk)then
busA <= reg_data_bits(Rsi);
busB <= reg_data_bits(Rti);
if RegWr = '1' then
reg_data_bits(Rdi) := Writebus;
end if;
end if; 


end process decode_input;
--writing to registers



end behavioral;
