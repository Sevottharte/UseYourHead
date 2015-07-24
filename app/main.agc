// Project: UseYourHead 
// Created: 2015-07-20

//inclus�o de arquivos externos
#include "Jumper.agc"


// set window properties
SetWindowTitle( "Use Your Head" )
SetWindowSize( 320, 480, 0 )

// set display properties
//SetVirtualResolution( 1024, 768 ) // usa pixel como medida
SetDisplayAspect ( 320.0/480.0 ) // usa porcentagem como medida (melhor para escalabilidade/mudan�a de resolu��o)
SetOrientationAllowed( 1, 1, 0, 0 ) //suporta apenas landscape

SetFolder("/media") //define a pasta atual
	
	//background e suas defini��es
	iBG = LoadImage("bg.jpg") 
	sBG = CreateSprite(iBG)
	SetSpriteSize(sBG, 100, 100)
	
	//set das imagens dos jumpers
	imgJumper01$ = "pikachu.png"
	imgJumper02$ = "charmander.png"
	imgJumper03$ = "charizard.png"
	
	//Inicializa os jumpers
	sJumper01 as sJumper
	sJumper02 as sJumper
	sJumper03 as sJumper
	
	sJumper01 = startJumper( imgJumper01$ , 16.5)
	sJumper02 = startJumper( imgJumper02$ , 49.5)
	sJumper03 = startJumper( imgJumper03$ , 82.5)
	
	// adiciona os ids dos sprites em um array para compar�-los no "evento" de click
	jumpersArray as sJumper[2] // s� t� global por n�o poder passar uma array para uma fun��o
	jumpersArray[0] = sJumper01
	jumpersArray[1] = sJumper02
	jumpersArray[2] = sJumper03
	
	//start cria��o da bola
	//array com as posi��es x das bolas que caem
	xPosBallArray as float[2] = [16.5, 49.5, 82.5]
	
	atualXPosBall = Random(0,2) //sorteia um n�mero no array correspondente a posi��o x de um dos jumpers
	
	img = LoadImage("ball.png")	
	ball = CreateSprite ( img )
	SetSpriteSize(ball, JUMPER_W, -1) 
	SetSpriteOffset(ball,2,getSpriteHeight(ball)/2) 
	SetSpritePositionByOffset(ball, xPosBallArray[atualXPosBall], 5) 
	
	tweenDownball = CreateTweenSprite( 2 )
	SetTweenSpriteY( tweenDownBall, 5, 100, TweenSmooth1())
	
	//end cria��o da bola
	
	click = 0 // flag para saber quando come�ar a animar os jumpers

	startH# = GetSpriteY(jumpersArray[1].sprite) // pega a posi��o x de um dos jumpers e torna a posi��o x de um dos n�o-jumpers (bola)
	endH# = 0 // seta a posi��o inicial da bola
	
	 // come�a a contar o timer. Vai ser vir para calcular a diferen�a de tempo usada na fun��o de deslocamento do sprite
	lastFrame# = Timer ( )
	
//
//
//////	Main Looping /////
do
	//calcula o DT usado na fun��o de movimento do sprite
	thisFrame#  = Timer ( )
    difference# = thisFrame# - lastFrame#
    lastFrame#  = thisFrame#
	    PRINT ( TIMER() )

	if ( GetPointerPressed ( ) = 1 ) //Evento de click/toque
		
		//verifica se houve um click em um sprite e passa o id do sprite clicado				
		sprite = GetSpriteHit ( GetPointerX ( ), GetPointerY ( ) )
		
		if(isJumper(jumpersArray, sprite)) //verifica se � um jumper. Evita de clicar em uma n�o-jumper e acontecer de interagir com ele.			
			click = 1 // uma flag para os jumpers come�arem a pular.	
		endif
		
	endif
	
	//como estamos em um looping infinito, coloquei essa flag para saber quando come�ar a mover os jumper.
	if (click = 1)
		
		totalJumpers = jumpersArray.length //tamanho do array de jumpers
		//percorro o array para saber se tem algum jumper que � para movimentar para cima ou para baixo. 
		//Isso em cada intera��o do looping principal
		for t = 0 to totalJumpers
			if(jumpersArray[t].behavior = ASCENDING)
				up(jumpersArray[t], difference#)
			endif
			if(jumpersArray[t].behavior = DESCENDING)
				
				down(jumpersArray[t], difference#)
			endif
		next t
	endif
	
	
	endH# = GetSpriteY(jumpersArray[1].sprite)
	
    Sync()
loop
