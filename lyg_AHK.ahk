;;====================瞎琢磨先生's AHK Script=====================;;
;;==================================================================;;
;;=========================CapsLock's Stuff=========================;;
;;==================================================================;;
;这里是瞎琢磨先生的DIY脚本。目前该脚本仍然有不少bug.且bug有越来越多的趋势,因为我还在不停的调整以及添加和更改功能

;必要说明
;# 号代表 Win 键；
;! 号代表 Alt 键；
;^ 号代表 Ctrl 键；
;+ 号代表 shift 键；
;~ 号代表显示键原来的功能
;$ 号代表永远使用该键的功能
;:: 号(两个英文冒号)起分隔作用；
;=================================
;win系统常用快捷键
;alt + esc 最小化当前窗口
;win+m 最小化当前窗口
;`是转义字符，将`放在欲转义字符前面即可1044885678@qq.chrome162135lyg

;============给自己的ahk添加一个个性图标===============
;IfExist, D:\9.AutoHotkey\lyg_ahk_icon.ico
IfExist, D:\Others\9.AutoHotKey\keyborad.ico
;很好理解，如果存在 icon.ico 文件则执行花括号中的脚本，花括号“{”不能和 IfExist 写在同一行。习惯其他编程语言风格的蛋友可能很不习惯。 记得找个图标文件放在和脚本相同的文件夹里，并重命名为 icon.ico 。
{
	;花括号表示的是一段程序段，如果只有一句脚本的的话，花括号是可以省略的，这里去掉花括号程序也是正确的
	Menu TRAY, Icon, keyborad.ico
	;这句会把 lyg_ahk_icon.ico 作为图标。AHK 的脚本是大小写不分的。
}
;============给自己的ahk添加一个个性图标===============


;###################引入其他的ahk文件#####################
#Include !lyg的libs\输入法状态指示器.ahk
#Include !lyg的libs\开发专用.ahk
#Include !lyg的libs\软键盘demo.ahk
/*
*	使用说明: 
*				F7 打开 软键盘
*/

#Include !lyg的libs\任务栏鼠标调节音量.ahk
#Include !lyg的libs\依次粘贴.ahk
/*
;------------------------------------------------------------------------
;||     win+0                  |                清空
;||     ctrl + c               |                复制
;||     win + v                |                依次粘
;||     win+b                  |                依次粘贴，但顺序相反
;||     ctrl+win+v             |                覆盖粘贴
;||     ESC                    |                退出本模式
;------------------------------------------------------------------------
*/
#Include !lyg的libs\多重搜索.ahk
/**	使用说明:
*			单击: 使用 Everything.exe 进行本地搜索
*			双击: 使用 多个搜索引擎进行搜索
*/

#Include E:\重要资料（勿删！！！）\1_重要资料\ahk_keyword.ahk


;#Include !lyg的libs\软键盘.ahk
;#Include !lyg的libs\输入法状态指示器.
;#Include !lyg的libs\瞎琢磨先生的便签日记.ahk
;#Include !lyg的libs\空格键space功能定义.ahk
;#Include !lyg的libs\快捷键调节音量.ahk
;#Include !lyg的libs\搜索功能.ahk			;不使用这个方法，太难用
;#Include !lyg的libs\单双击操作.ahk
;#Include !lyg的libs\!绕过中文输入法发送文本.ahk

;###################引入其他的ahk文件#####################

;###################绕过中文输入法发送文本需要调用的函数######################
;==============https://www.jianshu.com/p/e5b1ea126a8f===============
SendText(var_string){
	local
	SendInput {text}%var_string%
	return
}
;###################绕过中文输入法发送文本需要调用的函数######################



;###################测试专用#############################




;####################测试专用End############################



;================倒计时、计时器=======================

^+t::																									;Ctrl & Alt & T		倒计时器
	InputBox, time, 瞎琢磨先生の专用计时器, 请输入一个时间（单位是秒）
	; 弹出一个输入框，标题是“瞎琢磨先生の专用计时器”，内容是“请输入一个时间（单位是秒）”
	time := time*1000
	time2 :=time/1000
	; 如果一个变量要做计算的话，一定要像这样写，和平常的算式相比，多了一个冒号。
	;	sleep 的时间是按照千分之一秒算的，这里乘以 1000 就变成秒了。
	Sleep,%time%
	MsgBox 0,瞎琢磨先生的ahk,%time2%倒计时结束,5
return


;================倒计时End=======================

;=========将Capslock改成enter.================
;=====如果是大写状态，则切换状态为中文。如果小写/中文状态，则换行
$Capslock::																								;Capslock		回车/切换大写为中文/小写
	state :=GetKeyState("CapsLock","T")
	if  state=1   ; 是大写
	{
		SetCapsLockState, AlwaysOff			;大写切换成中文/小写
/*
;未完成的功能
;如果是中文，使用Capslock切换大写之后回去还是中文(默认就是这样的结果)
;如果是英文(小写)，则切换回去是英文(小写)，需要自己修改成中文。
*/
	}else{
		Send,{Enter}
	}
return
;=========将Capslock改成enter.================



;==============Capslock & Ctrl 切换成大写状态======================
;===Capslock & Ctrl 切换成大写状态/中文状态
CapsLock & LCtrl::																						;CapsLock&Ctrl		切换状态为"大写"
state :=GetKeyState("CapsLock","T")
if  state=0   ; 小写
{
	SetCapsLockState, AlwaysOn
}else
{
	SetCapsLockState, AlwaysOff
}
return

;====================================
LCtrl & CapsLock::																						;CapsLock&Ctrl		切换状态为"大写"
state :=GetKeyState("CapsLock","T")
if  state=0   ; 小写
{
	SetCapsLockState, AlwaysOn
}else if  state=1   ; 是大写
{
	SetCapsLockState, AlwaysOff
	if  state=0   ; 小写
	{
		Send,{LShift}
	}
}
return

;==============Capslock & Ctrl 切换成大写状态======================




;====================切换窗口===============
CapsLock & p::AltTab																					;CapsLock & P		切换窗口

;===================Ctrl + Shift + C 快速复制文件夹/文件的路径Home=============
^+c::																									;Ctrl + Shift +C		复制文件路径
	Clipboard =
	Send,^c
	ClipWait
	path = %Clipboard%
	Clipboard = %path%
	ToolTip,%path%
	;Sleep,521
	ToolTip
	;MsgBox 路径复制成功!!!
	;MsgBox, 0, Title, 路径复制成功, 0.66
	MsgBox,0,瞎琢磨先生.ahk, 路径复制成功, 0.3
	;MsgBox %path%
return
;===================复制文件夹/文件的路径End==============================


;=============快捷键调节音量Home==========
;F10静音
;F11减音量
;F12加音量

;===========F10 静音
F10::SoundSet, +1,, mute																				;F10静音
;===========F11 减音量
F11::																									;F11减音量
	SoundSet -1, MASTER
	SoundSet, -1,WAVE
return
;===========F12 加音量
F12::																									;F12加音量
	SoundSet +1, MASTER
	SoundSet, +1, WAVE
return
;==================快捷键调节音量End===================================



;==================`   的用法==========================================
$`:: SendInput, //																						;  `			//
	CapsLock & `:: SendInput, ``																		;CapsLock&`		`

	;----------------------------------------------------------------------






	;=======================快捷键_快速启动应用=============================
	;注意事项: 路径中尽量不要有中文
	;(如果有中文建议使用notepad来编辑，否则将报无法找到文件路径的错误/编码问题)
	;使用Alt;使用Alt快速打开应用/软件/盘符
$!C::Run C:\																							;Alt + C			快速打开C盘
return

$!D::
	Run D:\																								;Alt + D			快速打开D盘
return

/*
$!E::
	Run E:\				;Alt + E			快速打开E盘;弃用
return
*/

$!T::
	MsgBox,0,, 网易云音乐 启动中..., 0.3
	Run D:\Others\8.网易云音乐\cloudmusic.exe															;Alt + T			网易云音乐
return

#If not WinActive("ahk_class Chrome_WidgetWin_1","ahk_class SunAwtFrame")  								;===设置Ctrl Shift Zの 非语境约束{Start}===

$!S::																									;Alt + S			SQLyog
	if WinExist("ahk_exe SQLyog.exe")
	{
		MsgBox,0,, SQLyog 启动中..., 0.3
		WinActivate
	}else
	{
		MsgBox,0,, SQLyog 启动中..., 0.3
		Run D:\1.Development-Kit\5.SQLyog10.2\SQLyog.exe
	}
return
#If


/*
$!S::																									;Alt + S			SQLyog
if WinExist("ahk_exe SQLyog.exe")
{
MsgBox,0,, SQLyog 启动中..., 0.3
WinActivate
}else
{
MsgBox,0,, SQLyog 启动中..., 0.3
Run D:\1.Development-Kit\5.SQLyog10.2\SQLyog.exe
}
return
*/


$!G::
	MsgBox,0,, GifCam 启动中..., 0.3
	Run D:\Others\5.GifCam\GifCam.exe																	;Alt + G			GifCam
return

/*
$!W::
MsgBox,0,, 微信 启动中..., 0.3
Run D:\》腾讯软件\WeChat\WeChat.exe
return

*/


/*
$!W::																									;Alt + W			微信WeChat
If ProcessExist("WeChat.exe")=0
{
MsgBox,0,, 微信 启动中..., 0.3
Run D:\》腾讯软件\WeChat\WeChat.exe
Loop 5
{
MsgBox,0,, 微信 启动中..., 0.3
Sleep 200
WinActivate ahk_class WeChatLoginWndForPC
WinWaitActive ahk_class WeChatLoginWndForPC, , 3
if !ErrorLevel
break
}
MsgBox,0,, 微信 启动中..., 0.3
Sleep 200
Send ^{Enter}
}else{
MsgBox,0,, 微信 启动中..., 0.3
Send, !w
}
return

;if ProcessExist("Foxmail.exe")=0			;进程中没有Foxmail则执行下面的内容
ProcessExist(exe){			;一个自定义函数,根据自定义函数的返回值作为#if成立依据原GetPID
Process, Exist,% exe
return ErrorLevel
}

*/



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




;$!Q    提取TIM的消息，TIM中内置																			;Alt + Q			Tim消息

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



$#W::																									;Win + W	打开微信开发者工具
	if WinExist("ahk_class Chrome_WidgetWin_1")
	{
		MsgBox,0,, 微信web开发者工具 启动中..., 0.3
		WinActivate
	}else
	{
		MsgBox,0,, 微信web开发者工具 启动中..., 0.3
		Run D:\1.Development-Kit\1.WeChatDevelopmentTool\微信web开发者工具.exe
	}
return



$#S::
	MsgBox,0,, Notepad++ 启动中..., 0.3
	Run D:\Others\9.Notepad++\notepad++.exe        														;Win + S 	打开 Notepad++
return




$^+W::
	MsgBox,0,, WGestures 启动中..., 0.3
	Run C:\Program Files (x86)\WGestures\WGestures.exe													;Ctrl+Shift+W	打开WGestures
return


$^+Q::
	MsgBox,0,, Quicker 启动中..., 0.3
	Run C:\Program Files\Quicker\Quicker.exe															;Ctrl+Shift+Q	打开Quicker
return


Space & t::Send,#1																						;Space & T		打开百分浏览器--(Win + 1)

/*
Space & t::						;Space & T		打开浏览器
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
;================================================
;================================================


;===========================space功能定义================================							;================space功能定义{Home}================
Space::LShift
Space::Send {Space}
;======================================================

;=====数字小键盘==================================================
;================================================================
;26键上的123456789难以快速输出,且使用不方便, 更不要说直接盲打
;====================利用原来的7890键作为补充和配合
;spcace+h、j、k 				123
;spcace+u、i、0 				456
;spcace+7、8、9、0 				7890
Space & H::SendInput 0																				;Space & H		0
Space & J::SendInput 1																				;Space & J		1
Space & K::SendInput 2																				;Space & K		2
Space & L::SendInput 3																				;Space & L		3

Space & `;::SendInput,* 																			;Space & ;		*

Space & U::SendInput 4																				;Space & U		4
Space & i::SendInput 5																				;Space & i		5
Space & O::SendInput 6																				;Space & O		6

Space & P::SendInput /																				;Space & P		/_
Space & =:: SendInput, +=																			;Space & =		+
Space & -::SendInput, _ 																			;Space & -		_
;======================================================
;===================space功能定义End================================
Space & A::Send,^a^c																				;Space & A		全选复制
Space & D::Send,^{Right}^+{left}																	;Space & D		选中光标所在单词

Space & E::Send,!^{Tab}																				;Space & E		列出所有窗口
Space & Y::Send,^y																					;Space & Y		撤销
Space & W::Send ^{Tab}           																	;Space & W		切换 应用内标签


Space & f::																							;Space & F			搜索
Send ^f
return

Space & r::Send !{Tab}																				;Space & R			切换窗口

Space & q::Send {ESC}                																;Space & q			取消



;===============Ctrl + Shift + D ，获取当前日期Date==========										;Ctrl + Shift + D		获取当前日期Date
^+d::
	tempdate = %A_YYYY%-%A_MM%-%A_DD%
	;获得系统时间比如今天的时间：2018-12-16。如果需要“年”的话请替换上面的“-”。
	clipboard = %tempdate%
	;把 d 的值发送到剪贴板，变量是不用声明的，想引用变量的值，就在变量的前后加“%”。
	;第二行的变量是 AHK 自带的变量。
	;MsgBox,0,,获取当前日期Date  , 0.2
	Send ^v
	MsgBox,0,, 当前日期: %tempdate% , 2
return
;===============Ctrl + Shift + D ，获取当前时间==========


/*
;===============输入rq，获取当前时间==========
::rq::
tempdate = %A_YYYY%-%A_MM%-%A_DD%
;获得系统时间比如今天的时间：2018-12-16。如果需要“年”的话请替换上面的“-”。
clipboard = %tempdate%
;把 d 的值发送到剪贴板，变量是不用声明的，想引用变量的值，就在变量的前后加“%”。
;第二行的变量是 AHK 自带的变量。
Send ^v
MsgBox,0,,右选中并复制  , 0.3
return
;===============输入rq，获取当前日期==========
*/


;;============================Editor 复制/粘贴/保存/撤销/恢复===================						;==复制/粘贴/保存/撤销/恢复==

#SingleInstance Force  																					;CapsLock & G			单击:右选中;双击:右选中并复制
; 用于统计按键的次数
gnPressCountG := 0
CapsLock & G::
{
	gnPressCountG += 1
	SetTimer, ProcSubroutineG, Off
	SetTimer, ProcSubroutineG, 500
	return
}
ProcSubroutineG:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineG, Off
		if gnPressCountG = 1
		{
			; 第一类行为/单击
			Send, +{End}
			Sleep 1024
		}else if gnPressCountG = 2
		{
			; 第二类行为/双击
			Send, +{End}^c
			MsgBox,0,,右选中并复制  , 0.5
			Sleep 1024
		}
		else
		{
			;MsgBox, 其他次数
			Send,+{End}
			Sleep 1024
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountG := 0
		return
	}

;===================================

#SingleInstance ignore																					;CapsLock &a单击左选中，双击复制有问题，三击全选并复制。
; 用于统计按键的次数
gnPressCountA := 0
CapsLock & A::
{
	gnPressCountA += 1
	SetTimer, ProcSubroutineA, Off
	SetTimer, ProcSubroutineA, 500
	return
}
ProcSubroutineA:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineA, Off
		if gnPressCountA = 1
		{
			; 第一类行为
			Send, +{Home}
			Sleep 1024
		}else if  gnPressCountA = 2
		{
			; 第二类行为
			Send, +{Home}^c
			MsgBox,0,,左选并复制  , 0.4
			Sleep 1024
		}
		else
		{
			Send, ^a^c
			MsgBox,0,,全选并复制  , 0.5
			Sleep 1024
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountA := 0
		return
	}

;===================================



CapsLock & C::																							;CapsLock & C			复制
Send, ^c
MsgBox,0,, 复制..., 0.3
return

CapsLock & V::																							;CapsLock & V			粘贴
Send, ^v
MsgBox,0,, 粘贴..., 0.3
return

CapsLock & X::																							;CapsLock & X			剪切
Send, ^x
MsgBox,0,, 剪切..., 0.3
return

CapsLock & Y::																							;CapsLock & Y			撤销
Send, ^z
MsgBox,0,, 撤销..., 0.3
return

CapsLock & Z::																							;CapsLock & Z			撤销
Send, ^z
MsgBox,0,, 撤销..., 0.3
return


#If not WinActive("ahk_class SunAwtFrame") ;不在IDEA中生效												;===设置Ctrl Shift Zの 非语境约束{Start}===
^+z::
	Send,^y  																							;Ctrl + Shift+Z =Ctrl+Y		重做
	MsgBox,0,, 重做..., 0.3
#If  																									;===设置Ctrl Shift Zの 非语境约束{End}===



	CapsLock & D::																							;CapsLock & D			复制当前行内容
	Send, {Home}+{End}^c
	MsgBox,0,, 复制当前行..., 0.3
return
/*
#SingleInstance ignore
; 用于统计按键的次数
gnPressCountD := 0
CapsLock & D::
{
gnPressCountD += 1
SetTimer, ProcSubroutineD, Off
SetTimer, ProcSubroutineD, 500
return
}
ProcSubroutineD:
{
; 在计时器时间触发时, 需要将其关掉
SetTimer, ProcSubroutineD, Off
if gnPressCountD = 1
{
; 第一类行为
;Send, +{Home}
Send, {Home}+{End}^c  																		;CapsLock & D			复制当前行内容
Sleep 1024
}else if  gnPressCountD = 2
{
; 第二类行为
;Send, +{Home}^c
;MsgBox,0,,左选复制  , 0.4
Send, {Home}+{End}^c^v  																	;CapsLock & D			复制当前行内容
Sleep 1024
}
else
{
Send, {Home}+{End}^c  																		;CapsLock & D			复制当前行内容
Sleep 1024
}
; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
gnPressCountD := 0
return
}
*/


CapsLock & B::Send, {End}{Enter}  																	;CapsLock & B			直接换行

CapsLock & Q::Send, ^{BS}  																			;CapsLock & Q			←删

;====================

;========删除===========删除==========删除操作Deletor======删除==========

CapsLock & E:: Send, {Home}+{End}{Del}                                                  			;CapsLock & E		删除(/剪切)当前行

CapsLock & T:: Send, ^{Del}  																		;CapsLock & T		删除→词

CapsLock & R:: Send, {Del}  																		;CapsLock & R		Delete

CapsLock & W:: Send, {BS}  																			;CapsLock & W	BackSpace
;========删除===========删除==========删除操作Deletor======删除==========

;===============================================================

;;============================Special Char==========================||

;=========快速移动==========快速移动==========快速移动==========快速移动==
/*
s、f
j、l
u、o
======
i↑、k↓
n、m
*/



#If not WinActive("ahk_exe chrome.exe")  																;CapsLock &S		←跳一词并保存( 排除谷歌浏览器)
CapsLock & S::
Send, ^{Left}^s
#If

#If not WinActive("ahk_exe navicat.exe")  																;CapsLock &S		←跳一词并保存( 排除navicat)
CapsLock & S::
Send, ^{Left}^s
#If



CapsLock & S::Send, ^{Left}  																		;CapsLock &S		←跳一词(谷歌浏览器)

CapsLock & F::Send, ^{Right}  																		;CapsLock & F		→跳一词

CapsLock & J::Send,{Left}   																		;CapsLock & J		←
CapsLock & L::Send,{Right}  																		;CapsLock & L		→

CapsLock & U::         																				;CapsLock & U		←*14
Send,{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}
return

CapsLock & O::                 																		;CapsLock & O		→*14
Send,{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}
return

CapsLock & I::Send, {Up}  																			;CapsLock & I		↑
CapsLock & K::Send, {Down}  																		;CapsLock & k		↓

CapsLock & N:: Send, ^{Left}  																		;CapsLock & N		←跳一词
CapsLock & M:: Send, ^{Right}  																		;CapsLock & M		→跳一词

CapsLock & H::Send, {Home}	  																		;CapsLock & H		行首


;CapsLock & `;:: Send, {End}  																		;CapsLock & ;		行末


#SingleInstance Force  																					;CapsLock & G			单击:右选中;双击:右选中并复制
; 用于统计按键的次数
gnPressCountX := 0
CapsLock & `;::
{
	gnPressCountX += 1
	SetTimer, ProcSubroutineX, Off
	SetTimer, ProcSubroutineX, 500
	return
}
ProcSubroutineX:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineX, Off
		if gnPressCountX = 1
		{
			; 第一类行为/单击
			Send, {End}
			Sleep 1024
		}else if gnPressCountX = 2
		{
			; 第二类行为/双击
			SendInput,：
			;MsgBox,0,,：  , 0.5
			Sleep 1024
		}
		else
		{
			;MsgBox, 其他次数
			Send, {End}
			Sleep 1024
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountX := 0
		return
	}




CapsLock & ':: Send, {End}{Enter}																	;CapsLock & '		直接换行

;=========快速移动==========快速移动==========快速移动==========快速移动====


CapsLock & {:: Send, {{}																			;CapsLock & {		{
CapsLock & }:: Send, {}}																			;CapsLock & {		}

;CapsLock + 数字键  = Shift + 数字键

CapsLock & 1:: SendInput,{!}   																		;!(特殊语法)
CapsLock & 2:: SendInput, +@  																		;@
CapsLock & 3:: SendInput, {#}  																		;#(特殊语法)
CapsLock & 4:: SendInput, $  																		;$
CapsLock & 5:: SendInput, +5  																		;%
CapsLock & 6:: SendInput, +6  																		;^
CapsLock & 7:: SendInput, +7  																		;&
CapsLock & 8:: SendInput, +8  																		;*
;CapsLock & 9:: SendInput, +9  																		;(

CapsLock & 9::
temp=
(
	(
)
temp1=
(
	`)
)
SendText(temp)
SendText(temp1)
Send,{Left}
Sleep, 8
return


CapsLock & 0:: SendInput, +0  																			;)

CapsLock & -:: SendInput, +-  																			;_
CapsLock & =:: SendInput, +=  																			;+
CapsLock & \:: SendInput, +|  																			;|



CapsLock & ,:: SendInput, {，}																			;CapsLock & ,		中文标点 ，
CapsLock & .:: SendInput, {。}																			;CapsLock & .		中文标点 。
CapsLock & /:: SendInput, {、}																			;CapsLock & /		中文标点 、


;;==============================================================



;==============================自定义短语==========================
;[注意事项]: 不支持中文替换为其它字符===================

::bd::																									;bd			www.baidu.comcom
temp0=
(
www.baidu.com
)
temp=
(
com
)
SendText(temp0)
SendText(temp)
Send,{Enter}
return

::www.::																								;www.			www.baidu.comcom
temp=
(
www.baidu.com		
)
SendText(temp)
Send,{Enter}
return


::cmd::																									;cmd 		绕过中文输入法输出cmd
temp0=
(
cmd		
)
SendText(temp0)
Send,{Enter}
return

::cdm::																									;cdm 		绕过中文输入法输出cmd
temp=
(
cmd
)
SendText(temp)
Send,{Enter}
return


::ip.::																									;ip. 		绕过中文输入法输出ipconfig
temp=
(
ipconfig		
)
SendText(temp)
Send,{Enter}
return

::ip..::																								;ip.. 		绕过中文输入法输出ipconfig
temp=
(
ipconfig
)
SendText(temp)
Send,{Enter}
return



;===============ahk 编辑器 :  分号===============
#IfWinActive, ahk_class SciTEWindow
{
$`:: SendInput, `;																						;	`			//


	}
;===============ahk 编辑器 :  分号===============



;======================= # IDEA和webstorm语境约束=======================									;IDEA和webstorm语境约束下的ahk
#IfWinActive, ahk_class SunAwtFrame
{
	;=========快速输出1~n===========
/*
Space & 1::SendInput,1
Space & 2::SendInput,1,2
Space & 3::SendInput,1,2,3
Space & 4::SendInput,1,2,3,4,
Space & 5::SendInput,1,2,3,4,5
Space & 6::SendInput,1,2,3,4,5,6
Space & 7::SendInput,1,2,3,4,5,6,7
Space & 8::SendInput,1,2,3,4,5,6,7,8
Space & 9::SendInput,1,2,3,4,5,6,7,8,9
;=========快速输出1~n===========
*/

	CapsLock & WheelUp::Send, {Up}																		;CapsLock & WheelUp			查找↑一个
	CapsLock & WheelDown::Send, {Down}																	;CapsLock & WheelDown		查找↓一个


	;====获取一个 文件的全路径
^+c::																								;Ctrl + Shift +C		获取并文件的全类名(/路径)
	MsgBox,0,,全路径获取成功 , 0.3
	Send,^!+c

	;快速得到Mybatis的xml


::xml.::
	temp=
	(
 PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
 "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
	)
	SendText(temp)
	;Send,{Enter}
return



$`::SendInput, //																						;`				//

	;一键输出test_code
::test.::
	temp=
	(
@Test
public  void test() {}
	)
	SendText(temp)
	Send,{Left}{Enter}
return


CapsLock & ,:: SendInput, {<}																			;CapsLock & ,	<	单击:<,(英) 双击:，(中)
CapsLock & .:: SendInput, {>}																			;CapsLock & .	>	单击:>,(英) 双击:。(中)

/*	没有任何反应。无效的代码

#SingleInstance Force  																					;CapsLock & G			单击:右选中;双击:右选中并复制
; 用于统计按键的次数
gnPressCountP := 0
CapsLock & ,::
{
gnPressCount += 1
SetTimer, ProcSubroutineP, Off
SetTimer, ProcSubroutineP, 500
return
}
ProcSubroutineP:
{
; 在计时器时间触发时, 需要将其关掉
SetTimer, ProcSubroutineP, Off
if gnPressCountP = 1
{
; 第一类行为/单击
SendInput, {<}
Sleep 1024
}else if gnPressCountP = 2
{
; 第二类行为/双击
SendInput, {，}
MsgBox,0,,输入中文的逗号，  , 0.5
Sleep 1024
}
else
{
;MsgBox, 其他次数
Send,+{End}
Sleep 1024
}
; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
gnPressCountP := 0
return
}
*/


Space & p::																								;Space & p		public
temp=
(
public		
)
SendText(temp)
return

Space & s::																								;Space & s		String
temp=
(
String
)
SendText(temp)
return

Space & c::																								;Space & c		contrller
temp=
(
Controller
)
SendText(temp)
return


Space & t::Send,!5																						;Space & t		打开/关闭debug窗口

Space & q::Send,!1																						;Space & q		打开/关闭代码列表窗口

::psi::																									;psi			private String
temp=
(
private String 
)
SendText(temp)
return

::pii::																									;pii			private Integer
temp=
(
private Integer 
)
SendText(temp)
return


;=添加文档注释=====
CapsLock & /::																							;CapsLock & /			文档注释
if GetKeyState("alt") = 0 {
	Send, /**
	Send, {Enter}
}
else{
	Send, /**
	Send, {Enter}
}
return
;添加文档注释 结束====

}
;======= # IDEA语境约束结束==================================											;===IDEA语境{End}===



;======================= # SQLyog语境开始{Home}==============											;===SQLyog语境开始{Home}===
#IfWinActive, ahk_class MainWindow
{
	CapsLock & WheelUp::Send, {Up}																			;CapsLock & WheelUp 	↑
	CapsLock & WheelDown::Send, {Down}																		;CapsLock & WheelUp 	↓

	Shift & WheelUp::Send, {Left}																			;Shift & WheelUp 		←
	Shift & WheelDown::Send, {Right}																		;Shift & WheelUp 		→


	Space & D::SendInput,Delete																				;Space & D::			Delete
	Space & S::SendInput,select																				;Space & S::			select
	Space & F::SendInput,from																				;Space & F::			from
	Space & W::SendInput,where																				;Space & W::			where
	Space & L::SendInput,left																				;Space & L::			left

}
;======================= # MySQL语境约束{End}============================								;===SQLyog语境结束{End}=====================



;======================= # navicat语境开始{Home}==============									;===navicat语境开始{Home}===

#If WinActive("ahk_exe navicat.exe")
{


	CapsLock & WheelUp::Send, {Left}																		;CapsLock & WheelUp 	←
	CapsLock & WheelDown::Send, {Right}																		;CapsLock & WheelUp 	→

	Shift & WheelUp::Send, {Left}																			;Shift & WheelUp 		←
	Shift & WheelDown::Send, {Right}																		;Shift & WheelUp 		→


	CapsLock & S::Send,^{Left}																				;CapsLock & S::			←

	Space & D::SendInput,Delete																				;Space & D::			Delete
	Space & S::SendInput,select																				;Space & S::			select
	Space & F::SendInput,from																				;Space & F::			from
	Space & W::SendInput,where																				;Space & W::			where

	; 123  456
	;Space & L::SendInput,left																				;Space & L::			left

}
#If

;======================= # navicat语境结束{End}==============										;===navicat语境结束{End}===





;======================= # 文件管理器语境开始{Home}==============									;===文件管理器语境开始{Home}===
#If WinActive("ahk_exe explorer.exe")

;Capslock & S::Send,!{Left}																					;CapsLock & S		返回上一级
;Capslock & F::Send,!{Right}																				;CapsLock & F		跳到下一级
		
CapsLock & E::Send,!{Up}																					;CapsLock & E		返回上一级


;Capslock & D::Send,!{Down}																					;CapsLock & D		返回下一级


#If
;======================= # 文件管理器语境结束{End}==============										;===文件管理器语境结束{End}===




;======================= # XYplorer 语境开始{Home}==============									;===XYplorer 语境开始{Home}===
#If WinActive("ahk_exe XYplorer.exe")

;Capslock & S::Send,!{Left}																					;CapsLock & S		返回上一级
;Capslock & F::Send,!{Right}																				;CapsLock & F		跳到下一级
		
CapsLock & E::Send,!{BackSpace}																					;CapsLock & E		返回上一级


;Capslock & D::Send,!{Down}																					;CapsLock & D		返回下一级


#If
;======================= # XYplorer 语境结束{End}==============										;===XYplorer 语境结束{End}===




;======================= # chrome浏览器语境开始{Home}==============									;===chrome浏览器语境开始{Home}===

#If WinActive("ahk_exe chrome.exe")



; 在谷歌浏览器中 同时按 CapsLock 和 F，即可快速输入账号和密码进行登录。下面的账号和密码均为假的，不用想了。
CapsLock & F::
temp0=
(
1044885678@qq.com
)
temp=
(
lxdwxhn123456789
)
SendText(temp0)
Send,{Tab}
SendText(temp)
Send,{Enter}
Sleep 5
;Send,{Up}
return


Alt & 3::																						;Alt & 3			localhost:
SendInput, localhost:
return

Alt & 4::																						;Alt & 4			localhost:8080/
SendInput, localhost:8080/
return


Space & 4::																						;Space & 4			localhost:
SendInput, localhost:
return

Space & 5::																						;Space & 5			localhost:8080/
SendInput, localhost:8080/
return

CapsLock & T::																					;CapsLock & T		www.baidu.com
SendInput, www.baidu.com
return

#If
;======================= # chrome浏览器语境结束{End}============================								;===chrome浏览器语境结束{End}=====================


;======================= # 火萤酱/火柴语境开始{Home}==============									;======火萤酱/火柴语境开始{Home}====
#If WinActive("ahk_exe HuoChat.exe")
Space & Q::SendInput,y																				;Space & Q::SendInput,y
Space & W::SendInput,u																				;Space & W::SendInput,u
Space & E::SendInput,i																				;Space & E::SendInput,i
Space & R::SendInput,o																				;Space & R::SendInput,o
Space & T::SendInput,p																				;Space & T::SendInput,p

Space & A::SendInput,h																				;Space & A::SendInput,h
Space & S::SendInput,j																				;Space & S::SendInput,j
Space & D::SendInput,k																				;Space & D::SendInput,k
Space & F::SendInput,l																				;Space & F::SendInput,l

Space & Z::SendInput,n																				;Space & Z::SendInput,n
Space & X::SendInput,m																				;Space & X::SendInput,m


;space & C::SendInput,u																				;space & C::SendInput,u
;space & V::SendInput,u																				;space & R::SendInput,u
;space & B::SendInput,u																				;space & R::SendInput,u


#If
;======================= # 火萤酱/火柴语境结束{End}==============									;======火萤酱/火柴语境结束{End}====



;======================= # X-Shell语境开始{Home}==============									;======X-shell语境开始{Home}====
#If WinActive("ahk_exe Xshell.exe")

::pwd::																									;pwd		pwd
temp=
(
pwd
)
SendText(temp)
return


/*
::ls::																									;ls				ls -lh
temp=
(
ls -lh
)
SendText(temp)
return
*/


::lso::																									;lso		lsof -i: #pid
temp=
(
lsof -i:
)
SendText(temp)
return
#If
;======================= # X-Shell语境结束{End}==============									;======X-shell语境结束{End}====



;;=========================CapsLock's Stuff==============;;
;;==================================================;;