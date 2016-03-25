-- BUNDOC, Noreen Louise C.
-- Lecture Programming Assignment: VHDL
-- CMSC 132 T-3L

-- Library Statements
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Definition
entity t3l_bundoc is
  port( alarm: out std_logic;   -- data output
        IN_BUZZER: in std_logic_vector(2 downto 0); -- state of 3 IN_BUZZER
        OUT_BUZZER: in std_logic_vector(2 downto 0) -- state of 3 OUT_BUZZER
      );
end entity;

architecture t3l_bundoc of t3l_bundoc is
begin
  -- Let a = IN_BUZZER(2), b = IN_BUZZER(1), c = IN_BUZZER(0), d = OUT_BUZZER(2), e = OUT_BUZZER(1), f = OUT_BUZZER(0)
  -- alarm = ad + ae + af + bd + be + bf + cd + ce + cf
  alarm <= (IN_BUZZER(2) and OUT_BUZZER(2)) or (IN_BUZZER(2) and OUT_BUZZER(1)) or (IN_BUZZER(2) and OUT_BUZZER(0))
        or (IN_BUZZER(1) and OUT_BUZZER(2)) or (IN_BUZZER(1) and OUT_BUZZER(1)) or (IN_BUZZER(1) and OUT_BUZZER(0))
        or (IN_BUZZER(0) and OUT_BUZZER(2)) or (IN_BUZZER(0) and OUT_BUZZER(1)) or (IN_BUZZER(0) and OUT_BUZZER(0));
end architecture;
