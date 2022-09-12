--Function to check if a string is palindrome 
--Inputs: string
--Output: boolean
function checkPalindrome(s)
    if(string.reverse(s) ==s) then      --if reverse is equal to string
        return true
    else return false
    end
end

--Function to check if a string is palindrome ignoring the spaces
--Inputs: string
--Output: boolean
function checkPalindromNoSpaces(s)
    while string.find(s, " ") do
        i, j = string.find(s, " ")          --find location of space
        s = string.sub(s, 0, i-1) .. string.sub(s,j+1,-1)   --remove that space     
    end
    if(string.reverse(s) == s) then
        return true
    else return false
    end
end


--testing out the functions
print(checkPalindrome("racecar"))
print(checkPalindrome("bananas"))
s = "r a c e c a r"
print(checkPalindromNoSpaces(s))


