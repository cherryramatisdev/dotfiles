#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors
SendMode Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir% ; Ensures the consistent starting directory.

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
Send {F11}
return

^q::
WinGetTitle, Title, A
WinKill, %Title%
return

^m::
WinGetTitle, Title, A
WinMinimize, %Title%
return

^F11::reload