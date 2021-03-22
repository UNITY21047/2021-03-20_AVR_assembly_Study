;   Objective: Create a looping on/off program in assembly on the Adafruit Metro Board.
;   Name: Gary Smith
;   Name Of Program: test.asm
;   Equations:  time = instruction-cycle/frequency,
;               0.000001μs = 1/1000000MHz

.nolist
.include "/media/pup/Storage/assets/programs/Microchip/v5.45/packs/Microchip/ATmega_DFP/2.2.108/avrasm/inc/m328Pdef.inc"
.list

.CSEG
                ldi r16, 0b00001011     ; loads value inti register 16
                out MCUSR, r16          ; Places data from register 16 into address of MCUSR to disable Brown-out Detection.
                clr r16
                ldi r16, 0b00100000
                out DDRB, r16             ; places data in Port B Data Direction Register 5 for output.
                out PORTB, r16            ; places data in PORTB register 5 for output.

        main:
                call delay              ; delay for light off.
                clr r16
                ldi r16, 0b00000000
                out PORTB, r16            ; set PORTB pin 5.
                call delay
                clr r16
                ldi r16, 0b00100000
                out PORTB, r16
                rjmp main               ; loop back to main label.
                                
        delay:
                ldi r26, low(60000)     ; place 0 in register 26.
                ldi r27, high(60000)    ; place 64888 in register 26.
        loop_1:
                clr r16                 ; clears register 16.
        loop_2:
                inc r16                 ; deceraments the value in register 17.
                brne loop_2             ; loops to loop_1 if the Zero flag is set.
                adiw r26, 1             ; add 1 to register pair r26,27.
                brne loop_1             ; loops to loop_2 if the Zero flag is set.
                ret                     ; exit the delay subroutine.