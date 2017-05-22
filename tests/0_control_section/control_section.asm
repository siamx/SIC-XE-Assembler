MAIN     START  0
         EXTDEF ADDR,ADDR2,ADDR3
         EXTREF RTADDR,GETPAIR       
         CLEAR  X
         +JSUB  GETPAIR
         STCH   ADDR2
         +JSUB  GETPAIR
         STCH   ADDR3
         LDB    ADDR
         +JSUB  GETPAIR
         STCH   ADDR 
         +JSUB  GETPAIR
         STCH   ADDR2
LOOP     +JSUB  GETPAIR
         STCH   ADDR,X
         TIXR   X
         +STCH  RTADDR
         J      LOOP
ADDR     RESB   1
ADDR2    RESB   1
ADDR3    RESB   1
GETPAIR  CSECT
         EXTDEF RTADDR,ORADDR  
         EXTREF READ   
         STL    RTADDR
         +JSUB  READ
         SHIFTL A,4
         STCH   HEX
         OR     ORADDR
         J      @RTADDR
RTADDR   RESB   1
ORADDR   RESB   1
HEX      RESB   1
READ     CSECT
         EXTREF ADDR     
	 TD     =X'F1'
         JEQ    READ 
         CLEAR  A
         RD     =X'F1'
         COMP   #48
         JLT    EOFCK
         SUB    #48
         COMP   #10
         JLT    GOBACK
         SUB    #7
GOBACK   RSUB   
EOFCK    COMP   #33
         JEQ    EXIT
         COMP   #4
         JGT    READ
EXIT     CLEAR  L 
         +J     ADDR      
         END    MAIN
