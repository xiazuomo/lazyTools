;###################绕过中文输入法发送文本的3种方法######################
;==============https://www.jianshu.com/p/e5b1ea126a8f===============
SendText(var_string){
    local
sendinput {text}%var_string%
return
}  
;###################绕过中文输入法发送文本的3种方法######################




;# AHK-J004-示例1
::/ahkgl::
temp0=
(
 
)
temp=
(
autohotkey
 
)
SendText(temp0)
SendText(temp)
Sleep 5
Send,{Up}
return

