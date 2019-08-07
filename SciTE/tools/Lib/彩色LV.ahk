/*
参考了官网众多帖子，主要是以下两个。
http://www.autohotkey.com/board/topic/50067-listviews-color-individual-rows-multiple-lv-support
http://www.autohotkey.com/board/topic/8463-listview-colors-for-individual-lines-eg-highlighting/
其中第一个存在严重的性能问题，第二个功能上稍微欠缺。两者共同存在的问题就是创建了数不尽的全局变量，看着眼烦……
因此结合起来修改，目前性能问题解决，全局变量问题解决，功能仅欠缺多LV支持。
*/

;初始化。主要作用是创建所需变量（对象），获取待操作LV的Hwnd。
;此函数创建了5个全局变量，分别是“hw_LV_ColorChange”、“Text_%hw_LV_ColorChange%”、“Back_%hw_LV_ColorChange%”、“Selected_%hw_LV_ColorChange%”、“LvItem_%hw_LV_ColorChange%”。
LV_ColorInitiate(Gui_Number=1, Control="") ; initiate listview color change procedure
  {
    local Gui_ID    ;指定了local后，其它变量会自动变全局的。
    If Control =
        Control =SysListView321
    Gui, %Gui_Number%:+Lastfound
    Gui_ID := WinExist()
    ControlGet, hw_LV_ColorChange, HWND,, %Control%, ahk_id %Gui_ID%
    Text_%hw_LV_ColorChange%:=[]    ;Global的单行模式不支持创建带%%引用的变量，只能用首行Global的假设全局模式创建。
    Back_%hw_LV_ColorChange%:=[]    ;指定local后，等效于首行Global的假设全局模式。
    Selected_%hw_LV_ColorChange%:=[]
    VarSetCapacity(LvItem_%hw_LV_ColorChange%, 36, 0)
    OnMessage( 0x4E, "WM_NOTIFY" )
  }

;模式区分行模式与编号模式，即颜色附着于行或者编号。默认行模式。
;行模式就是排序后，每行依旧是之前的颜色。
;编号模式就是排序后，颜色会跟随排序内容的变化而变化。
;通常情况下，可将编号设在LV的第一列，并隐藏。
;首参数为空，将重设所有颜色。与LV_Destroy()的区别是，此种方式重设后，无需重新初始化。
LV_ColorChange(Index="", TextColor="", BackColor="", TextMode="L", BackMode="L", IndexModeColumnNumber=1,Redraw=1)
  {
    global
    If (Index="")   ;清除模式
      {
        LV_SelectedColor()
        Text_%hw_LV_ColorChange%:=[]
        Back_%hw_LV_ColorChange%:=[]
        WinSet, Redraw,, ahk_id %hw_LV_ColorChange%
        return,1
      }
    Else
      {
        Text_%hw_LV_ColorChange%[Index] := TextColor
        Back_%hw_LV_ColorChange%[Index] := BackColor
        Text_%hw_LV_ColorChange%["M"] := TextMode
        Back_%hw_LV_ColorChange%["M"] := BackMode
        Text_%hw_LV_ColorChange%["IndexModeColumnNumber"] := IndexModeColumnNumber
        If (Redraw=1)
            WinSet, Redraw,, ahk_id %hw_LV_ColorChange%
      }
    return,1
  }

;设置选中行的文本及背景色，不传任何参数将关闭选中行染色功能。
LV_SelectedColor(TextColor="", BackColor="")
  {
    global
    If (TextColor="" And BackColor="")  ;清除模式
      {
        Selected_%hw_LV_ColorChange%:=[]
        return,1
      }
    Else
      {
        Selected_%hw_LV_ColorChange%["TextColor"]:=TextColor
        Selected_%hw_LV_ColorChange%["BackColor"]:=BackColor
        Selected_%hw_LV_ColorChange%["Sign"]:=1
      }
    return,1
  }

;当需要染色的行有很多时，可以在LV_ColorChange()中设置Redraw=0，然后等待所有LV_ColorChange()操作完毕，自行重绘。
;这样做的好处是，可避免闪烁，并提高速度。
LV_Redraw()
  {
    global
    WinSet, Redraw,, ahk_id %hw_LV_ColorChange%
    return,1
  }

;此函数将关闭消息监视，并清空变量。
;使用此函数后，若要再次改变颜色，需要重新初始化。
LV_Destroy()
  {
    global
    OnMessage(0x4E, "")
    WinSet, Redraw,, ahk_id %hw_LV_ColorChange%
    Text_%hw_LV_ColorChange%:=""
    Back_%hw_LV_ColorChange%:=""
    Selected_%hw_LV_ColorChange%:=""
    LvItem_%hw_LV_ColorChange%:=""
    hw_LV_ColorChange:=""
    return,1
  }

;染色函数。大致原理是监听消息0x4E，当监听到对应行时，写入颜色信息。
WM_NOTIFY( p_w, p_l, p_m )
  {
    local draw_stage, Current_Line, Index, IsSelected=0
    Critical
    If ( DecodeInteger( "uint4", p_l, 0 ) = hw_LV_ColorChange ) {
        If ( DecodeInteger( "int4", p_l, 8 ) = -12 ) {                            ; NM_CUSTOMDRAW
            draw_stage := DecodeInteger( "uint4", p_l, 12 )
            If ( draw_stage = 1 )                                                 ; CDDS_PREPAINT
                return, 0x20                                                      ; CDRF_NOTIFYITEMDRAW
            Else If ( draw_stage = 0x10000|1 ){                                   ; CDDS_ITEM
                Current_Line := DecodeInteger( "uint4", p_l, 36 )+1
                LV_GetText(Index, Current_Line, Text_%hw_LV_ColorChange%["IndexModeColumnNumber"])

                If (Text_%hw_LV_ColorChange%[Current_Line] != "" And Text_%hw_LV_ColorChange%["M"]="L") ;值存在并且模式匹配
                    EncodeInteger( Text_%hw_LV_ColorChange%[Current_Line], 4, p_l, 48 ) ; 文本颜色
                Else If (Text_%hw_LV_ColorChange%[Index] != "" And Text_%hw_LV_ColorChange%["M"]="I")
                    EncodeInteger( Text_%hw_LV_ColorChange%[Index], 4, p_l, 48 )    ; 文本颜色

                If (Back_%hw_LV_ColorChange%[Current_Line] != "" And Back_%hw_LV_ColorChange%["M"]="L")
                    EncodeInteger( Back_%hw_LV_ColorChange%[Current_Line], 4, p_l, 52 ) ; 背景色
                Else If (Back_%hw_LV_ColorChange%[Index] != "" And Back_%hw_LV_ColorChange%["M"]="I")
                    EncodeInteger( Back_%hw_LV_ColorChange%[Index], 4, p_l, 52 )    ; 背景色

                If (Selected_%hw_LV_ColorChange%["Sign"]=1) ;此标记为1时，表示启用选中行染色功能。之所以加这么多判断，都是为了性能考虑。
                    If ( DllCall("GetFocus") = hw_LV_ColorChange ) {				 	; Control has Keyboard Focus?
                        SendMessage, 4140, Current_Line-1, 2, , ahk_id %hw_LV_ColorChange% ; LVM_GETITEMSTATE
                        IsSelected := ErrorLevel
                        If ( IsSelected = 2 ) {																 ; LVIS_SELECTED
                            If (Selected_%hw_LV_ColorChange%["TextColor"] != "")
                                EncodeInteger( Selected_%hw_LV_ColorChange%["TextColor"], 4, p_l, 48 )							 ; NMCUSTOMDRAW->clrText ; foreground
                            If (Selected_%hw_LV_ColorChange%["BackColor"] != "")
                                EncodeInteger( Selected_%hw_LV_ColorChange%["BackColor"], 4, p_l, 52 )							 ; NMCUSTOMDRAW->clrTextBk ; background
                            EncodeInteger(0x0, 4, &LvItem_%hw_LV_ColorChange%, 12)									 ; LVITEM->state
                            EncodeInteger(0x2, 4, &LvItem_%hw_LV_ColorChange%, 16)									 ; LVITEM->stateMask ; LVIS_SELECTED
                            SendMessage, 4139, Current_Line-1, &LvItem_%hw_LV_ColorChange%, , ahk_id %hw_LV_ColorChange% ; Disable Highlighting
                            return, 0x00000010																	 ; CDRF_NOTIFYPOSTPAINT     				; We want item post-paint notifications
                          }
                      }
              }
            Else If (Selected_%hw_LV_ColorChange%["Sign"]=1)    ;此标记为1时，表示启用选中行染色功能。之所以加这么多判断，都是为了性能考虑。
                If ( draw_stage = 0x10000|2 )						; CDDS_ITEMPOSTPAINT
                    If ( IsSelected ) {
                        EncodeInteger(0x02, 4, &LvItem_%hw_LV_ColorChange%, 12)				; LVITEM->state
                        EncodeInteger(0x02, 4, &LvItem_%hw_LV_ColorChange%, 16)				; LVITEM->stateMask ; LVIS_SELECTED
                        SendMessage, 4139, Current_Line-1, &LvItem_%hw_LV_ColorChange%, , ahk_id %hw_LV_ColorChange% ; LVM_SETITEMSTATE
                      }
          }
      }
  }

;WM_NOTIFY()需要的解码函数。
DecodeInteger( p_type, p_address, p_offset, p_hex=true )
  {
    old_FormatInteger := A_FormatInteger
    IfEqual, p_hex, 1, SetFormat, Integer, hex
    Else, SetFormat, Integer, dec
    StringRight, size, p_type, 1
    Loop, %size%
        value += *( ( p_address+p_offset )+( A_Index-1 ) ) << ( 8*( A_Index-1 ) )
    If ( size <= 4 and InStr( p_type, "u" ) != 1 and *( p_address+p_offset+( size-1 ) ) & 0x80 )
        value := -( ( ~value+1 ) & ( ( 2**( 8*size ) )-1 ) )
    SetFormat, Integer, %old_FormatInteger%
    return, value
  }

;WM_NOTIFY()实现写入颜色信息的函数。
EncodeInteger( p_value, p_size, p_address, p_offset )
  {
    Loop, %p_size%
        DllCall( "RtlFillMemory", "uint", p_address+p_offset+A_Index-1, "uint", 1, "uchar", p_value >> ( 8*( A_Index-1 ) ) )
  }