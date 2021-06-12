;开发者语境包括但不限于 IDEA、SQLyog、navicat、X-Shell 等


#Include a_lygLibs\SendText.ahk



;======================= # 文件管理器语境开始{Home}==============									;===文件管理器 语境开始{Home}===
#If WinActive("ahk_exe explorer.exe")



;(鼠标中键实现开机启动所有常用软件)一键启动所有开发环境软件 =========================							;(鼠标中键实现开机启动所有常用软件)一键启动所有开发环境软件 ========

$MButton::

MsgBox,0,, ...一键启动常用软件(explore语境)..., 0.3

;Send,#1
;Sleep 3


;启动 Ditto
Run, ..\!shortcut\nosee\Ditto.exe.lnk


;启动 Snipaste
Run, ..\!shortcut\nosee\Snipaste.exe.lnk

;启动 Quicker
Run, ..\!shortcut\nosee\Quicker.exe.lnk

;启动 天若OCR文字识别
Run, ..\!shortcut\nosee\天若OCR文字识别.exe.lnk

;启动 火柴
Run, ..\!shortcut\nosee\火柴.lnk

return
;(鼠标中键实现开机启动所有常用软件)一键启动所有开发环境软件 =========================						;(鼠标中键实现开机启动所有常用软件)一键启动所有开发环境软件 ========

CapsLock & E::Send,!{Up}																				;CapsLock & E		返回上一级
;Capslock & D::Send,!{Down}																				;CapsLock & D		返回下一级


Capslock & LButton::																					;Capslock & 鼠标左键 back(上一步)
Send,^!{left}
return

Capslock & RButton::																					;Capslock & 鼠标右键 forward(下一步)
Send,^!{Right}
return


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



#If
;======================= # 文件管理器语境结束{End}==============											;===文件管理器语境结束{End}===


;======================= # IDEA 和 webstorm 语境约束，开始 =======================						;IDEA 和 webstorm 语境约束，开始
#If WinActive("ahk_exe idea64.exe")

$`::Send,^{/}																							;`		添加单行注释

/*
::,,::																									;,,		Run
Send, ^+{F10}
;MsgBox,0,,Run 启动中... , 0.2
return

::..::																									;..		Debug
Send, ^{F5}
Send, +{F9}
;MsgBox,0,,Debug 启动中... , 0.2
return
*/

Alt & I::Send, !{Up}																					;Alt & I	上一个方法
Alt & K::Send, !{Down}																					;Alt & K	下一个方法

Alt & E::Send,^e																						;Alt & E	最近打开文件

Alt & F::Send, ^+{\}																					;Alt & F	搜索接口(插件Request mapper 的快捷键：Ctrl + Shift + \)

Alt & W::Send, ^w																						;Alt & W 	选中单词


;Alt & J::Send,^!{left}																					;Alt & J	back(上一步)
;Alt & L::Send,^!{Right}																					;Alt & L	 forward(下一步)

Alt & N::Send, ^+{BS}																					;Alt & N	 上一次更改的位置


Capslock & Space::Send, ^w																				;CapsLock & Space 	选中单词
;CapsLock & Space::SendInput,{.}																		;CapsLock & Space	输入"."

Capslock & Tab::																					 	;CapsLock & Tab		添加多行注释
SendInput,/**
Send,{Enter}
return


;CapsLock & WheelUp::Send, {Up}																			;CapsLock & WheelUp			查找↑一个
;CapsLock & WheelDown::Send, {Down}																		;CapsLock & WheelDown		查找↓一个

CapsLock & WheelUp::Send, !{Up}																			;CapsLock & WheelUp			↑ 方法
CapsLock & WheelDown::Send, !{Down}																		;CapsLock & WheelDown		↓ 方法

Capslock & LButton::																					;Capslock & 鼠标左键 back(上一步)
Send,^!{left}
return

Capslock & RButton::																					;Capslock & 鼠标右键 forward(下一步)
Send,^!{Right}
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



;====获取一个 文件的全路径
^+c::																									;Ctrl + Shift +C		获取并文件的全类名(/路径)
MsgBox,0,,全路径获取成功 , 0.3
Send,^!+c
return

;CapsLock & ,:: SendInput, {<}																			;CapsLock & ,	<	单击:<,(英) 双击:，(中)
;CapsLock & .:: SendInput, {>}																			;CapsLock & .	>	单击:>,(英) 双击:。(中)


Space & p::																								;Space & p		public
SendText("public")
return

Space & s::																								;Space & s		String
SendText("String")
return

Space & c::																								;Space & c		contrller
SendText("Controller")
return

Space & r::Send, ^!{Right}																				;Space & w		跳转到"最后浏览"				
Space & w::Send, ^!{Left}																				;Space & w		跳转到"刚才浏览"

;Space & q::Send,!1																						;Space & q		打开/关闭代码列表窗口

Space & T::Send,{F9}																					;Space & t		F9(下一个断点)
Space & 5::Send,{F9}																					;Space & 5		F9(下一个断点)
Space & 4::Send,{F8}																					;Space & 4		F8(下一步)


#If
;======================= # IDEA 和 webstorm 语境约束，结束 =======================						;IDEA 和 webstorm 语境约束，结束	=======================




;======= # pycharm64 语境约束，开始==================================									;=== pycharm64 语境，开始 ===
#If WinActive("ahk_exe pycharm64.exe")


$`::Send,^{/}																							;`		添加单行注释

;=添加文档注释=====
CapsLock & /::																							;CapsLock & /	文档注释
	Send, """
	Send, {Enter}
	return


#If
;======= # pycharm64 语境约束，结束==================================									;=== pycharm64 语境，结束	=======================

;======================= # navicat语境开始{Home}==============											;===navicat语境开始{Home}	=======================
#If WinActive("ahk_exe navicat.exe")
{

	;$`:: SendInput,--{Space}																						;  `			//
	$`::Send,^{/}																						;`		添加注释

	F7::Send,^{/}																						;F7		添加注释	
	F8::F5																								;F8  刷新当前页面(方便在IDEA中操作后，直接快速操作)
	
	F9::Send,^{R}																						;F9  执行当前sql操作
	
	
	
	CapsLock & WheelUp::Send, {Left}																	;CapsLock & WheelUp 	←
	CapsLock & WheelDown::Send, {Right}																	;CapsLock & WheelUp 	→

	Shift & WheelUp::Send, {Left}																		;Shift & WheelUp 		←
	Shift & WheelDown::Send, {Right}																	;Shift & WheelUp 		→


	CapsLock & S::Send,^{Left}																			;CapsLock & S::			←

	Space & D::SendInput,DELETE																			;Space & D::			Delete
	Space & S::SendInput,SELECT																			;Space & S::			select
	Space & F::SendInput,FROM																			;Space & F::			from
	Space & W::SendInput,WHERE																			;Space & W::			where
	Space & A::SendInput,AND																			;Space & A::			and
	
	;Space & L::SendInput,LEFT JOIN 																	;Space & L::			left join
	

}
#If

;======================= # navicat 语境结束{End}==============											;===navicat语境结束{End}	=======================


;======================= # X-Shell语境开始{Home}==============											;======X-shell语境开始{Home}	=======================
#If WinActive("ahk_exe Xshell.exe")


;~;输出结果
Send_Str_Zz(strZz){
	ClipSaved:=ClipboardAll
	Clipboard:=strZz
	SendInput,^v
	Sleep,200
	Clipboard:=ClipSaved
}

_shell=
(
function killServerByPort(){
	killPort=$1
	kill -9 $(netstat -nlp | grep :$killPort | awk '{print $7}' | awk -F'/' '{ print $1 }')

}

function killServerByName(){
	killName=$1
	ps -ef | grep $killName | grep -v grep | awk '{print $2}' | xargs kill -9

}


# 根据服务端口/名称杀死服务
function k(){
	
	if [ -n "$(echo $1| sed -n "/^[0-9]\+$/p")" ];then 

	  echo "根据服务端口 [[$1]] 杀死服务." 
	  killServerByPort $1

	elif  [ -n "$1" ] ;then 
	  echo "根据服务名称 [[$1]] 杀死服务." 
	  killServerByName $1
	else
		echo "请输入参数后重试"
	fi

}



# 根据名称/端口找到服务的路径
function p(){
		
	if [ -n "$(echo $1| sed -n "/^[0-9]\+$/p")" ];then 
	
		serverPort=$1
		
		# pwdxPath=`lsof -i:$serverPort | sed -n '2p' | cut -d ' ' -f5`| awk -F": " '{print $2}'
		serverPath=$(pwdx `lsof -i:$serverPort | sed -n '2p' | cut -d ' ' -f5` | awk -F": " '{print $2}')
		echo "端口 [[ $serverPort ]] 对应的服务路径是：[[ $serverPath ]]。"
		#cd $serverPath
		#sleep 3s
		#cd -
		
	elif  [ -n "$1" ] ;then 
		echo "根据服务名称 [[$1]] 查找服务路径" 
		serverName=$1
		# serverPath=$(pwdx `ps -ef | grep $serverName | sed -n '2p' | cut -d ' ' -f7 `| awk -F": " '{print $2}')
		#(半成品) ps -ef|grep CT|  awk -F= '{print $6}'

		ps -ef | grep $serverName
		
		# echo "服务 [[ $serverName ]] 对应的服务路径是：[[ $serverPath ]]。"
		#cd $serverPath
		#sleep 3s
		#cd -
	else
		echo "请输入参数后重试"
	fi
}


# 限制内存启动服务
function n(){
	
	Server_Jar_Name=$1
	# 未传递服务名称，使用默认值
	
	if [ ! -n "$Server_Jar_Name" ] ;then
		Server_Jar_Name=*.jar
		echo $Server_Jar_Name
	fi
	
	
	maxXmx=$2
	
	# 未传递内存大小，使用默认值
	if [ ! -n "$maxXmx" ] ;then
		maxXmx=1
		echo $maxXmx
	fi
	
	
	nohup java -server -Xms512m -Xmx${maxXmx}G -Xss512k -XX:+HeapDumpOnOutOfMemoryError -XX:+UseConcMarkSweepGC -XX:+UseCMSCompactAtFullCollection -XX:ParallelGCThreads=4 -jar  ${Server_Jar_Name} > nohup.out  &


}

)

;# k CT
;# k 50288

;# p CT
;# p 50288

;# n FireAppServer
;# n 



/*
$`:: 																									;` 		ll 展示当前目录的文件
;Send,%_shell%
Send_Str_Zz(_shell)
return
*/





$`:: 																									;` 		ll 展示当前目录的文件
SendText("ll")
Send,{Enter}
SendText("pwd")
Send,{Enter}
return




CapsLock & D::																							;CapsLock & D 		 pwd
SendText("ll")
Send,{Enter}
SendText("pwd")
Send,{Enter}
return


CapsLock & F::																							;CapsLock & F 		 netstat -nlp | grep :
;SendText("lsof -i:")
SendText("netstat -nlp | grep :")
return


CapsLock & X:: 																							;CapsLock & X	pwdx
;SendText("pwdx ``lsof -i: | sed -n '2p' | cut -d ' ' -f5 ``| sed 's/: /&\n/g' | sed 's/://g'")
SendText("pwdx ``netstat -nlp | grep : | awk '{print $7}' | awk -F'/' '{ print $1 }'``|sed 's/: /&\n/g' | sed 's/://g'")
Send,{Home}
;Send, 26 个→
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}
return



CapsLock & T::																							;CapsLock & T 		cat
SendText("tail -200f ")
Send,{End}
return


CapsLock & C::																							;CapsLock & C 		cat
SendText("cd ")
return

/*
CapsLock & V::																							;CapsLock & V 		 vim 
SendText("vim ")
return
*/

CapsLock & Space::																						;CapsLock & Space 		cd 
SendText("ps -ef | grep ")
return


CapsLock & '::																							;CapsLock & '		ll 以及 pwd
SendText("kill -9 $(netstat -nlp | grep : | awk '{print $7}' | awk -F'/' '{ print $1 }')")
Send,{Home}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}
return



CapsLock & WheelUp::Send, {Up}																			;CapsLock & WheelUp 	↑

CapsLock & WheelDown::Send, {Down}																		;CapsLock & WheelUp 	↓



;鼠标左键	
CapsLock & LButton::																					;CapsLock & LButton		ll 以及 pwd
SendText("kill -9 $(netstat -nlp | grep : | awk '{print $7}' | awk -F'/' '{ print $1 }')")
Send,{Home}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}
return


CapsLock & RButton::																					;CapsLock & LButton		ll 以及 pwd
SendText("cd ..")
Send,{Enter}
SendText("ll")
Send,{Enter}
return

/*
^F::
SendText(":/")
return
*/

/*
^K::
SendText("ps -ef | grep  | grep -v grep | awk '{print $2}' | xargs kill -9")
Send,{Home}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}{Right}
Send,{Right}{Right}{Right}{Right}
return


::lso::																									;lso		lsof -i: #pid
SendText("lsof -i:")
return
*/


#If
;======================= # X-Shell 语境结束{End}==============										;====== X-shell语境结束{End}====



;======================= # cmd.exe 语境开始{Home}==============										;=== cmd 语境开始{Home}===
#If WinActive("ahk_exe cmd.exe")

$`:: 																								;`			ipconfig
SendText("ipconfig")
Send,{Enter}
return




#If
;======================= # cmd 语境结束{End}==============											;=== cmd 语境结束{End}===



;======================= # Typora 语境开始{Home}==============										;=== Typora 语境开始{Home}===
#If WinActive("ahk_exe Typora.exe")

$`:: 																								;`		插入代码块	
Send,{``}{``}{``}{Space}
return



CapsLock & Space::
SendInput, {-}
Send, {Space}
return


CapsLock & 9::
SendInput, {（}
SendInput, {）}
Send,{Left}
return


CapsLock & 0::
SendInput, {）}
return



#If
;======================= # Typora 语境结束{End}==============										;=== Typora 语境结束{End}===




;=============== ahk 编辑器 :  分号 ===============
#IfWinActive, ahk_class SciTEWindow
{
$`::
Send, {Home}
SendInput, `;																						;	`			//
return


	}
;=============== ahk 编辑器 :  分号 ===============



;======================= # notepad++ 语境开始{Home}==============									;=== notepad++ 语境开始{Home}===
#If WinActive("ahk_exe notepad++.exe")

$`::
Send, {Home}
SendInput, //																						;	`		在行首添加注释：//
return

#If
;======================= # notepad++ 语境结束{End}==============										;=== notepad++ 语境结束{End} ===


;======================= # chrome 浏览器语境开始{Home}==============									;=== chrome浏览器语境开始{Home} ===
#If WinActive("ahk_exe chrome.exe")

F8::F5

CapsLock & Space::Send,^{Tab}																		;CapsLock & Space 切换到到→窗口

CapsLock & S::Send, {Left}

CapsLock & 9::
SendText("（）")
Send,{Left}
return

CapsLock & 0::SendText("）")

CapsLock & '::
SendText("“”")
Send,{Left}
return

CapsLock & C::Send, ^c

;前进/后退
Capslock & LButton::																				;Capslock & 鼠标左键 back(上一步)
Send, !{left}
return

Capslock & RButton::																				;Capslock & 鼠标右键 forward(下一步)
Send, !{Right}
return

Space & F::Send, ^e																					;Space & E 调用百度搜索

Space & W::Send,^+{Tab}																				;Space & W 切换到→窗口
Space & R::Send,^{Tab}																				;Space & R 切换到到←窗口

Space & T::Send,^t																					;Space & T 打开新窗口

Space & E::Send,^w																					;Space & E 关闭当前窗口


!F::Send, !+H																						;Alt + F	搜索书签列表并可以快速打开(需安装插件 Holmes，，默认快捷键：Alt + Shift + H)

!G::Send, ^+B																						;Alt + G	搜索书签(需安装插件 书签管理，并设置快捷键：Ctrl + Shift + B)

;^+F::Send, ^+F																						;Ctrl + Shift + F	搜索已打开的 Tab 页(需安装插件 Go to Tab，并设置快捷键：Ctrl + Shift + F)

!L::Send, ^+k																						;Alt + L		搜索已打开的 Tab 页(需安装插件 Go to Tab，可从 https://www.crx4chrome.com 或 拓展迷 中下载 )


#If
;======================= # chrome浏览器语境结束{End}============================						;=== chrome浏览器语境结束{End} =====================



;======================= # edge 浏览器语境开始{Home} ==============									;=== edge浏览器 语境开始{Home} ===
#If WinActive("ahk_exe msedge.exe")


F8::F5

CapsLock & Space::Send,^{Tab}																		;CapsLock & Space 切换到到→窗口

CapsLock & S::Send, {Left}

CapsLock & 9::
SendText("（）")
Send,{Left}
return

CapsLock & 0::SendText("）")

CapsLock & '::
SendText("“”")
Send,{Left}
return

CapsLock & C::Send, ^c

;前进/后退
Capslock & LButton::																				;Capslock & 鼠标左键 back(上一步)
Send, !{left}
return

Capslock & RButton::																				;Capslock & 鼠标右键 forward(下一步)
Send, !{Right}
return

Space & F::Send, ^e																					;Space & E 调用百度搜索

Space & W::Send,^+{Tab}																				;Space & W 切换到→窗口
Space & R::Send,^{Tab}																				;Space & R 切换到到←窗口

Space & T::Send,^t																					;Space & T 打开新窗口

Space & E::Send,^w																					;Space & E 关闭当前窗口


!F::Send, ^+B																						;Alt + F	搜索书签列表并可以快速打开(需安装插件"书签管理"，默认快捷键：Ctrl + B，建议修改成 Ctrl + Shift + B)

;																									;插件 Holmes，，默认快捷键：Alt + Shift + H

;!G::Send, !G																						;Alt + G	搜索书签(需安装插件 Quick书签菜单，并设置快捷键：Alt + G)

;^+F::Send, ^+F																						;Ctrl + Shift + F	搜索已打开的 Tab 页(需安装插件 Go to Tab，并设置快捷键：Ctrl + Shift + F)

!L::Send, ^+k																						;Alt + L		搜索已打开的 Tab 页(需安装插件 Go to Tab，可从 https://www.crx4chrome.com 或 拓展迷 中下载 )


#If
;======================= # edge浏览器 语境结束{End} ============================						;=== edge浏览器 语境结束{End} =====================




;======================= # 火萤酱/火柴语境开始{Home}==============									;====== 火萤酱/火柴语境开始{Home} =======================
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


Ctrl & Enter::Send,{Tab}{Enter}

CapsLock & Enter::Send,{Tab}{Enter}

#If
;======================= # 火萤酱/火柴语境结束{End}==============									;======火萤酱/火柴语境结束{End}	=======================



;======================= # WPS{Home}==============									;======WPS 语境开始{Home}====
#If WinActive("ahk_exe wps.exe")


Shift & 9::
Send,（）
Send,{Left}
return

Shift & 0::）



#If
;======================= # WPS 语境结束{End}==============									;======WPS 语境结束{End}====



;======================= # WPS看图 语境开始{Home}==============									;======WPS看图 语境开始{Home}====
#If WinActive("ahk_exe photolaunch.exe")

WheelUp::Send, {Up}																			;WheelUp 	↑
WheelDown::Send, {Down}																		;WheelUp 	↓
Ctrl & WheelUp::Send, {+}																	;Ctrl & WheelUp 	放大
Ctrl & WheelDown::Send, {-}																	;Ctrl & WheelDown 	缩小



#If
;======================= # WPS看图 语境结束{End}==============									;======WPS看图 语境结束{End}====


;======================= # 语雀 语境开始{Home}==============									;======语雀 语境开始{Home}====
#If WinActive("ahk_exe 语雀.exe")




$`::
;Send,{Ctrl}{/}
;Send,{Enter}
SendText("``````")
return


CapsLock & 9::
SendInput, {（}
SendInput, {）}
Send,{Left}
return


CapsLock & 0::
SendInput, {）}
return

CapsLock & Space::
SendInput, {-}
SendInput, {Space}
return

#If
;======================= # 语雀 语境结束{End}==============									;====== 语雀 语境结束{End}====




;======================= # 石墨文档 语境开始{Home}==============									;======石墨文档 语境开始{Home}====
#If WinActive("ahk_exe 石墨文档.exe")

	
$`::Send,{``}{``}{``}{Space} 																	;  `			`


CapsLock & Space::
Send,{-}
Send,{Space}
return


CapsLock & 9::
SendInput, {(}
SendInput, {)}
Send,{Left}
return


CapsLock & 0::
SendInput, {)}
return



#If
;======================= # 石墨文档 语境结束{End}==============									;======石墨文档 语境结束{End}====


;======================= # MindManager 语境{Home}==============										;===MindManager 语境{Home}===

#IfWinActive,ahk_exe MindManager.EXE
 
 
 
~Shift & WheelUp::  ; 向左滚动.
	SetScrollLockState, On
	Send {Left}
	SetScrollLockState, off
return
 
~Shift & WheelDown::  ; 向右滚动.
	SetScrollLockState, On
	Send {Right}
	SetScrollLockState, off
return


#IfWinActive
;======================= # MindManager 语境{End}==============										;===MindManager 语境{End}===



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

