
_main:

;VendingMachine.c,79 :: 		void main() {
;VendingMachine.c,83 :: 		mstep=0;
	CLRF       _mstep+0
	CLRF       _mstep+1
;VendingMachine.c,85 :: 		ADCON1 = 0x06; // To turn off analog to digital converters (Make all digital)
	MOVLW      6
	MOVWF      ADCON1+0
;VendingMachine.c,86 :: 		TRISC = 0x00; // PORT C as output port
	CLRF       TRISC+0
;VendingMachine.c,87 :: 		PORTC = 0xFF;// For 2 Stepper motors
	MOVLW      255
	MOVWF      PORTC+0
;VendingMachine.c,88 :: 		TRISA = 0x00; // PORT A as output port
	CLRF       TRISA+0
;VendingMachine.c,89 :: 		PORTA = 0x0F; // For 1 Stepper motors
	MOVLW      15
	MOVWF      PORTA+0
;VendingMachine.c,93 :: 		TRISE = TRISE | 0x03;
	MOVLW      3
	IORWF      TRISE+0, 1
;VendingMachine.c,97 :: 		LCD_Initialize();
	CALL       _LCD_initialize+0
;VendingMachine.c,100 :: 		keyinit();
	CALL       _keyinit+0
;VendingMachine.c,102 :: 		while(1)
L_main0:
;VendingMachine.c,104 :: 		LCD_String_xy(2,0,"Credit:");
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr1_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,105 :: 		if(bal==0)
	MOVLW      0
	XORWF      _bal+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main124
	MOVLW      0
	XORWF      _bal+0, 0
L__main124:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;VendingMachine.c,106 :: 		{LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,107 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,108 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,109 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,110 :: 		LCD_char('0');}
	MOVLW      48
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
	GOTO       L_main3
L_main2:
;VendingMachine.c,112 :: 		{WordToStr(bal,balval);
	MOVF       _bal+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _bal+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _balval+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;VendingMachine.c,113 :: 		LCD_String_xy(2,7,balval);}
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      7
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
L_main3:
;VendingMachine.c,114 :: 		LCD_String_xy(1,0,"Select(1,2,3):");//Start from pos 14
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr2_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,115 :: 		LCD_command(0x0F);//Cursor Blinking
	MOVLW      15
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;VendingMachine.c,116 :: 		while(C1&&C2&&C3)
L_main4:
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main5
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main5
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main5
L__main113:
;VendingMachine.c,118 :: 		if(IR1==0)
	BTFSC      PORTE+0, 1
	GOTO       L_main8
;VendingMachine.c,120 :: 		bal=bal+5;
	MOVLW      5
	ADDWF      _bal+0, 0
	MOVWF      R0+0
	MOVF       _bal+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _bal+0
	MOVF       R0+1, 0
	MOVWF      _bal+1
;VendingMachine.c,121 :: 		WordToStr(bal,balval);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _balval+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;VendingMachine.c,122 :: 		LCD_String_xy(2,7,balval);
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      7
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,123 :: 		LCD_String_xy(1,13,":");//For cursor
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      13
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      ?lstr3_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,124 :: 		read=1;
	MOVLW      1
	MOVWF      _read+0
	MOVLW      0
	MOVWF      _read+1
;VendingMachine.c,127 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay+0
	MOVLW      3
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,128 :: 		read=0;
	CLRF       _read+0
	CLRF       _read+1
;VendingMachine.c,130 :: 		}
L_main8:
;VendingMachine.c,132 :: 		if(IR2==0)
	BTFSC      PORTE+0, 0
	GOTO       L_main10
;VendingMachine.c,134 :: 		MSdelay(600);
	MOVLW      88
	MOVWF      FARG_MSdelay+0
	MOVLW      2
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,135 :: 		bal=bal+50;
	MOVLW      50
	ADDWF      _bal+0, 0
	MOVWF      R0+0
	MOVF       _bal+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _bal+0
	MOVF       R0+1, 0
	MOVWF      _bal+1
;VendingMachine.c,136 :: 		WordToStr(bal,balval);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _balval+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;VendingMachine.c,137 :: 		LCD_String_xy(2,7,balval);
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      7
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,138 :: 		LCD_String_xy(1,13,":");//For cursor
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      13
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      ?lstr4_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,139 :: 		read=1;
	MOVLW      1
	MOVWF      _read+0
	MOVLW      0
	MOVWF      _read+1
;VendingMachine.c,142 :: 		MSdelay(1000);
	MOVLW      232
	MOVWF      FARG_MSdelay+0
	MOVLW      3
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,143 :: 		read=0;
	CLRF       _read+0
	CLRF       _read+1
;VendingMachine.c,145 :: 		}
L_main10:
;VendingMachine.c,148 :: 		}
	GOTO       L_main4
L_main5:
;VendingMachine.c,149 :: 		Sel=key();
	CALL       _key+0
	MOVF       R0+0, 0
	MOVWF      _Sel+0
;VendingMachine.c,152 :: 		if(Sel=='1'||Sel=='2'||Sel=='3'||Sel=='*')
	MOVF       R0+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L__main112
	MOVF       _Sel+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L__main112
	MOVF       _Sel+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L__main112
	MOVF       _Sel+0, 0
	XORLW      42
	BTFSC      STATUS+0, 2
	GOTO       L__main112
	GOTO       L_main14
L__main112:
;VendingMachine.c,154 :: 		LCD_String_xy(1,13,":");//Move cursor back to select
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      13
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      ?lstr5_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,155 :: 		LCD_Char(Sel); // Display value on Keypad
	MOVF       _Sel+0, 0
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,156 :: 		}
L_main14:
;VendingMachine.c,158 :: 		if(sel=='1')//Item 1
	MOVF       _Sel+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;VendingMachine.c,160 :: 		LCD_command(0x0C);//Cursor off
	MOVLW      12
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;VendingMachine.c,161 :: 		MSdelay(500);
	MOVLW      244
	MOVWF      FARG_MSdelay+0
	MOVLW      1
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,162 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,164 :: 		while(1)
L_main16:
;VendingMachine.c,166 :: 		LCD_String_xy(1,0,"Item1: 5Fils");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr6_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,167 :: 		LCD_String_xy(2,0,"Credit:");
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr7_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,168 :: 		if(bal==0)
	MOVLW      0
	XORWF      _bal+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main125
	MOVLW      0
	XORWF      _bal+0, 0
L__main125:
	BTFSS      STATUS+0, 2
	GOTO       L_main18
;VendingMachine.c,170 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,171 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,172 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,173 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,174 :: 		LCD_char('0');}
	MOVLW      48
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
	GOTO       L_main19
L_main18:
;VendingMachine.c,176 :: 		{LCD_String_xy(2,7,balval);}
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      7
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
L_main19:
;VendingMachine.c,177 :: 		if(bal>=5)
	MOVLW      0
	SUBWF      _bal+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main126
	MOVLW      5
	SUBWF      _bal+0, 0
L__main126:
	BTFSS      STATUS+0, 0
	GOTO       L_main20
;VendingMachine.c,179 :: 		Wmotor=1;
	MOVLW      1
	MOVWF      _Wmotor+0
	MOVLW      0
	MOVWF      _Wmotor+1
;VendingMachine.c,180 :: 		bal=bal-5;
	MOVLW      5
	SUBWF      _bal+0, 1
	BTFSS      STATUS+0, 0
	DECF       _bal+1, 1
;VendingMachine.c,181 :: 		Msdelay(2500);
	MOVLW      196
	MOVWF      FARG_MSdelay+0
	MOVLW      9
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,182 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,183 :: 		LCD_String_xy(1,0,"Processing..");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr8_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,184 :: 		for (mstep=0;mstep<steps;mstep++)
	CLRF       _mstep+0
	CLRF       _mstep+1
L_main21:
	MOVLW      4
	SUBWF      _mstep+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main127
	MOVLW      56
	SUBWF      _mstep+0, 0
L__main127:
	BTFSC      STATUS+0, 0
	GOTO       L_main22
;VendingMachine.c,186 :: 		full_drive(clockwise,Wmotor);
	CLRF       FARG_full_drive+0
	MOVF       _Wmotor+0, 0
	MOVWF      FARG_full_drive+0
	MOVF       _Wmotor+1, 0
	MOVWF      FARG_full_drive+1
	CALL       _full_drive+0
;VendingMachine.c,184 :: 		for (mstep=0;mstep<steps;mstep++)
	INCF       _mstep+0, 1
	BTFSC      STATUS+0, 2
	INCF       _mstep+1, 1
;VendingMachine.c,187 :: 		}
	GOTO       L_main21
L_main22:
;VendingMachine.c,188 :: 		MSdelay(500);
	MOVLW      244
	MOVWF      FARG_MSdelay+0
	MOVLW      1
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,189 :: 		LCD_Clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,190 :: 		break;
	GOTO       L_main17
;VendingMachine.c,191 :: 		}
L_main20:
;VendingMachine.c,192 :: 		PortB=0x00;
	CLRF       PORTB+0
;VendingMachine.c,193 :: 		while(C1&&C2&&C3);
L_main24:
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main25
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main25
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main25
L__main111:
	GOTO       L_main24
L_main25:
;VendingMachine.c,194 :: 		Sel=key();
	CALL       _key+0
	MOVF       R0+0, 0
	MOVWF      _Sel+0
;VendingMachine.c,195 :: 		if(sel=='*'){
	MOVF       R0+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_main28
;VendingMachine.c,196 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,197 :: 		break;}
	GOTO       L_main17
L_main28:
;VendingMachine.c,198 :: 		}
	GOTO       L_main16
L_main17:
;VendingMachine.c,199 :: 		}
	GOTO       L_main29
L_main15:
;VendingMachine.c,201 :: 		else if (sel=='2')//Item 2
	MOVF       _Sel+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main30
;VendingMachine.c,203 :: 		LCD_command(0x0C);//Cursor off
	MOVLW      12
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;VendingMachine.c,204 :: 		MSdelay(500);
	MOVLW      244
	MOVWF      FARG_MSdelay+0
	MOVLW      1
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,205 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,206 :: 		while(1)
L_main31:
;VendingMachine.c,208 :: 		LCD_String_xy(1,0,"Item2: 50Fils");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr9_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,209 :: 		LCD_String_xy(2,0,"Credit:");
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr10_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,210 :: 		if(bal==0)
	MOVLW      0
	XORWF      _bal+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main128
	MOVLW      0
	XORWF      _bal+0, 0
L__main128:
	BTFSS      STATUS+0, 2
	GOTO       L_main33
;VendingMachine.c,212 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,213 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,214 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,215 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,216 :: 		LCD_char('0');}
	MOVLW      48
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
	GOTO       L_main34
L_main33:
;VendingMachine.c,218 :: 		{LCD_String_xy(2,7,balval);}
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      7
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
L_main34:
;VendingMachine.c,219 :: 		if(bal>=50)
	MOVLW      0
	SUBWF      _bal+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main129
	MOVLW      50
	SUBWF      _bal+0, 0
L__main129:
	BTFSS      STATUS+0, 0
	GOTO       L_main35
;VendingMachine.c,221 :: 		Wmotor=3;
	MOVLW      3
	MOVWF      _Wmotor+0
	MOVLW      0
	MOVWF      _Wmotor+1
;VendingMachine.c,222 :: 		bal=bal-50;
	MOVLW      50
	SUBWF      _bal+0, 1
	BTFSS      STATUS+0, 0
	DECF       _bal+1, 1
;VendingMachine.c,223 :: 		Msdelay(2500);
	MOVLW      196
	MOVWF      FARG_MSdelay+0
	MOVLW      9
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,224 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,225 :: 		LCD_String_xy(1,0,"Processing..");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr11_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,226 :: 		for (mstep=0;mstep<steps;mstep++)
	CLRF       _mstep+0
	CLRF       _mstep+1
L_main36:
	MOVLW      4
	SUBWF      _mstep+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main130
	MOVLW      56
	SUBWF      _mstep+0, 0
L__main130:
	BTFSC      STATUS+0, 0
	GOTO       L_main37
;VendingMachine.c,228 :: 		full_drive(clockwise,Wmotor);
	CLRF       FARG_full_drive+0
	MOVF       _Wmotor+0, 0
	MOVWF      FARG_full_drive+0
	MOVF       _Wmotor+1, 0
	MOVWF      FARG_full_drive+1
	CALL       _full_drive+0
;VendingMachine.c,226 :: 		for (mstep=0;mstep<steps;mstep++)
	INCF       _mstep+0, 1
	BTFSC      STATUS+0, 2
	INCF       _mstep+1, 1
;VendingMachine.c,229 :: 		}
	GOTO       L_main36
L_main37:
;VendingMachine.c,230 :: 		Msdelay(500);
	MOVLW      244
	MOVWF      FARG_MSdelay+0
	MOVLW      1
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,231 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,232 :: 		break;
	GOTO       L_main32
;VendingMachine.c,233 :: 		}
L_main35:
;VendingMachine.c,234 :: 		PortB=0x00;
	CLRF       PORTB+0
;VendingMachine.c,235 :: 		while(C1&&C2&&C3);
L_main39:
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main40
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main40
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main40
L__main110:
	GOTO       L_main39
L_main40:
;VendingMachine.c,236 :: 		Sel=key();
	CALL       _key+0
	MOVF       R0+0, 0
	MOVWF      _Sel+0
;VendingMachine.c,237 :: 		if(sel=='*'){
	MOVF       R0+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_main43
;VendingMachine.c,238 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,239 :: 		break;}
	GOTO       L_main32
L_main43:
;VendingMachine.c,240 :: 		}
	GOTO       L_main31
L_main32:
;VendingMachine.c,241 :: 		}
	GOTO       L_main44
L_main30:
;VendingMachine.c,243 :: 		else if (sel=='3')//Item 3
	MOVF       _Sel+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_main45
;VendingMachine.c,245 :: 		LCD_command(0x0C);//Cursor off
	MOVLW      12
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;VendingMachine.c,246 :: 		MSdelay(500);
	MOVLW      244
	MOVWF      FARG_MSdelay+0
	MOVLW      1
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,247 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,248 :: 		while(1)
L_main46:
;VendingMachine.c,250 :: 		LCD_String_xy(1,0,"Item3: 100Fils");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr12_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,251 :: 		LCD_String_xy(2,0,"Credit:");
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr13_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,252 :: 		if(bal==0)
	MOVLW      0
	XORWF      _bal+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main131
	MOVLW      0
	XORWF      _bal+0, 0
L__main131:
	BTFSS      STATUS+0, 2
	GOTO       L_main48
;VendingMachine.c,254 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,255 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,256 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,257 :: 		LCD_char(' ');
	MOVLW      32
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,258 :: 		LCD_char('0');}
	MOVLW      48
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
	GOTO       L_main49
L_main48:
;VendingMachine.c,260 :: 		{LCD_String_xy(2,7,balval);}
	MOVLW      2
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      7
	MOVWF      FARG_LCD_String_xy+0
	MOVLW      _balval+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
L_main49:
;VendingMachine.c,262 :: 		if(bal>=100)
	MOVLW      0
	SUBWF      _bal+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main132
	MOVLW      100
	SUBWF      _bal+0, 0
L__main132:
	BTFSS      STATUS+0, 0
	GOTO       L_main50
;VendingMachine.c,264 :: 		Wmotor=2;
	MOVLW      2
	MOVWF      _Wmotor+0
	MOVLW      0
	MOVWF      _Wmotor+1
;VendingMachine.c,265 :: 		bal=bal-100;
	MOVLW      100
	SUBWF      _bal+0, 1
	BTFSS      STATUS+0, 0
	DECF       _bal+1, 1
;VendingMachine.c,266 :: 		Msdelay(2500);
	MOVLW      196
	MOVWF      FARG_MSdelay+0
	MOVLW      9
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,267 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,268 :: 		LCD_String_xy(1,0,"Processing..");
	MOVLW      1
	MOVWF      FARG_LCD_String_xy+0
	CLRF       FARG_LCD_String_xy+0
	MOVLW      ?lstr14_VendingMachine+0
	MOVWF      FARG_LCD_String_xy+0
	CALL       _LCD_String_xy+0
;VendingMachine.c,269 :: 		for (mstep=0;mstep<steps;mstep++)
	CLRF       _mstep+0
	CLRF       _mstep+1
L_main51:
	MOVLW      4
	SUBWF      _mstep+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main133
	MOVLW      56
	SUBWF      _mstep+0, 0
L__main133:
	BTFSC      STATUS+0, 0
	GOTO       L_main52
;VendingMachine.c,271 :: 		full_drive(clockwise,Wmotor);
	CLRF       FARG_full_drive+0
	MOVF       _Wmotor+0, 0
	MOVWF      FARG_full_drive+0
	MOVF       _Wmotor+1, 0
	MOVWF      FARG_full_drive+1
	CALL       _full_drive+0
;VendingMachine.c,269 :: 		for (mstep=0;mstep<steps;mstep++)
	INCF       _mstep+0, 1
	BTFSC      STATUS+0, 2
	INCF       _mstep+1, 1
;VendingMachine.c,272 :: 		}
	GOTO       L_main51
L_main52:
;VendingMachine.c,273 :: 		MSdelay(500);
	MOVLW      244
	MOVWF      FARG_MSdelay+0
	MOVLW      1
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,274 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,275 :: 		break;
	GOTO       L_main47
;VendingMachine.c,276 :: 		}
L_main50:
;VendingMachine.c,277 :: 		PortB=0x00;
	CLRF       PORTB+0
;VendingMachine.c,278 :: 		while(C1&&C2&&C3);
L_main54:
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_main55
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_main55
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_main55
L__main109:
	GOTO       L_main54
L_main55:
;VendingMachine.c,279 :: 		Sel=key();
	CALL       _key+0
	MOVF       R0+0, 0
	MOVWF      _Sel+0
;VendingMachine.c,280 :: 		if(sel=='*'){
	MOVF       R0+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_main58
;VendingMachine.c,281 :: 		LCD_clear();
	CALL       _LCD_Clear+0
;VendingMachine.c,282 :: 		break;}
	GOTO       L_main47
L_main58:
;VendingMachine.c,283 :: 		}
	GOTO       L_main46
L_main47:
;VendingMachine.c,284 :: 		}
L_main45:
L_main44:
L_main29:
;VendingMachine.c,285 :: 		Msdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,286 :: 		PortB=0x00;
	CLRF       PORTB+0
;VendingMachine.c,287 :: 		}
	GOTO       L_main0
;VendingMachine.c,290 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_LCD_Initialize:

;VendingMachine.c,295 :: 		void LCD_Initialize () /* LCD Initialize function */
;VendingMachine.c,297 :: 		LCD_Port = 0x00;       /*PORT as Output Port*/
	CLRF       TRISD+0
;VendingMachine.c,298 :: 		delay_ms(20);        /*15ms,16x2 LCD Power on delay*/
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_LCD_Initialize59:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Initialize59
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Initialize59
	NOP
	NOP
;VendingMachine.c,300 :: 		for nibble (4-bit) mode */
	MOVLW      2
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;VendingMachine.c,302 :: 		initialize 5*8 matrix in (4-bit mode)*/
	MOVLW      40
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;VendingMachine.c,303 :: 		LCD_Command(0x01);  /*clear display screen*/
	MOVLW      1
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;VendingMachine.c,304 :: 		LCD_Command(0x0c);  /*display on cursor off*/
	MOVLW      12
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;VendingMachine.c,305 :: 		LCD_Command(0x06);  /*increment cursor (shift cursor to right)*/
	MOVLW      6
	MOVWF      FARG_LCD_command+0
	CALL       _LCD_command+0
;VendingMachine.c,306 :: 		}
L_end_LCD_Initialize:
	RETURN
; end of _LCD_Initialize

_LCD_command:

;VendingMachine.c,307 :: 		void LCD_command(unsigned char cmnd)
;VendingMachine.c,309 :: 		ldata = (ldata & 0x0f) |(0xF0 & cmnd);  /*Send higher nibble of command first to PORT*/
	MOVLW      15
	ANDWF      PORTD+0, 0
	MOVWF      R1+0
	MOVLW      240
	ANDWF      FARG_LCD_command_cmnd+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 0
	MOVWF      PORTD+0
;VendingMachine.c,310 :: 		RS = 0;  /*Command Register is selected i.e.RS=0*/
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;VendingMachine.c,311 :: 		EN = 1;  /*High-to-low pulse on Enable pin to latch data*/
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;VendingMachine.c,312 :: 		asm NOP;
	NOP
;VendingMachine.c,313 :: 		EN = 0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;VendingMachine.c,314 :: 		MSdelay(1);
	MOVLW      1
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,315 :: 		ldata = (ldata & 0x0f) | (cmnd<<4);  /*Send lower nibble of command to PORT */
	MOVLW      15
	ANDWF      PORTD+0, 0
	MOVWF      R2+0
	MOVF       FARG_LCD_command_cmnd+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      PORTD+0
;VendingMachine.c,316 :: 		EN = 1;
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;VendingMachine.c,317 :: 		asm NOP;
	NOP
;VendingMachine.c,318 :: 		EN = 0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;VendingMachine.c,319 :: 		MSdelay(3);
	MOVLW      3
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,320 :: 		}
L_end_LCD_command:
	RETURN
; end of _LCD_command

_LCD_String_xy:

;VendingMachine.c,322 :: 		function */
;VendingMachine.c,324 :: 		location=0;
	CLRF       _location+0
;VendingMachine.c,325 :: 		if(row<=1)
	MOVF       FARG_LCD_String_xy_row+0, 0
	SUBLW      1
	BTFSS      STATUS+0, 0
	GOTO       L_LCD_String_xy60
;VendingMachine.c,327 :: 		location=(0x80) | ((pos) & 0x0f);  /*Print message on 1st row and desired location*/
	MOVLW      15
	ANDWF      FARG_LCD_String_xy_pos+0, 0
	MOVWF      R0+0
	BSF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      _location+0
;VendingMachine.c,328 :: 		LCD_Command(location);
	MOVF       R0+0, 0
	MOVWF      FARG_LCD_command_cmnd+0
	CALL       _LCD_command+0
;VendingMachine.c,329 :: 		}
	GOTO       L_LCD_String_xy61
L_LCD_String_xy60:
;VendingMachine.c,332 :: 		location=(0xC0) | ((pos) & 0x0f);  /*Print message on 2nd row and desired location*/
	MOVLW      15
	ANDWF      FARG_LCD_String_xy_pos+0, 0
	MOVWF      R0+0
	MOVLW      192
	IORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _location+0
;VendingMachine.c,333 :: 		LCD_Command(location);
	MOVF       R0+0, 0
	MOVWF      FARG_LCD_command_cmnd+0
	CALL       _LCD_command+0
;VendingMachine.c,334 :: 		}
L_LCD_String_xy61:
;VendingMachine.c,337 :: 		LCD_String(str);
	MOVF       FARG_LCD_String_xy_str+0, 0
	MOVWF      FARG_LCD_String+0
	CALL       _LCD_String+0
;VendingMachine.c,339 :: 		}
L_end_LCD_String_xy:
	RETURN
; end of _LCD_String_xy

_LCD_String:

;VendingMachine.c,341 :: 		void LCD_String (unsigned char *str) /* Send string to LCD function */
;VendingMachine.c,343 :: 		while((*str)!=0)
L_LCD_String62:
	MOVF       FARG_LCD_String_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_LCD_String63
;VendingMachine.c,345 :: 		LCD_Char(*str);
	MOVF       FARG_LCD_String_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_LCD_Char+0
	CALL       _LCD_Char+0
;VendingMachine.c,346 :: 		str++;
	INCF       FARG_LCD_String_str+0, 1
;VendingMachine.c,347 :: 		}
	GOTO       L_LCD_String62
L_LCD_String63:
;VendingMachine.c,348 :: 		}
L_end_LCD_String:
	RETURN
; end of _LCD_String

_LCD_Char:

;VendingMachine.c,350 :: 		void LCD_Char (unsigned char chardata) /* LCD data write function */
;VendingMachine.c,352 :: 		ldata = (ldata & 0x0f) | (0xF0 & chardata);  /*Send higher nibble of data first to PORT*/
	MOVLW      15
	ANDWF      PORTD+0, 0
	MOVWF      R1+0
	MOVLW      240
	ANDWF      FARG_LCD_Char_chardata+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 0
	MOVWF      PORTD+0
;VendingMachine.c,353 :: 		RS = 1;  /*Data Register is selected*/
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;VendingMachine.c,354 :: 		EN = 1;  /*High-to-low pulse on Enable pin to latch data*/
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;VendingMachine.c,355 :: 		asm NOP;
	NOP
;VendingMachine.c,356 :: 		EN = 0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;VendingMachine.c,357 :: 		MSdelay(1);
	MOVLW      1
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,358 :: 		ldata = (ldata & 0x0f) | (chardata<<4);  /*Send lower nibble of data to PORT*/
	MOVLW      15
	ANDWF      PORTD+0, 0
	MOVWF      R2+0
	MOVF       FARG_LCD_Char_chardata+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      PORTD+0
;VendingMachine.c,359 :: 		EN = 1;  /*High-to-low pulse on Enable pin to latch data*/
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;VendingMachine.c,360 :: 		asm NOP;
	NOP
;VendingMachine.c,361 :: 		EN = 0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;VendingMachine.c,362 :: 		MSdelay(3);
	MOVLW      3
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,363 :: 		}
L_end_LCD_Char:
	RETURN
; end of _LCD_Char

_LCD_Clear:

;VendingMachine.c,366 :: 		void LCD_Clear()
;VendingMachine.c,368 :: 		LCD_Command(0x01);  /*clear display screen*/
	MOVLW      1
	MOVWF      FARG_LCD_command_cmnd+0
	CALL       _LCD_command+0
;VendingMachine.c,369 :: 		MSdelay(3);
	MOVLW      3
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,370 :: 		}
L_end_LCD_Clear:
	RETURN
; end of _LCD_Clear

_keyinit:

;VendingMachine.c,374 :: 		void keyinit()
;VendingMachine.c,376 :: 		TRISB=0XF0;
	MOVLW      240
	MOVWF      TRISB+0
;VendingMachine.c,377 :: 		OPTION_REG&=0X7F;   //ENABLE WEAK PULL UP resistors for he keypad
	MOVLW      127
	ANDWF      OPTION_REG+0, 1
;VendingMachine.c,378 :: 		}
L_end_keyinit:
	RETURN
; end of _keyinit

_key:

;VendingMachine.c,379 :: 		unsigned char key()
;VendingMachine.c,381 :: 		PORTB=0X00;
	CLRF       PORTB+0
;VendingMachine.c,382 :: 		while(!C1||!C2||!C3) {
L_key64:
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__key122
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__key122
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key122
	GOTO       L_key65
L__key122:
;VendingMachine.c,383 :: 		R1=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;VendingMachine.c,384 :: 		R2=R3=R4=1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L__key142
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__key143
L__key142:
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
L__key143:
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__key144
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__key145
L__key144:
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
L__key145:
;VendingMachine.c,385 :: 		if(!C1||!C2||!C3) {
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__key121
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__key121
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key121
	GOTO       L_key70
L__key121:
;VendingMachine.c,386 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,387 :: 		rowloc=0;
	CLRF       _rowloc+0
;VendingMachine.c,388 :: 		break;
	GOTO       L_key65
;VendingMachine.c,389 :: 		}
L_key70:
;VendingMachine.c,390 :: 		R2=0;R1=1;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;VendingMachine.c,391 :: 		if(!C1||!C2||!C3) {
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__key120
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__key120
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key120
	GOTO       L_key73
L__key120:
;VendingMachine.c,392 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,393 :: 		rowloc=1;
	MOVLW      1
	MOVWF      _rowloc+0
;VendingMachine.c,394 :: 		break;
	GOTO       L_key65
;VendingMachine.c,395 :: 		}
L_key73:
;VendingMachine.c,396 :: 		R3=0;R2=1;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;VendingMachine.c,397 :: 		if(!C1||!C2||!C3) {
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__key119
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__key119
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key119
	GOTO       L_key76
L__key119:
;VendingMachine.c,398 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,399 :: 		rowloc=2;
	MOVLW      2
	MOVWF      _rowloc+0
;VendingMachine.c,400 :: 		break;
	GOTO       L_key65
;VendingMachine.c,401 :: 		}
L_key76:
;VendingMachine.c,402 :: 		R4=0; R3=1;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;VendingMachine.c,403 :: 		if(!C1||!C2||!C3){
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__key118
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__key118
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key118
	GOTO       L_key79
L__key118:
;VendingMachine.c,404 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,405 :: 		rowloc=3;
	MOVLW      3
	MOVWF      _rowloc+0
;VendingMachine.c,406 :: 		break;
	GOTO       L_key65
;VendingMachine.c,407 :: 		}
L_key79:
;VendingMachine.c,408 :: 		}
	GOTO       L_key64
L_key65:
;VendingMachine.c,409 :: 		if(C1==0&&C2!=0&&C3!=0)
	BTFSC      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_key82
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_key82
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_key82
L__key117:
;VendingMachine.c,411 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,412 :: 		colloc=0;
	CLRF       _colloc+0
;VendingMachine.c,413 :: 		}
	GOTO       L_key83
L_key82:
;VendingMachine.c,414 :: 		else if(C1!=0&&C2==0&&C3!=0)
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_key86
	BTFSC      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_key86
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_key86
L__key116:
;VendingMachine.c,416 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,417 :: 		colloc=1;
	MOVLW      1
	MOVWF      _colloc+0
;VendingMachine.c,418 :: 		}
	GOTO       L_key87
L_key86:
;VendingMachine.c,419 :: 		else if(C1!=0&&C2!=0&&C3==0)
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_key90
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_key90
	BTFSC      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L_key90
L__key115:
;VendingMachine.c,421 :: 		MSdelay(100);
	MOVLW      100
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,422 :: 		colloc=2;
	MOVLW      2
	MOVWF      _colloc+0
;VendingMachine.c,423 :: 		}
L_key90:
L_key87:
L_key83:
;VendingMachine.c,425 :: 		while(C1==0||C2==0||C3==0);
L_key91:
	BTFSS      RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L__key114
	BTFSS      RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L__key114
	BTFSS      RB6_bit+0, BitPos(RB6_bit+0)
	GOTO       L__key114
	GOTO       L_key92
L__key114:
	GOTO       L_key91
L_key92:
;VendingMachine.c,426 :: 		return (keypad[rowloc][colloc]);
	MOVLW      3
	MOVWF      R0+0
	MOVF       _rowloc+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      _keypad+0
	ADDWF      R0+0, 1
	MOVF       _colloc+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
;VendingMachine.c,427 :: 		}
L_end_key:
	RETURN
; end of _key

_full_drive:

;VendingMachine.c,435 :: 		void full_drive (unsigned char direction,unsigned int Wmot){
;VendingMachine.c,436 :: 		if(Wmot==1)
	MOVLW      0
	XORWF      FARG_full_drive_Wmot+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__full_drive147
	MOVLW      1
	XORWF      FARG_full_drive_Wmot+0, 0
L__full_drive147:
	BTFSS      STATUS+0, 2
	GOTO       L_full_drive95
;VendingMachine.c,438 :: 		if (direction == clockwise){
	MOVF       FARG_full_drive_direction+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_full_drive96
;VendingMachine.c,440 :: 		PORTA = 0b00001001;
	MOVLW      9
	MOVWF      PORTA+0
;VendingMachine.c,442 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,444 :: 		PORTA = 0b00001100;
	MOVLW      12
	MOVWF      PORTA+0
;VendingMachine.c,446 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,448 :: 		PORTA = 0b00000110;
	MOVLW      6
	MOVWF      PORTA+0
;VendingMachine.c,450 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,452 :: 		PORTA = 0b00000011;
	MOVLW      3
	MOVWF      PORTA+0
;VendingMachine.c,454 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,456 :: 		PORTA = 0b00001001;
	MOVLW      9
	MOVWF      PORTA+0
;VendingMachine.c,458 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,460 :: 		}
L_full_drive96:
;VendingMachine.c,461 :: 		}
	GOTO       L_full_drive97
L_full_drive95:
;VendingMachine.c,462 :: 		else if(Wmot==2)
	MOVLW      0
	XORWF      FARG_full_drive_Wmot+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__full_drive148
	MOVLW      2
	XORWF      FARG_full_drive_Wmot+0, 0
L__full_drive148:
	BTFSS      STATUS+0, 2
	GOTO       L_full_drive98
;VendingMachine.c,464 :: 		if (direction == clockwise){
	MOVF       FARG_full_drive_direction+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_full_drive99
;VendingMachine.c,466 :: 		PORTC = 0b10010000;
	MOVLW      144
	MOVWF      PORTC+0
;VendingMachine.c,468 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,470 :: 		PORTC = 0b11000000;
	MOVLW      192
	MOVWF      PORTC+0
;VendingMachine.c,472 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,474 :: 		PORTC = 0b01100000;
	MOVLW      96
	MOVWF      PORTC+0
;VendingMachine.c,476 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,478 :: 		PORTC = 0b00110000;
	MOVLW      48
	MOVWF      PORTC+0
;VendingMachine.c,480 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,482 :: 		PORTC = 0b10010000;
	MOVLW      144
	MOVWF      PORTC+0
;VendingMachine.c,484 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,486 :: 		}
L_full_drive99:
;VendingMachine.c,487 :: 		}
	GOTO       L_full_drive100
L_full_drive98:
;VendingMachine.c,488 :: 		else if(Wmot==3)
	MOVLW      0
	XORWF      FARG_full_drive_Wmot+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__full_drive149
	MOVLW      3
	XORWF      FARG_full_drive_Wmot+0, 0
L__full_drive149:
	BTFSS      STATUS+0, 2
	GOTO       L_full_drive101
;VendingMachine.c,490 :: 		if (direction == clockwise){
	MOVF       FARG_full_drive_direction+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_full_drive102
;VendingMachine.c,492 :: 		PORTC = 0b00001001;
	MOVLW      9
	MOVWF      PORTC+0
;VendingMachine.c,494 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,496 :: 		PORTC = 0b00001100;
	MOVLW      12
	MOVWF      PORTC+0
;VendingMachine.c,498 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,500 :: 		PORTC = 0b00000110;
	MOVLW      6
	MOVWF      PORTC+0
;VendingMachine.c,502 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,504 :: 		PORTC = 0b00000011;
	MOVLW      3
	MOVWF      PORTC+0
;VendingMachine.c,506 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,508 :: 		PORTC = 0b00001001;
	MOVLW      9
	MOVWF      PORTC+0
;VendingMachine.c,510 :: 		MSdelay(speed);
	MOVLW      2
	MOVWF      FARG_MSdelay+0
	MOVLW      0
	MOVWF      FARG_MSdelay+1
	CALL       _MSdelay+0
;VendingMachine.c,512 :: 		}
L_full_drive102:
;VendingMachine.c,513 :: 		}
L_full_drive101:
L_full_drive100:
L_full_drive97:
;VendingMachine.c,516 :: 		}
L_end_full_drive:
	RETURN
; end of _full_drive

_MSdelay:

;VendingMachine.c,521 :: 		void MSdelay(unsigned int val)
;VendingMachine.c,523 :: 		for(i=0;i<val;i++)
	CLRF       _i+0
	CLRF       _i+1
L_MSdelay103:
	MOVF       FARG_MSdelay_val+1, 0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__MSdelay151
	MOVF       FARG_MSdelay_val+0, 0
	SUBWF      _i+0, 0
L__MSdelay151:
	BTFSC      STATUS+0, 0
	GOTO       L_MSdelay104
;VendingMachine.c,524 :: 		for(j=0;j<165;j++);  /*This count Provide delay of 1 ms for 8MHz Frequency */
	CLRF       _j+0
	CLRF       _j+1
L_MSdelay106:
	MOVLW      0
	SUBWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__MSdelay152
	MOVLW      165
	SUBWF      _j+0, 0
L__MSdelay152:
	BTFSC      STATUS+0, 0
	GOTO       L_MSdelay107
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
	GOTO       L_MSdelay106
L_MSdelay107:
;VendingMachine.c,523 :: 		for(i=0;i<val;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;VendingMachine.c,524 :: 		for(j=0;j<165;j++);  /*This count Provide delay of 1 ms for 8MHz Frequency */
	GOTO       L_MSdelay103
L_MSdelay104:
;VendingMachine.c,525 :: 		}
L_end_MSdelay:
	RETURN
; end of _MSdelay
