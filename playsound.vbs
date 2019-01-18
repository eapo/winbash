Set objArgs = WScript.Arguments
messageText = objArgs(0)

Dim WshShell, strCurDir
Set WshShell = CreateObject("WScript.Shell")
strCurDir = WshShell.CurrentDirectory

intButton = WshShell.Popup ("Go2Play!"+Chr(13)+messageText, 5,"Elvenar! "+ ChrW(12484) + " " + messageText, 0 + 48)

select case intButton
	case -1
		ProgressMsg
	strMessage = "Stop audio?"+Chr(13)+messageText
	case 1
	WScript.Quit

end select

WshShell.Popup strMessage, ,"Elvenar"+ChrW(9834) + " " + messageText, 16

Function ProgressMsg()
	'Play audio'
	WshShell.Run "wmplayer /play /close """ & strCurDir & "\elv2.mp3""", 0, False
End Function

'Kill audio'
WshShell.Run "taskkill /F /IM wmplayer.exe", 0, False

Set WshShell = Nothing