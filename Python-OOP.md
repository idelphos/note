[toc]

# refer to

[Python官方手册](https://docs.python.org/zh-cn/3.7/tutorial/index.html)

# OOP 相关定义

**class** : 用来描述具有相同的属性和方法的对象集合. 它定义了该集合中每个对象所共有的属性和方法. 对象是类的实例.  类是创建实例的模板，而实例则是一个一个具体的对象，各个实例拥有的数据都互相独立，互不影响；

**method**: 方法,  类中定义的函数,就是与实例绑定的函数，和普通函数不同，方法可以直接访问实例的数据 . 通过在实例上调用方法，我们就直接操作了对象内部的数据，但无需知道方法内部的实现细节。

**object** :对象, 也称实例, 通过类定义的数据结构实例。对象包括两类数据成员（类变量和实例变量）和方法。

**实例化**：创建一个类的实例，类的具体对象。

**类变量**:  类变量在整个实例化的对象中是公用的,不单独分配给每个实例. 类变量定义在类中且在函数体外. 类变量通常不作为实例变量使用

**实例变量**:在类的声明中，属性是用变量来表示的，这种变量就称为实例变量，实例变量就是一个用 **self** 修饰的变量。实例化后,每个实例单独拥有的变量

**数据成员**:类变量或实例变量 用于处理类及其实例对象的相关数据

?**局部变量**: 定义在方法中的变量,只作用于当前实例的类

**继承**：即一个派生类（derived class）继承基类（base class）的字段和方法。继承也允许把一个派生类的对象作为一个基类对象对待。例如，有这样一个设计：一个Dog类型的对象派生自Animal类，这是模拟"是一个（is-a）"关系（例图，Dog是一个Animal）

**方法重写**: 如果父类继承的方法不能满足子类的需求,可以对其改写, 这个过程叫方法的覆盖(override), 也称方法的重写

```python
class Athele:
    ''' 
      类定义示例 docstring 
    ''' 
    # 类变量
    name = ''
    age = 0
  
    #定义私有属性, 私有属性在类外部无法直接访问
    __weight = 0
    
    
    
    def __init__(self, a_name, a_bob = None, a_times = []):
    
    # 属性 attribute 定义 , 实例变量
    # 类中的属性都必须有初始值
    # 可通过类函数来访问这些数据 , 访问如 self.name 形式
        self.name  = a_name
        self.bob   = a_bob
        self.times = a_times
        self.height = 0       #设定属性默认值
    

    #与普通函数相比, 类中定义的函数只有一点不同, 就是第一个参数必须是实例变量self.self 代表类的实例
    #类内定义的访问数据的函数, 对数据实现了封装
    
    def top(self):
        return(sorted(set([sanitize(t) for t in self.times]))[0:3])
  
    def add_time(self, time_value):
        self.times.append(time_value)
  
    def add_times(self, list_of_times):
        self.times.extend(list_of_times)
   
#私有方法,外部无法调用.内部采用 self.__add_pri()形式调用.
    def __add_pri(self, list_of_times):      
        pass
    
  
    
       
        
    #关于封装
    #数据和逻辑被封装起来,调用很容易, 不用知道内部实现细节.
    #封装的另一个好处是,可以很容易给类增加新的方法


inst1 = Athele('Tom','George', [23,45])        #类实例化
print(inst1.name)                              #句点形式访问方法或属性 obj.name
```

## \__init__()

类中的一个特殊方法(构造方法), 该方法会在实例化时自动运行. 它的第一个参数永远是 self , 表示创建实例本身. \__init__ 内部可以把各种属性绑定到 self , 因为 self就是指向创建的实例本身的引用

有了\_\__init__ 方法,创建实例时,就必须传入与\__init__ 方法匹配的参数 (不需要传 self)

每个与类相关联的方法调用都自动传递实参 self, 让实例能够访问类中的属性和方法. 类中属性以 self.name 的形式可供类中的所有方法使用, 还可以通过类的实例来访问这些变量.

self 代表类的实例,即当前对象的地址, 而非类, self.\__class__则指向类



# 类变量与实例变量

无论是类属性还是类方法，都无法向普通变量或者函数那样，在类的外部直接使用它们。我们可以将类看做一个独立的空间，则类属性其实就是在类体中定义的变量，类方法是在类体中定义的函数.

1. 类体中、所有函数之外：此范围定义的变量，称为类属性或**类变量**；
2. 类体中，所有函数内部：，称为实例属性或**实例变量**；





python**普通变量**: 在类体中, 所有函数内部: 在被赋值后即变量存在, 以“变量名=变量值”的方式定义的变量. 也称局部变量

python **类变量**: 在类设计里,class里, def functionName外,通过变量名就能被赋值; def 里通过类名字的点运算,变量可被赋值.   在程序中, 通过类名字的点运算,类变量也能被赋值

Python **实例变量**: 在类设计里, 函数内部: 以“self.变量名”的方式定义的变量 ,变量可被赋值. 不一定非在\_\__init__()  , 其它已被调用的函数也行.  在程序里,通过实例对象的点运算, 变量可被赋值.

 ```python
class classVarTest:
    '''
    理解类变量与实例变量的区别
    '''
    class_var = 10      # 
    
    def __init__(self):
        self.inst_var1 = 11
        self.inst_var2 = 12
    
    def add(self):
        return self.inst_var1 + self.inst_var2

inst1 = classVarTest()        # 实例化
print(inst1.add())            # 23 


# inst1.class_var 是实例变量
# 类变量用 className.classVarName形式访问
#通过类对象是无法修改类变量的。通过类对象对类变量赋值，其本质将不再是修改类变量的值，而是在给该对象定义新的实例变量
classVarTest.class_var = 20
inst1.class_var = 13                       #定义了新的实例变量,而不是给类变量赋值
print(classVarTest.class_var, inst1.class_var)    # 20 13

# inst1.t  inst1.q 都是实例变量
# python 还支持为特定对象添加实例变量
inst1.t = 14
inst1.q = 15 
print(inst1.t,inst1.q)                  # 14  15

#classVarTest.m ,classVarTest.n 是类变量
# 可以动态地为类和对象添加类变量
classVarTest.m = 30
classVarTest.n = 20               
print(classVarTest.m,classVarTest.n )       #30 20 

#和静态语言不同，Python允许对实例变量绑定任何数据，也就是说，对于两个实例变量，虽然它们都是同一个类的不同实例，但拥有的变量名称都可能不同
inst2 = classVarTest()                      #实例化
print(inst2.inst_var1, inst2.inst_var2)     # 11 12
# print(inst2.t, inst2.q)        #出错, 新实现,而且classVarTest类中没有t,q的属性

#m,n 是类变量
print(inst2.m, inst2.n)                     # 30 20 

    

    
    
 ```

## 类变量

类变量的特点是，所有类的实例化对象都同时共享类变量，也就是说，类变量在所有实例化对象中是作为公用资源存在的.  因为类变量为所有实例化对象共有，通过类名修改类变量的值，会影响所有的实例化对象

```python
class CLanguage :
    # 下面定义了2个类变量
    name = "C语言中文网"
    add = "http://c.biancheng.net"
    # 下面定义了一个say实例方法
    def say(self, content):
        print(content)
        
#使用类名直接调用
print(CLanguage.name)
print(CLanguage.add)
#修改类变量的值
CLanguage.name = "Python教程"
CLanguage.add = "http://c.biancheng.net/python"
print(CLanguage.name)
print(CLanguage.add)

# 也可以使用类对象来调用所属类中的类变量
# 但不推荐这样使用,因为实例变量和类变量可以同名，但这种情况下使用类对象将无法调用类变量，它会首选实例变量.
clang = CLanguage()
print(clang.name)
print(clang.add)
```

## 实例变量

实例变量指的是在任意类方法内部，以“self.变量名”的方式定义的变量，其特点是只作用于调用方法的对象。另外，实例变量只能通过对象名访问，无法通过类名访问

```python
class CLanguage :
    def __init__(self):
        self.name = "C语言中文网"
        self.add = "http://c.biancheng.net"
    # 下面定义了一个say实例方法
    def say(self):
        self.catalog = 13
#CLanguage 类中，name、add 以及 catalog 都是实例变量。其中，由于 __init__() 函数在创建类对象时会自动调用，而 say() 方法需要类对象手动调用。因此，CLanguage 类的类对象都会包含 name 和 add 实例变量，而只有调用了 say() 方法的类对象，才包含 catalog 实例变量
```

## 局部变量

类方法中还可以定义局部变量，局部变量直接以“变量名=值”的方式进行定义.通常定义局部变量是为了所在类方法功能的实现。局部变量只能用于所在函数中，函数执行完成后，局部变量也会被销毁。





## 修改变量的值

```python
class changeAttr:
    class_var = 'class variable for test'
    
    def __init__(self):
        self.name = 'Tom'
        self.age = 23
        
    def update_name(self,mi):
        self.name = mi
    
    # def 类引用类变量的方法
    def print_class_var(self):
        print(changeAttr.class_var)
       

        
inst1 = changeAttr()
print(inst1.name)

inst1.print_class_var()

#句点形式,直接访问,修改实例属性
inst1.name = 'George'
print(inst1.name)

# 通过方法修改属性值
inst1.update_name('Johnny')
print(inst1.name)


  
```

# 类的私有属性和方法

类中__private_attrs, 两个下划线开头, 声明为私有属性. 不能在类的外部被使用或直接访问. 在类内部的方法中使用self.\_\_private_attrs .

类中__private_method,两个下划线开头, 声明为私有方法. 只能在类的内部调用. 调用方法self.\_\_private_methods







# 继承

```python
class DerivedClassName(BaseClassName1):
    <statement1>
    ...
    <statementN>
  
```

```python
#类定义
class people:
    #定义基本属性
    name = ''
    age = 0
    #定义私有属性,私有属性在类外部无法直接进行访问
    __weight = 0
    #定义构造方法
    def __init__(self,n,a,w):
        self.name = n
        self.age = a
        self.__weight = w
    def speak(self):
        print("%s 说: 我 %d 岁。" %(self.name,self.age))
 
#单继承示例
class student(people):
    grade = ''
    def __init__(self,n,a,w,g):
        #调用父类的构造函数
        people.__init__(self,n,a,w)
        self.grade = g
    
    #覆写父类的方法
    def speak(self):
        print("%s 说: 我 %d 岁了，我在读 %d 年级"%(self.name,self.age,self.grade))
 
 
 
s = student('ken',10,60,3)
s.speak()
```



# 多继承

```python
class DerivedClassName(Base1, Base2, Base3):
    <statement-1>
    .
    .
    .
    <statement-N>

# 若父子类中有相同的方法名,而在子类使用时未指定,则会按从左至右顺序查找.即方法在子类中未找到,从左至右查找父类中是否包含该方法

```

```python 
#类定义
class people:
    #定义基本属性
    name = ''
    age = 0
    #定义私有属性,私有属性在类外部无法直接进行访问
    __weight = 0
    #定义构造方法
    def __init__(self,n,a,w):
        self.name = n
        self.age = a
        self.__weight = w
    def speak(self):
        print("%s 说: 我 %d 岁。" %(self.name,self.age))
 
#单继承示例
class student(people):
    grade = ''
    def __init__(self,n,a,w,g):
        #调用父类的构函
        people.__init__(self,n,a,w)
        self.grade = g
    #覆写父类的方法
    def speak(self):
        print("%s 说: 我 %d 岁了，我在读 %d 年级"%(self.name,self.age,self.grade))
 
#另一个类，多重继承之前的准备
class speaker():
    topic = ''
    name = ''
    def __init__(self,n,t):
        self.name = n
        self.topic = t
    def speak(self):
        print("我叫 %s，我是一个演说家，我演讲的主题是 %s"%(self.name,self.topic))
 
#多重继承
class sample(speaker,student):
    a =''
    def __init__(self,n,a,w,g,t):
        student.__init__(self,n,a,w,g)
        speaker.__init__(self,n,t)
 
test = sample("Tim",25,80,4,"Python")
test.speak()   #方法名同，默认调用的是在括号中排前地父类的方法
```

## 方法重写

当父类方法的功能不能满足需求时, 可以在子类重写父类的方法

```python
class Parent:        # 定义父类
   def myMethod(self):
      print ('调用父类方法')
 
class Child(Parent): # 定义子类
   def myMethod(self):
      print ('调用子类方法')
 
c = Child()          # 子类实例
c.myMethod()         # 子类调用重写方法
super(Child,c).myMethod() #用子类对象调用父类已被覆盖的方法

# super() , 用于调用父类的一个方法.
```



# ?类方法

类方法也可细分为实例方法、静态方法和类方法

类方法的调用方式有 2 种，既可以使用类名直接调用，也可以使用类的实例化对象调用



## 类的专有方法

```python

__init__ : 构造函数，在生成对象时调用
__del__ : 析构函数，释放对象时使用
__repr__ : 打印，转换
__setitem__ : 按照索引赋值
__getitem__: 按照索引获取值
__len__: 获得长度
__cmp__: 比较运算
__call__: 函数调用
__add__: 加运算
__sub__: 减运算
__mul__: 乘运算
__truediv__: 除运算
__mod__: 求余运算
__pow__: 乘方
```

## 运算符重载

Python 支持运算符重载, 可以对类的专有方法进行重载

```python
class Vector:
   def __init__(self, a, b):
      self.a = a
      self.b = b
 
   def __str__(self):
      return 'Vector (%d, %d)' % (self.a, self.b)
   
   def __add__(self,other):
      return Vector(self.a + other.a, self.b + other.b)
 
v1 = Vector(2,10)
v2 = Vector(5,-2)
print (v1 + v2)
```



# function

函数是组织好的，可重复使用的，用来实现单一，或相关联功能的代码段。函数能提高应用的模块性，和代码的重复利用率. python 提供了许多内置函数，如print() ，也可以创建用户自定义函数

[Python内置函数](https://docs.python.org/zh-cn/3.7/library/functions.html)

[Python定义函数](https://docs.python.org/zh-cn/3.7/tutorial/controlflow.html#lambda-expressions)

## 定义函数



```python
#函数定义一般格式
def function_name(argu_list):
    '''
    comments for function.
    '''
    funtion body        #缩进内容即构成函数体.
    
    [return]
```

>- def function_name():   #开头定义形式
>- 任何传入参数和自变量必须放在圆括号中间，圆括号之间可以用于定义参数。
>- 函数的第一行语句可以选择性地使用文档字符串—用于存放函数说明。
>- 函数内容以冒号起始，并且缩进。
>- return     [表达式] 结束函数，选择性地返回一个值给调用方。不带表达式的return相当于返回 None。
>- \#默认情况下，参数值和参数名称是按函数声明中定义的顺序匹配起来的

```python
# 定义函数示例
def area(width, height):                             # width, height是形参
	''' return area with width and height '''        
	return width * height
	
area(4, 5)                                           #函数调用,对应值4, 5为实参
```

## 参数传递

传递的参数是不可变类型与可变类型的区别:

**不可变类型**: 类似 c++ 值传递,fun(a) ,只传递 a 的值,fun(a) 修改 a 的值,只是修改了另一个复制的对象,a不变

**可变类型**:类似 c++ 的引用传递, 如列表,字典等,fun(la), 将 la真正传过去,修改后 fun 外部的la也被修改.

函数定义时包含多个形参 , 函数调用时也可包含多个实参. 按函数传递实参的方式,实参可为分:

**位置实参**:  positional argument,调用时实参的顺序与定义函数时形参顺序一致

**关键字实参**: keyword argument, 传递给函数的是 arguName = value 形式,不需要考虑调用时实参的顺序

**默认参数**: 定义函数时给每个形参指定**默认值**，调用函数时给形参提供了实参时，使用实参；否则，使用形参的默认值。指定了默认值，也同时实现了让相应实参变成可选的。
所以定义函数时**先列出没有默认值的形参，再列出有默认值参数**，以便Python能够正确解读位置实参。

调用函数时可混合使用位置实参，关键字实参，默认值，但需要按一定规则调用，避免Python在调用时解析有歧义。

```python

def trapezoid_area(base_up, base_down, height):
	return 1/2 * (base_up + base_down) * height

trapezoid_area(1, 2, 3)                                                     #位置参数传递
trapezoid_area(base_up = 1, base_down = 2, height = 3)   #关键字参数传递
trapezoid_area（height = 3, base_down = 2, base_up = 1）  #right
trapezoid_area（height = 3, base_down = 2, 1 )       # wrong, height 关键字传入与位置传入冲突
trapezoid_area(base_up = 1, base_down = 2, 3）   #  关键字实参与位置实参调用
trapezoid_area(1, 2, height = 3)                             # right

               
             
def trapezoid_area(base_up, base_down, height = 3):  #定义参数的时候给参数赋值即可
return 1/2 * (base_up + base_down) * height
trapezoid_area(1, 2)                                 #有默认值参数调用.
trapezoid_area(1, 2, 4)                              # 不使用参数默认值             
```



### 形参名带*

此种形式的参数定义, 让函数可以处理任意数量的参数

*name 作为最后一个形参时, 接收包含一个包含除了已有形参列表以外的位置参数的元组的形参. 出现在 *name参数之后的任务形参都是 '仅关键字参数'

**name 作为最后一个形参时,它会接收一个字典, 其中包含除了与已有形参相对应的关键字参数以外的所有关键字参数 

*name 与 **name 组合使用时, *name 必须出现在 \*\*name之前



```python
def function_name([formal_args_list], *var_args_tuple):
    '''
    docstrings
    '''
    function_body
    return [expression]

def function_name([formal_args_list], **var_args_dict):
    '''
    docstrings
    '''
    function_body
    return [expression]


# 形参名*dosages 让Python创建了一个名为dosages的空元组, 并将收到的所有实参都封装到这个元组中.
def sandwiches(*dosages):
    for san in dosages:
        print("You have ordered the following dosages: \n", san)
        
sandwiches('tomato','cucumber')
sandwiches('eggplant','port','meat')




```

### 形参 /

/ 不代表任何参数, 它指示前面的都是位置参数,没有关键字参数

```python
#只能采用位置参数形式调用readlines(1),而不能以关键字参数形式调用readlines(hints = 1)

def readlines(hints = -1, /):
    pass
```



## 返回值

返回值类型可以是Python 支持的所有数据类型。不带 return, 相当于返回 None

## 局部函数

## Lambda 表达式

lambda 表达式是 Python 中创建匿名函数的一个特殊语法. 可以理解为  lambda 语法本身为 **lambda 表达式**, 而它返回的函数称之为 **lambda 函数**.  lambda函数可以在函数对象的任何地方使用. 在语法上限于单个表达式

Python 的 lambda 表达式允许在一行代码中创建一个函数并传递(通常传递到另外一个函数)

可以用 lambda 替换局部函数



我称.





## 函数模板

```python
def sum_of_squares(nums):
    """
    Compute the sum of squares  of a list of numbers.
    Args:
        nums (`list` of `int` or  `float`): A `list` of numbers.
    Returns:
        ans (`int` or `float`):  Sum of squares of `nums`.
    Raises:
        AssertionError: If  `nums` contain elements that are not floats nor ints.
    """
    try:
        ans =sum([x**2 for x in nums])
    except:
        raiseAssertionError('Input should be a list of floats or ints.')
    return ans

```

# 内置函数

### map()

map(function, iterable, ...)





# 流程控制

Python 里有 for , while 循环结构 

## for

for循环可以遍历任何序列的项目，如一个列表或者一个字符串. for 用于针对集合中的每个元素都一个代码块，而[while](onenote:#while&section-id={02F21E22-A0D2-4DA1-9CCF-F7FE45B5AA0F}&page-id={EBC5B56A-7B53-894C-82AB-C45CA7C9F10C}&end&base-path=https://d.docs.live.net/1fcf2202bbc2a600/onenote/Linux/Python.one)不断地运行，直到指定的条件不满足为止。

**break** 用于跳出当前循环(for / while ) , 任何对应的循环else块将不执行，即终止循环。

**continue**  跳过当前循环中的剩余语句，然后执行下一轮循环

**else**:  for 和while loop 均有一个可选的else分支，它是在**循环迭代正常完成后执行**。即循环体内没有break, return 或者其它异常 退出循环后会执行

循环语句可以有else子句，它在for穷尽列表或while条件变为false导致循环终止时被执行，但循环被break终止时不执行。



```Python
# ＜sequence> 对应的是具有可迭代的（iterable）或者像列表那样的集合形态的对象
for <variable> in <sequence>:
    <statements>
else:
    <statements>



languages = ["C", "C++", "Perl", "Python"] 
for x in languages:
    print(x)

for i in range(5):
    print("output of range(5):",i)

print ("-------------------------------")

for i in range(5,9):
    print("output of range(5,9):",i)

print ("-------------------------------")

for i in range(0, 10, 3):
    print(i)

print ("-------------------------------")
for i in range(-10, -100, -30):
    print(i)
print ("-------------------------------")



a = ['Google', 'Baidu', 'Runoob', 'Taobao', 'QQ']
for i in range(len(a)):                              #遍历一个序列的索引
    print(i, a[i])
 

list(range(5))                                      # 创建列表
[0, 1, 2, 3, 4]


```



## while

Python中一般只有在循环永不停止时使用while, 其它循环都会用for , 尤其在循环的对象数量固定或者有限的情况下。

 使用while循环停止，一是循环过程中制造某种可以使循环停下来的条件

二是改变使循环成立的条件

```python
while <condition>:
	<statements>
else:
	<additional_statements>         #可选子句, 表达式为 False 时,要执行语句


n = 100
sum = 0
counter = 1
while counter <= n:                              # while 循环
    sum += counter
    print("从1到{}之和为:{}".format(counter,sum))
    counter += 1
    
'''
var = 1
while  var == 1:                            #表达式永远为True时，无限循环 CTRL+C退出
    pass        
'''


count = 0
while count < 5:                               #循环条件
    print (count, " 小于 5")
    count += 1
else:
    print (count, "大于或等于 5")


    
# 改变标志使用循环停止
flag = 1
while (flag):
    print ('欢迎访问菜鸟教程!')     #while循环中只有一条语句，可以与while写在同一行
    print ("Good bye!")



```





## pass

```python
# pass是空语句，是为了保持程序结构的完整性。pass不做任何事情，一般用做占位语句。
# 即语法上需要一个语句, 但什么也不做时,用pass

while True:
    pass                       # 等待键盘中断 (Ctrl+C)



```


# data structure



## list

refer to [list](onenote:#list&section-id={02F21E22-A0D2-4DA1-9CCF-F7FE45B5AA0F}&page-id={FFBBCDDF-549A-2045-8DC1-54B60E118F5D}&end&base-path=https://d.docs.live.net/1fcf2202bbc2a600/onenote/Linux/Python.one)





## bool

在 Python2 中是没有布尔型的，它用数字 0 表示 False，用 1 表示 True。

到 Python3 中，把 True 和 False 定义成关键字了，但它们的值还是 1 和 0，它们可以和数字相加. 

凡能够产生一个布尔值的表达式称为布尔表达式boolean expressions

python 中任何对象都可判断其布尔值，除0，None, 所有空序列和集体（list, dict, set）布尔值为False外，其它都为True

```python
# 以下值为 False ,其它都为True.
bool(0)
bool('')
bool(False)
bool([])
bool(())  
bool({}) 
bool(None)
bool(set()) 

# 以下值为True 
bool(True == 1)
bool(False == 0)
bool(True > False)                    #  equal to bool(1 > 0)
bool(True + False > False + False )   # equal to bool( 1 + 0 > 0 + 0) 
```



**比较运算符** 

!=  not equal

==  equal

\>=  greater-than-equal

<= less-than-equal

\>

<

不同类型的对象不使用 < > <= >= 进行比较，但可以使用== ， !=

 

**真值表**

True  真     

False  假

 is, is not        # Identify Operator

in, not in       # membership operator , 测试一个序列中是否包含某个值

\# in 后是一个集合形态的对象



and 与       #boolean operator
		or  或
		not  非

\# and or 短路特性，可以快速判断布尔表达式的值

| NOT        | True? |
| ---------- | ----- |
| not  False | True  |
| not  True  | False |

 

| OR              | True？ |
| --------------- | ------ |
| True  or False  | True   |
| True  or True   | True   |
| False  or True  | True   |
| False  or False | False  |

 

| AND              | True? |
| ---------------- | ----- |
| True  and False  | False |
| True  and True   | True  |
| False  and True  | False |
| False  and False | False |

 

| NOT  OR               | True? |
| --------------------- | ----- |
| not  (True or False ) | False |
| not  (True or True )  | False |
| not  (False or True ) | False |
| not  (False or False) | True  |

 

| NOT  AND               | True? |
| ---------------------- | ----- |
| not  (True and False)  | True  |
| not  (True and True )  | False |
| not  (False and True)  | True  |
| not  (False and False) | True  |

 

| !=      | True? |
| ------- | ----- |
| 1  !=0  | True  |
| 1  !=1  | False |
| 0  != 1 | True  |
| 0  != 0 | False |

 

| ==      | True? |
| ------- | ----- |
| 1  == 0 | False |
| 1  == 1 | True  |
| 0  == 1 | False |
| 0  == 0 | True  |

'

##  dict



### 移除字典值key-value 对

```python
# 使用 del 删除

test_dict = {1:'name', 2:'age', 3:'height', 4:'weight'}

```



## comprehensions

python的推导式，又称解析式，是python独有特性。推导式是可以从一个数据序列构建另一个新的数据序列的结构体。 其构建过程比使用循环来构建效率更高。Python的推导式有三种:

- [列表推导式](###list comprehension)
- [字典推导式](###dict comprehension)
- [集合推导式](###set comprehension)



### list comprehension

列表推导式提供了从序列创建列表的简单途径 .通常应用程序将一些操作应用于某个序列的每个元素, 用其获得的结果 作为生成新列表的元素, 或者根据确定的判定条件创建子序列.

若希望表达式推导出一个元组, 将[ ] 换成( ) 即可.

列表推导式形式: 一个表达式，后面跟一个 `for` 子句，然后是零个或多个 `for` 或 `if` 子句

 list1 = [**out_exp_res** for **out_exp** in **iterable** if out_exp == 2]
  out_exp_res:　　           列表生成元素表达式，可以是有返回值的函数。
  for out_exp in iterable  迭代iterable将out_exp传入out_exp_res表达式中。
  if out_exp == 2：　　    **可选项** 根据条件过滤序列值可以。

```python
[(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]

#等价于, for 和 if 的顺序也是相同的.
for x in [1,2,3]:
     for y in [3,1,4]:
         if x != y:
             combs.append((x, y))

---------------------------------------------------------------------
multiples = [i for i in range(30) if i % 3 is 0]
print(multiples)
# Output: [0, 3, 6, 9, 12, 15, 18, 21, 24, 27]
---------------------------------------------------------------------
def squared(x):
    return x*x
multiples = [squared(i) for i in range(30) if i % 3 is 0]
print multiples
#  Output: [0, 9, 36, 81, 144, 225, 324, 441, 576, 729]
---------------------------------------------------------------------
vec1 = [2, 4, 6]
vec2 = [3, 5, 7]
[ [x, x ** 2] for x in vec1 ]
[x*y for x in vec1 for y in vec2]
[x+y for x in vec1 for y in vec2]
[vec1[i]*vec2[i] for i in range(len(vec1))]


# 列表推导式可以使用复杂的表达式和嵌套函数
[str(round(355/113,i)) for i in range(1,6)]

```

#### 嵌套的列表推导式

列表推导式中的初始表达式可以是任何表达式, 包括另一个列表推导式, 即构成嵌套的列表推导式.





































### dict comprehension

```python
 # 字典推导式
{x : x**2 for x in (2, 4, 6) }   

d = {i:i+1 for i in range(4)}
print(d)
g = {i:j for i,j in zip(range(1,6),'abcde')}
print(g)
f = {i:j.upper() for i, j in zip(range(1, 6),'abcde')}
print(f)

{0: 1, 1: 2, 2: 3, 3: 4}
{1: 'a', 2: 'b', 3: 'c', 4: 'd', 5: 'e'}
{1: 'A', 2: 'B', 3: 'C', 4: 'D', 5: 'E'}

```





### set comprehension



```python
squared = {x**2 for x in [1, 1, 2]}
print(squared)
# Output: set([1, 4])

a= {x for x in 'abrddfsdf' if x not in 'abc'}

```



# algorithm

## 线性查找

线性查找指按一定的顺序检查数组中每一个元素，直到找到所要寻找的特定值为止

```python
def linear_search(arr,data):
    '''在数组 arr中查找指定值 data,找到返回找到的第一个元素的索引. 没找到返回-1'''
    for i in range(0,len(arr)-1):
        if arr[i] == data:
            return i
    return -1

arr_eg = [x**2 + 3 for x in range(0,30) if x % 2 != 0]
print(f'The array is {arr_eg}')

result = linear_search(arr_eg, 228)
if result == -1:
    print('data is not existent.')
else:
    print(f'the data is arr_ge[{result}] =',arr_eg[result])
 
```

## 二分查找

　二分查找又称折半查找，优点是比较次数少，查找速度快，平均性能好　　

　二分查找即搜索过程从数组的中间元素开始,如果中间元素正好是要查找的元素,则搜索过程结束;如果中间元素大于或小于要查找元素,则在小于或大于中间元素的那一半进行搜索,而且跟开始一样从中间元素开始比较. 如果在某一步骤数组为空,则代表找不到.这种算法每一次比较都会使搜索范围缩小一半.

适用条件:
二分查找是有条件的，首先是有序的，其次因为**二分查找操作的是下标**，所以要求是顺序
最优时间复杂度：O(1), 最坏时间复杂度：O(logn)

```python

# 在指定数组索引范围内查找 值 data.

def re_binary_search(arr, low, high, data):
    '''二分查拉递归算法'''
    
    # 计算中间元素位置
    mid = low + (high - low)//2
    
    if arr[mid] == data:
        return mid
    
    if high >= low:
        if arr[mid] < data:
            return re_binary_search(arr,mid + 1,high,data)
        else:
            return re_binary_search(arr, low, mid -1, data)
    
    return -1


def binary_search(arr, low, high, data):
    '''非递归算法'''
    mid = low +(high - low)//2
    
   
    
    while low <= high:
        if arr[mid] == data:
            return mid
        
        if arr[mid] < data:
            low = mid + 1
            mid = low +(high - low)//2
        else:
            high = mid -1
            mid = low +(high - low)//2
            
    return -1
     
    
# 测试函数
arr_eg = [x**2 + 3 for x in range(0,30) if x % 2 != 0]
print(f'The array is {arr_eg}')



# result = re_binary_search(arr_eg, 0 , len(arr_eg) - 1, 844)
result = binary_search(arr_eg, 0, len(arr_eg) - 1, 732)

if result == -1:
    print('data is not existent.')
else:
    print(f'the data is arr_ge[{result}] =',arr_eg[result])


```



