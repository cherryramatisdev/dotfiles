#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors
SendMode Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir% ; Ensures the consistent starting directory.

; AutoHotkey code to swap middle and right buttons
$RButton::MButton
$MButton::RButton

RCtrl::Capslock

Capslock::
if WinActive("ahk_class Emacs")
  Send {Home}
else
  Send {Esc}
return

OpenWorkBrowser() {
  if WinExist("ahk_exe msedge.exe")
    WinActivate
  else
    Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    WinActivate
}


Numpad1::OpenWorkBrowser()
#1::OpenWorkBrowser()
RAlt & 1::OpenWorkBrowser()

OpenPersonalBrowser() {
  if WinExist("ahk_exe firefox.exe")
    WinActivate
  else
    Run "C:\Users\cherr\scoop\apps\firefox\current\firefox.exe"
    WinActivate
}

; Numpad2::OpenPersonalBrowser()
; #2::OpenPersonalBrowser()
; RAlt & 2::OpenPersonalBrowser()

OpenEditor() {
  if WinExist("ahk_class Emacs")
    WinActivate
  else
    Run "C:\Users\cherr\scoop\shims\runemacs.exe"
    WinActivate
}

Numpad2::OpenEditor()
#2::OpenEditor()
RAlt & 2::OpenEditor()
Numpad3::OpenEditor()
#3::OpenEditor()
RAlt & 3::OpenEditor()

OpenSlack() {
  if WinExist("ahk_exe slack.exe")
    WinActivate
  else
    Run "C:\Users\cherr\AppData\Local\slack\slack.exe"
    WinActivate
}

Numpad4::OpenSlack()
#4::OpenSlack()
RAlt & 4::OpenSlack()

OpenFigma() {
  if WinExist("ahk_exe Figma.exe")
    WinActivate
  else
    Run "C:\Users\cherr\AppData\Local\Figma\Figma.exe"
    WinActivate
}

Numpad5::OpenFigma()
#5::OpenFigma()
RAlt & 5::OpenFigma()

OpenNoteTaking() {
  if WinExist("ahk_exe Mem.exe")
    WinActivate
  else
    Run "C:\Users\cherr\AppData\Local\Programs\@mem-labsdesktop-client\Mem.exe"
    WinActivate
}

Numpad6::OpenNoteTaking()
#6::OpenNoteTaking()
RAlt & 6::OpenNoteTaking()

OpenTerminal() {
  if WinExist("ahk_exe pwsh.exe")
    WinActivate
  else
    Run "C:\Program Files\WindowsApps\Microsoft.PowerShell_7.2.5.0_x64__8wekyb3d8bbwe\pwsh.exe"
    WinActivate
}

Numpad7::OpenTerminal()
#7::OpenTerminal()
RAlt & 7::OpenTerminal()
#Return::OpenTerminal()

OpenDiscord() {
  if WinExist("ahk_exe Discord.exe")
    WinActivate
  else
    Run "C:\Users\cherr\AppData\Local\Discord\app-1.0.9005\Discord.exe"
    WinActivate
}

Numpad8::OpenDiscord()
#8::OpenDiscord()
RAlt & 8::OpenDiscord()

!Return::
WinGet, WinState, MinMax, A
if (WinState = 1)
{
  WinRestore, A
}
else
{
  WinMaximize, A
}
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