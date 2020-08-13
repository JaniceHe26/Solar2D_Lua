-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local tapCount = 0;


-- Importing background image (horizontal, vertical)
local background = display.newImageRect("Images/background.png", 360, 570 );
-- Centering image
background.x = display.contentCenterX;
background.y = display.contentCenterY;

-- Adding texts
local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40);
tapText:setFillColor( 0, 0, 0 )


-- Importing the platform (horizontal, vertical)
local platform = display.newImageRect( "Images/platform.png", 300, 50 );
platform.x = display.contentCenterX;
platform.y = display.contentHeight - 25;

-- Importing the balloon
local balloon = display.newImageRect( "Images/balloon.png", 112, 112 );
balloon.x = display.contentCenterX;
balloon.y = display.contentCenterY;
balloon.alpha = 0.8

--Adding physics
-- Loads the Box2D physics engine into your app and assiocates it with the local variable for later references,
-- Gives ability to call other commands within the physics library using the physics namespace variable.
local physics = require( "physics" );
-- Starts the engine.
physics.start();
-- Static object not affected by gravity or other physical forces, object that doesnt move.
physics.addBody( platform, "static" );
-- Dynamic object affected by gravity and allows collisions with other physical objects. 
-- bounce = 0 means no bounce, up to 1 which bounce 100%
physics.addBody( balloon, "dynamic", {radius = 50, bounce = 0.3} );

-- Functions
local function pushBalloon() 
    -- Appy Linear Impulse apply pushes to any directions, in this example the balloon is pushed vertically. 
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
    tapCount = tapCount + 1
    tapText.text = tapCount
end

-- local function endGame()
--     if balloon.y == 0 then
--         local endText = display.newText("Game Over", display.contentCenterX, 20, native.systemFont, 40);
--         endText:setFillColor( 0, 0, 0 )
-- end

-- Adding event listener, : object methods
balloon:addEventListener( "tap", pushBalloon );