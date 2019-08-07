;开发者语境包括但不限于 IDEA、SQLyog、navicat、X-Shell 等


#Include D:\Others\9.AutoHotKey\!lygLibs\SendText.ahk




;======================= # IDEA和webstorm 语境约束=======================									;IDEA和webstorm 语境约束下的ahk
#IfWinActive, ahk_class SunAwtFrame
{

$`::Send,^{/}																							;`		添加注释

Capslock & Tab::																						; 
	SendInput,/**
	Send,{Enter}
	return






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

/*
::xml.::
	temp=
	(
 PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
 "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
	)
	SendText(temp)
	;Send,{Enter}
return
*/


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


;CapsLock & ,:: SendInput, {<}																			;CapsLock & ,	<	单击:<,(英) 双击:，(中)
;CapsLock & .:: SendInput, {>}																			;CapsLock & .	>	单击:>,(英) 双击:。(中)

/*
#SingleInstance Force  																					;CapsLock & P			单击:右选中;双击:右选中并复制
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


;Space & w::Send,{Ctrl}{Tab}																				;Space & w		切换窗口
Space & W::Send ^{Tab}{Enter}           																	;Space & W		切换 应用内标签


Space & t::Send,!5																						;Space & t		打开/关闭debug窗口

;Space & q::Send,!1																						;Space & q		打开/关闭代码列表窗口

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
;======= # IDEA 语境约束结束==================================											;===IDEA 语境{End}===



;======================= # SQLyog 语境开始{Home}==============											;===SQLyog语境开始{Home}===
#IfWinActive, ahk_class MainWindow
{
	
	$`:: SendInput,--{Space} 																			;  `			SQL注释
	
	
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

	;$`:: SendInput,--{Space}																						;  `			//
	$`::Send,^{/}																							;`		添加注释

	
	CapsLock & WheelUp::Send, {Left}																		;CapsLock & WheelUp 	←
	CapsLock & WheelDown::Send, {Right}																		;CapsLock & WheelUp 	→

	Shift & WheelUp::Send, {Left}																			;Shift & WheelUp 		←
	Shift & WheelDown::Send, {Right}																		;Shift & WheelUp 		→


	CapsLock & S::Send,^{Left}																				;CapsLock & S::			←

	Space & D::SendInput,DELETE																				;Space & D::			Delete
	Space & S::SendInput,SELECT																				;Space & S::			select
	Space & F::SendInput,FROM																				;Space & F::			from
	Space & W::SendInput,WHERE																				;Space & W::			where

	; 123  456
	;Space & L::SendInput,LEFT																				;Space & L::			left

}
#If

;======================= # navicat 语境结束{End}==============										;===navicat语境结束{End}===


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
;======================= # X-Shell 语境结束{End}==============									;======X-shell语境结束{End}====
