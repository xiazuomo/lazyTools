;============使用Ctrl + Shift + C 复制文件夹/文件的路径Home==============================
^+c::
	Clipboard =
	Send,^c
	ClipWait
	path = %Clipboard%
	Clipboard = %path%
	ToolTip,%path%
	Sleep,1000
	ToolTip
	MsgBox, 0, Title, 路径复制成功, 0.66
	;弹出:路径复制成功，3秒后消失。
	;MsgBox %path%		;显示复制的路径
return
;============复制文件夹/文件的路径End==============================
