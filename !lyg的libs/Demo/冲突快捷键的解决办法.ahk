ProcessExist(exe){			;一个自定义函数,根据自定义函数的返回值作为#if成立依据原GetPID
Process, Exist,% exe
return ErrorLevel
}




;;;;;;;;;;;;;;请把微信快捷键设置为alt+w，且不用担心和现在打开的软件产生冲突;;;;;;;;;;;;;;
$!w::		
  If ProcessExist("WeChat.exe")=0
    {
	Run, D:\Program Files\Internet\Tencent\WeChat\WeChat.exe
	Sleep 300
	WinActivate ahk_class WeChatLoginWndForPC
	WinWaitActive ahk_class WeChatLoginWndForPC, , 3
	;~ if !ErrorLevel
	Sleep 300
	Send ^{Enter}
	}else{
	Send, !w
	SetTimer, SCWAUp, -500			;立即执行并在 500 毫秒后关闭此定时器
	}
	return
