----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:30:07 03/26/2024 
-- Design Name: 
-- Module Name:    RAM1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM1 is
generic(
 gdin :integer := 32;
 gaddr :integer :=8;
 gdout  :integer :=32
);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  en : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (7 downto 0);
           rd : in  STD_LOGIC;
			  wr : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (31 downto 0);
           dout : out  STD_LOGIC_VECTOR (31 downto 0));
end RAM1;

architecture Behavioral of RAM1 is
type ram_type is array (2**gaddr-1 downto 0) of std_logic_vector (gdin-1 downto 0);
signal myram :ram_type;
begin

process (clk,rst)
begin
   if (clk'event and clk = '1') then
	if rst = '1' then
	 for i in 0 to 255 loop
   dout <= (others => '0');
   end loop; 
     elsif en = '1' then
                if wr = '1' then
                    myram(conv_integer(addr)) <= din;
                end if;
					 if rd = '1' then
                    dout <= myram(conv_integer(addr)) ;
                end if;
                
            end if;
        end if;
    end process;

end Behavioral;

