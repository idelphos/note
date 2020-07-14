## 准备 python 环境

python -V  　＃--version





## function

### 1. print()

```python
#!/usr/local/bin/python3

print("Hello World!")
print("Hello Again")
print("I like typing this.")
print("This is fun.")
print("Yay! Printing.")
print("I'd much rather you 'not' .")
print('I "said" do not touch this.')



```

%s 格式化字符串 [ex5.py](#ex5.py)



### 2.round()

浮点数四舍五入





#





## 注释 \# '''

\# 行注释 , 单行注释放在需要注释的语句前, 或单个语句后

''' 块注释  或 """   三个引号



## 数学计算

> +
>
> -
>
> /
>
> *
>
> %
>
> =
>
> <
>
> \>
>
> <=
>
> \>=
>
> PEMDAS 运行优先级 Parentheses Exponents Multiplication Division Addition Substraction

```python
print("I will now count my chickens:")
print("Hens", 25 + 30 / 6)
print("Rooster", 100 - 25 * 3 % 4)
print("Now I will count the eggs:")
print( 3+2+1-5+4%2-1/4+6)
print("Is it true that 3+2<5-7?")
print(3+2<5-7)
print("What is 3+2?", 3+2)
print("What is 5-7?",5-7)
print("oh, that's why it's False.")
print("How about some more.")
print("Is it greater?",5 > -2)
print("Is it greater or equal?", 5 >= -2)
print("Is it less or equal?", 5 <= -2)


result:
  I will now count my chickens:
Hens 30.0
Rooster 97
Now I will count the eggs:
6.75
Is it true that 3+2<5-7?
False
What is 3+2? 5
What is 5-7? -2
oh, that's why it's False.
How about some more.
Is it greater? True
Is it greater or equal? True
Is it less or equal? False
```



## variable 



``` python
cars = 100
space_in_a_car = 4.0
drivers = 30
passengers = 90
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car
average_passengers_per_car = passengers / cars_driven

print("There are", cars, "cars available.")
print("There are only", drivers, "drivers available.")
print("There will be", cars_not_driven, "empty cars today.")
print("We can transport", carpool_capacity, "people today.")
print("we have", passengers, "to carpool today.")
print("We need to put about", average_passengers_per_car, "in each car.")

result:
  There are 100 cars available.
There are only 30 drivers available.
There will be 70 empty cars today.
We can transport 120.0 people today.
we have 90 to carpool today.
We need to put about 3.0 in each car.
```



### ex5.py

```python
my_name = 'Zed A. Shaw'
my_age = 35  # not a lie
my_height = 74  # inches
my_weight = 180 # lbs
my_eyes = "Blue" 
my_teeth = "White"
my_hair = "Brown"

print("Let's talk about %s." % my_name)
print("He's %d inches tall." % my_height)
print("He's %d pounds heavey." % my_weight)
print("Actually that's not too heavey.")
print("He's got %s eyes and %s hair."% (my_eyes, my_hair))
print("His teeth are usually %s depending on the coffee." %my_teeth)

# this line is tricky, try to get it exactly right
print("If I add %d,%d, and %d I get %d."%(my_age, my_height, my_weight, my_age + my_height + my_weight))

result:
Let's talk about Zed A. Shaw.
He's 74 inches tall.
He's 180 pounds heavey.
Actually that's not too heavey.
He's got Blue eyes and Brown hair.
His teeth are usually White depending on the coffee.
If I add 35,74, and 180 I get 289.

```



## string 和文本

python 可以使用" 或 '  来表示字符串, 



### 格式化字符串

字符串可以包含格式化字符 (如%s) ,如果想要在字符串中通过格式化字符放入多个变量, 需要将变量放到()中, 变量之间用,分隔

%r 用来做 debug 比较好, 它会显示变量的原始数据





```python
x = "There are %d types of people." % 10
binary = "binary"
do_not = "don't"
y = "Those who know %s and those who %s." %(binary, do_not)

print(x)
print(y)

print("I said:%r." % x)
print("I also said: '%s'." %y)

hilarious = False
joke_evaluation = "Isn't that joke so funny?! %r"

print(joke_evaluation % hilarious)

w = "This is the left side of ..."
e = "a string with a right side."

print(w+e)

output
There are 10 types of people.
Those who know binary and those who don't.
I said:'There are 10 types of people.'.
I also said: 'Those who know binary and those who don't.'.
Isn't that joke so funny?! False
This is the left side of ...a string with a right side.
```

