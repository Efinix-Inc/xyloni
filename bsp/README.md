Description
===========
* build.py - Pre-defined Xyloni pin assignment including GPIO, I2C, UART, SPI in a standalone PyAPI script <br/>
* build_csv.py - Customize pin assignment for any Trion device with PyAPI & csv <br/>
* pmod_gpio.csv - Pre-defined Xyloni pin assigment with J3 PMOD as GPIO for build_csv.py input <br/>
* pmod_hbridge.csv - Pre-defined Xyloni pin assigment with J3 PMOD as hbridge for build_csv.py input <br/>
* pmod_i2c.csv - Pre-defined Xyloni pin assigment with J3 PMOD as I2C for build_csv.py input <br/>
* pmod_i2s.csv - Pre-defined Xyloni pin assigment with J3 PMOD as I2S for build_csv.py input <br/>
* pmod_spi.csv - Pre-defined Xyloni pin assigment with J3 PMOD as SPI for build_csv.py input <br/>
* pmod_uart.csv - Pre-defined Xyloni pin assigment with J3 PMOD as UART for build_csv.py input <br/>

##Dependencies
Under efinity/bin/ <br/>
On Windows:
```
setup.bat
```

On Ubuntu:
```
./setup.sh
```

##Usage
###Interface Designer pin assignment generation
For Xyloni in simple
```
python3 build.py -m spi -p hi_xyloni -1 8 -2 5
```
Generate a Xyloni board Interface Designer file with
* Project name: hi_xyloni
* J1 GPIO: 8 pins from pin 3 downto pin 10
* J2 GPIO: 5 pins from pin 19 upto pin 16
* J3 PMOD: as SPI

For customization
```
python3 build_csv.py -p hi_xyloni T8F81 pmod_gpio.csv
```
Generate a Xyloni board Interface Designer file with project name as hi_xyloni following in the pin assignment defined in pmod_gpio.csv.

The output Interface Designer file is ueder output/.

###Top-level template generation
1. Start Efinity
```
efinity
```
2. Create a new project with the same project name, e.g. hi_xyloni
3. move the <project_name>.peri.xml generated under bsp/output/ to your project root
3. Start Interface Designer
4. In Interface Designer, create a PLL if it is used
5. Generate constraint
6. a top-level template <project_name>_template.v is generated under outflow/