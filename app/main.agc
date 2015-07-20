//http://www.appgamekit.com/bitesize-1.php
// Project: HelloWorld 
// Created: 2015-07-20

// set window properties
SetWindowTitle( "HelloWorld" )
SetWindowSize( 320, 480, 0 )

// set display properties
//SetVirtualResolution( 1024, 768 ) // usa pixel como medida
SetDisplayAspect ( 320.0/480.0 ) // usa porcentagem como medida (melhor para escalabilidade/mudança de resolução)
SetOrientationAllowed( 0, 0, 1, 1 ) //suporta apenas portrait

SetFolder("/media")
//pikachu = LoadImage("pikachu.png")


	//background
	iBG = LoadImage("bg.jpg") 
	sBG = CreateSprite(iBG)
	SetSpriteSize(sBG, 100, 100)
	
	iPikachu = LoadImage("pikachu.png") //carrega imagem		
	sPikachu = CreateSprite ( iPikachu ) // cria um sprite e coloca a imagem pikachu nele
	SetSpritePositionByOffset(sPikachu, 49.5, 50) // posiciona o sprite na posição (25%,75%) da tela
	SetSpriteSize(sPikachu, 10, -1)
	setSpriteOffset(sPikachu,2,getSpriteHeight(sPikachu)/2)
	setSpritePhysicsOn(sPikachu,2)
	
	iChar1 = LoadImage("charmander.png") //carrega imagem		
	sChar1 = CreateSprite ( iChar1 ) // cria um sprite e coloca a imagem pikachu nele
	SetSpritePositionByOffset(sChar1, 16.5, 50) // posiciona o sprite na posição (25%,75%) da tela
	SetSpriteSize(sChar1, 10, -1)
	setSpriteOffset(sChar1,2,getSpriteHeight(sChar1)/2)
	setSpritePhysicsOn(sChar1,2)
	
	ichar2 = LoadImage("charizard.png") //carrega imagem		
	sChar2 = CreateSprite ( iChar2 ) // cria um sprite e coloca a imagem pikachu nele
	SetSpritePositionByOffset(sChar2, 82.5, 50) // posiciona o sprite na posição (25%,75%) da tela
	SetSpriteSize(sChar2, 10, -1)
	setSpriteOffset(sChar2,2,getSpriteHeight(sPikachu)/2)
	setSpritePhysicsOn(sChar2,2)

do
	Print( ScreenFPS() )
	
	
	
	if ( GetPointerPressed ( ) = 1 )
		
		 sprite = GetSpriteHit ( GetPointerX ( ), GetPointerY ( ) )
    
		if(sprite = sPikachu)
			SetSpritePosition(sPikachu,GetSpriteX(sPikachu),80)
		endif
		if(sprite = sChar1)
			SetSpritePosition(sChar1,GetSpriteX(sChar1),80)
		endif
		
		if(sprite = sChar2)
			SetSpritePosition(sChar2,GetSpriteX(sChar2),80)
		endif
		
		//SetSpriteX(sBG,(GetSpriteX(sBG))-1)
	endif
	
    
	
    Sync()
loop
