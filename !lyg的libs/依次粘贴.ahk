;本ahk由quicker用户 VernonLin 提供。感谢
;*****************************简单实用的剪切板***************************
;||    *  支持拷贝多段文字                                
;||    *                                               
;------------------------------------------------------------------------
;||     win+0                  |                清空
;||     ctrl + c               |                复制
;||     win + v                |                依次粘
;||     win+b                  |                依次粘贴，但顺序相反
;||     ctrl+win+v             |                覆盖粘贴
;||     ESC                    |                退出本模式
;===========================================================================


    handleClip(action)
    {
        global static AddNextNum
        global static GetNextNum
        global static HighestNum
        global static getprevnum
        global static highest1
        global static ClipArray
        global static ClipArray1
        global static ClipArray2
        global static ClipArray3
        global static ClipArray4
        global static ClipArray5
        global static ClipArray6
        global static ClipArray7
        global static ClipArray8
        global static ClipArray9
        global static ClipArray10
        global static ClipArray11
        global static ClipArray12
        global static ClipArray13
        global static ClipArray14
        global static ClipArray15
        global static ClipArray16
        global static ClipArray17
        global static ClipArray18
        global static ClipArray19
        global static ClipArray20
        global static ClipArray21
        global static ClipArray22
        global static ClipArray23
        global static ClipArray24
        global static ClipArray25
        global static ClipArray26
        global static ClipArray27
        global static ClipArray28
        global static ClipArray29
        global static ClipArray30

        if (action = "save")
        {
            if (AddNextNum < 30)
            {
                AddNextNum += 1 ;
            }
            else
            {
                AddNextNum := 1 ;
            }


            if (HighestNum < 30)
            {
                HighestNum += 1 ;
            }

            GetNextNum := AddNextNum ;
            ClipArray%AddNextNum% := Clipboard
            highest1 := highestnum + 1
            getprevnum := 1

        }
        else if ((action = "get") OR (action = "roll"))
        {
            if (GetNextNum != 0)
            {
                if (action = "roll")
                {
                    Send, ^z
                }
                Clipboard := ClipArray%GetNextNum%
                if (GetNextNum > 1)
                {
                    GetNextNum -= 1 ;
                    getprevnum++
                }
                else
                {
                    getprevnum := 1
                    GetNextNum := HighestNum

                }
                Send, ^v
                }
        }
        else if (action = "get-reverse")
        {
            if (GetNextNum != 0)
            {

                Clipboard := ClipArray%getprevnum%
                if (GetNextNum > 1)
                {
                    GetNextNum -= 1 ;
                    getprevnum++
                }
                else
                {
                    getprevnum := 1
                    GetNextNum := HighestNum

                }
                Send, ^v
            }
        }

        else if (action = "rollforward")
        {
            if (GetNextNum != 0)
            {
                Send, ^z
                if (GetNextNum < HighestNum)
                {
                    GetNextNum += 1 ;
                }
                else
                {
                    GetNextNum := 1
                }
                Clipboard := ClipArray%GetNextNum%
                Send, ^v
            }
        }
        else if (action = "clear")
        {

            GetNextNum := 0
            AddNextNum := 0
            HighestNum := 0
            getprevnum := 0
        }
    }
    ;控键
    #0::
    handleClip("clear")
    MsgBox,0,瞎琢磨先生.ahk, 清空粘贴板, 0.3
    return

    ^c::
    suspend on
    Send, ^c
    suspend off
    handleClip("save")

    return

    #v::
        handleClip("get-reverse")
    return

    #b::
        handleClip("get")
        MsgBox,0,瞎琢磨先生.ahk, 倒序粘贴, 0.3
    return
    #/::
        clipboard =
    return

    #^v::
        handleClip("rollforward")
    return
    ; end 剪切
ESC::ExitApp