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
menuItem3_2:		.asciiz "\n2-Partidas"

menuItem3_1_1:		.asciiz "\nQual time quer trocar o nome ? ( Digite o numero correspondente )"
menuItem3_1_2:		.asciiz "\nQual o novo nome ?"

menuItem3_2_1:		.asciiz "\n1-Total de jogos"
menuItem3_2_2:		.asciiz "\n2-Vitorias"
menuItem3_2_3:		.asciiz "\n3-Derrotas"
menuItem3_2_4:		.asciiz "\nEscolha o time:"
menuItem3_2_5:		.asciiz "\nNovo valor:"

# SubMenu 4

menuItem4_1: 		.asciiz "\nClassificados: \n"
menuItem4_2: 		.asciiz "\nQuartas de Finais \n"
menuItem4_3: 		.asciiz "\nDesclassificados \n"
menuItem4_4: 		.asciiz "\nRebaixados: \n"


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

gameTableAux:	.word 0, 0,
				.word 0, 0,
				.word 0, 0,
				.word 0, 0,
				.word 0, 0,
				.word 0, 0,
				.word 0, 0,
				.word 0, 0,
				.word 0, 0,
				.word 0, 0



.text
.globl auth

################# FUNCAO AUTH #################
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


################# FUNCAO MAIN #################
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
		jal edit_games
		j main	
	runResultsJAL:
		jal runResults
		j main	


################# FUNCAO LER NOME DOS TIMES #################
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


################# FUNCAO PRINTA MENU PRINCIPAL #################
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


################# FUNCAO REGISTRA RESULTADOS #################
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


################# FUNCAO ADD VITORIA #################
addWinner:
    #salva RA na stack
    sub $sp, $sp, 4
    sw $ra, 0($sp)

    #quando acabar o print, printar "quem ganhou?"
    la $a0, menuItem2_1
    li $v0, 4
    syscall
    
    #receber valor
    li $v0, 5
    syscall
    
    #adicionar vitorias
    addi $t5, $zero, 1
	jal addOneGameToTime

    #adicionar jogos
	add $t5, $zero, $zero
	jal addOneGameToTime

    #recupera $ra
    lw $ra, 0($sp)
    add $sp, $sp, 4

    jr $ra


################# FUNCAO ADD DERROTA #################
addLoser:
    #salva RA na stack
    sub $sp, $sp, 4
    sw $ra, 0($sp)

    #printar "quem perdeu?"
    la $a0, menuItem2_2
    li $v0, 4
    syscall
    
    #receber valor
    li $v0, 5
    syscall
    
    #adicionar derrotas
	addi $t5, $zero, 2
	jal addOneGameToTime

    #adicionar jogos
	add $t5, $zero, $zero
	jal addOneGameToTime

    #recupera $ra
    lw $ra, 0($sp)
    add $sp, $sp, 4
    
    jr $ra

################# FUNCAO ADD 1 EM JOGOS/VITORIAS/DERROTAS #################
addOneGameToTime:
    #add 1 jogo nesse time    
    add $t0, $zero, $v0
    subi $t0, $t0, 1 # pega a posi??o
    
    #carrega o tamanho da matriz
    addi $t1, $zero, 3

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna Jogos (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de Jogos
    sll $t0, $t0, 2
    
    la $t1, gameTable
    add $t1, $t1, $t0
    
    #somar jogos
    lw $t0, 0($t1)
    addi $t0, $t0, 1
    sw $t0, 0($t1)

    jr $ra

################# FUNCAO PRINTA NOME DOS TIMES #################
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


################# FUNCAO MENU DE EDICAO #################
editarMenu:



################# FUNCAO EDITAR NOME DOS TIMES #################
editarNome:

	addi $t0, $zero, 0
	
	#salva RA na stack
	sub $sp, $sp, 4
	sw $ra, 0($sp)

LOOP_3:
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

	# Print nome do time
	li $v0, 4
	syscall
	
	# Print linha
	la $a0, line
	li $v0, 4
	syscall

	bne $t0, 10, LOOP_3

	#printar "qual time quer trocar o nome?"
	la $a0, menuItem3_1_1
	li $v0, 4
	syscall

	# Receber valor
	li $v0, 5
	syscall
	add $t0, $zero, $v0

	#printar "qual o nome?"
	la $a0, menuItem3_1_2
	li $v0, 4
	syscall

	# Carrega instrucao de leitura
	li $v0, 8
	la $a1, teamCharSize

	#recupera $ra
	lw $ra, 0($sp)
	add $sp, $sp, 4
	
leNovoNome:
    li $t1,1
    bne $t0, $t1, leNovoNome2
	la $a0, team1
	syscall 
    jr $ra

leNovoNome2:
    li $t1,2
    bne $t0, $t1, leNovoNome3
	la $a0, team2
	syscall 
    jr $ra

leNovoNome3:
    li $t1,3
    bne $t0, $t1, leNovoNome4
	la $a0, team3
	syscall 
    jr $ra

leNovoNome4:
    li $t1,4
    bne $t0, $t1, leNovoNome5
	la $a0, team4
	syscall 
    jr $ra

leNovoNome5:
    li $t1,5
    bne $t0, $t1, leNovoNome6
	la $a0, team5
	syscall 
    jr $ra

leNovoNome6:
    li $t1,6
    bne $t0, $t1, leNovoNome7
	la $a0, team6
	syscall 
    jr $ra

leNovoNome7:
    li $t1,7
    bne $t0, $t1, leNovoNome8
	la $a0, team7
	syscall 
    jr $ra

leNovoNome8:
    li $t1,8
    bne $t0, $t1, leNovoNome9
	la $a0, team8
	syscall 
    jr $ra

leNovoNome9:
    li $t1,9
    bne $t0, $t1, leNovoNome10
	la $a0, team9
	syscall 
    jr $ra

leNovoNome10:
	la $a0, team10
	syscall 
    jr $ra


################# FUNCAO EDITAR VITORIAS/DERROTAS/JOGOS #################

edit_games:

	#salva RA na stack
	sub $sp, $sp, 4
	sw $ra, 0($sp)

	# Print "o que gostaria de editar?"
	la $a0, menuItem3Title
	li $v0, 4
	syscall

	la $a0, menuItem3_2_1
	syscall

	la $a0, menuItem3_2_2
	syscall

	la $a0, menuItem3_2_3
	syscall

	# Receber valor
	li $v0, 5
	syscall
	add $t5, $zero, $v0
	subi $t5, $t5, 1

	# Reseta o t0
	add $t0, $zero, $zero

LOOP_4:
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

	# Print nome do time
	li $v0, 4
	syscall
	
	# Print linha
	la $a0, line
	li $v0, 4
	syscall

	bne $t0, 10, LOOP_4

	#printar "qual time quer editar?"
	la $a0, menuItem3_2_4
	li $v0, 4
	syscall

	# Receber valor
	li $v0, 5
	syscall
	add $t7, $zero, $v0
	subi $t7, $t7, 1


	#printar "novo valor:"
	la $a0, menuItem3_2_5
	li $v0, 4
	syscall

	# Receber valor
	li $v0, 5
	syscall
	add $t6, $zero, $v0

	#em t7 tem o time e t5 tem a coluna t6 em o valor
    
	#add 1 jogo nesse time    
    add $t0, $zero, $t7

    #carrega o tamanho da matriz
    addi $t1, $zero, 3

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna Jogos (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de Jogos
    sll $t0, $t0, 2
    
    la $t1, gameTable
    add $t1, $t1, $t0
    
    #somar jogos
    sw $t6, 0($t1)

	#recupera $ra
	lw $ra, 0($sp)
	add $sp, $sp, 4

    jr $ra


################# FUNCAO MOSTRAR RESULTADO FINAL #################
runResults:
	#salva RA na stack
	sub $sp, $sp, 4
	sw $ra, 0($sp)

	jal addIdToGameTableAux

	jal addWinsToGameTableAux

	addi $t9, $zero, 0

LOOP_COMPARE:
	jal compareGameTable
	addi $t9,$t9, 1
	bne $t9, 10, LOOP_COMPARE


	jal show_result

	#recupera $ra
	lw $ra, 0($sp)
	add $sp, $sp, 4

    jr $ra


### ADD ID TO GAMETABLE

addIdToGameTableAux:
	# inicia contadora em 1
	addi $t2, $zero, 1

LOOP_5:
	#adicionar id do time
	add $t5, $zero, $zero
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t2
    subi $t0, $t0, 1 # pega a posi??o
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    add $t0, $zero, $t2
    sw $t0, 0($t1)

	#incrementa variavel
	addi $t2, $t2, 1

	bne $t2, 11, LOOP_5

	jr $ra


### ADD WINS TO GAMETABLE

addWinsToGameTableAux:
	# inicia contadora em 1
	addi $t2, $zero, 1

LOOP_6:

	########### GET VALOR DE VITORIAS ##############

	#adicionar id do time
	addi $t5, $zero, 1

	#add 1 jogo nesse time    
    add $t0, $zero, $t2
    subi $t0, $t0, 1 # pega a posi??o
    
    #carrega o tamanho da matriz
    addi $t1, $zero, 3

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna Jogos (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de Jogos
    sll $t0, $t0, 2
    
    la $t1, gameTable
    add $t1, $t1, $t0
    
    #pegar jogos
    lw $t4, 0($t1)


	########### SAVE VALOR DE VITORIAS ##############


	#adicionar id do time
	addi $t5, $zero, 1
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t2
    subi $t0, $t0, 1 # pega a posi??o
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    sw $t4, 0($t1)


	#incrementa variavel
	addi $t2, $t2, 1

	bne $t2, 11, LOOP_6

    jr $ra


### COMPARE AND SWITCH

compareGameTable:
	# inicia contadora em 1
	addi $t2, $zero, 1
LOOP_7:

	########## PEGAR 1- TIME ##################

	#adicionar id do time
	addi $t5, $zero, 0
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t2
    subi $t0, $t0, 1 # pega a posi??o
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    lw $t3, 0($t1)




	#adicionar vitorias do time
	addi $t5, $zero, 1
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t2
    subi $t0, $t0, 1 # pega a posi??o
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    lw $t4, 0($t1)


	########## PEGAR 2- TIME ##################

	#adicionar id do time
	addi $t5, $zero, 0
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t2
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    lw $t6, 0($t1)




	#adicionar vitorias do time
	addi $t5, $zero, 1
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t2
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    lw $t7, 0($t1)

IF_BIGGER:

	# se t4 < t7
	slt $t0, $t4, $t7 
	beq $t0,$zero, EXIT_COMPARE

CHANGE_VALUE:

	########## CHANGE 1- TIME ##################

	#adicionar id do time
	addi $t5, $zero, 0
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t2
    subi $t0, $t0, 1 # pega a posi??o
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    sw $t6, 0($t1)




	#adicionar vitorias do time
	addi $t5, $zero, 1
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t2
    subi $t0, $t0, 1 # pega a posi??o
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    sw $t7, 0($t1)


		########## PEGAR 2- TIME ##################

	#adicionar id do time
	addi $t5, $zero, 0
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t2
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    sw $t3, 0($t1)




	#adicionar vitorias do time
	addi $t5, $zero, 1
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t2
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    sw $t4, 0($t1)

EXIT_COMPARE:
	addi $t2, $t2, 1
	bne $t2, 10, LOOP_7

	jr $ra


######### SHOW RESULT #############

show_result:
	#salva RA na stack
	sub $sp, $sp, 4
	sw $ra, 0($sp)

	#Printar Classificados:
    la $a0, menuItem4_1
    li $v0, 4
    syscall

#### PRIMEIRO TIME ####

	#Primeiro Time
	addi $t0, $zero, 1

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall

	
	# Print nome do time
	jal print_time_selected
	jal printaTimes
	li $v0, 4
	syscall

	#Printar Espaco:
    la $a0, line
    li $v0, 4
    syscall


#### SEGUNDO TIME ####

	#Primeiro Time
	addi $t0, $zero, 2

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall

	
	# Print nome do time
	jal print_time_selected
	jal printaTimes
	li $v0, 4
	syscall



	#Printar Quartas:
    la $a0, menuItem4_2
    li $v0, 4
    syscall

#### TERCEIRO TIME ####

	#Primeiro Time
	addi $t0, $zero, 3

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall

	
	# Print nome do time
	jal print_time_selected
	jal printaTimes
	li $v0, 4
	syscall

	#Printar Espaco:
    la $a0, line
    li $v0, 4
    syscall

	
#### QUARTO TIME ####

	#Primeiro Time
	addi $t0, $zero, 4

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall

	
	# Print nome do time
	jal print_time_selected
	jal printaTimes
	li $v0, 4
	syscall

	#Printar Espaco:
    la $a0, line
    li $v0, 4
    syscall

#### QUINTO TIME ####

	#Primeiro Time
	addi $t0, $zero, 5

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall

	
	# Print nome do time
	jal print_time_selected
	jal printaTimes
	li $v0, 4
	syscall

	#Printar Espaco:
    la $a0, line
    li $v0, 4
    syscall
	
#### SEXTO TIME ####

	#Primeiro Time
	addi $t0, $zero, 6

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall
	
	# Print nome do time
	jal print_time_selected
	jal printaTimes
	li $v0, 4
	syscall

	#Printar Desclassificados:
    la $a0, menuItem4_3
    li $v0, 4
    syscall

#### SETIMO TIME ####

	#Primeiro Time
	addi $t0, $zero, 7

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall

	
	# Print nome do time
	jal print_time_selected
	jal printaTimes
	li $v0, 4
	syscall

	#Printar Espaco:
    la $a0, line
    li $v0, 4
    syscall


#### OITAVO TIME ####

	#Primeiro Time
	addi $t0, $zero, 8

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall

	
	# Print nome do time
	jal print_time_selected
	jal printaTimes
	li $v0, 4
	syscall

	#Printar Rebaixados:
    la $a0, menuItem4_4
    li $v0, 4
    syscall

#### NONO TIME ####

	#Primeiro Time
	addi $t0, $zero, 9

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall

	
	# Print nome do time
	jal print_time_selected
	jal printaTimes
	li $v0, 4
	syscall

	#Printar Espaco:
    la $a0, line
    li $v0, 4
    syscall

#### DECIMO TIME ####

	#Primeiro Time
	addi $t0, $zero, 10

	# Print numero
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	# Print hifen
	la $a0, hyphen
	li $v0, 4
	syscall

	
	# Print nome do time
	jal print_time_selected
	jal printaTimes
	li $v0, 4
	syscall

	#recupera $ra
    lw $ra, 0($sp)
    add $sp, $sp, 4


	jr $ra



print_time_selected:
	#adicionar id do time
	addi $t5, $zero, 0
	
	#add o id do time   ( INDEX )
    add $t0, $zero, $t0
    subi $t0, $t0, 1 # pega a posi??o
    
    #carrega o tamanho da matriz ( QUANTIDADE COLUNAS )
    addi $t1, $zero, 2 

    # $t0 index, $t1 quantidade de colunas
    mult $t0, $t1
    
    # resultado do Index * Coluna
    mflo $t0
    
    #carrega o valor da coluna id (0)
    add $t1, $zero, $t5
    add $t0, $t0, $t1
    
    #pega posicao da coluna de id
    sll $t0, $t0, 2
    
    la $t1, gameTableAux
    add $t1, $t1, $t0
    
    #somar jogos
    lw $t0, 0($t1)

	jr $ra