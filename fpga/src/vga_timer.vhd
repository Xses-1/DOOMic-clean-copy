library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity vga_timer is
  port (
      reset   : in std_logic;
      clk     : in std_logic;

      address : out std_logic_vector(17 downto 0);
      
      blank   : out std_logic;
      hsync   : out std_logic;
      vsync   : out std_logic
    );
end entity;

architecture behavioural of vga_timer is
  signal hcount, vcount : unsigned (15 downto 0) := (others => '0');

  -- horiontal
  constant h_screen : integer         := 640;
  constant h_front_porch : integer    := 16;
  constant h_pulse : integer          := 96;
  constant h_back_porch : integer     := 48;
   -- vertical
  constant v_screen : integer         := 480;
  constant v_front_porch : integer    := 10;
  constant v_pulse : integer          := 2;
  constant v_back_porch : integer     := 33;

begin
  process(
