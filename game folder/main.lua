function love.load()
    love.window.setMode(1280, 720)

    background = {}
    background.image = love.graphics.newImage("/sprites/background01.png")

    Cards = {}
    function Cards:new(name, imagePath)
        local instance = setmetatable({}, self)
        self.__index = self

        instance.name = name
        instance.image = love.graphics.newImage(imagePath)
        instance.width = instance.image:getWidth()
        instance.height = instance.image:getHeight()

        return instance
    end

    function Cards:info(x, y)
        love.graphics.print("Card Name: \n" .. self.name, x, y)
    end

    RealCard = {}
end

function love.keypressed(key)
    if key == "up" and #RealCard < 5 then
        local newCard = Cards:new("Ace of Spades", "/sprites/pre_card.png")
        table.insert(RealCard, newCard)
    end
    
    if key == "down" then
        if #RealCard > 0 then
            table.remove(RealCard)
        end
    end
end

function love.draw()
    love.graphics.draw(background.image, 0, 0)

    for i, card in ipairs(RealCard) do
        local x = 100 + (i - 1) * 200 
        local y = 100
        love.graphics.draw(card.image, x, y, 0, 0.5, 0.5)

        local mx, my = love.mouse.getPosition()
        isMouseOver = mx >= x and mx <= x + card.width * 0.5 and
                           my >= y and my <= y + card.height * 0.5

        if isMouseOver and love.mouse.isDown(1) then
            love.graphics.print("Clicked on card: " .. card.name, 0, 0)
        end
        
    end
end