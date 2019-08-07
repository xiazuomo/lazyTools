;多重搜索   Alt & F
;	1.使用 Alt + F：进行本地搜索(使用Everything.exe)。
;	2.在 Everything 中输入完毕之后，按 "Ctrl + Enter"进行网络搜索。
;更新地址：https://blog.csdn.net/liuyukuan/article/details/81950299

!F::
run D:\Others\9.9_Everything\Everything.exe
return


#SingleInstance,Force
#IfWinActive ahk_class EVERYTHING
Capslock & Enter::
ControlGetText,Keywords,Edit1,A
if (Keywords="cmd")
  Run %ComSpec%
else if (Keywords="notepad")
  Run notepad
else if (Keywords="mspaint")
  Run mspaint
else if (Keywords="calc")
  Run calc
else
{
OutputDebug %Keywords% 
run, http://soo.bitdock.cn/search.html?i=0&q=%Keywords%
;run, http://www.baidu.com/s?wd=%Keywords% 
;run, https://cn.bing.com/search?igu=1&q=%Keywords% 
;run, https://s.weibo.com/weibo/%Keywords% 
}
Process,Close,everything.exe
return


^Enter::
ControlGetText,Keywords,Edit1,A
{
OutputDebug %Keywords%  
run, http://soo.bitdock.cn/search.html?i=0&q=%Keywords%
;run, http://www.baidu.com/s?wd=%Keywords% 
Process,Close,everything.exe
}
return




#IfWinActive

/*
--------------------- 
作者：liuyukuan 
来源：CSDN 
原文：https://blog.csdn.net/liuyukuan/article/details/81950299 
版权声明：本文为博主原创文章，转载请附上博文链接！
*/