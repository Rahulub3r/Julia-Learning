using Printf
using Statistics

#import Pkg
#Pkg.add("DataFrames")

using DataFrames, Random

# -- Variables -- #
# Can reassign variable to different types and no errors are thrown
s=0
#s='Dog' - This will give an error
s="Dog"
println(s)

# -- Datatypes -- #

# This will throw and error because we asserted a data type and are
# trying to change it after changing
function changeNum()
    x::Int8 = 10
    x = "Dog"
end
#changeNum()

# Boolen
canDrive = true
println(canDrive)
cantDrive = false
println(canDrive)

# Other data types
# Int8 : -128 - 127
# Int16 : −32,768 - 32,767
# Int32 : −2,147,483,648 - 2,147,483,647
# Int64 : −2^63 - 2^63 - 1
# Float32, Float64, UInt8, UInt16, etc.

# Float addition is accurate upto 14 digits
s = 0.1111111111111111111111111111
println(s + 1.23111111111111111111111111)

# Can use get_bigfloat_precision() for biggerones
# there are also bigints

# -- Casting datatypes -- #

# casting from int to char type
s = Char(122)
println(s)

# cast from flaot to Int
s = UInt8(trunc(2.73))
println(s)

# cast from string to Float
s = parse(Float64, "1")
println(s)

# casting string to Int
s = parse(Int8, "1")
println(s)

# -- Strings -- #
s = "random stuff\n"

# size of the String
println(length(s))

# The 1st index value - indexing starts at 1
println(s[1])

# last index
println(s[end])

# get a range
println(s[5:9])

# concatenation
s = string("random", "words")
println(s)
# using and
println("random" * "words")

# interpolation in Strings
i1=37
i2=21
println("$i1+$i2=$(i1+i2)")

# multiple lines
s="""There
are
multiple
lines"""
println(s)

# string comparisons
println("A" > "B")
println("\n")
# which index
println(findfirst(isequal("i"), "kite"))
println(findfirst(isequal('i'), "kitie"))
println("\n")
# substring conditional
println(occursin("java", "javascript"))

# -- Dataframes -- #
println(DataFrame(A = 1:2, B = 3:4))

# -- Conditionals -- #
age = 12
if age >= 5 && age <= 6
    println("You're in K.G")
elseif age >= 7 && age <= 13
    println("You're in elementary or middle school")
elseif age >= 14 && age <=18
    println("You're in highschool")
else
    println("Go to college!")
end

@printf("true || false = %s\n", true || false ? "true" : "false")
@printf("!true = %s\n", !true ? "true" : "false")

age = 55
@printf("Can I drive : %s\n", age > 16 ? "true" : "false")

# -- Loops -- #
i=1

while i<20
    if (i%2) == 0
        println("i = $i")
        global i += 1
        continue
    end

    global i += 1

    if i >= 10
        break
    end
end

# a range with for loop
for i=1:5
    println(i)
end

# for loop using array
for i in [1,2,3]
    println(i)
end

# multiple variables for loop
for i = 1:5, j = 2:2:10 # from:by:to
    println((i, j))
end

# -- Arrays -- #
# array of zeros
s = zeros(Int32, 2, 2) # a 2x2 array

# array of Int 32s
s = Array{Int32}(undef, 5) # undef says they have undefined values

# or like This
s=Float64[]

# array indexing - similar to strings
s=[1,2,3]
println(5 in s)

# find all matches using a generic function
f(a) = (a >= 2) ? true : false
println(findall(f, s))
println(count(f, s)) # number of times the array passes the test

# get num of rows and columns
println(size(s))

# get num of elements
println(length(s))

# sum of the values
println(sum(s))

# put values starting at 2nd index
splice!(s, 2:1, [8,9]) #to insert a replacement before an index n without removing any items use n:n-1
println(s)

# popping elements
splice!(s, 2:3)
println(s)

# max and min
println(maximum(s))
println(minimum(s))

# perform calculations without looping
println(s * 2)

# like a list in python - multiple data types
s = [1,2.732, "hello"]

# can store functions in arrays
s = [sin, cos, tan]
for n in s
    println(n(0))
end

# multi dim array
s=[1 2 3; 4 5 6]
for n = 1:2, m=1:3
    @printf("%d ", s[n,m])
end
println()

# get a single column out
println(s[:, 2])

# array from a range
s=collect(1:5)

# range with a step
# or backward collect (4:-1:1)
s=collect(2:2:10)
for n in s print(n) end
println()

# list comprehension
println([n^2 for n in s])

# add a value to an array
push!(s, 36)
println(s)

# multidim array using comprehension
s = [x*y for x in 1:5, y in 2:2:10]
println(s)

# getting random values
s=rand(0:1, 5, 5)
for n in 1:5
    for m in 1:5
        print(s[n,m])
    end
    println()
end

# -- Tuples -- #
# similar to python, same as arrays and immutable
s = (1,2,3,4)

for i in s
    print(i)
end
println()

# multidim Tuples
s = ((1,2),(3,4))
println(s[2][2])

# named tuple
s = (a=("a",100),b=("b",200))
println(s.a)

# -- Dictionaries -- #
# key must be unique
s = Dict("pi"=>3.14, "e"=>2.72)
println(s)

# get a value
println(s["pi"])

# add a key val pair
s["golden_ratio"]=1.618

# del a key
delete!(s, "pi")
println(s)

# check if a key exisits
println(haskey(s, "pi"))

# check for a key and values
println(in("pi"=>3.14, s))

# display all keys and values
println(keys(s))
println(values(s))

# get both
for kvpair in s
    println(s)
end

# control the display using a different type of for
for(key, value) in s
    println(key, " : ", value)
end

# -- Sets -- #
# same like Python sets
s1 = Set(["A", "B", "A"])
s2 = Set(["B", "C", "D"])

println(s1)
push!(s1, "F")
println(s1)

println("Union: ", union(s1, s2))
println("Intersection: ", intersect(s1, s2))
println("Difference:", setdiff(s1, s2))

# -- Functions -- #
# Single expression function
getSum(x, y) = x+y
x, y = 1, 2
@printf("%d + %d = %d\n",x, y, getSum(x, y))

# multiple expression function
function canIVote(age=16)
    if age >= 18
        println("Can Vote")
    else
        println("Cannot Vote")
    end
end
canIVote(43)

# arguments are passed by value
s=5
function changeS(s)
    s=10
end
changeS(s)
println(s) # did not change cuz did not use global

function changeS2()
    global s = 10
end
changeS2()
println(s)

# variable arguments
function getSum(args...)
    sum = 0
    for a in args
        sum += a
    end
    println(sum)
end
getSum(1,2,3,4)

# return multiple values
function next2(s)
    return (s+1, s+2)
end
println(next2(5))

# functions returning functions
function makeMultiplier(s)
    return function(x) return x*s end
end

mult7=makeMultiplier(7)
println(mult7(6))

# handling diff types of args
function getSum(s1::Number, s2::Number)
    return s1+s2
end

function getSum(s1::String, s2::String)
    return parse(Int32, s1) + parse(Int32, s2)
end

f1 = parse(Float64, "1")

println("5 + 4 = ", getSum(5, 4))
println("5 + 4 = ", getSum("5", "4"))

# -- Anonymous functions -- #
# Must be used inline

# map applies the fn to each item
s = map(x -> x * x, [1,2,3])
println(s)

# add arrays
s = map((x, y) -> x+y, [1,2], [3,4])
println(s)

# reduce uses a fn multiple times for a single result
s = reduce(+, 1:100)
println(s)

# getting the longest word in a sentence
s = "This is a string"
# Convert to array
sArray = split(s, " ")
longest = reduce((x, y) -> length(x) > length(y) ? x : y, sArray)
println(longest)

# ----- Math ----- #
@printf("5 + 4 = %d\n", (5 + 4))
@printf("5 - 4 = %d\n", (5 - 4))
@printf("5 * 4 = %d\n", (5 * 4))
@printf("5 / 4 = %d\n", (5 / 4))
println("5 % 4 = ", (5 % 4))
@printf("5 ^ 4 = %d\n", (5 ^ 4))

@printf("round(3.5) = %d\n", round(3.5))
@printf("floor(3.5) = %d\n", floor(3.5))
@printf("ceil(3.5) = %d\n", round(3.5))
@printf("abs(-3.5) = %d\n", abs(-3.5))
@printf("sqrt(100) = %d\n", sqrt(100))
@printf("cbrt(100) = %d\n", cbrt(100))
@printf("hypot(90,90) = %d\n", hypot(90,90))
@printf("exp(2) = %d\n", exp(2))
@printf("log(100) = %d\n", log(100))
@printf("log2(100) = %d\n", log2(100))
@printf("log10(100) = %d\n", log10(100))

# Trig Functions : sin, cos, tan, cot, sec, csc
# sinh, cosh, tanh, coth, sech, csch
# asin, acos, atan, acot, asec, acsc
# asinh, acosh, atanh, acoth, asech, acsch
# sinc, cosc

# can imply multiplication without *
s=[1,2,3]
println(2s)

# Dot operators
s=[1,2,3]
println(s .*2)
println(s .+2)

# -- Enumerators -- #
@enum Color begin
    red=1
    blue=2
    green=3
end

favColor=blue::Color
println(favColor)

# -- Symbols -- #
# They are the immutable strings that represent a variable as "data"
:Derek
println(:Derek)

# They are commonly used for dictionaries
s = Dict(:pi => 3.14, :e => 2.73)
println(s)
println(s[:pi])

# -- Structs -- #
# Composite datatypes
struct Customer
    name::String
    balance::Float32
    id::Int
end

# Create customer obj
bob = Customer("Bob Smith", 10.50, 123)
println(bob.balance)

# They are immutable bob.name="Sue" will throw an error
# Can change this with a mutable struct

# -- Abstract datatypes -- #
# they can be instantiated like structs
# but can have subtypes

abstract type Animal end

struct Dog <: Animal
    name::String
    bark::String
end

struct Cat <: Animal
    name::String
    meow::String
end

bowser=Dog("Bowser", "Ruff")
muffin=Cat("Muffin","Meow")

function makeSound(animal::Dog)
    println("$(animal.name) says $(animal.bark)")
end

function makeSound(animal::Cat)
    println("$(animal.name) says $(animal.meow)")
end

makeSound(bowser)
makeSound(muffin)

# -- Exception handling and user input -- #
# Throw and handle errors
print("Enter a number: ")
s1=chomp(readline())

print("Enter a number: ")
s2=chomp(readline())

try
    val = parse(Int32, s1) / parse(Int32, s2)
    if (val == Inf)
        error("Can't divide by zero")
    else
        println(val)
    end
catch e
    println(e)
end

# -- File IO -- #
# Open a file to write
open("random.txt", "w") do file
    write(file, "Here is some random text\nSome more\n")
end

# Open a file to read
open("random.txt", "r") do file
    # Read the whole file into a string
    data=read(file, String)
    println(data)
end

open("random.txt") do file
    # Read one line at a time
    for line in eachline(file)
        println(line)
    end
end

# -- Marcros -- #
# Macros generate code before the program is run

# Execute passed code a certain #times
macro doMore(n, exp)
    quote

        # esc hides what it contains until everything
        # is ready to be executed

        for i = 1:$(esc(n))
            $(esc(exp))
        end
    end
end

@doMore(2, println("Hello"))

# Create a do while loop
macro doWhile(exp)

    # Assert that while is the first element passed
    @assert exp.head == :while

    # quote is the same as begin .. end
    esc(quote
    # Containts loop body

    $(exp.args[2])
    $exp
    end)
end

s=0
@doWhile while s < 10
    global s += 1
    println(s)
end
