#!/bin/bash

echo "It is a test"
echo It is a test

echo "\"It is a test\""



read name
echo $name is a test


echo -e "OK! \n" # -e 开启转义
echo "After one line\n"


echo -e "OK! \c"  # \c 不换行
echo "After one line\c"

echo "It is a test " > myFile

echo '$name\"' # 原样输出字符串，不转义或取变量

echo `date` # 显示命令执行结果
