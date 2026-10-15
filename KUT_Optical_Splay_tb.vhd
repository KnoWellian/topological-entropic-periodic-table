-- ====================================================================
-- Copyright (c) 2026 David Noel Lynch. All rights reserved.
-- Project: Topological Entropic Cosmology Hardware Translation
-- Module: KUT_Optical_Splay_tb (Simulation Testbench Framework)
-- ====================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity KUT_Optical_Splay_tb is
-- Testbenches do not possess external ports
end KUT_Optical_Splay_tb;

architecture Simulation of KUT_Optical_Splay_tb is

    -- Component Declaration for the Device Under Test (DUT)
    component KUT_Optical_Splay
        Port (
            clk            : in  STD_LOGIC;
            rst_n          : in  STD_LOGIC;
            atomic_number  : in  STD_LOGIC_VECTOR(7 downto 0);
            splay_channel  : out STD_LOGIC_VECTOR(5 downto 0);
            routing_group  : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Signal declarations to anchor the routing connections
    signal clk_tb           : STD_LOGIC := '0';
    signal rst_n_tb         : STD_LOGIC := '0';
    signal atomic_number_tb : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal splay_channel_tb : STD_LOGIC_VECTOR(5 downto 0);
    signal routing_group_tb : STD_LOGIC_VECTOR(2 downto 0);

    -- Clock Frequency Definition: Locked precisely to KUT 432.081216 MHz
    -- Period calculation: T = 1 / 432.081216 MHz ≈ 2314.38 ps = 2.31438 ns
    constant CLK_PERIOD : time := 2314.38 ps;

begin

    -- Instantiate the Device Under Test (DUT)
    DUT: KUT_Optical_Splay
        port map (
            clk            => clk_tb,
            rst_n          => rst_n_tb,
            atomic_number  => atomic_number_tb,
            splay_channel  => splay_channel_tb,
            routing_group  => routing_group_tb
        );

    -- Clock Generation Process matching the Universal Matrix Core
    clk_process : process
    begin
        clk_tb <= '0';
        wait for CLK_PERIOD / 2;
        clk_tb <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus Vector Process stepping through verified KnoWellian elements
    stim_process : process
    begin
        -- Assert asynchronous system reset
        rst_n_tb <= '0';
        wait for CLK_PERIOD * 2;
        rst_n_tb <= '1';
        wait for CLK_PERIOD;

        -- Test Case 1: Hydrogen (Z = 1) -> Target: Channel 1, Group: Tonic Base
        atomic_number_tb <= STD_LOGIC_VECTOR(to_unsigned(1, 8));
        wait for CLK_PERIOD;

        -- Test Case 2: Helium (Z = 2) -> Target: Channel 2, Group: Octave Closure
        atomic_number_tb <= STD_LOGIC_VECTOR(to_unsigned(2, 8));
        wait for CLK_PERIOD;

        -- Test Case 3: Lithium-7 (Z = 3) -> Target: Channel 3, Group: Tonic Base
        atomic_number_tb <= STD_LOGIC_VECTOR(to_unsigned(3, 8));
        wait for CLK_PERIOD;

        -- Test Case 4: Iron Node Peak (Z = 26) -> Target: Channel 26, Group: Transition Band
        atomic_number_tb <= STD_LOGIC_VECTOR(to_unsigned(26, 8));
        wait for CLK_PERIOD;

        -- Test Case 5: Oganesson Boundary Cutoff (Z = 118) -> Target: Channel 54, Group: Octave Closure
        atomic_number_tb <= STD_LOGIC_VECTOR(to_unsigned(118, 8));
        wait for CLK_PERIOD * 2;

        -- End of verified cosmic hardware cycle simulation run
        wait;
    end process;

end Simulation;
