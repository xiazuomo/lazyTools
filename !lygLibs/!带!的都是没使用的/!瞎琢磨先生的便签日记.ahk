;瞎琢磨先生的便签笔记
;感谢河许人 --九宫格笔记本的原作者


#NoEnv
;#Warn
#SingleInstance Force
SetBatchLines, -1
SetWorkingDir %A_ScriptDir%

;~ #Include, %A_ScriptDir%\Gdip.ahk

;定义全局变量
global Plan,Success,Persist,Important,health,Money,friend,Innovate,Today,FileName,PlanFile


;=======笔记的保存目录
;static lastChooseTime:="C:\Users\Administrator\Desktop\临时文件夹\我的便签笔记"
	
	
	
	
;~ ;启动gdip
;~ If !pToken := Gdip_Startup()
;~ {
;~ MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
;~ ExitApp
;~ }

;~ Width := 1050, Height := 788

Gui, 1:-DPIScale -Caption ;   +ToolWindow +AlwaysOnTop +OwnDialogs  +E0x80000 +LastFound

Gui,Font,s18 C808080,华文行楷
Gui Add, Text, x362 y10 w332 h20  cred CEnter, 瞎琢磨先生的便签笔记



Gui,Font,s14 C808080,华文行楷
Gui Add, Text, x20 y43 w342 h20 cblue gPlanlab CEnter, %A_MM%月计划
Gui Add, Text, x20 y264 w342 h20  cblue CEnter, 相信坚持的力量
Gui Add, Text, x362 y43 w342 h20  cblue CEnter, 每日清单

Gui Add, Text, x362 y264 w342 h20 cred  vChooseTime CEnter, %A_YYYY%年%A_MM%月%A_DD%日

Gui Add, Text, x700 y43 w342 h20 cblue CEnter, 闪念胶囊
Gui Add, Text, x700 y264 w342 h20 cblue CEnter, 临时存放

Gui,font
Gui,Font,s12,华文新魏
Gui Add, Edit, x20 y63 w332 h198 vPlan -0x200000 , 本月计划 `n`n 1:  `n 2:  `n 3:  
Gui Add, Edit, x20 y284 w332 h198 vSuccess -0x200000, 坚持做正确的事，而不是做简单的事`n`n 阅读 `n 写作 `n 早起 `n 早睡 `n 跑步
Gui Add, Edit, x362 y63 w332 h198 vImportant -0x200000, 今日必做`n`n1: `n2: `n3: 

Gui Add,MonthCal , x362 y284 w240 h198 gClickTime vtoday 16

Gui,font

Gui,Font,s34.5 C808080,方正舒体
Gui,Add, Text, x602 y274 w92 h198 v生之时 gGTD,陽光不銹
Gui,Font

Gui,Font,s12,华文新魏

Gui Add, Edit, x700 y63 w332 h198 vMoney -0x200000, #瞎琢磨先生の闪念# `n`n 1:  `n 2: `n 3:  `n 4:  
Gui Add, Edit, x700 y284 w332 h198 vfriend -0x200000, 临时存放、`n乱七八糟`n

Gui,Font

Gui, Font, s13,华文行楷
;Gui, Add, Text, x888 y466 c808080, 因为微笑，所以快乐! -- 瞎琢磨先生
;Gui, Add, Text, x765 y466 cgreen, 因为微笑，所以快乐! -- 瞎琢磨先生
Gui, Add, Text, x65 y496 cgreen, 因为微笑，所以快乐! -- 瞎琢磨先生
Gui,font

Gui, Font, underline s12,华文新魏
Gui, Add, Text, x600 y496  cblue gLaunchAutoAHK, 智能热键工作室出品、感谢河许人 --九宫格笔记本的原作者
Gui,font

Gui,1:Show,NA,我的九宫格



Menu,Tray,NoStandard
Menu,Tray,Add,关于
Menu,Tray,Add,关闭


IfExist,%A_YYYY%%A_MM%%A_DD%
{
	Today:=A_YYYY A_MM A_DD
	显示笔记(Today)
}


;~ Gui,Show, w1050 h768, My Life

Hotkey, ^!z, 调出九宫
Hotkey, ^!x, 关闭
Hotkey, ^!c, GuiClose
; By placing this OnMessage here. The function WM_LBUTTONDOWN will be called every time the user left clicks on the gui
OnMessage(0x201, "WM_LBUTTONDOWN")


return


GuiEscape:
GuiClose:
	Gui Submit
	保存笔记()
	Gui,Destroy
return

; End of the GUI section

Planlab:

return

ClickTime:
	Gui,Submit,NoHide
	保存笔记()
	IfExist,%Today%
	{
		显示笔记(Today)
	}
	else
	{
		;MsgBox, 0, 标题, 想要输出的话, 多长时间(秒)消失
		MsgBox, 0, 便签笔记.ahk , 咦? 笔记为空??,0.678
	}

return


;#######################################################################

; This function is called every time the user clicks on the gui
; The PostMessage will act on the last found window (this being the gui that launched the subroutine, hence the last parameter not being needed)
WM_LBUTTONDOWN()
{
	PostMessage, 0xA1, 2
}

;#######################################################################

调出九宫:
	Reload
return

保存笔记()
{
	;便签日记保存的路径
	static lastChooseTime:="C:\Users\Administrator\Desktop\临时文件夹\我的便签笔记"
	FileCreateDir,%lastChooseTime%

	FileName= %lastChooseTime%\本月计划.txt
	PlanFile:=FileOpen(FileName,"w")
	PlanFile.Write(Plan)
	Planfile.Close()

	FileName= %lastChooseTime%\坚持的力量.txt
	PlanFile:=FileOpen(FileName,"w")
	PlanFile.Write(Success)
	Planfile.Close()



	FileName= %lastChooseTime%\今日清单.txt
	PlanFile:=FileOpen(FileName,"w")
	PlanFile.Write(Important)
	Planfile.Close()




	FileName= %lastChooseTime%\闪念胶囊.txt
	PlanFile:=FileOpen(FileName,"w")
	PlanFile.Write(Money)
	Planfile.Close()


	FileName= %lastChooseTime%\临时存放.txt
	PlanFile:=FileOpen(FileName,"w")
	PlanFile.Write(friend)
	Planfile.Close()


	IfExist,%Today%
	{
		lastChooseTime:=Today
	}
}

显示笔记(Today)
{
	FileRead, Plan, %Today%\本月计划.txt
	GuiControl,, Plan, %Plan%

	FileRead, Success, %Today%\坚持的力量.txt
	GuiControl,, Success, %Success%



	FileRead, Important, %Today%\今日清单.txt
	GuiControl,, Important, %Important%



	FileRead, Money, %Today%\闪念胶囊.txt
	GuiControl,, Money, %Money%

	FileRead, friend, %Today%\临时存放.txt
	GuiControl,, friend, %friend%



	GuiControl,,ChooseTime,% SubStr(Today,1,4) "年" SubStr(Today,5,2) "月" SubStr(Today,7,2) "日"
}

关于:
	MsgBox, 0, 说明, 本便签由瞎琢磨先生改造河许人的代码而来，在此鸣谢。`n 快捷键: `n ctrl+alt+z=唤出神龙 `n ctrl+alt+c=打入冷宫  `n ctrl+alt+X=再也不见 `n历史笔记直接在日历中选择就可以啦! ,100
return

关闭:
	Gui Submit
	保存笔记()
	Gui,Destroy
	WinKill,Drozd_zegar
	ExitApp

LaunchAutoAHK:
	Run,https://www.autoahk.com/
return

GTD:

	Run,生之时.exe
return


