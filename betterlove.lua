local betterlove = {}

local atlas = require('atlas')

-- can draw quads and images with the same function
function betterlove.drawImage(image,x,y,rotation,sx,sy)
    if type(image) == "userdata" and image:typeOf("Quad") then
        love.graphics.draw(atlas.png,image,x,y,rotation,sx,sy)
    elseif type(image) == "userdata" and image:typeOf("Image") then
        love.graphics.draw(image,x,y,rotation,sx,sy)
    end
end

return betterlove