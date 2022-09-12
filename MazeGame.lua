--[[
    A simple maze game that calls other functions as a part of tail call
]]

function Room1()
    io.write("\nIn Room 1\n")
    io.write("You can move north, south, west\n")
    io.write("What direction to move?\n")
    direction = io.read()
    if (direction == "north") then
        Room2()
    elseif (direction == "south") then
        Room3()
    elseif (direction == "west") then
        Room4()    
    else
        io.write("invalidmove")
        Room1()
    end
end

function Room2()
    io.write("\nIn Room 2\n")
    io.write("You can move north, south, east\n")
    io.write("What direction to move?\n")
    direction = io.read()
    if (direction == "north") then
        Room3()
    elseif (direction == "south") then
        Room1()
    elseif (direction == "east") then
        Room4()    
    else
        io.write("invalidmove")
        Room2()
    end
end

function Room3()
    io.write("\nIn Room 3\n")
    io.write("You can move north, south, west\n")
    io.write("What direction to move?\n")
    direction = io.read()
    if (direction == "north") then
        Room4()
    elseif (direction == "south") then
        Room2()
    elseif (direction == "west") then
        Room1()    
    else
        io.write("invalidmove")
        Room3()
    end
end


function Room4()
    io.write("\nOut of Maze!")
end


function mazeGame()
    Room1()
end

mazeGame()
