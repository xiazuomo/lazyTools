;~ SciTE交互示例
oSciTE := ComObjActive("SciTE4AHK.Application")

;获取SciTE版本
MsgBox,% oSciTE.Version

;获取SciTE句柄
MsgBox,% oSciTE.SciTEHandle

;获取SciTE用户目录
MsgBox,% oSciTE.UserDir

;获取SciTE安装目录
MsgBox,% oSciTE.SciTEDir

;获取SciTE是否绿色版
MsgBox,% oSciTE.IsPortable

;获取当前文件路径
MsgBox,% oSciTE.CurrentFile

;获取当前文件内容
MsgBox,% oSciTE.Document

;获取当前选中内容
MsgBox,% oSciTE.Selection

;打开一个文件
oSciTE.OpenFile(filename)

;调试一个文件
oSciTE.DebugFile(filename)

;获取已打开文件列表
oTabs := oSciTE.Tabs
oTabs.Array
MsgBox,% oTabs.List
MsgBox,% oTabs.Count

;切换标签
oSciTE.SwitchToTab(tabidx)

;插入文本.省略坐标,则使用光标所在位置
oSciTE.InsertText("Text", pos)

;在输出框中显示文本
oSciTE.Output("OutputText")

;重载配置.可以理解为让修改后的配置生效
oSciTE.ReloadProps()

;看不懂
oSciTE.ResolveProp(propname)

;获取当前platform
oSciTE.ActivePlatform

;设置当前platform
oSciTE.SetPlatform(platform)

;向SciTE发消息
oSciTE.Message(msg , wParam, lParam)

;用 Director interface 方式向SciTE发消息
oSciTE.SendDirectorMsg(message)

;同上,不过有两个返回值
oSciTE.SendDirectorMsgRet(message)

;同上,不过返回的是数组
oSciTE.SendDirectorMsgRetArray(message)

;获取Scintilla的句柄，不是scite的
获取Scintilla句柄()
{

	oSciTE := ComObjActive("SciTE4AHK.Application")
	hEditor:=oSciTE.SciTEHandle
	;Com得到的句柄SciTE的，而需要的是Scintilla的
	;Get handle to focused control
	ControlGetFocus, cSci, ahk_id %hEditor%
	;Check if it fits the class name
	If InStr(cSci, "Scintilla")
	{
		ControlGet, hSci, Hwnd,, %cSci%, ahk_id %hEditor%
		Return, hSci
	}
	Else
		Return, 0
}

;显示出一个自动完成框
;单词用空格分隔，例如"abc bcd"会显示成abc`r`nbcd
SciUtil_Autocompletion_Show(hSci, sText)
{
	; Prepare a local buffer for conversion
	sNewLen := StrPut(sText, "CP" (cp := SciUtil_GetCP(hSci)))
	VarSetCapacity(sTextCnv, sNewLen)

	; Open remote buffer (add 1 for 0 at the end of the string)
	RemoteBuf_Open(hBuf, hSci, sNewLen + 1)

	; Convert the text to the destination codepage
	StrPut(sText, &sTextCnv, "CP" cp)
	RemoteBuf_Write(hBuf, sTextCnv, sNewLen + 1)

	; Call Scintilla to insert the text. SCI_INSERTTEXT
	SendMessage, 2100, 0, RemoteBuf_Get(hBuf),, ahk_id %hSci%

	; Done
	RemoteBuf_Close(hBuf)
}

SciUtil_GetCP(hSci)
{
	; Retrieve active codepage. SCI_GETCODEPAGE
	SendMessage, 2137, 0, 0,, ahk_id %hSci%
	Return ErrorLevel
}