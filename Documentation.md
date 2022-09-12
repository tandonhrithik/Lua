
@author Hrithik Tandon
Notes from Programming in Lua 4ed 
# Basics

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
  

# Numbers

Numerals with decimal points are considered floating points. Otherwise, they are treated as integers

both integers and float values have type "number":

type(3)     --> number
type(3.5)   --> number
type(3.0)   --> number

floats and integers with the same value are equal in lua.

1 == 1.0      --> true
-3 == -3.0    --> true
0.2e3 == 200  --> true

to distinguish between float and integers, use math.type.

math.type(3)    -->Integer
math.type(3.0)  -->float

* Lua also supports floating point hexadecimal values

0xff      -->255
0xa.bp2   -->42.75

Lua can also write in floating point representation using string.format("%a")

string.format("%a", 419)        --> 0x1.a3p+8
string.format("%a", 0.1)        --> 0x1.999999999ap-4

This format isn't as friendly to readers but preserves full precision

Arithmetic Operators

If both operands are integers, then the answer is integer. Otherwise, for mixed operands, Lua converts integer to float.

Division does not follow this rule because the division of two integers does not need to be an integer.

3/2     --> 1.5

For integer division, we also have //(floar division). It always rounds the quotient towards minus infinity. This follows the same rule as the general arithmetic operators.

3//2    --> 1

modulo can be defined as 
    a % b == a - ((a // b) * b)

For any given positive constant k,
    the result of x % k is always in the range [0, K-1] even if x is negative

Lua also supports exponentiation operator, denoted by caret(^).
We can use x^0.5 to compute square root
We can also use x^ (1/3) to compute cubic root etc

Relational Operator:

We also have several relational operators to use. 
<, >, == , <= , >= , ~= 

~= is the netfation of equality operators. 

if the operands are of different types, then lua considers them not equal. string and number, for example. 

Mathematical Library:

the math library offers logarithms, constants such as pi and huge(largest representable number), trigonometric functions, random etc.

All trigonometric functions work in radians and we can use deg and rad to convert between degrees and radians

math.random can be used in three ways. Without arguments, it returns a psuedo random number in [0,1). With only one argument, it returns an integer between [1,n]. With two arguments l and  u, it returns a number between [l,u].

we can set a seed for this method using randomseed function. Defualt seed is 1. We can also use ostime function as seed.

Rounding functions:

floor, ceil and modf. 
floor rounds towards minus infinite. 
ceil rounds toward plus infinite. 
modf rounds towards zero. 

modf returns the rounded value as well as the fractional part of the number as second result

math.floor(3.3)   -->3
math.ceil(-3.3)   --> -4
math.ceil(3.3)    --> 4
math.ceil(-3.3)   --> -3
math.modf(3.3)    --> 3     0.3
math.modf(-3.3)   --> -3    -0.3

If the argument is an integer, it remains unaltered.

Representation limits:

Standard Lua uses 64-bit representation. If the values is smaller than mininteger or larger than maxinteger, overflow occurs and the result wraps around.

For floating points, lua uses 64-bit representation, 11 of which are used for exponent. Double precision floats can represent numbers with roughly 16 significant decimal digits.

Conversions:

To convert an integer to float, we can simply add a 0.0 to it. 

To convert float to integer, use |0
if the number has a fractional part, lua raises an error.

Another way to force a number to integer is to use math.tointeger
if there is a fractional part, we get nil. if we go out of range, we still get nil

# Strings

Strings are immutable sequences of bytes in Lua. Lua handles the memory management of strings for us.

We can get the length of string by using #. 
print(#"Hello")

We can concatenate two strings by using .. operator.
"Hello" .. "World"

Any numeric operation where lua finds a string, it converts the string to a number.
Any operation, such as concatenation, where lua finds a number, it converts it into a string

to convert number to sting, use tonumber(). We can also use toNumber("", base) to specify what base we want the number in. 

to convert to string, use tostring() function.

The String Library:
string.rep("", num)   --> repeats "" num times
string.reverse("")    --> reverse the line
string.lower("")      --> to lower case
string.upper("")      --> to upper case
string.sub(s, i, j)   --> returns substring from ith to jth character
                          inclusive
sub can also be used with negative indices which start from -1 from end of the string.

string.char()         --> returns character representation of ASCII
string.byte()         --> returns ASCII representation of character
string.byte("abc")    --> returns ASCII representation of first character
string.byte("", i)    --> returns ASCII representation of ith character
string.byte("", i, j) --> returns ASCII representation of all characters 
                          between i and j
string(s, 1,-1)       --> get list of codes of all characters in s
This only works for strings smaller than 1MB. Lua limits stack size

string. format can be used to convert to decimal, hex, string, float etc
string.format("x = %d  y = %d", 10, 20)  --> x = 10  y = 20
string.format("x = %x", 200)              --> x = c8
string.format("x = 0x%X", 200)            --> x = 0xC8
string.format("x = %f", 200)              --> x = 200.000000

string.find(s, x)     --> returns initial and final positions of x in s
string.gsub(s, x, y)  --> replaces all x in s with y. also returns  
                          number of replacements made

