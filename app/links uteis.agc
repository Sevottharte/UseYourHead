//http://www.appgamekit.com/bitesize-1.php
http://www.thegamecreators.com/news/2012/07/pardon-me-i-just-berped/
http://www.appgamekit.com/documentation/Reference/Tweening/SetTweenSpriteBlue.htm
http://forum.thegamecreators.com/?m=forum_view&t=213434&b=55
http://gamedev.stackexchange.com/questions/51639/interpolating-a-player-between-two-2d-points


==== -------------------- ====


// Project: movendoSprite 
// Created: 2015-07-22

// set window properties
SetWindowTitle( "movendoSprite" )
SetWindowSize( 320, 480, 0 )

// set display properties
SetDisplayAspect ( 320.0/480.0 ) 
SetOrientationAllowed( 1, 1, 1, 1 )
	
	isAscending = 0
	img = LoadImage("ball.png")	
	ball = CreateSprite ( img )
	SetSpriteSize(ball, 10, -1) 
	SetSpriteOffset(ball,2,getSpriteHeight(ball)/2) 
	SetSpritePositionByOffset(ball, 16.5, 95) 
	y# = GetSpriteY(ball)
    lastFrame# = Timer ( )
	clicked = 0
do
	Print(GetSpriteY(ball) )
	Print(sprite)
	print(isAscending)
	thisFrame#  = Timer ( )
    difference# = thisFrame# - lastFrame#
    lastFrame#  = thisFrame#
	
    if ( GetPointerPressed ( ) = 1 )
		//Evento de click
		sprite = GetSpriteHit ( GetPointerX ( ), GetPointerY ( ) )
		
		if(sprite = ball)
			clicked = 1
			if(isAscending = 0)
				isAscending = 1
			else
				isAscending = 0
			endif
		endif
	endif
	
	
	if(clicked = 1)
		
		if(y# > 75 and isAscending = 1)
			y# = y# - 25.0 * difference#
			SetSpriteY(ball, y#)
			if(y# < 75)
				isAscending = 0
			endif
		endif
		if(isAscending = 0)
			y# = y# + 24.0 * difference#
			SetSpriteY(ball, y#)
			if(y# >= 95)
				isAscending = 1
			endif
		endif
	endif
	
    
    
    Sync()
loop
