#selector 
###introduction
对同一元素设置了不同的css样式代码的情况下，元素会根据对应[样式的权值](http://www.imooc.com/code/2039)来决定启用哪一个css样式　　
- 继承的权值 0.1
- 标签权值 1
- 类选择符权值 10
- ID选择符的权值 100

而对一个元素有多个相同权值的css样式，会根据css样式的顺序应用最后的样式.就近原则，所以就会有如下css样式优先级排序了:  
内联样式表（标签内部）> 嵌入样式表（当前文件中）> 外部样式表（外部文件中）

`p{color:red!important;}` !import放在；号前为样式设置最高的权值.  
浏览网页显示样式的优先级:
浏览器默认的样式 < 网页制作者样式 < 用户自己设置的样式<!important 样式

###元素选择器
`h1{font-size:20px;color:red;}`

###ID 选择器
`#stressid{color:red;}`  
`<p>到了<span id="stressid">三年级</span>`

###class选择器
` .stress{color:red;}`  
`  <p>到了<span class="stress">三年级</span>下学期</p>`  
`.bigsize{font-size:25px}`  
`<p>到了<span class="stress bigsize">三年级</span>`

###ID selector 与 class selector比较
1. ID选择器只能在文档中使用一次
2. 可以使用类选择器词列表方法为一个元素同时设置多个样式,而ID selector不可以

###子选择器
用>定义子选择器，子元素的父可以是ID选择器，class选择器... 
`.food>li{border:1px solid red;}`
这会使类名为food下的子元素li 加入红色实绩边框  
.food>li{border:1px solid red;}
 > <ul class="food">
    <li>水果
        <ul>
          <li>香蕉</li>
            <li>苹果</li>
            <li>梨</li>
        </ul>
    </li>
    <li>蔬菜
      <ul>
          <li>白菜</li>
            <li>油菜</li>
            <li>卷心菜</li>
        </ul>
    </li>
</ul>


###包含(后代)选择器 child selector
.first span{color:red;}   类名后加入空格，用于选择指定标签元素下的后辈元素

请注意这个选择器与子选择器的区别，子选择器（child selector）仅是指它的直接后代，或者你可以理解为作用于子元素的第一代后代。而后代选择器是作用于所有子后代元素,多于二层的相同元素嵌套。后代选择器通过空格来进行选择，而子选择器是通过“>”进行选择。  
总结：>作用于元素的第一代后代，空格作用于元素的所有后代


###通用选择器
`* {color:red;}` 它匹配HTML中所有的标签元素


###伪类选择器
它给HTML不存在的标签设置样式
`a:hover{color:red;font-size:18px;} ` 鼠标滑过a标签时样式的改变


###分组选择器
分组中的类，可以是标签，ID选择器，class选择器...
```h1{color:red;}
span{color:red;} 
可以缩写成
h1,span{color:red;}
```





###refer


