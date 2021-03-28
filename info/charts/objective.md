# Objective: Blink Light On And Off Using An ATMEGA328P-AU And Assembly

[X] Find the documentation for ATMEGA328P-AU.
 - /media/pup/Storage/tests/assembly/info/docs/ATmega48A-PA-88A-PA-168A-PA-328-P_datasheet.pdf

[X] Find the assembler compatible with the ATMEGA328P-AU and it's documentation.
 - /media/pup/Storage/tests/assembly/info/docs/ AVR_Assembler.pdf
 - /media/pup/Storage/tests/assembly/info/docs/ AVR_Instruction_Set_Manual.pdf

[X] Research the ATMEGA328P-AU using the found documentation.
 - The ATMEGA328P-AU has three port registers for input and output. These port names are PORTB, PORTC, and PORTD.

 - For my application I need to set the pin that controls SCK for turn a light on and off based on the diagram of the METRO Arduino. The pin of which SCK is marked is within PORTB, and DDRB which needs to be set high with this binary number 0b00100000 for output. SCK is of pin 

 - All definitions can be found within this file for the ATMEGA328P-AU:
 ```
 /media/pup/Storage/assets/programs/Microchip/v5.45/packs/Microchip/ATmega_DFP/2.2.108/avrasm/inc/m328Pdef.inc
 ```

 - Brown-out Detection is within the MCU Status Register (MCUSR). The Brown-out Detection with-in the ATMEGA328P-AU consumes unnecessary current based on the objective. You can turn it of by writing a logical zero to it with this binary number 0b00001011.

 - The internal clock will be in use so CKSEL must be set to 0b0011. The clock is at 128kHz, so using the frequency equation, $f = \frac{instruction-cycles}{time}$

[X] Research the functions of the assembler and subsidiary programs.
 - avra: Assembler for the ATMEGA328P-AU
 - MPLAB IPE: Programming the ATMEGA328P-AU.

- Create more checks based on that research.

[X] Research the setting of PORTx and DDrx pins in assembly.

[X] Construct program.