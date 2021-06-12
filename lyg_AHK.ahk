;;====================瞎琢磨先生's AHK Script=====================;;
;;==================================================================;;
;;=========================CapsLock's Stuff=========================;;
;;==================================================================;;
;这里是瞎琢磨先生的 DIY 脚本。目前该脚本在多年的日常重度使用中已日趋稳定，每个功能亦在多年打磨中尽善尽美。

;必要说明
;# 号代表 Win 键；
;! 号代表 Alt 键；
;^ 号代表 Ctrl 键；
;+ 号代表 shift 键；
;~ 号代表显示键原来的功能
;$ 号代表永远使用该键的功能
;:: 号(两个英文冒号)起分隔作用；

;;==================================================================;;
;依赖环境：
;1.自定义 CopyQ 收藏热键(修改成 Shift + Alt + C)
;2.修改 ditto 启动命令为 Ctrl + 0(数字)
;3.安装 Everything.exe，并将安装路径的位置作相应的修改。
;4.navicat 安装路径：D:\1.Development-Kit\5.Navicat15\navicat.exe
;5.微信安装路径：D:\Others\6.微信\WeChat\WeChat.exe


;=================================
;win系统常用快捷键
;alt + esc 最小化当前窗口
;win + m 最小化当前窗口
;`是转义字符，将`放在欲转义字符前面即可

;============给自己的ahk添加一个个性图标===============
IfExist, D:\a_soft\AutoHotkey\myAhk.ico
;如果存在 myAhk.ico 文件则执行花括号中的脚本。注意事项：花括号“{”不能和 IfExist 写在同一行。记得找个图标文件放在和脚本相同的文件夹里，并重命名为 myAhk.ico 。
{
	;花括号表示的是一段程序段，如果只有一句脚本的的话，花括号是可以省略的，这里去掉花括号程序也是正确的
	Menu TRAY, Icon, myAhk.ico
	;这句会把 myAhk.ico 作为图标。AHK 的脚本是大小写不分的。
}
;============给自己的ahk添加一个个性图标===============

;################### 引入其他的 ahk 文件(可以使用相对/绝对路径) #####################

;重要账号的密码相关内容保存的配置文件
#Include ..\..\z_other\!!!重要资料\lib\lyg_ahk_keyword.ahk

#Include a_lygLibs\输入法状态指示器.ahk
#Include a_lygLibs\快捷启动器.ahk
#Include a_lygLibs\各软件语境.ahk
#Include a_lygLibs\任务栏鼠标调节音量.ahk
#Include a_lygLibs\多重搜索.ahk
/*	使用说明:
*	①Alt + F 打开 Everything 等待输入。
	②Enter：进行本地搜索
*	②CapsLock + Enter：网络搜索(或者使用Ctrl + Enter)
*				
*/

#Include a_lygLibs\依次粘贴.ahk
/*
;------------------------------------------------------------------------
;||     Win + 0                  |                清空
;||     Win + C                  |                复制
;||     Win + V                  |                依次粘
;||     Win + B                  |                依次粘贴，但顺序相反
;||     Ctrl+ Win + V            |                覆盖粘贴
;||     ESC                      |                退出本模式
;------------------------------------------------------------------------
*/

;废弃功能↓
;#Include !lygLibs\瞎琢磨の便利贴.ahk  ; 使用 utools 替代，剪切板 ditto 也被取代。
;#Include !lygLibs\快捷列表.ahk
/*
*	使用说明: F7 打开 软键盘
*/
;###################引入其他的ahk文件#####################

;###################绕过中文输入法发送文本需要调用的函数######################
;==============https://www.jianshu.com/p/e5b1ea126a8f===============

/*
SendText(var_string){
	local
	SendInput {text}%var_string%
	return
}
*/
;###################绕过中文输入法发送文本需要调用的函数######################



;################### 测试专用 {start} #############################

; ahk 的基础语法(定义变量，引用变量，使用函数)
;自定义字符串(变量，单行)
;_shell=1 3 3 )

;;自定义字符串(变量，多行。如存在"特殊字符串"，则使用"`"转义，如"括号"，则使用"`"转义
_shell=
(
1
2
`)
)

;定义一个热字符串
::abc::
;调用方法
;Send_Str_Zz(_shell)
Send,%_shell%
return
;效果：输入 abc，得到：1 回车 2 回车 )

*/


;###################################################################


CapsLock & Space::																					;CapsLock & Space 得到 .
SendInput, {.}
return


^`::^0                                                                                              ;Ctrl + `：ditto 设置热键为 Ctrl + 0(数字)。解决 ditto 热键冲突失效问题


;################################################

$Tab::Send,{Tab}

;模拟鼠标操作																						;;模拟鼠标操作;;;;;;;;;;;;;;;;;;;
;模拟鼠标操作																						;;模拟鼠标操作;;;;;;;;;;;;;;;;;;;
Tab & U::
;Send,{Up}{Left}
MouseMove, -10, -10, 0, return
;Click 1
return


Tab & N::
;Send,{Down}{Left}
MouseMove, -10, 10, 0, return
Click 1
return


Tab & O::
;Send,{Up}{Right}
MouseMove, 10, -10, 0, return
;Click 1
return


Tab & /::
;Send,{Up}{Right}
MouseMove, 10, 10, 0, return
;Click 1
return


Tab & J::
;Send,{Left}
MouseMove, -10, 0, 0, return
;Click 1
return


Tab & i::
;Send,{Up}
MouseMove, 0, -10, 0, return
;Click 1
return


Tab & K::
;Send,{Down}
MouseMove, 0, 10, 0, return
;Click 1
return


Tab & L::
;Send,{Right}
MouseMove, 10, 0, 0, return
;Click 1
return

Tab & M::
Send,{LButton}
return


Tab & C::
Send,^C
return

Tab & V::
Send,^V
return

Tab & X::
Send,^X
return

;################################################

/*
;W为1/3显示器宽度，W2为2/3显示器宽度，H为显示器高度
W:=A_ScreenWidth/3
W2:=A_ScreenWidth*2/3
H:=A_ScreenHeight
run, C:\
run, D:\
run, E:\
;等待1秒继续运行
sleep, 1000
;1、2、3为文件夹窗口title，可通过windows spy确认

WinMove, 1, ,0, 0, %W%,%H%
WinMove, 2, ,%W%, 0, %W%,%H%
WinMove, 3, ,%W2%, 0, %W%,%H%
return
*/

;####################测试专用 End############################


;================倒计时、计时器=======================
/*
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
*/

;================倒计时End=======================

;=========将 Capslock 改成 Enter ================
;=====如果是大写状态，则切换状态为中文。如果小写/中文状态，则换行
/*
;未完成的功能
;如果是中文，使用Capslock切换大写之后回去还是中文(默认就是这样的结果)
;如果是英文(小写)，则切换回去是英文(小写)，需要自己修改成中文。
*/


$Capslock::																								;Capslock		回车/切换大写为中文/小写
	state :=GetKeyState("CapsLock","T")
	if  state=1   ; 是大写
	{
		SetCapsLockState, AlwaysOff			;大写切换成中文/小写
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
;CapsLock & p::AltTab																			;CapsLock & P	切换窗口(该功能已移除)


;=============快捷键调节音量Home==========
;F10静 音
;F11减音量
;F12加音量

;===========F10 静音
F10::SoundSet, +1,, mute																		;F10静音
;===========F11 减音量
F11::																							;F11减音量
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
$`:: SendInput, //																					;`			//

CapsLock & `:: SendInput, ``																		;CapsLock&`		`

;----------------------------------------------------------------------
 



;===========================space功能定义================================							;================ space功能定义{Home} ================
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
;spcace+M、N、H、,、0 				0

Space & ,::SendInput 0																				;Space & ,		0
Space & N::SendInput 0																				;Space & N		0
Space & M::SendInput 0																				;Space & M		0
Space & H::SendInput 0																				;Space & H		0
Space & J::SendInput 1																				;Space & J		1
Space & K::SendInput 2																				;Space & K		2
Space & L::SendInput 3																				;Space & L		3

Space & `;::SendInput,* 																			;Space & ;		*

Space & U::SendInput 4																				;Space & U		4
Space & i::SendInput 5																				;Space & i		5
Space & O::SendInput 6																				;Space & O		6

Space & P::SendInput /																				;Space & P		/
Space & =:: SendInput, +=																			;Space & =		+
Space & -::SendInput, _ 																			;Space & -		_
;====================================================================================================================================
Space & W::Send ^{Tab}           																	;Space & W		切换 应用内标签
Space & E::Send,!^{Tab}																				;Space & E		列出所有窗口
Space & R::Send ^+{Tab}																				;Space & R		切换窗口
;Space & T::打开浏览器																				;Space & T		打开浏览器
Space & F::Send ^f																					;Space & F		搜索

Space & Y::Send,^y																					;Space & Y		撤销
Space & A::Send,^a^c																				;Space & A		全选复制
Space & D::Send,^{Right}^+{left}																	;Space & D		选中光标所在单词



;=================== space 功能定义 End ================================

;===============Ctrl + Shift + D ，获取当前日期Date==========										;Ctrl + Shift + D		获取当前日期Date
^+d::
	tempdate = %A_YYYY%-%A_MM%-%A_DD%
	;获得系统时间比如今天的时间：2018-12-16。如果需要“年”的话请替换上面的“-”。
	clipboard = %tempdate%
	;把 d 的值发送到剪贴板，变量是不用声明的，想引用变量的值，就在变量的前后加“%”。
	;第二行的变量是 AHK 自带的变量。
	Send ^v
	MsgBox,0,, 当前日期: %tempdate% , 0.02
return
;===============Ctrl + Shift + D ，获取当前时间==========


;;============================Editor 复制/粘贴/保存/撤销/恢复===================					;==复制/粘贴/保存/撤销/恢复==

#SingleInstance Force  																				;CapsLock & G   单击:右选中;双击:右选中并复制
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
			;MsgBox,0,,1次 右选中并复制  , 1
			Sleep 1024
		}else if gnPressCountG = 2
		{
			; 第二类行为/双击
			Send, +{End}^c
			MsgBox,0,, 右选中并复制  , 0.1
			Sleep 1024
		}else if gnPressCountG = 3
		{
			; 第三类行为/双击
			Send, +{End}^x
			;MsgBox,0,,3次 右选中并剪切  , 0.1
			Sleep 1024
		}
		else
		{
			;MsgBox, 其他次数
			;Send,+{End}
			MsgBox,0,,右选中并复制  , 0.1
			Send, +{End}^c
			Sleep 1024
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountG := 0
		return
	}

;===================================

#SingleInstance ignore																					;CapsLock & A 单击左选中，双击复制，三击全选并复制。
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
			MsgBox,0,,左选并复制  , 0.2
			Sleep 1024
		}
		else
		{
			Send, ^a^c
			MsgBox,0,,全选并复制  , 0.2
			Sleep 1024
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountA := 0
		return
	}

;===================================
;短按：正常的复制，长按：调用 CopyQ 的收藏版功能(需要设置其调用快捷键为 Shift + Alt + C)
CapsLock & C::                                                                                          ;CapsLock & C 复制(短按)，常用短语(长按)
KeyWait,C,T0.4
if not(ErrorLevel){
    ;MsgBox, 复制
	Send, ^c
	
}else{
	;自定义 CopyQ 收藏热键(修改成 Shift + Alt + C)
    ;MsgBox, !+C
	Send, !+C
}
return


;短按：正常的粘贴，长按：剪切板历史(调用 ditto 的剪切板历史，需要设置其调用快捷键为 Alt + 0
CapsLock & V::                                                                                          ;CapsLock & V 粘贴(短按)，剪切板(长按)
KeyWait,V,T0.3
if not(ErrorLevel){
	Send, ^v
}else{
	;调用 ditto 修改后的快速启动键(修改成 Ctrl + 0)
	Send, ^0
}
return


CapsLock & X::																							;CapsLock & X			剪切
Send, ^x
;MsgBox,0,, 剪切..., 0.3
Sleep 1024
return

CapsLock & Y::																							;CapsLock & Y			撤销
Send, ^z
;MsgBox,0,, 撤销..., 0.3
Sleep 1024
return

CapsLock & Z::																							;CapsLock & Z			撤销
Send, ^z
;MsgBox,0,, 撤销..., 0.3
Sleep 1024
return



#If not WinActive("ahk_class SunAwtFrame") ;不在IDEA中生效												;===设置Ctrl Shift Zの 非语境约束{Start}===
^+z::
	Send,^y  																							;Ctrl + Shift+Z =Ctrl+Y		重做
	;MsgBox,0,, 重做..., 0.3
#If  																									;===设置Ctrl Shift Zの 非语境约束{End}===


#SingleInstance ignore
; 用于统计按键的次数
gnPressCountD := 0
CapsLock & D::																							;CapsLock & D	单击:复制当前行，其余:剪切
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
    Send, {Home}+{End}^c  				;CapsLock & D			复制当前行
    Sleep 1024
}else if  gnPressCountD = 2
{
; 第二类行为
Send, {Home}+{End}^c 
Send, ^x  							;CapsLock & D			剪切
Sleep 1024
}
else
{
    Send, {Home}+{End}^c  																		
    Send, ^x  							;CapsLock & D			剪切
    Sleep 1024
}
; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
gnPressCountD := 0
return
}



CapsLock & B::Send, {End}{Enter}  																	;CapsLock & B	直接换行

CapsLock & Q::Send, ^{BS}  																			;CapsLock & Q	BackSpace

;====================

;========删除===========删除==========删除操作Deletor======删除==========

CapsLock & E:: Send, {Home}+{End}{Del}                                                  			;CapsLock & E	删除(/剪切)当前行

CapsLock & T:: Send, ^{Del}  																		;CapsLock & T	删除→词

CapsLock & R:: Send, {Del}  																		;CapsLock & R	Delete

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



#If not WinActive("ahk_exe chrome.exe")  															;CapsLock &S	←跳一词并保存( 排除谷歌浏览器)
    ;CapsLock & S::Send, ^{Left}^s
    CapsLock & S::Send, {Left}^s
#If


#If not WinActive("ahk_exe navicat.exe")  															;CapsLock &S	←跳一词并保存( 排除navicat)
	;CapsLock & S::Send, ^{Left}^s
    CapsLock & S::Send, {Left}^s
    
#If



;CapsLock & S::Send, ^{Left}  																		;CapsLock &S		←跳一词(谷歌浏览器)
;CapsLock & F::Send, ^{Right}  																		;CapsLock & F		→跳一词

CapsLock & S::Send, {Left}  																		;CapsLock &S		←跳一词(谷歌浏览器)
CapsLock & F::Send, {Right}  																		;CapsLock & F		→跳一词


CapsLock & U::         																				;CapsLock & U		←*14
Send,{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}
return

CapsLock & O::                 																		;CapsLock & O		→*14
Send,{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}
return

CapsLock & H::Send, {Home}	  																		;CapsLock & H		行首

;CapsLock & J::Send,{Left}   																		;CapsLock & J		←
;CapsLock & L::Send,{Right}  																		;CapsLock & L		→

CapsLock & J::Send,{Left}   																		;CapsLock & J		←
CapsLock & L::Send,{Right}  																		;CapsLock & L		→

CapsLock & I::Send, {Up}  																			;CapsLock & I		↑
CapsLock & K::Send, {Down}  																		;CapsLock & k		↓

;CapsLock & N:: Send, +^{Left}  						;CapsLock & N		←选中一词
;CapsLock & M:: Send, +^{Right}  						;CapsLock & M		→选中一词

CapsLock & N:: Send, ^{Left}  																		;CapsLock & N		←一词
CapsLock & M:: Send, ^{Right}  																		;CapsLock & M		→一词


;CapsLock & `;:: Send, {End}  																		;CapsLock & ;		行末


#SingleInstance Force  																				;CapsLock & ;		单击:行末;双击:"中文冒号"：
; 用于统计按键的次数
gnPressCount1 := 0
CapsLock & `;::
{
	gnPressCount1 += 1
	SetTimer, ProcSubroutine1, Off
	SetTimer, ProcSubroutine1, 500
	return
}
ProcSubroutine1:
{
    ; 在计时器时间触发时, 需要将其关掉
    SetTimer, ProcSubroutine1, Off
    if gnPressCount1 = 1
    {
        ; 第一类行为/单击
        Send, {End}
        Sleep 1024
    }else if gnPressCount1 = 2
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
    gnPressCount1 := 0
    return
}


CapsLock & ':: Send, {End}{Enter}																	;CapsLock & '	直接换行

;=========快速移动==========快速移动==========快速移动==========快速移动====


CapsLock & {:: Send, {{}																			;CapsLock & {	{
CapsLock & }:: Send, {}}																			;CapsLock & {	}

;CapsLock + 数字键  = Shift + 数字键

CapsLock & 1:: SendInput,{!}   																		;CapsLock & 1   !(特殊语法)
CapsLock & 2:: SendInput, +@  																		;CapsLock & 2   @
CapsLock & 3:: SendInput, {#}  																		;CapsLock & 3   #(特殊语法)
CapsLock & 4:: SendInput, $  																		;CapsLock & 4   $
CapsLock & 5:: SendInput, +5  																		;CapsLock & 5   %
CapsLock & 6:: SendInput, +6  																		;CapsLock & 6   ^
CapsLock & 7:: SendInput, +7  																		;CapsLock & 7   &
CapsLock & 8:: SendInput, +8  																		;CapsLock & 8   *
CapsLock & 9::                                                                                      ;CapsLock & 9   ()
SendText("()")
Send,{Left}
Sleep, 8
return


CapsLock & 0:: SendInput, +0  																		;CapsLock & 0   )

CapsLock & -:: SendInput, +-  																		;CapsLock & -   _
CapsLock & =:: SendInput, +=  																		;CapsLock & =   +
CapsLock & \:: SendInput, +|  																		;;CapsLock & \  |



CapsLock & ,:: SendInput, {，}																		;CapsLock & ,	，(中文标点)
CapsLock & .:: SendInput, {。}																		;CapsLock & .	。(中文标点)
CapsLock & /:: SendInput, {、}																		;CapsLock & /	、(中文标点)


;;==============================================================





;;=========================CapsLock's Stuff==============;;
;;==================================================;;