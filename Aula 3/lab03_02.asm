.data
    msg1: .asciiz "\nEntre com o numero para ordernar: "
    msg2: .asciiz "\nA ordenação final ficou: "
    msg3: .asciiz "\nAperta o [Enter] para finalizar o programa"
.text

.globl main

main:
    addi $t0, $zero, 5 # armazena quantidade de numeros para a array

    addi $sp, $sp, -4 # carrega a pilha
    sw $ra, 0($sp) # armazena o ra na posição 0 para finalizar o programa
    addi $sp, $sp, 4 # volta para a posicão inicial da pilha

    addi $sp, $sp, -500 # inicia a array na posição 500 da pilha

## pegar numero e salvar referencia em $a1

    jal loop_pegar_numero # pega os numeros
    add $a1, $zero, $sp # salva a array em a1
    addi $sp, $sp, 500 # volta para a posicão inicial da pilha

## entrando no loop e swap

    jal loop_externo # entra no loop loop_externo

mostrar_array_final:
    li $v0, 4 # Codigo SysCall p/ escrever strings
    la $a0, msg2 # Parametro (string a ser escrita)
    syscall

    addi $t0, $zero, 5 # armazena quantidade de numeros para a array
loop_printar_numero:
    addi $a1, $a1, -4 # começa no primeiro elemento
    lw $t1, 0($a1) # pega o proximo numero para printar

    li $v0, 1 # Codigo SysCall p/ escrever inteiros
    add $a0, $zero, $t1 # Parametro (inteiro a ser escrito)
    syscall

    addi $t0, $t0, -1
    bne $t0, $zero, loop_printar_numero # enquanto t0 != 0, pega proximo numero
    addi $a1, $a1, 16 # volta para o inicio da array
    addi $sp, $sp, -4 # pega o $ra
    lw $ra, 0($sp) # pega o ra para finalizar o programa
    addi $sp, $sp, 4 # volta para o inicio da array
    jr $ra

loop_pegar_numero:
    li $v0, 4 # Codigo SysCall p/ escrever strings
    la $a0, msg1 # Parametro (string a ser escrita)
    syscall
    
    li $v0, 5 # Codigo SysCall p/ ler inteiros
    syscall # Inteiro lido vai ficar em $v0

    addi $sp, $sp, -4 #carrega a posição do vetor
    sw $v0, 0($sp)

    addi $t0, $t0, -1 # diminui até 0 ( porque são 5 repetições )
    bne $t0, $zero, loop_pegar_numero # enquanto t0 != 0, pega proximo numero
    addi $sp, $sp, 20 # volta para o começo da pilha ( array )
    jr $ra #voltar pra main:



loop_externo:
    addi $t1, $zero, 0 # garantir que I começe com 0
    addi $t2, $zero, 0 # garantir que J comece com 0
    j for_2 # vai para for_2
for_1:
    add $a1, $a1, 16 # retorna no começo do vetor
    addi $t1, $t1, 1 # adiciona i++;
    addi $t2, $zero, 0 # garantir que J comece com 0
    bne $t1, 5, for_2 # se i != 5, vai para o segundo for
    jr $ra # volta para main
for_2:
    add $a1, $a1, -4 # pega primeira pos
    lw $t4, 0($a1) # adiciona
    add $a1, $a1, -4 # pega segunda pos
    lw $t5, 0($a1) # adiciona

    slt $t7, $t5, $t4 # t5 >= t4
    beq $t7, $zero, fim_for_2 # senão for fim_for_2
    
    add $a1, $a1, 4 # pega primeira pos
    sw $t5, 0($a1) # pego a segunda pos e coloco na primeira
    add $a1, $a1, -4 # pega segunda pos
    sw $t4, 0($a1) # pego a primeira pos e coloca na segunda

fim_for_2:
    addi $t2, $t2, 1 # j++
    add $a1, $a1, 4 # volta uma pos
    bne $t2, 4, for_2 # se for diferente de 5, continua o loop
    j for_1 # volta para o primeiro for



    