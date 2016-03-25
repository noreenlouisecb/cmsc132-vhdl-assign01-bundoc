library IEEE;
use IEEE.std_logic_1164.all;

entity t3l_bundoc is
  port( alarm: out std_logic;
        IN_BUZZER: in std_logic_vector(2 downto 0);
        OUT_BUZZER: in std_logic_vector(2 downto 0)
      );
end entity;

architecture t3l_bundoc of t3l_bundoc is
begin
  alarm <= (IN_BUZZER(2) and OUT_BUZZER(2)) or (IN_BUZZER(2) and OUT_BUZZER(1)) or (IN_BUZZER(2) and OUT_BUZZER(0))
        or (IN_BUZZER(1) and OUT_BUZZER(2)) or (IN_BUZZER(1) and OUT_BUZZER(1)) or (IN_BUZZER(1) and OUT_BUZZER(0))
        or (IN_BUZZER(0) and OUT_BUZZER(2)) or (IN_BUZZER(0) and OUT_BUZZER(1)) or (IN_BUZZER(0) and OUT_BUZZER(0));
end architecture;
