# my_vim
my vim
> This is my vim config files

ref:[Vim改变生活，插件改变Vim](http://fancyseeker.com/?p=592)

----

常用快捷键:

key|作用
----|-----
,+g						|tagbar
,+n						|nerdtree
w+[hjkl]				|分屏切换
(文件名上面)v				|在新的分屏中打开文件
,+q						|关闭对应分屏，退出不保存
,+w						|关闭并保存
k+j						|insert to normal
,cc						|注释
,cu						|取消注释
:vs						|纵向切屏
:sp						|横向切屏
,s						|语法错误信息
;/SHIFT+;				|切换到命令行模式
H/SHIFT+右箭头 			|行首
L/SHIFT+左箭头			|行尾	
,+p                     |打开文件搜索栏
,+j+d                   |跳转到变量定义处

----

vim安装YouCompleteMe插件

```
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
sh install.sh
```
OK!

![screen](screen.png)

可以参考:[http://www.cnblogs.com/junnyfeng/p/3633697.html](http://www.cnblogs.com/junnyfeng/p/3633697.html)
