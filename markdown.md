#markdown简明语法  


###introduction
Markdown是一种轻量级的标记语言，语法简单，可以排出简洁的表现界面, 使用[mahua](http://mahua.jser.me/) 等工具
可以快速的书写带markdown标记的文档。它的目的是实现易读易写。
- 支持表格、代码块、LaTeX数学公式、目录
- 可以很方便的插入到 Gmail、Evernote
- 很容易转为 [HTML](http://www.runoob.com/html/html-tutorial.html) 、PDF 文件
- 可以自定义 css 文件，写出更直观优雅的笔记


###markdown基础语法
 *,-,+ 3个符号效果都一样，这3个符号被称为 Markdown符号
 空白行表示另起一个段落
`是表示inline代码，tab是用来标记 代码段，分别对应html的code，pre标签


    单一段落( <p>) 用一个或多个空白行
    连续两个空格 会变成一个 <br>
    连续3个符号，然后是空行，表示 hr横线
    

###兼容HTML
1. 不在 Markdown 涵盖范围之内的标签，都可以直接在文档里面用 HTML 撰写
2. 一些HTML的区块元素，如`<div><table><pre><p>`等标签,必须在前后加上空行与其它内容区隔开
3. HTML的开始标签与结尾标签不能用制表符或空格来缩进
4. 在 HTML 区块标签间的 Markdown 格式语法将不会被处理
5. HTML 的区段（行内）标签如 `<span>、<cite>、<del> `可以在 Markdown 的段落、列表或是标题里随意使用

<p>Here is an example of AppleScript:</p>

###特殊字符自动转换< &　\
HTML中的两个字符(< &)需要特别处理，<用于标签，&用于标记HTML实体。 markdown可以让人自然地书写字符，它会根据语境自动决定是否转换：  
markdown code 范围内，无论是行内还是区块，< 和 ＆ 都一定会被转换成 HTML 实体
markdown使用\来转义，表示文本中markdown符号:
```
\   反斜杠
`   反引号
*   星号
_   底线
{}  大括号
[]  方括号
()  括号
#   井字号
+    加号
-    减号
.   英文句点
!   惊叹号
```

###code  blockquote
```
  ```                  <pre><code> ... </code></pre>   代码区块，多行代码引用  
  缩进四个空格或一个制表符 <pre><code> ... </code></pre>   代码区块  
  `sum = b + c` 反引号  <code>   </code>    行内代码,反引号，单行代码引用
  ---  分页,水平线       <hr />
  行尾两个以上空格+Enter  <br />      markdown段内强制换行
  >                    <blockquote> 
  使用多个>，可以将<blockquote>嵌套，且<blockquote>内可以使用其它markdown语法
  
```

###heading
```
  #h1         <h1></h1>
  ##h2        <h2></h2>
  ###h3       <h3></h3>  
  ....
```

###bold,Italic & strikethrough
*Italic*  
**bold**  
***bold&Italic***  
~~删除线~~

###list
也可以缩进，最多 3 个空格，项目标记后面则一定要接着至少一个空格或制表符
列表支持嵌套，每个项目前增加两个空格缩进
- unorder list1
- unorder list2
- unorder list3

1. order list 1
2. order list 2
3. order list 3


###link,image,mailto
```
  [linkName](URL)      <a href="URL">linkName</a>
  ![]()                <img src="URL">
  <adelphos@msn.cn>    <a href="mailto:adelphos@msn.cn">adelphos@msn.cn</a>
  
```
链接为： [链接文字](http://www.jianshu.com/p/1e402922ee32/)
图片为：![]()

Email: <adelphos@msn.cn>  



###table
dog | bird | cat
--- |:----|:---:
foo | foo | foo
bar | bar | bar
baz | baz | baz 

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |


###refer
[Mahua](http://mahua.jser.me/) markdown编辑器  
[markdown 语法说明](http://wowubuntu.com/markdown/index.html#autoescape)  
[gedit-markdown](https://github.com/jpfleury/gedit-markdown)





