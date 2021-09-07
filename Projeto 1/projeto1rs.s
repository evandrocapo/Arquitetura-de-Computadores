.data
quantityOfTeams:	.byte 10

hyphen:			.asciiz " - "
line:			.asciiz "\n"

menuTitle:		.asciiz "\n\nSeja bem vindo!\nO que gostaria de fazer?\n"
menuItem1:		.asciiz "\n1-Cadastrar nomes dos times"
menuItem2:		.asciiz "\n2-Cadastrar um jogo"
menuItem3:		.asciiz "\n3-Editar informacoes"
menuItem4:		.asciiz "\n4-Gerar resultado"
menuItem5:		.asciiz "\n5-Sair\n\n"

# SubMenu 2

menuItem2_1:		.asciiz "\nQual time ganhou ? ( Digite o numero correspondente )"
menuItem2_2:		.asciiz "\nQual time perdeu ? ( Digite o numero correspondente )"

# SubMenu 3
menuItem3Title:		.asciiz "\nO que gostaria de editar?"
menuItem3_1:		.asciiz "\n1-Nome de um time"
menuItem3_2:		.asciiz "\n1-Um jogo"

menuItemInvalid:	.asciiz "\nOpcao errada, selecione novamente"


textTeamNameInput:	.asciiz "\nEntre com os nomes dos times:\n"

textPasswordInput:	.asciiz "\nInsira a senha de 4 digitos: "
textWrongPassword:	.asciiz "\nSenha invalida, tente novamente "

teamCharSize:		.byte 20
team1:				.space 20
team2:				.space 20
team3:				.space 20
team4:				.space 20
team5:				.space 20
team6:				.space 20
team7:				.space 20
team8:				.space 20
team9:				.space 20
team10:				.space 20

# LINHAS = TIME
# COLUNAS = 0->TOTAL DE JOGOS | 1->VITORIAS | 2->DERROTAS
gameTable:	.word 0, 0, 0,
	        .word 0, 0, 0,
        	.word 0, 0, 0,
        	.word 0, 0, 0,
        	.word 0, 0, 0,
        	.word 0, 0, 0,
		.word 0, 0, 0,
		.word 0, 0, 0,
		.word 0, 0, 0,
	        .word 0, 0, 0

.text
.globl auth


auth:
	# Print de msg informativa
	la $a0, textPasswordInput
	li $v0, 4
	syscall
	
	# Le senha inserida
	li $v0, 5
	syscall
	
	# TODO: Colocar a senha numa constante?
	li $t0, 1234
	beq $v0, $t0, main

	# Print de msg informativa de erro
	la $a0, textWrongPassword
	li $v0, 4
	syscall
	
	j auth

main:
	# Print menu principal
	jal printMainMenu
	
	# Le opcao inserida
	li $v0, 5
	syscall
	
	#TODO: Usar loop?
	# Compara para ver qual menu deve ir
	li $t0,1
	beq $v0, $t0, readTeamsJAL
	li $t0,2
	beq $v0, $t0, registerResultJAL
	li $t0,3
	beq $v0, $t0, editMenuJAL
	li $t0,4
	beq $v0, $t0, runResultsJAL
	li $t0,5
	beq $v0, $t0, exit
	
	# Print de opcao errada
	la $a0, menuItemInvalid
	li $v0, 4
	syscall
	
	# Volta pra main
	j main
	

exit:
	# Encerra o programa
	li $v0, 10
	syscall

readTeamsJAL:
	jal readTeams
	j main
registerResultJAL:
	jal registerResult
	j main	
editMenuJAL:
#	jal editMenu
	j main	
runResultsJAL:
#	jal runResults
	j main	


readTeams:
	#TODO: Usar loop?
	# Print msg de exibicao
	la $a0, textTeamNameInput
	li $v0, 4
	syscall

	# Carrega instrucao de leitura
	li $v0, 8
	la $a1, teamCharSize

	# Le o time 1
	la $a0, team1
	syscall 
	
	# Le o time 2
	la $a0, team2
	syscall 
	
	# Le o time 3
	la $a0, team3
	syscall 
	
	# Le o time 4
	la $a0, team4
	syscall 
	
	# Le o time 5
	la $a0, team5
	syscall 
	
	# Le o time 6
	la $a0, team6
	syscall 
	
	# Le o time 7
	la $a0, team7
	syscall 
	
	# Le o time 8
	la $a0, team8
	syscall 
	
	# Le o time 9
	la $a0, team9
	syscall 
	
	# Le o time 10
	la $a0, team10
	syscall 

	jr $ra

printMainMenu:
	# Carrega instrucao de print
	li $v0, 4
	
	# Printa titulo do menu
	la $a0, menuTitle
	syscall
	
	# Printa titulo do menu 1
	la $a0, menuItem1
	syscall
	
	# Printa titulo do menu 2
	la $a0, menuItem2
	syscall
	
	# Printa titulo do menu 3
	la $a0, menuItem3
	syscall
	
	# Printa titulo do menu 4
	la $a0, menuItem4
	syscall
	
	# Printa titulo do menu 5
	la $a0, menuItem5
	syscall
	
	# Retorna
	jr $ra

registerResult:
	addi $t0, $zero, 0
	
	#salva RA na stack
	sub $sp, $sp, 4
	sw $ra, 0($sp)

LOOP_1:
	addi $t0, $t0, 1

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall
	
	jal printaTimes

LOOP_2:
	# Print nome do time
	li $v0, 4
	syscall
	
	# Print linha
	la $a0, line
	li $v0, 4
	syscall

	bne $t0, 10, LOOP_1
	
	#limpar t0
	addi $t0, $zero, 0
	jal addWinner

	#limpar t0
	addi $t0, $zero, 0
	jal addLoser
	
FIM_REGISTER_RESULT:
	#recupera $ra
	lw $ra, 0($sp)
	add $sp, $sp, 4
	
	jr $ra

addWinner:
	# Printar "quem ganhou?"
	la $a0, menuItem2_1
	li $v0, 4
	syscall
	
	# Receber valor
	li $v0, 5
	syscall
	
	add $t0, $zero, $v0
	subi $t0, $t0, 1 # pega a posicao
	# carrega o valor na matriz ( lembrar de tirar -1 pq o print começa do 1, e n do 0)

	# add quantidade de colunas
	addi $t1, $zero, 3

	# $t0 index, $t1 quantidade de colunas
	mult $t0, $t1
	
	# resultado do Index * Coluna
	mflo $t0
	
	#carrega o valor da coluna Vitorias
	addi $t1, $zero, 1
	add $t0, $t0, $t1
	
	#pega posicao da coluna de Vitorias
	sll $t0, $t0, 5
	
	# Carrega endereco da tabela de jogos
	la $t1, gameTable
	add $t1, $t1, $t0
	
	#soma +1 em vitorias
	lw $t0, 0($t1)
	addi $t0, $t0, 1
	sw $t0, 0($t1)
	
	# zera $t0
	add $t0, $zero, $v0
	subi $t0, $t0, 1 # pega a posicaoo
	
	#carrega o valor na matriz ( lembrar de tirar -1)
	addi $t1, $zero, 3

	# $t0 index, %1 quantidade de colunas
	mult $t0, $t1
	
	# resultado do I * Coluna
	mflo $t0
	
	#carrega o valor da coluna Jogos
	addi $t1, $zero, 0
	add $t0, $t0, $t1
	
	#pega posicao da coluna de Jogos
	sll $t0, $t0, 5
	
	la $t1, gameTable
	add $t1, $t1, $t0
	
	#somar jogos
	lw $t0, 0($t1)
	addi $t0, $t0, 1
	sw $t0, 0($t1)

	jr $ra

addLoser:
	#printar "quem perdeu?"
	la $a0, menuItem2_2
	li $v0, 4
	syscall
	
	#receber valor
	li $v0, 5
	syscall
	
	add $t0, $zero, $v0
	subi $t0, $t0, 1 # pega a posicao
	
	#carrega o valor na matriz ( lembrar de tirar -1)
	addi $t1, $zero, 3

	# $t0 index, %1 quantidade de colunas
	mult $t0, $t1
	
	# resultado do I * Coluna
	mflo $t0
	
	#carrega o valor da coluna Derrotas
	addi $t1, $zero, 2
	add $t0, $t0, $t1
	
	#pega posicaoo da coluna de Derrotas
	sll $t0, $t0, 5
	
	la $t1, gameTable
	add $t1, $t1, $t0
	
	#somar derrotas
	lw $t0, 0($t1)
	addi $t0, $t0, 1
	sw $t0, 0($t1)

	
	#add 1 jogo nesse time	
	add $t0, $zero, $v0
	subi $t0, $t0, 1 # pega a posicaoo
	
	#carrega o valor na matriz ( lembrar de tirar -1)
	addi $t1, $zero, 3

	# $t0 index, %1 quantidade de colunas
	mult $t0, $t1
	
	# resultado do I * Coluna
	mflo $t0
	
	#carrega o valor da coluna Jogos
	addi $t1, $zero, 0
	add $t0, $t0, $t1
	
	#pega posicaoo da coluna de Jogos
	sll $t0, $t0, 5
	
	la $t1, gameTable
	add $t1, $t1, $t0
	
	#somar jogos
	lw $t0, 0($t1)
	addi $t0, $t0, 1
	sw $t0, 0($t1)
	
	jr $ra

printaTimes:
    li $t1,1
    bne $t0, $t1, printaTimes2
    la $a0, team1
    jr $ra
printaTimes2:
    li $t1,2
    bne $t0, $t1, printaTimes3
    la $a0, team2
    jr $ra
printaTimes3:
    li $t1,3
    bne $t0, $t1, printaTimes4
    la $a0, team3
    jr $ra
printaTimes4:
    li $t1,4
    bne $t0, $t1, printaTimes5
    la $a0, team4
    jr $ra
printaTimes5:
    li $t1,5
    bne $t0, $t1, printaTimes6
    la $a0, team5
    jr $ra
printaTimes6:
    li $t1,6
    bne $t0, $t1, printaTimes7
    la $a0, team6
    jr $ra
printaTimes7:
    li $t1,7
    bne $t0, $t1, printaTimes8
    la $a0, team7
    jr $ra
printaTimes8:
    li $t1,8
    bne $t0, $t1, printaTimes9
    la $a0, team8
    jr $ra
printaTimes9:
    li $t1,9
    bne $t0, $t1, printaTimes10
    la $a0, team9
    jr $ra
printaTimes10:
    li $t1,10
    la $a0, team10
    jr $ra
