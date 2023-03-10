-----------------------------------------------------------------------------
-- Faculty of Electrical Engineering
-- PDS 2022
-- https://github.com/knezicm/sava-vrbas/
-----------------------------------------------------------------------------
--
-- unit name:     EIGHT-BIT MULTIPLIER
--
-- description:
--
--  This file implements logic of multiplying two eight-bit numbers.
--
-----------------------------------------------------------------------------
-- Copyright (c) 2022 Faculty of Electrical Engineering
-----------------------------------------------------------------------------
-- The MIT License
-----------------------------------------------------------------------------
-- Copyright 2022 Faculty of Electrical Engineering
--
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the "Software"),
-- to deal in the Software without restriction, including without limitation
-- the rights to use, copy, modify, merge, publish, distribute, sublicense,
-- and/or sell copies of the Software, and to permit persons to whom
-- the Software is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
-- THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-- ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE
-----------------------------------------------------------------------------
--! @file eight_bit_multiplier.vhd
--! @brief  This file implements Eight-bit multiplier logic.
--! @author Tanja Popovic
-------------------------------------------------------
--! Use standard library
library ieee;
--! Use logic elements
use ieee.std_logic_1164.all;
--! Use numeric elements
use ieee.numeric_std.all;

--! @brief Eight-bit multiplier entity description

entity eight_bit_multiplier is
  port (
    A_i   : in  std_logic_vector(7 downto 0); --! Multiplicand
    B_i   : in  std_logic_vector(7 downto 0); --! Multiplier
    RES_o : out std_logic_vector(15 downto 0) --! Product
  );
end eight_bit_multiplier;

--! @brief Architecture definition of Eight-bit multiplier
--! @details Following architecture is based on the algorithm of addition of partial products

architecture arch of eight_bit_multiplier is
begin

  multipler : process (B_i, A_i)
    variable temp_product, temp_b_shift : unsigned (15 downto 0);
  begin
    temp_product := "0000000000000000";
    temp_b_shift := unsigned("00000000" & B_i);
    for i in 0 to 7 loop
      if A_i(i) = '1' then
        temp_product := temp_product + temp_b_shift;
      end if;
      temp_b_shift := temp_b_shift(14 downto 0) & '0';
    end loop;
    RES_o <= std_logic_vector(temp_product);
  end process multipler;
end architecture arch;
