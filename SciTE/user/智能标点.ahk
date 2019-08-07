#NoEnv

;在非注释区，标点总是英文
;在注释区，标点总是中文
智能标点:
	oSciTE := ComObjActive("SciTE4AHK.Application")
	SciTE_Hwnd := oSciTE.SciTEHandle
	ime:=new 智能标点()
	ime.切换输入法标点状态()
	;随SciTE退出
	WinWaitClose, ahk_id %SciTE_Hwnd%
	ExitApp
Return

;分别对应行注释的“；”
;块注释开头的“*”结尾的“/”
;以及回车
#If !WinExist("ahk_class ListBoxX") and WinActive("ahk_id " . SciTE_Hwnd)
$;::
$NumpadMult::
$+8::
$NumpadDiv::
$/::
$Enter::
$NumpadEnter::
	ime.确认位置信息已更新(A_ThisHotkey)
	Style:=ime.切换输入法标点状态()
Return
#If

#If (Style="非注释")
;按键本身就是符号
$`::ime.发送原意字符("``")
$[::ime.发送原意字符("[")
$]::ime.发送原意字符("]")
$'::ime.发送原意字符("'")
$\::ime.发送原意字符("\")
$,::ime.发送原意字符(",")
$.::ime.发送原意字符(".")
$/::ime.发送原意字符("/")
;shift与按键组合的符号
$+1::ime.发送原意字符("!")
$+4::ime.发送原意字符("$")
$+6::ime.发送原意字符("^")
$+9::ime.发送原意字符("(")
$+0::ime.发送原意字符(")")
$+-::ime.发送原意字符("_")
$+;::ime.发送原意字符(":")
$+'::ime.发送原意字符("""")
$+,::ime.发送原意字符("<")
$+.::ime.发送原意字符(">")
$+/::ime.发送原意字符("?")
;可能引起 非注释 —— 注释 状态的改变，所以需要单独处理
$;::
	ime.确认位置信息已更新(A_ThisHotkey,1)
	Style:=ime.切换输入法标点状态()
Return
#If

;作用是在非注释中自动将输入法的标点设置改为英文
;在注释中自动将标点设置改为中文
class 智能标点
{
	Static hSci,symbol_original

	;获取Scintilla的hwnd
	__New()
	{
		oSciTE := ComObjActive("SciTE4AHK.Application")
		hEditor:=oSciTE.SciTEHandle
		;Com得到的句柄SciTE的，而需要的是Scintilla的
		;Get handle to focused control
		ControlGetFocus, cSci, ahk_id %hEditor%
		;Check if it fits the class name
		If InStr(cSci, "Scintilla")
			ControlGet, hSci, Hwnd,, %cSci%, ahk_id %hEditor%
		Else
			Return, 0
		智能标点.hSci:=hSci
		Return,	this
	}

	;高亮风格为1时，代表此位置为行注释
	;高亮风格为2时，代表此位置为块注释
	;高亮风格的定义，在lpp.style文件中
	;存在一点问题，假设一个快捷键*会激活这个函数
	;假设当前坐标是100，当按下*后，坐标应该变为101
	;但如果此时通过SCI_GETCURRENTPOS得到的坐标依然是100，再代入SCI_GETSTYLEAT
	;返回值将永远是0
	获取当前位置语法高亮风格()
	{
		hSci:=智能标点.hSci
		;~ SCI_GETCURRENTPOS  2008
		;~ SCI_GETSTYLEAT  2010
		SendMessage, 2008, 0, 0, , ahk_id %hSci%
		SendMessage, 2010, ErrorLevel, 0, , ahk_id %hSci%
		Return, ErrorLevel
	}

	;注释状态时重启输入法，这样就总是中文标点状态了
	;获取其它进程的输入法状态是很恼火的事情，快捷键又只能切换状态，所以只能才用这么落后的方式来实现
	切换输入法标点状态()
	{
		Static Style_Last
		Style:=this.获取当前位置语法高亮风格()
		If (Style=1 or Style=2)
			Style:="注释"
		Else
			Style:="非注释"
		If (Style<>Style_Last)
		{
			Style_Last:=Style
			If (Style="注释")
			{
				;为了避免对标点状态进行获取
				;先关闭，再重新激活搜狗，这样默认就是中文标点
				SwitchIME(0x804)
				SwitchIME("E0200804")
			}
		}
		Return, Style
	}
	
	;当一个字符被输入后，可能由于“Scintilla”来不及处理，会造成字符输入了，但位置信息没有更新
	;此时如果获取该位置的style，就会返回0
	;当一个字符被输入后，如果位置信息被正确更新，则style总会返回正确的值
	确认位置信息已更新(Hotkey,发送原意字符:=0)
	{
		hSci:=智能标点.hSci
		SendMessage, 2008, 0, 0, , ahk_id %hSci%
		Pos:=ErrorLevel
		StringReplace, Hotkey, Hotkey, $, , All
		If (发送原意字符=1)
			this.发送原意字符(Hotkey)
		Else
			Send, {%Hotkey%}				;添加花括号会被解析为功能键。注意：{Enter}和Enter是不同的，{/}和/是相同的
		Loop
		{
			SendMessage, 2008, 0, 0, , ahk_id %hSci%
			If (ErrorLevel<>Pos)
				Break
			Else
				Sleep, 50
		}
		Return, 1
	}
	
	;因为send在输入法开启的状态下，总会调用输入法来输入
	;比如send“`”在输入法开启且是中文标点的情况下，最终结果总是“·”
	;所以最后才用粘贴的方式来实现输入原意字符
	发送原意字符(字符)
	{
		ClipSaved := ClipboardAll				; 把剪贴板的所有内容保存到您选择的变量中.
		Clipboard:=字符
		Send, ^v
		Clipboard := ClipSaved				; 恢复剪贴板为原来的内容. 注意这里使用 Clipboard (不是 ClipboardAll).
		Return, 1
	}
}

SwitchIME(dwLayout)
{
	HKL:=DllCall("LoadKeyboardLayout", "Str", dwLayout, "UInt", 1)
	ControlGetFocus,ctl,A
	SendMessage,0x50,0,HKL,%ctl%,A
}