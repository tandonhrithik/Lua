-- defines a factorial function
--[[function fact (n)
    if n == 0 then
      return 1
    else
      return n * fact(n - 1)
    end
  end
  
  print("enter a number:")
  a = io.read("*n")        -- reads a number
  print(fact(a))
]]--

function fact(num)
    if num == 0 then
        return 1
    else 
        return (num*fact(num-1))
    end
end

print("Enter a number")
input = io.read("*n")
print(fact(input))
