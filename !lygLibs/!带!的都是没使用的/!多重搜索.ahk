/*

[AHK]
单击 Ctrl 无
双击 Ctrl键为 使用 Quicker 的 多重搜索
三击 Ctrl 打开 Everything.exe
--------------------- 
作者：liuyukuan 
来源：CSDN 
原文：https://blog.csdn.net/liuyukuan/article/details/53812881 
版权声明：本文为博主原创文章，转载请附上博文链接！
*/

$Ctrl::
if pressesCount > 0 ; ＞0说明SetTimer 已经启动了，按键次数递增
{
    pressesCount += 1
    return
}
;否则，这是新一系列按键的首次按键。将计数设重置为 1 ，并启动定时器：
pressesCount = 1
SetTimer, WaitKey, 400 ;在 400 毫秒内等待更多的按键。
return

WaitKey:
SetTimer, WaitKey, off
if pressesCount = 1 ;该键已按过一次。
{
    Gosub singleClick
}
else if pressesCount = 2 ;该键已按过两次。
{
	Gosub doubleClick
}
else if pressesCount > 2
{
    Gosub trebleClick
}
;不论上面哪个动作被触发，将计数复位以备下一系列的按键：
pressesCount = 0
return

singleClick:
run D:\Others\9.Everything\Everything.exe
return

doubleClick:
;MsgBox, 检测到2次点击。
Send, !F
return

trebleClick:
;MsgBox, 检测到三次或更多次点击。
Send, +!P
return
