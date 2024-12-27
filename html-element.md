#HTML element

###introduction
HTML中的元素大体被分为三种类型
- inline element:行内元素，也称内联元素
- block element :块元素
- inline-block: 可变元素为根据上下文语境决定该元素为块元素或者内联元素, 也称内联块状元素

`a{display:block;}`　此代码将内联元素a转换为块状元素
`div{display:block;}` 此代码将块元素div转换为内联元素
`a{display:inline-block;}a` 此代码将元素设置为inline-block元素
###inline element
1. 和其它元素都在同一行上
2. 元素的高度、宽度及顶部和底部边距不可设置
3. 元素的宽度就是它包含的文字或图片的宽度，不可改变


###block element
1. 每个块级元素都从新的一行开始，并且其后的元素也另起一行,独占一行
2. 元素的高度、宽度、行高以及顶和底边距都可设置
3. 元素宽度在不设置的情况下，是它本身父容器的100%（和父元素的宽度一致）


###inline-block element
同时具备内联元素，块状元素的特点:
1. 和其他元素都在一行上
2. 元素的高度、宽度、行高以及顶和底边距都可设置


###inline element
* a - 锚点
* abbr - 缩写
* acronym - 首字
* b - 粗体(不推荐)
* bdo - bidi override
* big - 大字体
* br - 换行
* cite - 引用
* code - 计算机代码(在引用源码的时候需要)
* dfn - 定义字段
* em - 强调
* font - 字体设定(不推荐)
* i - 斜体
* img - 图片
* input - 输入框
* kbd - 定义键盘文本
* label - 表格标签
* q - 短引用
* s - 中划线(不推荐)
* samp - 定义范例计算机代码
* select - 项目选择
* small - 小字体文本
* span - 常用内联容器，定义文本内区块
* strike - 中划线
* strong - 粗体强调
* sub - 下标
* sup - 上标
* textarea - 多行文本输入框
* tt - 电传文本
* u - 下划线
* var - 定义变量


###block element
* address - 地址
* blockquote - 块引用
* center - 举中对齐块
* dir - 目录列表
* div - 常用块级容易，也是css layout的主要标签
* dl - 定义列表
* fieldset - form控制组
* form - 交互表单
* h1 - 大标题
* h2 - 副标题
* h3 - 3级标题
* h4 - 4级标题
* h5 - 5级标题
* h6 - 6级标题
* hr - 水平分隔线
* isindex - input prompt
* menu - 菜单列表
* noframes - frames可选内容，(对于不支持frame的浏览器显示此区块内容
* noscript - )可选脚本内容(对于不支持script的浏览器显示此内容)
* ol - 排序表单
* p - 段落
* pre - 格式化文本
* table - 表格
* ul - 非排序列表


###inline-block 内联块状元素
* applet - java applet
* button - 按钮
* del - 删除文本
* iframe - inline frame
* ins - 插入的文本
* map - 图片区块(map)
* object - object对象
* script - 客户端脚本

