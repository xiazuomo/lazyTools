;瞎琢磨先生の魔改版快捷列表

mymenu := [	  "-"
			, {"常用字符串" : ["	@邮箱|#methodMail()"
								,	"@ip地址|#methodIp()"
								,	"@pwd|#methodPwd()"
								
								,	"@,|2222|"]}
			, "-"
			, "-"
			, {"+-*/" : [	"@=|#method1()|#子页项2标签"
						, "-"
						,	;"@，|#method2()"
						,	"@.|#method3()"
						, "-"
						,	"@`;|#method4()"
						, "-"
						,	"@/*|#method5()"
						,	"@*/|#method6()"
						, "-"
						,	"@{|#method7()"
						,	"@}|#method8()"]}
			, {"快捷启动软件" : ["	@Quicker|#methodQuicker()"
								,	"@GifCam|#methodGifCam()"
								,	"@Everything|#methodEverything()"
								
								
								
								,	"@,|#method2()|"
								,	"@.|#method3()|"
								,	"@`;|#method4()|"
								,	"@,|#method2()|"
								,	"@,|#method2()|"]}
			, "-"
			, "-"			
			,	"@快捷键大全|#showNotice()"		
			, "-"]
		



#mk_menu("mymenu")
return




;快速启动快捷键
F2::																													;F2		快速启动快捷键
menu, mymenu, show
return


showNotice() {
	;msgbox, 函数1
	MsgBox,0,©瞎琢磨先生出品, `n 快捷键: `n ctrl+alt+z=唤出神龙 `n ctrl+alt+c=打入冷宫  `n ctrl+alt+X=再也不见 `n , 8
}


SendText1(var_string){
	local
	SendInput {text}%var_string%
	return
}



method1(){
SendText1("=")
}

method2(){
SendText1(",")
}

method3(){
SendText1(".")
}

method4(){
SendText1(";")
}


method5(){
SendText1("/*")
}


method6(){
SendText1("*/")
}

method7(){
SendText1("{")
}

method8(){
SendText1("}")
}


methodNotepad(){
run D:\Others\9.Notepad++\notepad++.exe
}

methodQuicker(){
run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Quicker\Quicker.lnk
}


methodGifCam(){
Run D:\Others\5.GifCam\GifCam.exe																	;Alt + G			GifCam
}

methodEverything(){
run D:\Others\9.9_Everything\Everything.exe
}


methodMail(){
	SendText1("1044885678@qq.com")
}

;#methodPwd(){
methodPwd(){
	SendText1("!Fzb_dahua2019")
}

methodIp(){
	SendText1("124.160.108.60")
}




__never_going() {	;从未执行,用于无功能参数的菜单项
	global
	return
	#__labelgoing:
	MsgBox, __never_going
	return
}

#mk_menu(s_main) {	;主函数
	if (!isobject(%s_main%) or !%s_main%.MaxIndex()) {
		MsgBox, 传入参数错误`n请保证为菜单为列表`n程序将退出
		ExitApp
	}
	ls_menu := %s_main%	;主要菜单列表
	for i, v in ls_menu
	{
		if isobject(v)
			#whoim_belongto(s_main, v)
		else {
			if (v = "-")
				menu, % s_main, add
			else {
				#check_func(obj, v)
				menu, % s_main, add, % rts_menuname(v), % obj
			}
		}
	}
}

#whoim_belongto(s_belongto, obj_subdict) {	;次级递归函数
	for key, list in obj_subdict
	{
		for i, v in list
		{
			if isobject(v)
				#whoim_belongto(key, v)
			else {
				if (v = "-")
					menu, % key, add
				else {
					#check_func(obj, v)
					menu, % key, add, % rts_menuname(v), % obj
				}
			}
		}
		menu, % s_belongto, add, % key, :%key%
		return
	}
}

#check_func(byref obj, s_into) {	;确认功能项
	if regexmatch(s_into, "(*UCP)\#([^\|]+)\(\)", rt)
		obj := func(rt1)
	else if regexmatch(s_into, "(*UCP)\#([^\|]+)", rt)
		obj := rt1
	else if regexmatch(s_into, "(*UCP)\$([^\|]+)", rt)
		obj := func("#menuitem_run").bind(rt1)
	else
		obj := "#__labelgoing"
}

#menuitem_run(s_path) {				;启动软件的功能项
	run, % s_path
}

rts_menuname(s_reg) {				;正则,返回菜单项的内容
	RegExMatch(s_reg, "(*UCP)@([^\|]+)", rt)
	if (rt1)
		return rt1
	MsgBox, % s_reg "`n未识别的菜单名称,脚本将退出"
	ExitApp
}




;;;;;;;;;;;;;;;;;;;;;分割线	

