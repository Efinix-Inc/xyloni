
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT counter
		port ( clk 			: in std_logic;								-- clock input. Could be from internal osc (T4/T8) or from the external 33.3MHz clock use GPIOl_20
				 setn 		: in std_logic;								--  Set signal, low active; sett all outputs to '1' (LED are low active, means all LEDs msut be OFF) GPIOL_12
				 stopn 		: in std_logic;								-- Stop signal, low active Stop counting GPIOL_13
				 Dataout 	: out std_logic_vector ( 3 downto 0)); 		-- Output data connected to the LEDs (low active); GPIOL_21,GPIOL_18,GPIOL_16,GPIOL_09,GPIOL_03
	END COMPONENT;

	SIGNAL clk :  std_logic := '0';
	SIGNAL setn :  std_logic:= '1';
	SIGNAL stopn :  std_logic:= '1';
	SIGNAL Dataout :  std_logic_vector(3 downto 0);
	SIGNAL PERIOD : time := 30ns;
	SIGNAL PERIOD2 : time := PERIOD/2;

BEGIN

-- Please check and add your generic clause manually
	dut: counter PORT MAP(
		clk => clk,
		setn => setn,
		stopn => stopn,
		Dataout => Dataout
	);

-- clock generation
clk <= not clk after PERIOD2;
-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
     setn <='1';
	 stopn <= '1';
	 wait for PERIOD *10;
	 setn <='1';
	 stopn <= '0'; 
	 wait for PERIOD *5;
	 setn <='1';
	 stopn <= '1'; 	
	wait for PERIOD *5;
	 setn <='0';
	 stopn <= '1';  
	wait for PERIOD *5;
	 setn <='1';
	 stopn <= '1'; 
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
