function removeLast(...)
    local s = {...}
    return table.unpack(s, 1, #s-1)
end

print(removeLast(1,2,3,4,5,6,7,8,9,10))
