-- Programa: Aula 5.6 a 5.7 - tilemaps, tilesets e animação
-- Autor: Michael Jordan S Chagas
-- Curso: Ciência da Computação - UFMT-CUA
-- Disclina: Design e Programação de Games (Opt)
-- Docente: Maxwell Silva Carmo
-- Data: 2021-08-06
-- Update: 2021-08-06
-- 
-- Este programa simula uma animação de jogo.
-------------------------------------------------------

local Display = require('display')

function love.load()
    math.randomseed(os.time())

    -- Display:fullscreen()
    love.window.setMode(Display.width, Display.height, {
        fullscreen = Display.isFullScreen,
        resizable = true
    })

    image = love.graphics.newImage('assets/images/ken.png')
    img_width = image:getWidth()
    img_heigth = image:getHeight()
    sprite_width = img_width / 7
    sprite_heigth = img_heigth / 10

    sprites = {}
    sprites.idle = {}

    for i=0,3 do
        sprite = love.graphics.newQuad(
            i * sprite_width, 1 * sprite_heigth, 
            sprite_width, sprite_heigth, 
            img_width, img_heigth)

        table.insert(sprites.idle, sprite)
    end
    
    curFrame = 1
end

function love.update(dt)
    curFrame = curFrame + 8 * dt
    if curFrame > 4 then
        curFrame = 1
    end

    fps = love.timer.getFPS()
end

function love.draw()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.draw(image, sprites.idle[math.floor(curFrame)], 30, 30, 0 , 2, 2)
    -- love.graphics.print('FPS: ' .. fps, 10, 12)
end