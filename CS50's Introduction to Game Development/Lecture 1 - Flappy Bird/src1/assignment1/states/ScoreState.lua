--[[
ScoreState Class
Author: Colton Ogden
cogden@cs50.harvard.edu

A simple state used to display the player's score before they
transition back into the play state. Transitioned to from the
PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

BRONZE_MEDAL_SCORE = 3
SILVER_MEDAL_SCORE = 5
GOLD_MEDAL_SCORE = 7

score_medal_images = {
	[1] = love.graphics.newImage('bronze_medal.png'),
	[2] = love.graphics.newImage('silver_medal.png'),
	[3] = love.graphics.newImage('gold_medal.png')
}

--[[
When we enter the score state, we expect to receive the score
from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
	self.score = params.score

	self.medal_to_display = nil
	for min_score, medal_image in pairs(score_medal_images) do
		if self.score >= min_score then
			self.medal_to_display = medal_image
			self.medal_x = VIRTUAL_WIDTH/2 - self.medal_to_display:getWidth()/2
			self.medal_y = VIRTUAL_HEIGHT/2 - self.medal_to_display:getHeight()/2
		end
	end
end

function ScoreState:update(dt)
	-- go back to play if enter is pressed
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		gStateMachine:change('countdown')
	end
end

function ScoreState:render()
	if self.medal_to_display then
		love.graphics.draw(self.medal_to_display, self.medal_x, self.medal_y)
	end

	-- simply render the score to the middle of the screen
	love.graphics.setFont(flappyFont)
	love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

	love.graphics.setFont(mediumFont)
	love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

	love.graphics.printf('Press Enter to Play Again!', 0, 180, VIRTUAL_WIDTH, 'center')
end
