.orig x3000


;this stack lab computes the polish notation of a set of calls
;push_val(4) pushes the value 4 onto the stack [4]
AND R0, R0, #0
ADD R0, R0, #4
LD R6, STACK_ADDR
LD R5, PUSH_ADDR
JSRR R5

;push_val(3) pushes the value 3 onto the stack [4,3]
AND R0, R0, #0
ADD R0, R0, #3
JSRR R5

;push_val(2) pushes the value 2 onto the stack [4,3,2]
AND R0, R0, #0
ADD R0, R0, #2
JSRR R5

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R5, POP_ADDR
JSRR R5

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
JSRR R5

HALT
;move the top value of the stack into r4


PUSH_ADDR .FILL x3400
POP_ADDR .FILL x3800
STACK_ADDR .FILL xFE00
.end





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack

ST R0, BACKUP_R0_3400 ; backup
ST R7, BACKUP_R7_3400

PUSH ADD R6, R6, #-1
     STR R0, R6, #0
     
     LD R0, BACKUP_R0_3400 ; backup
     LD R7, BACKUP_R7_3400
     
     RET
BACKUP_R0_3400 .BLKW #1 ; backup
BACKUP_R7_3400 .BLKW #1

.end
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
ST R0, BACKUP_R0_3800
ST R7, BACKUP_R7_3800
;ST R4, BACKUP_R4_3800

POP LDR R0, R6, #0 ; pop once the value
    ADD R6, R6, #1
    
    AND R4, R4, #0
    ADD R4, R4, R0 ; add first val to register
    
    LDR R0, R6, #0 ; pop once the value
    ADD R6, R6, #1
    
    ADD R4, R4, R0 ; add second val to register
    
    ADD R6, R6, #-1 ; push value back in
    STR R4, R6, #0
    
    LD R0, BACKUP_R0_3800
    LD R7, BACKUP_R7_3800
    ;LD R4, BACKUP_R4_3800

    RET
BACKUP_R0_3800 .BLKW #1
BACKUP_R7_3800 .BLKW #1
;BACKUP_R4_3800 .BLKW #1
PUSH_ADDR_3800 .FILL x3400
.end



.orig x4200 ;;data you might need

.end


