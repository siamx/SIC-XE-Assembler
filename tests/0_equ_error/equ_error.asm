MAIN     START  0000         
FIRST    +LDA    #BEGIN
         +LDX    #FINAL
LOOP     ADDR   X,A
         TIX    #11
         JLT    LOOP
         +STA    #POS
         ORG    2000
BEGIN    EQU    FIRST+LOOP
DUMP     RESW   1
FINAL    EQU    LOOP*300 
POS      EQU    FINAL-BEGIN
         END    MAIN  
                  
