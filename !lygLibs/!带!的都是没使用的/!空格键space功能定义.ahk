;===================space功能定义================================
	Space::LShift

	Space::Send {Space}
	
	
	;======================================================
;======================================================
Space & f::Send ^f                          ;搜索
;space & s::Send ^s                          ;保存
;space & v::Send ^v                          ;粘贴
;space & b::Send ^v                          ;粘贴
;space & g::Send ^c                          ;复制
;space & q::Send {ESC}                       ;取消
;space & r::Send ^z                          ;撤销
;space & t::Send ^y                          ;恢复
;space & d::Send {Home}+{End}^c              ;复制当前行
;space & a::Send ^a^c                        ;全选并复制



;=====数字小键盘==================================================
;================================================================
;26键上的123456789难以快速输出,且使用不方便, 更不要说直接盲打
;====================利用原来的7890键作为补充和配合


Space & j::SendInput 1
Space & k::SendInput 2
Space & l::SendInput 3
;Space & `;::SendInput 4			;(特殊)    空格 + 分号  =  4

Space & u::SendInput 4
Space & i::SendInput 5
Space & o::SendInput 6

;Space & p::SendInput 8
;Space & y::SendInput 9
;===================数字键盘========================================


;=======================快速启动应用=====================================
;注意事项: 路径中尽量不要有中文(如果有中文建议使用notepad来编辑，否则将报无法找到文件路径的错误/编码问题)

Space & e::Run D:\3.CentBrowser\CentBrowser\Application\chrome.exe
;space & w::Run D:\1.BaseSoftware\2.WPS\WPS2019\ksolaunch.exe
Space & w::Run D:\5.WPS\ksolaunch.exe


;===================space功能定义End================================