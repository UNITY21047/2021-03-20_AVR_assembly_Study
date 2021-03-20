;   Objective: Create a looping on/off program in assembly on the Adafruit Metro Board.
;   Name: Gary Smith
;   Name Of Program: test.asm
;   Equations:  time = instruction-cycle/frequency,
;               1000ms = 1s

    .nolist
    .include "/media/pup/Storage/assets/programs/Microchip/v5.45/packs/Microchip/ATmega_DFP/2.2.108/avrasm/inc/m328Pdef.inc"
    .list

    .CSEG
        ldi r16, 0b00100000     ;   7.8125ms = 1/128kHz --> ldi; value for PORTB and DDRB.
        ldi r17, 0b00001011     ;   7.8125ms --> ldi; value for MCUSR.
        sbr CKSEL0, 1           ;   7.8125ms --> sbr; setting the bit in this register high for internal clock.
        sbr CKSEL1, 1           ;   7.8125ms --> sbr; setting the bit in this register high for internal clock.
        sbr CKSEL2, 0           ;   7.8125ms --> sbr; setting the bit in this register low for internal clock.
        sbr CKSEL3, 0           ;   7.8125ms --> sbr; setting the bit in this register low for internal clock.
        sbr MCUSR, r17          ;   7.8125ms --> out; places data in register 17 into address of MCUSR to disable Brown-out Detection.
        out DDRB, r16           ;   7.8125ms --> out; places data in register 16 into address of DDRB for output.
        out PORTB, r16          ;   7.8125ms --> out; places data in register 16 into address of PORTB for output.
        clr r17                 ;   7.8125ms --> clr; clear register 17.
                                ;  	78.125ms = 10 * 7.8125ms; total.
main:
        sbi PB5, 0              ;   7.8125ms --> sbi; set port b pin low.
        rjmp delay              ;   15.625ms --> rjmp; delay or light off.
        sbi PB5, 1              ;   7.8125ms --> sbi; set port b pin high.
        rjmp delay              ;   15.625ms --> rjmp; delay or light on.
        rjmp main               ;   15.625ms = 2/128kHz --> rjmp; loop back to main label.
                                ;   ; total.
delay:
        ldi r17, 50             ;   15.625ms --> ldi;
loop_1:                           
        dec r17                 ;   7.8125ms --> dec; deceraments the value in register 17.
        brne loop_1             ;   15.625ms --> rjmp; loops back to loop_1 if 
        ldi r17, 50             ;   15.625ms = 2/128kHz --> ldi;
        ret