function love.load()
    player = {}
    player.x = 100
    player.y = 100
    player.speed = 200
    player.isRun = false
    player.runDuration = 1
    player.runCooldownTimer = 0
    player.runTimer = 0
end

function love.update(dt)

    if player.isRun then
        player.runTimer = player.runTimer - dt
        if player.runTimer <= 0 then
            player.isRun = false
        end
        player.runCooldownTimer = 2
    end

    if player.runCooldownTimer > 0 then
        player.runCooldownTimer = player.runCooldownTimer - dt
    end

    player.speed = player.isRun and 400 or 200

    if love.keyboard.isDown("right") then
       player.x = player.x + player.speed * dt
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed * dt
    end
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed * dt
    end
end

function love.draw()
    love.graphics.print(player.runCooldownTimer > 0 and 
        string.format("Run Cooldown: %.2f", player.runCooldownTimer) or "Run Ready", 10, 10)
    love.graphics.setColor(0.2, 0.6, 0.7)
    love.graphics.circle("fill", player.x, player.y, 20)
end

function love.keypressed(key)
    if key == "space" and player.runCooldownTimer <= 0 then
        player.isRun = true
        player.runTimer = player.runDuration
    end
end