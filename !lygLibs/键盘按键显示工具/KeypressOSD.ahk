; KeypressOSD.ahk

;----------------------------------------------------------
;   			KeypressOSD v1.00
; Author    : tmplinshi
; Date      : 2013-10-11
; Tested on : Windows XP SP3 / AutoHotkey v1.1.13.00
; Thanks    : HotShow.ahk by RaptorX (http://www.autohotkey.com/board/topic/51641-hotshow-10-osd-hotkeys-for-video-tutorials/)
;----------------------------------------------------------

#SingleInstance force
#NoEnv
SetBatchLines, -1
ListLines, Off


; #################################
;		Settings
; #################################
;
transN        := 200
ShowSingleKey := True
DisplayTime   := 800


; #################################
;		Create GUI
; #################################
;
Gui, +AlwaysOnTop -Caption +Owner +LastFound +E0x20
Gui, Margin, 0, 0
Gui, Color, Black
Gui, Font, cWhite s50 bold, Arial
Gui, Add, Text, vHotkeyText Center y20
WinSet, Transparent, %transN%


; #################################
;		Create hotkey
; #################################
;
Loop, 95
	Hotkey, % "~*" Chr(A_Index + 31), Display

Loop, 24 ; F1-F24
	Hotkey, % "~*F" A_Index, Display

Loop, 10 ; Numpad0 - Numpad9
	Hotkey, % "~*Numpad" A_Index - 1, Display

Otherkeys := "NumpadDiv|NumpadMult|NumpadAdd|NumpadSub|NumpadEnter|Tab|Enter|Esc|BackSpace|Del|Insert|Home|End|PgUp|PgDn|Up|Down|Left|Right|ScrollLock|CapsLock|NumLock|Pause"
Loop, parse, Otherkeys, |
	Hotkey, % "~*" A_LoopField, Display
return

^!MButton::ShowSingleKey := !ShowSingleKey	; Toggle ShowSingleKey


; #################################
;		Display
; #################################
;
Display:
	If (A_ThisHotkey = "")
		Return

	mods   := "Ctrl|Shift|Alt|LWin|RWin"
	prefix := ""

	Loop, Parse, mods, |
		if GetKeyState(A_LoopField)
			prefix .= A_LoopField " + "

	if (!prefix && !ShowSingleKey)
		return

	key := SubStr(A_ThisHotkey, 3)
	if (key = " ")
		key := "Space"

	if ( ShowHotkey(prefix key) = "Error" )
		Return
	NewHotkeyPressed := True
	SetTimer, FadeOut, -1
Return

FadeOut:
	Gui, +LastFound

	Loop
	{
		NewHotkeyPressed := False
		WinSet, Transparent, % transN
		Sleep, %DisplayTime%

		Loop, % transN
		{
			if NewHotkeyPressed
				Break

			WinSet, Transparent, % (A_Index - transN) * -1
		}

		if !NewHotkeyPressed
			Break
	}

	Gui, Hide
Return

; ===================================================================================
ShowHotkey(Hotkey)
{
	GuiControl,, HotkeyText, %Hotkey%

	WinGetPos, ActWin_X, ActWin_Y, ActWin_W, ActWin_H, A
	if !ActWin_W
		Return "Error"

	text_w := ActWin_W, gui_y := (ActWin_Y+ActWin_H) - 115 - 50
	GuiControl, Move, HotkeyText, w%text_w% Center

	Gui, Show, NoActivate x%ActWin_X% y%gui_y% h115 w%text_w%
}