LogFile(data, line, file, labl="autoexec",  func="", obs="", outfile="AHK_log.txt")
{
FormatTime, time,, yyyy.MM.dd HH:mm:ss
if !labl
	labl=autoexec
if func
	func := " [function: " func "() ]"
if obs
	obs := " (" obs ")"
if (file != A_ScriptFullPath)
	{
	SplitPath, file, inc, incdir
	log3 := " in include file " inc " (" incdir ")"
	}
labl := " [label " . labl . "]"
log1 := "[" time "] [line " line "]" labl func
log2 := data . obs
FileAppend, %log1%%log3%`n%log2%`n`n, %outfile%
}