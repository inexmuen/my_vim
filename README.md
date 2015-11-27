# my_vim
my vim
> This is my vim config files

ref:[Vim改变生活，插件改变Vim](http://fancyseeker.com/?p=592)

----

常用快捷键:

key|作用
----|-----
,+g						    |tagbar
,+n						    |nerdtree
w+[hjkl]				    |分屏切换
(文件名上面)(v/Enter)		|在(新的/当前)分屏中打开文件
,+q					    	|关闭对应分屏，退出不保存
,+w						    |关闭并保存
k+j						    |insert to normal
,cc						    |注释
,cu						    |取消注释
:vs						    |纵向切屏
:sp						    |横向切屏
,s						    |语法错误信息
;/SHIFT+;				    |nornal切换到命令行模式
H/SHIFT+右箭头 			    |行首
L/SHIFT+左箭头			    |行尾	
,+p                         |打开文件搜索栏
,+j+d                       |跳转到变量定义处
F8                          |按PEP8标准格式化文件
:Ag create_order --python   |全局搜索"create_order"
'.                          |移动光标到上一次的修改行
`.                          |移动光标到上一次的修改点
control+y/g'Z               |可跨文件跳转到上次修改位置(last_edit_maker提供功能)
:new/e/vs/sp filename       |新建/当前tab/纵向/横向打开 filename
CTRL+c & COMMAND+v          |vim复制，主机粘贴
COMMAND+c & CTRL+v          |主机复制，vim粘贴

----

vim安装YouCompleteMe插件
参考:http://www.oschina.net/question/2012764_237658

YouCompleteMe插件要求vim版本7.4

```
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
sh install.sh
```
OK!
运行install.sh的时候报错:fatal error: '__debug'
参考:http://stackoverflow.com/questions/29529455/missing-c-header-debug-after-updating-osx-command-line-tools-6-3
升级command lint tools到6.3.1

![screen](screen.png)

可以参考:[http://www.cnblogs.com/junnyfeng/p/3633697.html](http://www.cnblogs.com/junnyfeng/p/3633697.html)
