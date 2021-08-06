local Display = require('display')

function love.conf(t)
    t.version = "11.1"

    -- t.modules.joystick = false
    -- t.modules.physics = false
    -- t.modules.touch = false

    -- t.console = true
    
    t.window.title = Display.title
    t.window.icon = Display.icon
end
