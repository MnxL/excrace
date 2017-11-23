#!/bin/bash
your_name="wwwuxt" 
# 变量名和等号之间不能有空格
echo $your_name
echo ${your_name}

# 花括号可选，如下需要区分时需使用
for skill in Ada Coffe Action Java; do
    echo "I am good at $skill Script"
    echo "I am good at ${skill}Script"
done

# 变量重新赋值，不用加$，只在使用时加$
your_name="shawn"
echo $your_name

# 只读变量
myUrl="http://wwwuxt.cc"
readonly myUrl
myUrl="other"
unset myUrl

# 删除变量
unset your_name
echo $your_name

# 局部变量
# 环境变量
# shell变量 由shell程序设置的特殊变量，一部分是局部，一部分是环境

# shell字符串
# 单引号 - 任何字符原样输出，变量无效 - 单引号中不能出现单引号
str='this is a string'
# 双引号 - 可以有变量 - 可以转义
yname='wwwuxt'
str="Hello, my name is \"$yname\"! \n"
echo $str
# 拼接字符串
greeting="hello, "$yname" !"
greeting_1="hello, ${yname} !"
echo $greeting $greeting_1
echo ${#greeting} # 获取字符串长度

# 提取子字符串
echo ${greeting:1:4}

# 查找子字符串
echo `expr index "$greeting" ww`


# 一维数组，三种方式定义数组
array_name=(1 2 3 4 5)
array_name1=(
1
2
3
4
5
)
array_name2[0]=1
array_name2[1]=2
array_name2[2]=3
array_name2[3]=4
array_name2[4]=5

echo ${array_name[1]} # 获取数组某个元素
echo ${array_name2[@]} # 获取数组全部元素
echo ${#array_name[@]} # 获取数组元素个数
echo ${#array_name[*]} # 获取数组元素个数
echo ${#array_name[1]} # 获取数组某个元素的长度
