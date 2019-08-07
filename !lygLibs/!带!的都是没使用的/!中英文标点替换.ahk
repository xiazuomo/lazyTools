;中英文标点 替换


;英文状态		-->		中文状态

; 英文  , --> ，
::,`;::
SendbyClip("，")
return


; 英文  . --> 。
::.`;::
SendbyClip("。")
return


; 英文  ? --> ？
::?`;::
SendbyClip("？")
return


; 英文 :  --> ：
::`:`;:::
SendbyClip("：")
return


::。`;::
SendbyClip(">")
return


;https://www.xuebuyuan.com/1643780.html
;# 英文标点和中文标点 一键切换。
;		https://www.xuebuyuan.com/1643780.html
;# eg. 当你想输出中文状态的"句号"时却因为在英文状态下，得到了一个"."。这时，你要做的不是删除并重新输入，而是在.的基础上输入";"，再点击"tab"，即可得到"。"
sendbyclip(var_string)

{

    ClipboardOld = %ClipboardAll%

    Clipboard =%var_string%

    sleep 100

    send ^v

    sleep 100

    Clipboard = %ClipboardOld%  ; Restore previous contents of clipboard.

}

;===============================

SelectLeftSpaceChar()

{

    autotrim off

    ClipboardOld := ClipboardAll

    Clipboard = $error$

    send {shift down}{left}{shift up}

    send ^c

    clipwait

    if Clipboard = $error$

    {

        return            ;; 如果没有选中内容，则返回

    }

    ifInString clipboard, `n

    {

        send {down}                     ;; 如果选中的是回车符号，那么向下退回原位

    }

    else if Clipboard is not space

    {

        send {right}                    ;; 如果选中了一个非空白字符，则向右退回原位

    }

    Clipboard := ClipboardOld

    autotrim on

}

;===============================

::、；::
SendbyClip("/")
return

::、`;::
SendbyClip("/")
return








::/`;::
SendbyClip("、")
return


::、`;::
SendbyClip("/")
return




/*
::'';::     ;; 输入''加分号输出“”

    SelectLeftSpaceChar()

    SendbyClip("“”")

    send {left}

    return
*/
	

	;思维拓展:    输入英文状态下的: 得到中文状态下的：
