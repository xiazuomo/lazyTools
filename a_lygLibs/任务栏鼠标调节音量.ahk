;===========任务栏调节音量(方法一.方法二在文末)=======
~lbutton & enter::
exitapp
~WheelUp::
if (existclass("ahk_class Shell_TrayWnd")=1)
Send,{Volume_Up}
;if (existclass("ahk_class QWidget")=1)
;Send,{Volume_Up}
Return

~WheelDown::
if (existclass("ahk_class Shell_TrayWnd")=1)
Send,{Volume_Down}
;if (existclass("ahk_class QWidget")=1)
;Send,{Volume_Down}
Return

~MButton::
if (existclass("ahk_class Shell_TrayWnd")=1)
Send,{Volume_Mute}
;if (existclass("ahk_class QWidget")=1)
;Send,{Volume_Mute}
Return
Existclass(class)
{
MouseGetPos,,,win
WinGet,winid,id,%class%
if win = %winid%
Return,1
Else
Return,0
}
;===========任务栏调节音量End=======







