
;=============快捷键调节音量Home==========
	;===========F10静音
	F10::SoundSet, +1,, mute
	;===========F11减音量
F11::
	SoundSet -1, MASTER
	SoundSet, -1,WAVE
return
;===========F12加音量
F12::
	SoundSet +1, MASTER
	SoundSet, +1, WAVE
return
;==================快捷键调节音量End================================================
