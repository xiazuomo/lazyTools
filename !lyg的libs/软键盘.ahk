*F7::屏幕键盘()
 
 
屏幕键盘() {
 
  static NewName:={ "":"Space", Lock:"CapsLock", BS:"BS"
     , App:"AppsKey", Psc:"PrintScreen", Slk:"ScrollLock"
     , Brk:"Pause", Hm:"Home", Pup:"PgUp", Pdn:"PgDn"
     , "↑":"Up", "↓":"Down", "←":"Left", "→":"Right" }
 
  ; 键盘布局：[ 键名，宽度，右移间隔 ]
 
  s1:=[ ["Esc"],["F1",,23],["F2"],["F3"],["F4"],["F5",,15]
     ,["F6"],["F7"],["F8"],["F9",,15],["F10"],["F11"],["F12"]
     ,["Psc",,10],["Slk"],["Brk"] ]
 
  s2:=[ ["~ ``"],["! 1"],["@ 2"],["# 3"],["$ 4"],["% 5"],["^ 6"]
     ,["&& 7"],["* 8"],["( 9"],[") 0"],["_ -"],["+ ="],["BS",45]
     ,["Ins",,10],["Hm"],["Pup"] ]
 
  s3:=[ ["Tab",45],["Q"],["W"],["E"],["R"],["T"],["Y"]
     ,["U"],["I"],["O"],["P"],["{ ["],["} ]"],["| \"]
     ,["Del",,10],["End"],["Pdn"] ]
 
  s4:=[ ["Lock",60],["A"],["S"],["D"],["F"],["G"],["H"]
     ,["J"],["K"],["L"],[": `;"],[""" '"],["Enter",47] ]
 
  s5:=[ ["Shift",75],["Z"],["X"],["C"],["V"],["B"]
     ,["N"],["M"],["< ,"],["> ."],["? /"],["Shift",64]
     ,["↑",,10+30+2] ]
 
  s6:=[ ["Ctrl",40],["Win",40],["Alt",40],["",167]
     ,["Alt",40],["Win",40],["App",40],["Ctrl",40]
     ,["←",,10],["↓"],["→"] ]
 
  Gui, OSK: Destroy
  Gui, OSK: +AlwaysOnTop +Owner +E0x08000000
  Gui, OSK: Font, s10, Verdana
  Gui, OSK: Margin, 10, 10
  Gui, OSK: Color, DDEEFF
  Loop, 6 {
    if (A_Index<=2)
      j=
    For i,v in s%A_Index%
    {
      w:=v.2 ? v.2 : 30, d:=v.3 ? v.3 : 2
      j:=j="" ? "xm" : i=1 ? "xm y+2" : "x+" d
      Gui, OSK: Add, Button, %j% w%w% h25 -Wrap gRunOSK, % v.1
    }
  }
  Gui, OSK: Show, NA, 屏幕键盘
  return
 
  OSKGuiClose:
  Gui, OSK: Destroy
  return
 
  RunOSK:
  k:=A_GuiControl
  if k in Shift,Ctrl,Win,Alt
  {
    v:=k="Win" ? "LWin" : k
    GuiControlGet, isEnabled, OSK: Enabled, %k%
    GuiControl, OSK: Disable%isEnabled%, %k%
    if (!isEnabled)
      SendInput, {Blind}{%v%}
    return
  }
  s:=InStr(k," ") ? SubStr(k,0) : k
  s:=(v:=NewName[s]) ? v : s, s:="{" s "}"
  For i,k in StrSplit("Shift,Ctrl,Win,Alt", ",")
  {
    GuiControlGet, isEnabled, OSK: Enabled, %k%
    if (!isEnabled)
    {
      GuiControl, OSK: Enable, %k%
      v:=k="Win" ? "LWin" : k
      s={%v% Down}%s%{%v% Up}
    }
  }
  SendInput, {Blind}%s%
  return
}
 
;