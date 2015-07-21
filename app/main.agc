//http://www.appgamekit.com/bitesize-1.php
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
	
do
	Print( ScreenFPS() )
    
	if ( GetPointerPressed ( ) = 1 )
		//Evento de click
		sprite = GetSpriteHit ( GetPointerX ( ), GetPointerY ( ) )
		
		//se um sprite fora clicado, ele busca pelo id do sprite clicado em uma lista de ids. 
		//Se o id estiver nessa lista ele chama o método jump(idSprite)
		if(idJumpersArray.find(sprite) <> -1)
			jump(sprite)
		endif		
		
	endif
	
    
	
    Sync()
loop
