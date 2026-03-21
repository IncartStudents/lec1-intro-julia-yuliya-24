# переписать ниже примеры из первого часа из видеолекции: 
# https://youtu.be/4igzy3bGVkQ

# по желанию можно поменять значения и попробовать другие функции
println("I'm excited to learn Julia!")

123
456;

#присваивание переменных
my_answer = 42
typeof(my_answer)
my_pi = 3.14
typeof(my_pi)
my_name = "Yulia"
typeof(my_name)

#присваивание переменной одного типа значение переменной другого вида
my_answer = my_name
typeof(my_answer)

#математические операции
sum = 5+6
difference = 7-6 
product = 5*8
quotient = 80/10
power = 2^6
modulus = 100% 51 

#создание строки
s1 = """я пишу"""
typeof('a')

#$для подставления переменных в строку
name = "Jane"
num_fingers = 10
num_toes = 9

println("Hello, my name is $name.")
println("I have $num_fingers fingers and $num_toes toes. $(num_fingers+num_toes)")

#объединение строк
string("How many cats", "are too many cats?")

s3 = "how many cats ";
s4 = "are too many cats?";
s3*s4
"$s3$s4"

#создание словаря Dict
myphonebook = Dict("Jenny" => "867-5309", "Ghosbusters" => "555-2368") # => соединение ключа и значения
myphonebook["Kraken"] = "555-666"
myphonebook
myphonebook["Kraken"]
pop!(myphonebook, "Kraken") #удаление из словаря
myphonebook
#словари не упорядочены, нельзя обращаться по индексу

#Кортеж (tuple) — это неизменяемая (immutable) упорядоченная коллекция элементов, которая может содержать значения разных типов
animals = ("dog", "cat", "pig")
animals[2]
#нельзя обновлять кортеж/присваивать другое значение

#массивы (можно изменять + упорядочены)
friend = ["ted", "rob", "bob", "lily", "jane"]
fibonacci =[1, 1, 2, 3, 5, 8, 13]
mix = [1, 2.5, "hi"]
friend[3]
friend[3]= "pop"
friend
push!(fibonacci, 21)
pop!(fibonacci)#удаляется последний
fibonacci

#многомерные массивы
pypypy = [["pypy1", "pypy2", "pypy3"],["1pypy", "2pypy", "3pypy"]]
rand(4,3,2)

#циклы
n=0
while n<10
    n+=1
    println(n)
end

friend 
i=1
while i <= length(friend)
    name_friend = friend[i]
    println("hi $name_friend, if's great to see you!")
    i += 1
end

for n in 1:10
    println(n)
end

for name_friend in friend
    println("hi $name_friend")
end

for n = 1:11
    println(n)
end

#создание таблиц сложения
m, n = 4, 4
A = zeros(m,n)
for i in 1:m
    for j in 1:n
        A[i, j] = i+j;
    end
    
end
A
for i in 1:m
    for j in 1:n
        A[i, j] += A[i,j]
    end
    
end
A

B = zeros(m,n)
for i in 1:m, j in 1:n
    B[i,j] = i+j
end
B

C = [i+j for i in 1:m, j in 1:n]

for n in 1:10
    A = [i+j for i in 1:n, j in 1:n]
    display(A)
end

#условные операторы
x = 5
y = 5.2
if x>y
    println("$x > $y")
elseif y>x
    println("$y>$x")
else
    println("$x = $y")
end

if x>y 
    x 
else
    y 
end

#= a?b :C 
if a
    B
else
    c 
end =#
(x<y) ? x : y

(x>y) && println("$x > $y")
(x<y) && println("$x < $y")

#функции
function sayhi(name)
    println("hi $name")
end

function f(x)
    x^2
end

sayhi("hh")
f(5)

sayhi2(name) = println("hi $name !")
f2(x) = x^2
sayhi2("bob")
f2(3)

sayhi3 = name -> println("hi $name")
f3 = x -> x^2
sayhi3("pypi")
f3(7)
sayhi(12546)
A = rand(3,3)
A
f(A)

v = [3, 5, 2]
sort!(v)
v

A = [i + 2*j for j in 0:2, i in 1:3]
f(A)
f.(A) #возведение каждого индекса матрицы в квадрат
A[2,2]
A[2,2]^2
B[2,2]
v = [1, 2, 3]
f.(v)

#пакеты
#Pkg.add("Example")
using Example
hello("it's me")

using Colors
palette = distinguishable_colors(50)
rand(palette, 4,4)

#построение графиков
using Plots
x = -3 :0.1 :4
f(x) = x^2
y = f.(x)
gr()
#=plot(x, y, label = "line")
scatter!(x, y, label = "points")
=#
plotlyjs()
plot(x, y, label = "line")
scatter!(x, y, label = "points")

globaltemperatures = [14.4, 14.5, 14.8, 15.2, 15.5, 15.8]
numpirates = [45000, 20000, 15000, 5000, 400, 17]
gr()
plot(numpirates, globaltemperatures, legend=false )
scatter!(numpirates, globaltemperatures, legeng=false)
xflip!()
xlabel!("колво пиратов")
ylabel!("глобальная температура")
title!("зависимость количества пиратов от глобального потепления")

gr()
p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
plot(p1, p2, p3, layout=(3, 1), legend=true)

methods(+)
@which 3+3
@which 3.0+3.0
@which 3+3.0

import Base: +
+(x::String, y:: String) = string(x,y)
"hello" + " world!"
@which "hello" + " world!"

#линейная алгебра
A = rand(1 :4, 3, 3)
B = A
C = copy(A)
[B C]

A[1]= 17
[B C]
x = ones(3)
b = A*x 
Asym = A + A' #сопряженно транспонированная матрица
Apd = A'A
Atall = A[:, 1:2]
display(Atall)
Atall\b
A = rand(3,3)
[A[:, 1] A[:, 1]]\b