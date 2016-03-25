library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity t3l_bundoc_tb is
end entity;

architecture t3l_bundoc_tb of t3l_bundoc_tb is
  signal alarm: std_logic;
  signal buzzer_in: std_logic_vector(2 downto 0);
  signal buzzer_out: std_logic_vector(2 downto 0);
  component t3l_bundoc is
    port( alarm: out std_logic;
          buzzer_in: in std_logic_vector(2 downto 0);
          buzzer_out: in std_logic_vector(2 downto 0)
        );
  end component;

begin
  uut: component t3l_bundoc port map(alarm, buzzer_in, buzzer_out);
  main: process is
    variable temp: unsigned(5 downto 0);
    variable expected_alarm: std_logic;
    variable error_count: integer := 0;

  begin --process
  report "start simulation";

    for i in 0 to 63 loop
      temp := TO_UNSIGNED(i, 6);
      --assign each input a value from temp
      buzzer_in(2) <= temp(5);
      buzzer_in(1) <= temp(4);
      buzzer_in(0) <= temp(3);
      buzzer_out(2) <= temp(2);
      buzzer_out(1) <= temp(1);
      buzzer_out(0) <= temp(0);

      if((i >=0 and i <= 8) or i = 16 or i = 24 or i = 32 or i = 40 or i = 48 or i = 56) then expected_alarm :='0';
      else expected_alarm := '1';
      end if;
      wait for 10 ns;

      assert(expected_alarm = alarm)
        report "ERROR: Expected_alarm " &
          std_logic'image(expected_alarm) & " /= alarm " & std_logic'image(alarm) & " at time " & time'image(now);

      if((expected_alarm /= alarm))
        then error_count := error_count + 1;
      end if;
    end loop;
    wait for 10 ns;

    assert (error_count = 0)
      report "ERROR: There were " & integer'image(error_count) & " errors!";
      if(error_count = 0)
        then report "Simulation completed with NO errors.";
      end if;
    wait;
  end process;
end architecture;
