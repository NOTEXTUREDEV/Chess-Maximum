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

function betterlove.checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

return betterlove