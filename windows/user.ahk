#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors
SendMode Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir% ; Ensures the consistent starting directory.

;; disable Win key behavior of popping up the Start Menu, but don't disable Win+key combination
~LWin Up::Return
~RWin Up::Return

#p::
Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge_proxy.exe"  --profile-directory=Default, , , PID
WinActivate, ahk_pid %PID%
return

#o::
Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge_proxy.exe"  --profile-directory="Profile 1", , , PID
WinActivate, ahk_pid %PID%
return

#e::
Run "C:\Users\cherr\scoop\apps\emacs\28.1\bin\emacsclientw.exe" -c -n, , , PID
WinActivate, ahk_pid %PID%
return

#Return::
if WinExist("ahk_class mintty")
  WinActivate
else
  Run "C:\Users\cherr\scoop\apps\git\current\git-bash.exe"
  WinActivate
return

!Return::
WinMaximize
return

LWin & l::AltTab
LWin & h::ShiftAltTab

^q::
WinGetTitle, Title, A
WinKill, %Title%
return

^m::
WinGetTitle, Title, A
WinMinimize, %Title%
return

^F11::reload