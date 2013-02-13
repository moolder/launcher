; launcher-gui.ahk
; Entwickelt von moolder / Guido Schuh (moolder@gmx.net, dirtyhack.de)
; Lizenz: Creative Commons Namensnennung-NichtKommerziell-Weitergabe unter gleichen Bedingungen 3.0
; Siehe http://creativecommons.org/licenses/by-nc-sa/3.0/de/

configfile=launcherconfig.txt
appheadline=Folder Launcher - select Folders

TrayTip, Launcher, Running launcher - Hit Windows-Alt-0 to configure, 4, 1

; Menu, Tray, Icon, moolder-minifig.ico

Gosub LoadConfig

Gui, Add, Text, h0 y10 , Win+1:
Gui, Add, Text, hp     , Win+2:
Gui, Add, Text, hp     , Win+3:
Gui, Add, Text, hp     , Win+4:
Gui, Add, Text, hp     , Win+5:
Gui, Add, Text, hp     , Win+6:
Gui, Add, Text, hp     , Win+7:
Gui, Add, Text, hp     , Win+8:
Gui, Add, Text, hp     , Win+9:
Gui, Add, Text, hp     , Win+0:

Gui, Add, Edit, vRun1Path h21 w500 gStoreControlData ym, %Run1Path%  ; The ym option starts a new column of controls.
Gui, Add, Edit, vRun2Path hp w500 gStoreControlData, %Run2Path%
Gui, Add, Edit, vRun3Path hp w500 gStoreControlData, %Run3Path%
Gui, Add, Edit, vRun4Path hp w500 gStoreControlData, %Run4Path%
Gui, Add, Edit, vRun5Path hp w500 gStoreControlData, %Run5Path%
Gui, Add, Edit, vRun6Path hp w500 gStoreControlData, %Run6Path%
Gui, Add, Edit, vRun7Path hp w500 gStoreControlData, %Run7Path%
Gui, Add, Edit, vRun8Path hp w500 gStoreControlData, %Run8Path%
Gui, Add, Edit, vRun9Path hp w500 gStoreControlData, %Run9Path%
Gui, Add, Edit, vRun0Path hp w500 gStoreControlData, %Run0Path%

Gui, Add, Button, default, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed.

Gui, Add, Button, h21 gRun1SelectFolder ym , dir 1
Gui, Add, Button, hp  gRun2SelectFolder , dir 2
Gui, Add, Button, hp  gRun3SelectFolder , dir 3
Gui, Add, Button, hp  gRun4SelectFolder , dir 4
Gui, Add, Button, hp  gRun5SelectFolder , dir 5
Gui, Add, Button, hp  gRun6SelectFolder , dir 6
Gui, Add, Button, hp  gRun7SelectFolder , dir 7
Gui, Add, Button, hp  gRun8SelectFolder , dir 8
Gui, Add, Button, hp  gRun9SelectFolder , dir 9
Gui, Add, Button, hp  gRun0SelectFolder , dir 0


;if %ShowGuiOnStartup% {
;	Gui, Show,, %appheadline%
;}

return

GuiEscape:
Gosub LoadConfig
nr=0
Loop 10
{
	TempPath := Run%nr%Path
	GuiControl,, Run%nr%Path, %TempPath%
	nr++
}
Gui, Cancel
return

GuiClose:
ButtonOK:
Gui, Submit  ; Save the input from the user to each control's associated variable.
Gosub SaveConfig
; ExitApp
return

StoreControlData:
Gui, Submit, NoHide  ; Save the input from the user to each control's associated variable.
return

Run1SelectFolder:
FileSelectFolder, TempPath,, 3, Please select dir for Win+1
if ErrorLevel = ERROR
	return
Run1Path=%TempPath%
GuiControl,, Run1Path, %Run1Path%
Gosub SaveConfig
return

Run2SelectFolder:
FileSelectFolder, TempPath,, 3, Please select dir for Win+2
if ErrorLevel = ERROR
	return
Run2Path=%TempPath%
GuiControl,, Run2Path, %Run2Path%
Gosub SaveConfig
return

Run3SelectFolder:
FileSelectFolder, TempPath,, 3, Please select dir for Win+3
if ErrorLevel = ERROR
	return
Run3Path=%TempPath%
GuiControl,, Run3Path, %Run3Path%
Gosub SaveConfig
return

Run4SelectFolder:
FileSelectFolder, TempPath,, 3, Please select dir for Win+4
if ErrorLevel = ERROR
	return
Run4Path=%TempPath%
GuiControl,, Run4Path, %Run4Path%
Gosub SaveConfig
return

Run5SelectFolder:
FileSelectFolder, TempPath,, 3, Please select dir for Win+5
if ErrorLevel = ERROR
	return
Run5Path=%TempPath%
GuiControl,, Run5Path, %Run5Path%
Gosub SaveConfig
return

Run6SelectFolder:
FileSelectFolder, TempPath,, 3, Please select dir for Win+6
if ErrorLevel = ERROR
	return
Run6Path=%TempPath%
GuiControl,, Run6Path, %Run6Path%
Gosub SaveConfig
return

Run7SelectFolder:
FileSelectFolder, TempPath,, 3, Please select dir for Win+7
if ErrorLevel = ERROR
	return
Run7Path=%TempPath%
GuiControl,, Run7Path, %Run7Path%
Gosub SaveConfig
return

Run8SelectFolder:
FileSelectFolder, TempPath,, 3, Please select dir for Win+8
if ErrorLevel = ERROR
	return
Run8Path=%TempPath%
GuiControl,, Run8Path, %Run8Path%
Gosub SaveConfig
return

Run9SelectFolder:
FileSelectFolder, TempPath,, 3, Please select dir for Win+9
if ErrorLevel <> 0
	return
Run9Path=%TempPath%
GuiControl,, Run9Path, %Run9Path%
Gosub SaveConfig
return

Run0SelectFolder:
FileSelectFolder, TempPath,, 3, Please select dir for Win+0
if ErrorLevel = ERROR
	return
Run0Path=%TempPath%
GuiControl,, Run0Path, %Run0Path%
Gosub SaveConfig
return

LoadConfig:
nr=0
Loop, read, %configfile%
{
    Run%nr%Path:=A_LoopReadLine
    nr++
}
return

SaveConfig:
FileDelete, %configfile%
FileAppend %Run0Path%`n, %configfile%
FileAppend %Run1Path%`n, %configfile%
FileAppend %Run2Path%`n, %configfile%
FileAppend %Run3Path%`n, %configfile%
FileAppend %Run4Path%`n, %configfile%
FileAppend %Run5Path%`n, %configfile%
FileAppend %Run6Path%`n, %configfile%
FileAppend %Run7Path%`n, %configfile%
FileAppend %Run8Path%`n, %configfile%
FileAppend %Run9Path%`n, %configfile%

return

#0::Run %Run0Path%
#1::Run %Run1Path%
#2::Run %Run2Path%
#3::Run %Run3Path%
#4::Run %Run4Path%
#5::Run %Run5Path%
#6::Run %Run6Path%
#7::Run %Run7Path%
#8::Run %Run8Path%
#9::Run %Run9Path%

#+0::Send %Run0Path%
#+1::Send %Run1Path%
#+2::Send %Run2Path%
#+3::Send %Run3Path%
#+4::Send %Run4Path%
#+5::Send %Run5Path%
#+6::Send %Run6Path%
#+7::Send %Run7Path%
#+8::Send %Run8Path%
#+9::Send %Run9Path%

#!0::Gui, Show,, %appheadline%

#X::Send {Ctrl}{WheelUp}
#Y::Send {Ctrl}{WheelDown}
