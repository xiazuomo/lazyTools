;=======================快捷键_快速启动应用=============================
;注意事项: 路径中尽量不要有中文
;(如果有中文建议使用notepad来编辑，否则将报无法找到文件路径的错误/编码问题)
;使用Alt;使用Alt快速打开应用/软件/盘符

/*
CapsLock & Space::
;Run D:\Others\9.AutoHotKey\!lygLibs\快捷列表.ahk
return
*/

$!C::Run C:\																					;Alt + C			快速打开C盘
return


$!D::																							;Alt + D			F2打开RunAnything	
	Send,#2
	;Run D:\
return



/*
$!E::
	Run E:\				;Alt + E			快速打开E盘;弃用
return
*/




!E::																									;Alt + E			快速打开IDEA
	if WinExist("ahk_class SunAwtFrame")
	{
		MsgBox,0,, IDEA 启动中..., 0.3
		WinActivate
	}else
	{
		MsgBox,0,, IDEA 启动中..., 0.3
		Run ..\!shortcut\nosee\IntelliJ IDEA.lnk
		
	}
return




#If not WinActive("ahk_class Chrome_WidgetWin_1","ahk_class SunAwtFrame")  								;===设置Ctrl Shift Zの 非语境约束{Start}===

$!S::																									;Alt + S			Navicat
	if WinExist("ahk_exe Navicat.exe")
	{
		MsgBox,0,, Navicat 启动中..., 0.3
		WinActivate
	}else
	{
		MsgBox,0,, Navicat 启动中..., 0.3
		Run ..\!shortcut\nosee\Navicat Premium.lnk
	}
return
#If


$!X::																									;Alt + S			Navicat
	if WinExist("ahk_exe  Xshell.exe")
	{
		MsgBox,0,,  Xshell 启动中..., 0.3
		WinActivate
	}else
	{
		MsgBox,0,,  Xshell 启动中..., 0.3
		Run ..\!shortcut\nosee\Xshell.lnk
	}
return


/*
$!G::
	MsgBox,0,, GifCam 启动中..., 0.3
	Run D:\Others\5.GifCam\GifCam.exe																	;Alt + G			GifCam
return
*/


$!Q::																									;Alt + QTim消息(修改QQ获取消息的快捷键Ctrl Shift 0)
;Send,^+0
;MsgBox,0,, Tim 启动中..., 0.3
if WinExist("ahk_class TXGuiFoundation")	;如何已经打开了这个软件，直接激活
	{
		;WinActivate
		Send,^!z
	}else										;如何没有打开这个软件，启动软件
	{
		Run ..\!shortcut\nosee\TIM.lnk
	}
return

$!W::																									;Alt + W			微信WeChat
	MsgBox,0,, 微信 启动中..., 0.3
	if WinExist("ahk_class WeChatMainWndForPC")	;如何已经打开了这个软件，直接激活
	{
		WinActivate
	}else										;如何没有打开这个软件，启动软件
	{
		Run ..\!shortcut\nosee\微信.lnk
	}
return


$!R::																									;Alt + R			打开WPS
	if WinExist("ahk_exe wps.exe")
	{
		MsgBox,0,, WPS 启动中..., 0.3
		WinActivate
	}else{
		MsgBox,0,, WPS 启动中..., 0.3
		Run ..\!shortcut\nosee\WPS Office.lnk

	}
return


$!T::        																							;Alt + T 	打开 Notepad++
	MsgBox,0,, notepad 启动中..., 0.3
	Run ..\!shortcut\nosee\Notepad++.lnk
return


$!Y::
	MsgBox,0,, 网易云音乐 启动中..., 0.3
	Run ..\网易云音乐\cloudmusic.exe       														;Alt + Y 		打开 网易云音乐
return

/*
!F::																									;Alt + F		打开火柴(需自定义快捷键 Alt + F) Everything.exe
;run a_lygLibs\tools\Everything.exe
SendInput, {ff}
return
*/

;======使用win键操作===========

$#N::Run D:\2.JavaWeb.kit\0.SublimeText\sublime_text.exe												;Win + N 	打开sublimeText


/*
$^+W::
	MsgBox,0,, WGestures 启动中..., 0.3
	Run C:\Program Files (x86)\WGestures\WGestures.exe													;Ctrl+Shift+W	打开 WGestures
return
*/

/*
Space & T::																							;Space & T		打开浏览器
if WinExist("ahk_class Chrome_WidgetWin_1")
{
	MsgBox,0,, CentBrowser 启动中..., 0.3
	WinActivate
}else
{
	MsgBox,0,, CentBrowser 启动中..., 0.3
	Run, ..\..\!shortcut\nosee\Cent Browser.lnk
}
return
*/

Space & Q::																							;Space & Q		打开 win1 窗口，再次按下返回现在的窗口
Send,#1
return

/*
if WinExist("ahk_class Chrome_WidgetWin_1")
{
	MsgBox,0,, CentBrowser 启动中..., 0.3
	WinActivate
}else
{
	MsgBox,0,, CentBrowser 启动中..., 0.3
	Run, D:\Others\9.Cent Browser\CentBrowser\Application\chrome.exe
}
return
*/


;=======================快捷键_快速启动应用=============================