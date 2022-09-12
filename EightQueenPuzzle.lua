--[[
    This program positions the eight queens on a chessboard in a way
    that no queen can attack one another

    For a valid solution, each row must have only one queen
    The queens cannot be adjacent to one another or fall in the 
    diagonal line or lie in the same column

    We can represent the position of the queens using an array
    
]]

--[[
    Logic of the program:
    each queen will have to be place in a different row. 
    hence, instead of checking for same row just use row+1

    check for same column

    for diagonal, check if it is in a column+1 or column-1

    Since we already know that the last queen was placed in the
    previous column, we just have to check for the column placements
]]

boardSize = 8   --size of the board

--defining a function to check if the position is safe
--inputs: array of queens, new queen(its row number), newqueen column
--output: boolean true or false

function checkIfSafe(arr, newQueen, col)
    for i = 1, newQueen-1 do
        if (arr[i] == col) or --check if same column
        (arr[i] - i == col - newQueen) or --check diagonal piece in last column
        (arr[i] + i == col + newQueen) --check diagonal pice in next column
        then 
            return false
        end
    end
        return true
end

--function to print the solution
--prints to io
--inputs: array of queen columns/ array indices act as rows
function printSolution(arr)
    for i = 1, boardSize do --for each row
        for j = 1, boardSize do --for each column
            if(arr[i] == j) then --check if that column has a queen
                io.write(" X ")
            else 
                io.write(" - ")
            end
        end
        io.write("\n")
    end
    io.write("\n")
end


--Function to add new queens and call printSolution
--inputs: the array of queens and the queen row/number to add
--output: prints the solution
function addQueen(arr, num)
    if num>boardSize then --checking if all rows are filled
        printSolution(arr)
    else
        for col = 1, boardSize do --going row by row
            if checkIfSafe(arr, num, col)  then --checking if that row and column are safe
                arr[num] = col --adding queen
                addQueen(arr, num + 1) --recursion. calling the same method again
            end
        end
    end
end

arr = {}
addQueen(arr, 1)
