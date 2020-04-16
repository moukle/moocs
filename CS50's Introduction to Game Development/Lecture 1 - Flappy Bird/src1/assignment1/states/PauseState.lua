PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
	for name,val in pairs(params) do
		self[name] = val
	end

	sounds['music']:pause()
end

function PauseState:update(dt)
	-- go back to play if enter is pressed
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		gStateMachine:change('play', self)
	end
end

function PauseState:render()
	love.graphics.setFont(flappyFont)
	love.graphics.printf('PAUSED', 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, 'center')
end

function PauseState:exit()
	sounds['music']:play()
end
