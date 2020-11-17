-- smal example design for the Xyloni Efinix Eval Board
-- By Harald Werner
-- 15.10.2020
-- 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
port ( clk 			: in std_logic;							-- clock input. Could be from internal osc (T8) or from the external 33.3MHz clock use GPIOl_20
		 setn 		: in std_logic;							--  Set signal, low active; sett all outputs to '1' (LED are high active, means all LEDs msut be ON) GPIOR_02
		 stopn 		: in std_logic;							-- Stop signal, low active Stop counting GPIOR_15
	     Dataout 	: out std_logic_vector ( 3 downto 0)); 	-- Output data connected to the LEDs (high active); GPIOR_17,GPIOR_16,GPIOR_37,GPIOL_21
end counter;

architecture vers1 of counter is
signal cnt: std_logic_vector ( 29 downto 0) := (others => '0');
Begin
cnt_proc : process(clk, setn)
			Begin
				if setn = '0' then
					cnt 	<= (others => '1');
					dataout <= (others => '1');
				elsif clk'event and clk = '1' then
					if stopn = '0' then
						cnt <= cnt;
					else 
						cnt <= cnt +1;
					end if;
--                    Dataout <= cnt(17 downto 14);  		--17 downto 14 OK for the 10Khz internal oscillator. For the 33MHz external clock use 29 downto 26
					Dataout <= cnt(29 downto 26);  	--17 downto 14 OK for the 10Khz internal oscillator. For the 33MHz external clock use 29 downto 26
				end if;
			end process;
end vers1;
					