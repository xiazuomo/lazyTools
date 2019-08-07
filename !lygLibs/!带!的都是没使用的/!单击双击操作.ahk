#SingleInstance Force
; 用于统计按键的次数
gnPressCount := 0
$Ctrl::
{
        gnPressCount += 1
        SetTimer, ProcSubroutine, Off
        SetTimer, ProcSubroutine, 300
        Return
}
ProcSubroutine:
{
        ; 在计时器时间触发时, 需要将其关掉
        SetTimer, ProcSubroutine, Off
        If gnPressCount = 1
        {
                ; 第一类行为
                MsgBox, 单击了Ctrl
        }Else If gnPressCount = 2
        {
                ; 第二类行为
                MsgBox,双击了Ctrl
        }Else
        {
                MsgBox, 其他次数
        }
        ; 在结束后, 还需要将 ** 按键的按键次数重置为0, 方便下次继续使用
        gnPressCount := 0
        Return
}