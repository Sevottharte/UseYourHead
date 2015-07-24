#constant JUMPER_W 10 //largura do jumper
#constant JUMPER_H -1 //altura do jumper
#constant INITIAL_JUMPER_Y 90
#constant MAX_JUMP_H 75
#constant STOPPED 0
#constant ASCENDING 1
#constant DESCENDING 2

//definição do jumper
type sJumper
    sprite as integer //id do sprite
    behavior as integer //flag para saber se o jumper está subindo (1), descendo (0) ou parado (0)
endtype





//inicializa o jumper
function startJumper(imgPath as string, x)
	img = LoadImage(imgPath)
	jumper as sJumper
	jumper.sprite = CreateSprite ( img )
	jumper.behavior = STOPPED
	
	SetSpriteSize(jumper.sprite, JUMPER_W, JUMPER_H) //define o tamanho do spriteSetSpriteSize(jumper.sprite, jumperW, jumperH) //define o tamanho do sprite
	SetSpriteOffset(jumper.sprite,2,getSpriteHeight(jumper.sprite)/2) //muda o offset para o centro do sprite
	SetSpritePositionByOffset(jumper.sprite, x, INITIAL_JUMPER_Y) // posiciona o sprite na posição (x,y) da tela. x,y em porcentagem
		
endfunction jumper

//----- função de deslocamento ---
function movement(sprite as integer, y#)		
	SetSpriteY(sprite, y#)
endfunction 
	//------ fim


//função de pulo do jumper
function up(jumper ref as sJumper, difference#)
	
	y# = GetSpriteY(jumper.sprite)
	if(y# > 75 and jumper.behavior = ASCENDING)
			y# = y# - 25.0 * difference#			
			movement(jumper.sprite, y#)			
			if(y# <= 75)
				jumper.behavior = DESCENDING
				
			endif
		endif
	
endfunction

function down(jumper ref as sJumper, difference#)
	y# = GetSpriteY(jumper.sprite)
	
	if(jumper.behavior = DESCENDING)
			y# = y# + 24.0 * difference#
			movement(jumper.sprite, y#)
			if(y# >= 91.66666)
				jumper.behavior = STOPPED
			endif
		endif
endfunction

// verifica se o sprite clicado é um jumper. Se for, ele muda o behavior dele para ascending.
	function isJumper(jumpersArray ref as  sJumper[],clickedSprite)
		j = jumpersArray.length
		
		isJumper = 0 
		
		for i = 0 to j
			if(jumpersArray[i].sprite = clickedSprite)
				if(jumpersArray[i].behavior = STOPPED)
					jumpersArray[i].behavior = ASCENDING
				endif
				isJumper = 1
			endif
		next i
		
	endfunction isJumper
