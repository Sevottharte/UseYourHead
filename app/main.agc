// Project: UseYourHead 
// Created: 2015-07-20

//inclusão de arquivos externos
#include "Jumper.agc"


// set window properties
SetWindowTitle( "Use Your Head" )
SetWindowSize( 320, 480, 0 )

// set display properties
//SetVirtualResolution( 1024, 768 ) // usa pixel como medida
SetDisplayAspect ( 320.0/480.0 ) // usa porcentagem como medida (melhor para escalabilidade/mudança de resolução)
SetOrientationAllowed( 1, 1, 0, 0 ) //suporta apenas landscape

SetFolder("/media") //define a pasta atual
	
	//background e suas definições
	iBG = LoadImage("bg.jpg") 
	sBG = CreateSprite(iBG)
	SetSpriteSize(sBG, 100, 100)
	
	sJumper01 as sJumper
	sJumper02 as sJumper
	sJumper03 as sJumper	
	
	//set das imagens dos jumpers
	imgJumper01$ = "pikachu.png"
	imgJumper02$ = "charmander.png"
	imgJumper03$ = "charizard.png"
	
	//Inicializa os jumpers
	sJumper01 = startJumper( imgJumper01$ , 16.5)
	sJumper02 = startJumper( imgJumper02$ , 49.5)
	sJumper03 = startJumper( imgJumper03$ , 82.5)
	
	// adiciona os ids dos sprites em um array para compará-los no "evento" de click
	idJumpersArray as integer[2]
	idJumpersArray[0] = sJumper01.sprite
	idJumpersArray[1] = sJumper02.sprite
	idJumpersArray[2] = sJumper03.sprite
	
	//start criação da bola
	//array com as posições x das bolas que caem
	xPosBallArray as float[2] = [16.5, 49.5, 82.5]
	
	atualXPosBall = Random(0,2) //sorteia um número no array correspondente a posição x de um dos jumpers
	
	img = LoadImage("ball.png")	
	ball = CreateSprite ( img )
	SetSpriteSize(ball, jumperW, -1) 
	SetSpriteOffset(ball,2,getSpriteHeight(ball)/2) 
	SetSpritePositionByOffset(ball, xPosBallArray[atualXPosBall], 5) 
	
	tweenDownball = CreateTweenSprite( 2 )
	SetTweenSpriteY( tweenDownBall, 5, 100, TweenSmooth1())
	
	//end criação da bola
	
	
	// Create a simple y translation tween with bounce easing
	// over 2 seconds. ( Time includes easing)!
	tweenUpSprite001 = CreateTweenSprite( 0.6 )
	SetTweenSpriteY( tweenUpSprite001, initialJumperY, maxJumpHight, TweenSmooth2())
	tweenDownSprite001 = CreateTweenSprite( 0.6 )
	SetTweenSpriteY( tweenDownSprite001, maxJumpHight, initialJumperY - 3, TweenSmooth1()) // por algum bug ele subindo 3 na escala Y, por isso o -3

	startH# = GetSpriteY(idJumpersArray[1])
	endH# = 0
do
	Print( startH# )
	Print( endH# )
	
	
	PlayTweenSprite( tweenDownBall, ball, 0)
    
	if ( GetPointerPressed ( ) = 1 )
		//Evento de click
		sprite = GetSpriteHit ( GetPointerX ( ), GetPointerY ( ) )
		
		//se um sprite for clicado, ele busca pelo id do sprite clicado em uma lista de ids. 
		//Se o id estiver nessa lista ele chama o método jump(idSprite)
		if(idJumpersArray.find(sprite) <> -1)
			//jump(sprite)
			PlayTweenSprite( tweenDownSprite001, sprite, 0)
			PlayTweenSprite( tweenUpSprite001, sprite, 0)
			
		endif
		
	endif
	
	endH# = getspritey(idJumpersArray[1])
	UpdateAllTweens( GetFrameTime())
    
	
    Sync()
loop
