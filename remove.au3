#RequireAdmin
#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIShPath.au3>

Func _WinWaitActivate($title,$text,$timeout=0)
	WinWait($title,$text,$timeout)
	If Not WinActive($title,$text) Then WinActivate($title,$text)
	WinWaitActive($title,$text,$timeout)
EndFunc

global $exe    = $CmdLine[1]

Sleep(200)
Run($exe)
_WinWaitActivate("[CLASS:MsiDialogCloseClass]","")
Sleep(1000)
_WinWaitActivate("[CLASS:MsiDialogCloseClass]","")
Send("{ENTER}")
; select uninstall
_WinWaitActivate("[CLASS:MsiDialogCloseClass]","ändert die installierten Programmfeatures")
Send("{DOWN}")
Send("{DOWN}")
Send("{TAB}")
Send("{TAB}")
Send("{SPACE}")
; verification uninstall
_WinWaitActivate("[CLASS:MsiDialogCloseClass]",'Klicken Sie auf "Entfernen",')
Send("{ENTER}")
_WinWaitActivate("[CLASS:MsiDialogCloseClass]",'Protokolldatei von Windows Installer anzeigen')
Send("{ENTER}")