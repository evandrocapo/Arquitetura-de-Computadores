.data
    msg1: .asciiz "\nEntre o numero do fatorial: "
    msg2: .asciiz "\nO numero do fatorial é: "
    msg3: .asciiz "\nAperta o [Enter] para finalizar o programa"
.text

.globl main

main:
    li $v0, 4 # Codigo SysCall p/ escrever strings
    la $a0, msg1 # Parametro (string a ser escrita)
    syscall
    li $v0, 5 # Codigo SysCall p/ ler inteiros
    syscall # Inteiro lido vai ficar em $v0
    add $a0, $v0, $zero # Armazena em $a0 o número do fatorial
imprimir_fat:
    addi $sp, $sp, -4 # carrega a pilha
    sw $ra, 0($sp) # adiciona o JR na pilha
    jal fact # vai para fact e salva o $ra
    add $t0, $zero, $v0 # Salva o resultado em $t0
    li $v0, 4 # Codigo SysCall p/ escrever strings
    la $a0, msg2 # Parametro (string a ser escrita)
    syscall
    li $v0, 1 # Codigo SysCall p/ escrever inteiros
    add $a0, $zero, $t0 # Parametro (inteiro a ser escrito)
    syscall
    li $v0, 4 # Codigo SysCall p/ escrever strings
    la $a0, msg3 # Parametro (string a ser escrita)
    syscall
    li $v0, 5 # Apenas para esperar um [ENTER]
    syscall 
    lw $ra, 0($sp) # le o $ra para finalizar o programa
    addi $sp, $sp, 4 # decrementa a posição da pilha
    jr $ra # volta para o $ra ou termina o programa
fact:
    slti $t0, $a0, 1 # Seta $t0 se $a0 < 1
    beq $t0, $zero, L1 # se $t0 == 0, então vai para L1
    addi $v0, $zero, 1 # senão, adiciona 1 para $v0
    jr $ra
L1:
    addi $sp, $sp, -8 # carrega a pilha
    sw $ra, 4($sp) # adiciona o JR na pilha
    sw $a0, 0($sp) # adiciona o numero do fatorial na pilha
    addi $a0, $a0, -1 # decrementa o valor do fatorial
    jal fact # salva o $ra e volta para FACT
    lw $a0, 0($sp) # le o valor que está na pilha e salva no $a0
    lw $ra, 4($sp) # le o valor que está na pilha e salva no $ra
    addi $sp, $sp, 8 # decrementa a posição da pilha
    mul $v0, $a0, $v0 # multiplica o valor obtido da pilha com o valor acumulado
    jr $ra # volta para $ra ou terminar o programa (caso os valor da pilha ja tenha retornado para o $ra do programa principal)