#constant jumperW  10 //largura do jumper
#constant jumperH  -1 //altura do jumper
#constant initialJumperY 90
#constant maxJumpHight 75
//definição do jumper
type sJumper
    sprite as integer //id do sprite
    ascending as integer //flag para saber se o jumper está subindo (1), descendo (0) ou parado (0)
endtype

//inicializa o jumper
function startJumper(imgPath as string, x)
	img = LoadImage(imgPath)
	jumper as sJumper
	jumper.sprite = CreateSprite ( img )
	jumper.ascending = 0
	
	SetSpriteSize(jumper.sprite, jumperW, jumperH) //define o tamanho do spriteSetSpriteSize(jumper.sprite, jumperW, jumperH) //define o tamanho do sprite
	SetSpriteOffset(jumper.sprite,2,getSpriteHeight(jumper.sprite)/2) //muda o offset para o centro do sprite
	SetSpritePositionByOffset(jumper.sprite, x, initialJumperY) // posiciona o sprite na posição (x,y) da tela. x,y em porcentagem
	
	
		
endfunction jumper

//função de pulo do jumper
function jump(idJumper as integer)
	SetSpritePosition(idJumper,GetSpriteX(idJumper),maxJumpHight)
	
endfunction
