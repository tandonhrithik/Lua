# LUA
@author Hrithik Tandon
Notes from Programming in Lua 4ed 
## Basics

Each piece of code that Lua executes, such as a file or a single line in interactive mode, is called a chunk.

Lexical conventions:
    Identifiers(name of the variables)

    comments start with -- for a single line comment
    or --[[for multi line comments]]

    A common trick that we use to comment out a piece of code is to enclose the code between --[[ and --]], like here:

      --[[
      print(10)         -- no action (commented out)
      --]]
    To reactivate the code, we add a single hyphen to the first line:

      ---[[
      print(10)         --> 10
      --]]

    Lua does not need a seperator like ; 
    We can use it if we want to.

    global varibles do not need declarations and a non-initialized variable is nil by default
    >b --> nil
    >b = 10

    eight basic types in Lua. nil, boolean, number, string, userdata, function, thread, and table

    use type(arguments) to find out the type of the data
    type() returns a string

    Nil: Lua uses nil to indicate the absence of any useful data

    Boolean: In Lua, conditional tests consider any value other than    false and nil as true. As such, even 0 or a string will return true.
        useful lua idiom = 
            x = x or v which is equivalent to if not x then x= v end
            As such, x is set to a default value v unless initialized


Lua Interpreter:
    It ignores the first line if marked as #
    


