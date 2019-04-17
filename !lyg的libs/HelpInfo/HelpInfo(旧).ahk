#SingleInstance Force
#NoTrayIcon
;#NoEnv
;#InstallKeybdHook
;#InstallMouseHook
SetWorkingDir %A_ScriptDir%
;FileEncoding, utf-8
;SetDefaultMouseSpeed,0
;MsgBox ,,,Unlocker,0.5
bShowed := false
global g_InputArea := "Edit1"
global g_AllContent =
global g_HelperFoler := "HelperInfo"
global g_TCOn := TCMatchOn("Lib/TCMatch/tcmatch64.dll")


Hotkey, IfWinActive, KeyHelper ahk_class AutoHotkeyGUI
	
	Hotkey, ^2, EscFunction
	HotKey, d, NextItem
	HotKey, e, PreviousItem
	HotKey, g, NextPage
	HotKey, a, PreviousPage; Generated using SmartGUI Creator for SciTE
Gui, Show, w479 h379, Untitled GUI
return

GuiClose:
ExitApp
	
	;HotKey, ^j, NextItem
	;HotKey, ^k, PreviousItem
	;HotKey, ^f, NextPage
	;HotKey, ^b, PreviousPage
	
Return

;Ctrl+PrintScreen
;^PrintScreen::
^1::															;使用快捷键--Ctrl + 1启动"帮助"功能
global g_HelperFoler := "HelperInfo"
WinGetActiveTitle , Title
WinGet, strProcessName, ProcessName, A
IfWinExist KeyHelper ahk_class AutoHotkeyGUI
{
		Gui, Destroy
		Gui, Cancel
		Return
}
;filename := g_HelperFoler "`\" strProcessName ".hlp"
;MsgBox, % FileExist(filename) "`r" filename
IfExist, %g_HelperFoler%\%strProcessName%.hlp
{
		;str =
		;Loop, Read, %strProcessName%.hlp
		;{
			;str = %str%`r%A_LoopReadLine%
		;}
		;bShowed := true
		;ToolTip %str%,0,0
	g_AllContent = 
	Gui, KeyHelper:New, -caption -border,KeyHelper
	Gui, Font, s18 cRed Bold, 楷体
	Gui, Color, cfcfcf
	Gui, KeyHelper:Add, ListView, Backgroundfcfc00 -Multi -Hdr x0 y0 r21 w1000 vKeyHelperListView, Keys|Description
		;str = 
	Loop, Read, %g_HelperFoler%\%strProcessName%.hlp
	{
			;str = %str%`r`n%A_LoopReadLine%
		g_AllContent .= "`r`n" A_LoopReadLine
			;pos := InStr(A_LoopReadLine, "`t")
		;LV_Add("", SubStr(A_LoopReadLine, 1, pos-1), SubStr(A_LoopReadLine, pos+1))
	}
	
	g_AllContent := SubStr(g_AllContent, 3)
	KH_DisplayResult(g_AllContent)
	Gui, KeyHelper:Add, Edit, w1000 x0 y592 vMyEditFilter gKH_ProcessInputCommand -WantReturn
	Gui, Show
	Winset, TransColor, cfcfcf, KeyHelper ahk_class AutoHotkeyGUI
	ControlFocus, %g_InputArea% , KeyHelper ahk_class AutoHotkeyGUI ahk_exe AutoHotkeyU64.exe
}Else{				;如果不存在该软件的快捷键帮助，则使用全局的快捷键帮助。
	;MsgBox, No Help File for "%strProcessName%"
	;%strProcessName% := global.exe.hlp
	
	g_AllContent = 
	Gui, KeyHelper:New, -caption -border,KeyHelper
	Gui, Font, s18 cRed Bold, 楷体
	Gui, Color, cfcfcf
	Gui, KeyHelper:Add, ListView, Backgroundfcfc00 -Multi -Hdr x0 y0 r21 w1000 vKeyHelperListView, Keys|Description
		
	Loop, Read, global.exe.hlp
	{
		g_AllContent .= "`r`n" A_LoopReadLine
	}
	
	g_AllContent := SubStr(g_AllContent, 3)
	KH_DisplayResult(g_AllContent)
	Gui, KeyHelper:Add, Edit, w1000 x0 y592 vMyEditFilter gKH_ProcessInputCommand -WantReturn
	Gui, Show
	Winset, TransColor, cfcfcf, KeyHelper ahk_class AutoHotkeyGUI
	ControlFocus, %g_InputArea% , KeyHelper ahk_class AutoHotkeyGUI ahk_exe AutoHotkeyU64.exe
	
}
	;IfInString , Title , `.ahk
Return
GuiClose:
	TCMatchOff()
	ExitApp
	Return
KH_DisplayResult(text){
	LV_Delete()
	Loop, Parse, text, "`n", "`r"
	{
		pos := InStr(A_LoopField, "`t")
		LV_Add("", SubStr(A_LoopField, 1, pos-1), "☑ " + SubStr(A_LoopField, pos+1))
	}
	LV_ModifyCol(1,280)
	;Gui, Submit,
}
KH_FilterResult(text, needle){
	res = 
	Loop, Parse, text, "`n", "`r"
	{
		If TCMatch(A_LoopField, needle){
			res .= "`r`n" A_LoopField
		}
	}
	res := RegExReplace(res, "^[`r`n `t]+")
	;if (res = "")
		;res := text
	return res
}
KH_ProcessInputCommand:
	ControlGetText, g_CurrentInput, %g_InputArea%
	KH_DisplayResult(KH_FilterResult(g_AllContent, g_CurrentInput))
	Return
EscFunction:
	ControlGetText, g_CurrentInput, %g_InputArea%
	If (g_CurrentInput != ""){
		ControlSetText, %g_InputArea%, , %g_WindowName%
		ControlFocus, %g_InputArea%
	}Else{
		Gui, KeyHelper:Destroy
		
		;TCMatchOff()
		;ExitApp
	}
	Return

GuiClose(){
	msgbox guiclose
}

NextItem:
	ControlFocus, SysListView321
	Send {Down}
	ControlFocus, Edit1
	return
PreviousItem:
	ControlFocus, SysListView321
	Send {Up}
	ControlFocus, Edit1
	return
NextPage:
	ControlFocus, SysListView321
	Send {PgDn}
	ControlFocus, Edit1
	return
PreviousPage:
	ControlFocus, SysListView321
	Send {PgUp}
	ControlFocus, Edit1
	return
#include %A_ScriptDir%\Lib\TCMatch.ahk