; SciTE4AutoHotkey v3 user autorun script
;
; You are encouraged to edit this script!
;

#NoEnv
#NoTrayIcon
SetWorkingDir, %A_ScriptDir%

/*
智能TAB 开始

说明:
SendInput 发送快捷键是不一定生效的
所以在全部使用 Send 代替

BUG:
逗号左边不能是转义符或者引号
有时会莫名打开文件夹
*/
智能Tab:
	标记 := 0
	oSciTE := ComObjActive("SciTE4AHK.Application")
	SciTE_Hwnd := oSciTE.SciTEHandle
	;随SciTE退出
	WinWaitClose, ahk_id %SciTE_Hwnd%
	ExitApp
Return

;Ctrl+Enter总能跳到下一行
/*
#If !WinExist("ahk_class ListBoxX") and WinActive("ahk_id " . SciTE_Hwnd)
$^Enter::
	Send, {End}
	Send, {Enter}
Return
*/
;自动完成状态下,使用Tab将展开缩略语,并选中第一个参数
#If (标记=0) and WinExist("ahk_class ListBoxX") and WinActive("ahk_id " . SciTE_Hwnd)
~$Tab::
	Send, ^b											;展开缩略语
	Send, ^+{Right}											;在缩略语文件中已经设置过光标位置为单词前,所以这里直接选择下一单词就是了
	标记 := 1
	ToolTip, 智能Tab 已启用
Return

;使用Tab在参数间跳跃
#If  (标记=1) and !WinExist("ahk_class ListBoxX") and WinActive("ahk_id " . SciTE_Hwnd)
$Tab::
	If (oSciTE.Selection<>"")									;当前已有选中文字,则发送右箭头取消选择状态
		Send, {Right}
	Loop,25
	{
		Send, ^+{Right}										;选中右面单词
		选中文本 := oSciTE.Selection								;获取被选中的内容
		If (选中文本="")									;最后一行
		{
			Send, {Right}
			Send, {Enter}
			标记 := 0
			ToolTip,
			Return
		}
		Else If (SubStr(选中文本, 1, 2)="`r`n" or SubStr(选中文本, -1, 2)="`r`n")		;行末
		{
			Send, ^{Left}
			Send, {Enter}
			标记 := 0
			ToolTip,
			Return
		}
		Else If (SubStr(选中文本, 0, 1)=")")							;带闭括号的行末
		{
			Send, {Right}
			Continue
		}
		Else If (SubStr(RTrim(选中文本, " `t`r`n`v`f"), 0, 1)=",")				;逗号后面的参数
		{
			Send, {Right}
			Send, ^+{Right}
			Return
		}
		Else If (Trim(SubStr(选中文本, -3, 4), " `t`r`n`v`f")="in")				;专为 for 设置
		{
			Send, {Right}
			Send, ^+{Right}
			Return
		}
	}
	标记 := 0
	ToolTip,
Return

$NumpadEnter::
$Enter::
	If (oSciTE.Selection<>"")									;当前已有选中文字,则发送右箭头取消选择状态
		Send, {Right}
	Send, !+{End}											;选中文字到行末
	If (SubStr(RTrim(oSciTE.Selection, " `t`r`n`v`f"), 0, 1)=")")					;检查行最后一个非空白字符是否是闭括号,是则补一个闭括号
		Send, )
	Send, {Enter}
	标记 := 0
	ToolTip,
Return
#If
/*
智能TAB 结束
*/