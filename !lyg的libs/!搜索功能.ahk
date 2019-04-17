tmp_path=E:\1——文档&&下载\》电脑装机必备    ;;; autohotkey 可以事先定义一些变量
idea_path=D:\1.Development-Kit\1.JetBrains\bin\idea64.exe
ahk = D:\9.AutoHotKey

!c::
    inputBox,command,enter command                                                          
    if ErrorLevel   
        return  
    else
        if (command=="zj"||command=="bb")		;打开装机必备文件夹
            run %tmp_path%   ;;;打开指定文件夹 用两个百分号%%包围说明这是一个变量
        else if (command=="bd"||command=="bldu")
            run http://www.baidu.com  ;;; 快速打开百度
        else if (command=="c" || command=="d" || command=="e" || command=="f")
            run %command%:/   ;;快速打开这些盘
        else if (command=="idea")
            run %idea_path%     ;;快速打开idea
		else if (command=="ahk")
            run %ahk%   ;;;打开autohotkey所在的文件夹
	
		
    return
	