;=======================快捷键_快速启动应用=============================
;注意事项: 路径中尽量不要有中文
;(如果有中文建议使用notepad来编辑，否则将报无法找到文件路径的错误/编码问题)
;使用Alt;使用Alt快速打开应用/软件/盘符


CapsLock & Space::
Run D:\Others\9.AutoHotKey\!lygLibs\快捷列表.ahk
return

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



#If not WinActive("ahk_class Chrome_WidgetWin_1","ahk_class SunAwtFrame")  								;===设置Ctrl Shift Zの 非语境约束{Start}===

$!S::																									;Alt + S			Navicat
	if WinExist("ahk_exe Navicat.exe")
	{
		MsgBox,0,, Navicat 启动中..., 0.3
		WinActivate
	}else
	{
		MsgBox,0,, Navicat 启动中..., 0.3
		;Run D:\1.Development-Kit\5.SQLyog10.2\SQLyog.exe
		Run D:\1.Development-Kit\5.Navicat12\navicat.exe
	}
return
#If


$!G::
	MsgBox,0,, GifCam 启动中..., 0.3
	Run D:\Others\5.GifCam\GifCam.exe																	;Alt + G			GifCam
return



$!Q::																									;Alt + QTim消息(修改QQ获取消息的快捷键Ctrl Shift 0)
;Send,^+0
;MsgBox,0,, Tim 启动中..., 0.3
if WinExist("ahk_class TXGuiFoundation")	;如何已经打开了这个软件，直接激活
	{
		;WinActivate
		Run D:\Others\6.TIM\Bin\TIM.exe
		;Send,^+0
	}else										;如何没有打开这个软件，启动软件
	{
		;Run D:\Others\6.TIM\Bin\TIM.exe
		Send,^+0
	}
return

$!W::																									;Alt + W			微信WeChat
	MsgBox,0,, 微信 启动中..., 0.3
	if WinExist("ahk_class WeChatMainWndForPC")	;如何已经打开了这个软件，直接激活
	{
		WinActivate
	}else										;如何没有打开这个软件，启动软件
	{
		Run D:\Others\6.WeChat\WeChat\WeChat.exe
	}
return

$!E::																									;Alt + E			快速打开IDEA
	if WinExist("ahk_class SunAwtFrame")
	{
		MsgBox,0,, IDEA 启动中..., 0.3
		WinActivate
	}else
	{
		MsgBox,0,, IDEA 启动中..., 0.3
		Run, D:\1.Development-Kit\1.JetBrains\IntelliJ IDEA 2018.3.3\bin\idea64.exe
	}
return

$!R::																									;Alt + R			打开WPS
	if WinExist("ahk_exe wps.exe")
	{
		MsgBox,0,, WPS 启动中..., 0.3
		WinActivate
	}else{
		MsgBox,0,, WPS 启动中..., 0.3
		Run D:\Others\5.WPS\ksolaunch.exe
	}
return


$!T::        																							;Alt + T 	打开 Notepad++
	MsgBox,0,, notepad 启动中..., 0.3
	Run D:\Others\5.1_Notepad++\notepad++.exe
return


$!Y::
	MsgBox,0,, 网易云音乐 启动中..., 0.3
	Run D:\Others\8.网易云音乐\cloudmusic.exe       														;Alt + Y 		打开 网易云音乐

return

/*
!F::																									;Alt + F			快速打开IDEA
run D:\Others\9.Everything\Everything.exe
return
*/

;======使用win键操作===========
;$#E::Run D:\7.Q-Dir\Q-Dir_x64.exe																		;Win + E 	多窗口的文件管理器

$#N::Run D:\2.JavaWeb.kit\0.SublimeText\sublime_text.exe												;Win + N 	打开sublimeText

$#T::																									;Win+ T		打开Studio 3T
	if WinExist("ahk_class SWT_Window1")
	{
		MsgBox,0,, Studio 3T 启动中..., 0.3
		WinActivate
	}else 
	{
		MsgBox,0,, Studio 3T 启动中..., 0.3
		Run D:\1.Development-Kit\5.Studio3T\Studio 3T.exe
	}
return





$^+W::
	MsgBox,0,, WGestures 启动中..., 0.3
	Run C:\Program Files (x86)\WGestures\WGestures.exe													;Ctrl+Shift+W	打开 WGestures
return


/*
$^+Q::
	MsgBox,0,, Quicker 启动中..., 0.3
	Run C:\Program Files\Quicker\Quicker.exe															;Ctrl+Shift+Q	打开Quicker
return
*/


$^+J::
	MsgBox,0,, HiJson 启动中..., 0.3
	Run D:\1.Development-Kit\9.HiJson\HiJson.exe														;Ctrl+Shift+J	打开 HiJson
return


$^+P::
	MsgBox,0,, PotPlayer 启动中..., 0.3
	Run D:\Others\9.9_PotPlayer\PotPlayer\PotPlayerMini64.exe											;Ctrl+Shift+P	打开 PotPlayer
return


Space & t::																							;Space & T		打开浏览器
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


Space & Q::	
Send,#1
return
																						;Space & Q		打开浏览器
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

^+R::
MsgBox,0,, RedisDesktopManager 启动中..., 0.3
run D:\1.Development-Kit\3.1_Redis\redis-server.exe
run D:\1.Development-Kit\5.1_RedisDesktopManager\rdm.exe


;=======================快捷键_快速启动应用=============================