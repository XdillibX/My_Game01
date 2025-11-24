function love.load()
    background = {}
    background.image = love.graphics.newImage("/sprites/background01.png")

    Cards = {}
    function Cards:new(name, imagePath)
        local instance = setmetatable({}, self)
        self.__index = self

        instance.name = name
        instance.image = love.graphics.newImage(imagePath)

        return instance
    end

    function Cards:info(x, y)
        love.graphics.print("Card Name: " .. self.name, x, y)
    end

    RealCard = {}
end

function love.keypressed(key)
    if key == "up" then
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
        love.graphics.draw(card.image, x, y)
        card:info(x, y + 200)
    end
end