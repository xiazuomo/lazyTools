;单双击操作]

#SingleInstance Force
; 用于统计按键的次数
gnPressCountG := 0
CapsLock & G::
{
	gnPressCountG += 1
	SetTimer, ProcSubroutineG, Off
	SetTimer, ProcSubroutineG, 100
	return
}
ProcSubroutineG:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineG, Off
		if gnPressCountG = 1
		{
			; 第一类行为
			Send, +{End}
			Sleep 666
		}else if gnPressCountG = 2
		{
			; 第二类行为
			Send, +{End}^c
			Sleep 666
		}
		else
		{
			;MsgBox, 其他次数
			Send,+{End}^c
			Sleep 666

			
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountG := 0
		return
	} 


/*
使用Capslock & D
单击: 复制当前行
双击: 复制当前行，并粘贴

*/

/*
#SingleInstance Force
; 用于统计按键的次数
gnPressCountD:= 0
CapsLock & D::
{
	gnPressCountD += 1
	SetTimer, ProcSubroutineD, Off
	SetTimer, ProcSubroutineD, 300
	return
}
ProcSubroutineD:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineD, Off
		if gnPressCountD = 1
		{
			; 第一类行为
			Send, {Home}+{End}^c                                             ;复制当前行内容
			Sleep,1000
		}else if gnPressCountD = 2
		{
			;第二类行为
			Send, {Home}+{End}^c                                             ;复制当前行内容
			Send, {End}{Enter}^v                                                            ;复制当前行内容
			Sleep,1000
		}else
		{
			Sleep 100
			;Send, {Home}+{End}^c                                             ;复制当前行内容
			;Send, {End}{Enter}^v                                                            ;复制当前行内容
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountD := 0
		return
	}
	*/
;========Ctrl + D=====================




;========Ctrl + B===========
;CapsLock & b::Send, {End}{Enter}														;直接换行

/*
CapsLock & B的功能
单击: 直接换行;
双击: 添加多行注释
*/

/*
gnPressCountB := 0
CapsLock & B::
{
	gnPressCountB += 1
	SetTimer, ProcSubroutineB, Off
	SetTimer, ProcSubroutineB, 300
	return
}
ProcSubroutineB:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineB, Off
		if gnPressCountB = 1
		{
			; 第一类行为，直接换行(跳到下一行)
			Send, {End}{Enter}														;直接换行
			Sleep 100
		}else if gnPressCountB = 2
		{
			; 第二类行为，添加多行注释  Ctrl Shift /
			Send,{Home}{Enter}
			Sleep 100
		}else
		{
			;MsgBox, 其他次数
			Send,^+/
			Sleep 100
		}
	; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
	gnPressCountB := 0
return
}
*/

/*
;CapsLock & q:: Send, ^{BS}              ; q = Del word before;
;单击: 删除一个单词
;双击: {Esc}


*/

/*
gnPressCountQ := 0
CapsLock & Q::
{
	gnPressCountQ += 1
	SetTimer, ProcSubroutineQ, Off
	SetTimer, ProcSubroutineQ, 300
	return
}
ProcSubroutineQ:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineQ, Off
		if gnPressCountQ = 1
		{
			; 第一类行为
			;MsgBox, 单击了Ctrl
			Send, ^{BS}
			Sleep 100
		}else if gnPressCountQ = 2
		{
			; 第二类行为
			;取消输入(对输入法输入错误内容时可以直接取消输入操作)
			Send,{Esc}
			Sleep 100
		}
		{
			;MsgBox, 其他次数
			Send,{Esc}
			Sleep 100
		}
	; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
	gnPressCountQ := 0
return
}
*/







;=======快速移动==========
/*
s、f
j、l
u、o
======
i↑
k↓
*/


/*
使用Capslock & S
单击: 快速→移*4，并保存
双击:快速→移到行首，并保存
*/

/* 
#SingleInstance Force
; 用于统计按键的次数
gnPressCountS := 0
CapsLock & s::
{
	gnPressCountS += 1
	SetTimer, ProcSubroutine, Off
	SetTimer, ProcSubroutine, 300
	return
}
ProcSubroutine:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutine, Off
		if gnPressCountS = 1
		{
			; 第一类行为
			Send, ^{Left}^s 
			;Send,{Left}{Left}{Left}{Left}{Left}{Left}^s 					;s 左移4,并保存。常常和CapsLock&J/L一起配合使用
			Sleep 666
		}else if gnPressCountS = 2
		{
			; 第二类行为
			Send,{Home}
			Sleep 666
		}else
		{
			;MsgBox, 其他次数
			Send,+{Home}^c
			Sleep 666
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountS := 0
		return
	}
 */

/*
使用Capslock & f
单击: 快速→移*8，并保存
双击:快速→移到行首，并保存
*/


/* 
#SingleInstance Force
; 用于统计按键的次数
gnPressCountF := 0
CapsLock & F::
{
	gnPressCountF += 1
	SetTimer, ProcSubroutineF, Off
	SetTimer, ProcSubroutineF, 100
	return
}
ProcSubroutineF:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineF, Off
		if gnPressCountF = 1
		{
			; 第一类行为
			;Send, {Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}                ;f 右移8，为了更好的发挥它的威力，常常和CapsLock&J/L一起配合使用
			Send, ^{Right}
			Sleep 666
		}else if gnPressCountF = 2
		{
			; 第二类行为
			Send,{End}
			Sleep 666
		}
		else
		{
			;MsgBox, 其他次数
			Send,+{End}^c
			Sleep 666

			
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountF := 0
		return
	} 
*/
;==============================
;==============================
;==============================


/*
使用Capslock & J
单击: ←移
双击:快速←移
*/


/* 
#SingleInstance Force
; 用于统计按键的次数
gnPressCountJ := 0
CapsLock & J::
{
	gnPressCountJ += 1
	SetTimer, ProcSubroutineJ, Off
	SetTimer, ProcSubroutineJ, 300
	return
}
ProcSubroutineJ:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineJ, Off
		if gnPressCountJ = 1
		{
			; 第一类行为
			Send,{Left}                                                                  					;J 左移
			Sleep 100
		}else if gnPressCountJ = 2
		{
			; 第二类行为
			Send, ^{Left}
			Sleep 100
		}else
		{
			;MsgBox, 其他次数
			Send,{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}
			Sleep 100
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountJ := 0
		return
	}
 */

/*
使用Capslock & L
单击: →移
双击:快速→移
*/

/* 
#SingleInstance Force
; 用于统计按键的次数
gnPressCountL := 0
CapsLock & L::
{
	gnPressCountL += 1
	SetTimer, ProcSubroutineL, Off
	SetTimer, ProcSubroutineL, 300
	return
}
ProcSubroutineL:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineL, Off
		if gnPressCountL = 1
		{
			; 第一类行为
			Send,{Right}                                                                  					;L→移
			Sleep 100
		}else if gnPressCountL = 2
		{
			; 第二类行为
			Send, ^{Right}
			Sleep 100
		}else
		{
			Send,{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}
			Sleep 100
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountL := 0
		return
	}
 */
;================================
;================================
/*
使用Capslock & U
单击: ←移
双击:快速←移
*/
/*
#SingleInstance Force
; 用于统计按键的次数
gnPressCountU := 0
CapsLock & U::
{
	gnPressCountU += 1
	SetTimer, ProcSubroutineU, Off
	SetTimer, ProcSubroutineU, 300
	return
}
ProcSubroutineU:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineU, Off
		if gnPressCountU = 1
		{
			; 第一类行为
			;MsgBox, 单击了Ctrl
			Send,{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}                                                             					;J 左移
			Sleep 100
		}else if gnPressCountU = 2
		{
			; 第二类行为
			;MsgBox,双击了Ctrl
			Send,{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}
			Sleep 100
		}else
		{
			;MsgBox, 其他次数
			Send,{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}{Left}
			Sleep 100
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountU := 0
		return
	}

*/

/*
使用Capslock & O
单击: →移
双击:快速→移
*/
/*
#SingleInstance Force
; 用于统计按键的次数
gnPressCountO := 0
CapsLock & O::
{
	gnPressCountO += 1
	SetTimer, ProcSubroutineO, Off
	SetTimer, ProcSubroutineO, 300
	return
}
ProcSubroutineO:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineO, Off
		if gnPressCountO = 1
		{
			; 第一类行为
			;MsgBox, 单击了Ctrl
			Send,{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}
			Sleep 100
		}else if gnPressCountO = 2
		{
			; 第二类行为
			;MsgBox,双击了Ctrl
			Send,{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}
			Sleep 100
		}else
		{
			;MsgBox, 其他次数
			Send,{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}{Right}
			Sleep 100
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountO := 0
		return
	}
	*/
;================================
;================================

/*
使用Capslock & i
单击: ↑移
双击:快速↑移
*/

/*
#SingleInstance Force
; 用于统计按键的次数
gnPressCountI := 0
CapsLock & I::
{
	gnPressCountI += 1
	SetTimer, ProcSubroutineI, Off
	SetTimer, ProcSubroutineI, 300
	return
}
ProcSubroutineI:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineI, Off
		if gnPressCountI = 1
		{
			; 第一类行为
			;MsgBox, 单击了Ctrl
			Send, {Up}
			Sleep 100
		}else if gnPressCountI = 2
		{
			; 第二类行为
			;MsgBox,双击了Ctrl
			Send, {Up}{Up}{Up}{Up}
			Sleep 100
		}else
		{
			;MsgBox, 其他次数
			Send, {Up}{Up}{Up}{Up}
			Sleep 100
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountI := 0
		return
	}
*/



/*
使用Capslock & K
单击: ↓移
双击:快速↓↓↓移
*/

/*
#SingleInstance Force
; 用于统计按键的次数
gnPressCountK := 0
CapsLock & K::
{
	gnPressCountK += 1
	SetTimer, ProcSubroutineK, Off
	SetTimer, ProcSubroutineK, 300
	return
}
ProcSubroutineK:
	{
		; 在计时器时间触发时, 需要将其关掉
		SetTimer, ProcSubroutineK, Off
		if gnPressCountK = 1
		{
			; 第一类行为
			;MsgBox, 单击了Ctrl
			Send, {Down}
			Sleep 100
		}else if gnPressCountK = 2
		{
			; 第二类行为
			;MsgBox,双击了Ctrl
			Send, {Down}{Down}{Down}{Down}
			Sleep 100
		}else
		{
			;MsgBox, 其他次数
			Send, {Down}{Down}{Down}{Down}
			Sleep 100
		}
		; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
		gnPressCountK := 0
		return
	}
	*/






