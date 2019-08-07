/*
#mk_menu(唯一参数: 菜单列表名称>字符串)
	该列表中元素:
		0.为有序数列, 从项1至末尾从上至下排列
		1.字典为展开包
			1.1.唯一键为展开包的名称和展开包的标识
			1.2.键的参数为列表
		2.字符串为功能项
			2.1."-" 该字符串取分隔符
			2.2.功能项字符串为"属性1|属性2"
				"@" 后 字符串 为子项名称
				"#" 至 "()" 之间为对应函数名称, 最高优先级
				"#" 后无 "()" 表示跳转标签, 次优先级
				"@" 后随要启动的软件完整路径, 最次优先级
			2.3.其他功能属性未定
*/

mymenu := [	  "@=|#method1()"
			,"@,|#method2()"
			,"@.|#method3()"
			,"@`;|#method4()"
			, "@子项2|#函数1()"
			, "-"
			, {"子页1" : [	"@子页项1|#子页项1标签"
						,	"@子页项2|#子页项2标签"]}
			, {"子页2" : [	{"子页2包1" :	["@某项|#某项0"
											,"@某项1|#某项x1"]}
							,"@子页2子项1|#子页2子项1标签"]}
			, "-"
			, "@notepad++|#methodNotepad()"
			, "@记事本|$notepad"]
			
/*
mymenu := [	  "@子项1|#标签1"
			, "@子项2|#函数1()"
			, "-"
			, {"子页1" : [	"@子页项1|#子页项1标签"
						,	"@子页项2|#子页项2标签"]}
			, {"子页2" : [	{"子页2包1" :	["@某项|#某项0"
											,"@某项1|#某项x1"]}
							,"@子页2子项1|#子页2子项1标签"]}
			, "@记事本|$notepad"]

*/
#mk_menu("mymenu")
return

Capslock & RButton::
menu, mymenu, show	; ctrl + 右键显示菜单
return

函数1() {
	msgbox, 函数1
}


SendText(var_string){
	local
	SendInput {text}%var_string%
	return
}



method1(){
SendText("=")
}

method2(){
SendText(",")
}

method3(){
SendText(".")
}

method4(){
SendText(";")
}


method5(){
SendText(";")
}



methodNotepad(){
Run D:\Others\9.Notepad++\notepad++.exe
}


标签1:
子页项1标签:
子页项2标签:
子页2子项1标签:
某项0:
某项x1:
	MsgBox, % a_thislabel
return



__never_going() {	;从未执行,用于无功能参数的菜单项
	global
	return
	#__labelgoing:
	MsgBox, a
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
