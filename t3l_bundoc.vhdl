library IEEE;
use IEEE.std_logic_1164.all;

entity t3l_bundoc is
  port( alarm: out std_logic;
        buzzer_in: in std_logic_vector(2 downto 0);
        buzzer_out: in std_logic_vector(2 downto 0)
      );
end entity;

architecture t3l_bundoc of t3l_bundoc is
begin
  alarm <= (buzzer_in(2) and buzzer_out(2)) or (buzzer_in(2) and buzzer_out(1)) or (buzzer_in(2) and buzzer_out(0))
        or (buzzer_in(1) and buzzer_out(2)) or (buzzer_in(1) and buzzer_out(1)) or (buzzer_in(1) and buzzer_out(0))
        or (buzzer_in(0) and buzzer_out(2)) or (buzzer_in(0) and buzzer_out(1)) or (buzzer_in(0) and buzzer_out(0));
end architecture;
