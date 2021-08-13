-- Programa: Aula 5.6 a 5.8 - tilemaps, tilesets e animação
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
    sprites.hadouken = {}
    sprites.idle = {}

    sprites.hadouken = get_sprites_by_row(1,4)
    sprites.idle = get_sprites_by_row(2,4)

    curFrame = 1
    state = 'idle'
end

function love.update(dt)
    curFrame = curFrame + 8 * dt
    if curFrame > 4 then
        curFrame = 1
        if state == 'hadouken' then
            state = 'idle'
        end
    end

    fps = love.timer.getFPS()
end

function love.draw()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    if state == 'idle' then
        love.graphics.draw(image, sprites.idle[math.floor(curFrame)], 30, 30, 0 , 2, 2)    
    elseif state == 'hadouken' then
        love.graphics.draw(image, sprites.hadouken[math.floor(curFrame)], 30, 30, 0 , 2, 2)    
    end
    -- love.graphics.print('FPS: ' .. fps, 10, 12)
end

function love.keypressed(key)
    if key == 'h' then
        state = 'hadouken'
        curFrame = 1
    end
end

function get_sprites_by_row(row,numSprites) 
    local sprites = {}
    for i=0,numSprites-1 do
        sprite = love.graphics.newQuad(
            i * sprite_width, (row -1) * sprite_heigth, 
            sprite_width, sprite_heigth, 
            img_width, img_heigth)

        table.insert(sprites, sprite)
    end
    return sprites
end