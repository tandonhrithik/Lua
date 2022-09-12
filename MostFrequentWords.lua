--[[
    This is a function that reads a line and displays the first nth most occurring words
]]

io.input("Documentation.md") --getting the file

--n is the number of words we want, size is the minimum length of the words that we want
function getMostFrequentWords(n, size)

local count = {}        --Use this to count repetition

for lines in io.lines() do
    for word in string.gmatch(lines, "%w+") do
        if(#word>size) then
            if(count[word]) then
                count[word] = count[word] + 1
            else
                count[word] = 1
            end
        end
    end
end

--storing words that have been counted
local words = {}

for word in pairs(count) do
    words[#words+1] = word
end

--sorting them using table.sort
table.sort(words, function(word1, word2)
    return count[word1] > count[word2]
    or count[word1] == count[word2] and word1<word2
end)

--printing the most frequent words
for i = 1, n do 
    io.write(words[i],"  count:  ", count[words[i]], "\n")
    end
end

getMostFrequentWords(5, 4)

