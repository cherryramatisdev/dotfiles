#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors
SendMode Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir C:\\Users\\cherr\\AppData\\Roaming\\git ; Ensures the consistent starting directory.

global insertMode := 0
global visualMode := 0

DisplayModeText() {
  modeText := "Normal Mode"
  if (insertMode = 1) {
    modeText := "Insert Mode"
  } else if (visualMode = 1) {
    modeText := "Visual Mode"
  } else {
    modeText := "Normal Mode"
  }

  ToolTip, %modeText%, 0, 0
}

DisplayModeText()

; AutoHotkey code to swap middle and right buttons
; $RButton::MButton
; $MButton::RButton

RCtrl::Capslock

Capslock::
if WinActive("ahk_class Emacs")
  Send {Home}
else
  Send {Esc}
return

CreateNewNote() {
  InputBox, NoteTitle, Phone Number, Note title: , , 640, 480
  titleLen := strLen(NoteTitle)

  if (titleLen > 0)
    Run emacsclientw.exe -t -e "(notes/create-new \"%NoteTitle%\")"
}

^!Return::CreateNewNote()

FocusWindow() {
  WinActivate
  ; WinMaximize
}

ExecuteCmd(cmd) {
  Run %cmd%
  FocusWindow()
}

OpenWorkBrowser() {
  if WinExist("ahk_exe msedge.exe")
    FocusWindow()
  else
    ExecuteCmd("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
}


Numpad1::OpenWorkBrowser()
#1::OpenWorkBrowser()
RAlt & 1::OpenWorkBrowser()

OpenPersonalBrowser() {
  if WinExist("ahk_exe firefox.exe")
     FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\scoop\apps\firefox\current\firefox.exe")
}

; Numpad2::OpenPersonalBrowser()
; #2::OpenPersonalBrowser()
; RAlt & 2::OpenPersonalBrowser()

OpenEditor() {
  if WinExist("ahk_class Emacs")
     FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\scoop\shims\runemacs.exe")
}

Numpad2::OpenEditor()
#2::OpenEditor()
RAlt & 2::OpenEditor()
Numpad3::OpenEditor()
#3::OpenEditor()
RAlt & 3::OpenEditor()

OpenSlack() {
  if WinExist("ahk_exe slack.exe")
     FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\AppData\Local\slack\slack.exe")
}

Numpad4::OpenSlack()
#4::OpenSlack()
RAlt & 4::OpenSlack()

OpenFigma() {
  if WinExist("ahk_exe Figma.exe")
     FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\AppData\Local\Figma\Figma.exe")
}

Numpad5::OpenFigma()
#5::OpenFigma()
RAlt & 5::OpenFigma()

OpenNoteTaking() {
  if WinExist("ahk_exe Mem.exe")
    FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\AppData\Local\Programs\@mem-labsdesktop-client\Mem.exe")
}

Numpad6::OpenNoteTaking()
#6::OpenNoteTaking()
RAlt & 6::OpenNoteTaking()

OpenTerminal() {
  if WinExist("ahk_exe pwsh.exe") {
    FocusWindow()
    global insertMode = 1
  }
  else {
    ExecuteCmd("C:\Program Files\WindowsApps\Microsoft.PowerShell_7.2.5.0_x64__8wekyb3d8bbwe\pwsh.exe")
    global insertMode = 1    
  }
}

Numpad7::OpenTerminal()
#7::OpenTerminal()
RAlt & 7::OpenTerminal()
#Return::OpenTerminal()

OpenDiscord() {
  if WinExist("ahk_exe Discord.exe")
     FocusWindow()
  else
    ExecuteCmd("C:\Users\cherr\AppData\Local\Discord\app-1.0.9005\Discord.exe")
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

#IfWinActive ahk_exe msedge.exe
^l::
  global insertMode = 1
  DisplayModeText()
  Send ^l
return

^t::
  global insertMode = 1
  DisplayModeText()
  Send ^t
return

,::
  global insertMode = 1
  DisplayModeText()
  Send {,}
return

Tab::
  if (insertMode = 1)
    Send {Tab}
  else
    Send ^{Tab}
return

+Tab::
  if (insertMode = 1)
    Send +{Tab}
  else
    Send ^+{Tab}
return

#IfWinNotActive ahk_class Emacs

Capslock::
  if (insertMode = 1) or (visualMode = 1) {
    global insertMode = 0
    global visualMode = 0
    DisplayModeText()
  }
  else
    Send {Esc}
return

2::
  if (insertMode = 1)
    Send {2}
  else {
    Send {Home}
    Send +{End}
    global visualMode = 1
  }
return

f::
  if (insertMode = 1)
    Send {f}
  else {
    global insertMode = 1
    DisplayModeText()
  }
return

t::
  if (insertMode = 1)
    Send {t}
  else {
    global visualMode = 1
    DisplayModeText()
  }
return

k::
  if (insertMode = 1)
    Send {k}
  else if (visualMode = 1)
    Send +{Down}
  else
    Send {Down}
return

j::
  if (insertMode = 1)
    Send {j}
  else if (visualMode = 1)
    Send +{Left}
  else
    Send {Left}
return

l::
  if (insertMode = 1)
    Send {l}
  else if (visualMode = 1)
    Send +{Right}
  else
    Send {Right}
return

i::
  if (insertMode = 1)
    Send {i}
  else if (visualMode = 1)
    Send +{Up}
  else
    Send {Up}
return

c::
  if (insertMode = 1)
    Send {c}
  else
    Send ^c
return

x::
  if (insertMode = 1)
    Send {x}
  else {
    Send ^x
    global insertMode = 1
    DisplayModeText()
  }
return

v::
  if (insertMode = 1)
    Send {v}
  else {
    Send ^v
    global visualMode = 0
    global normalMode = 1
    DisplayModeText()
  }
return

o::
  if (insertMode = 1)
    Send {o}
  else if (visualMode = 1)
    Send +^{Right}
  else
    Send ^{Right}
return

u::
  if (insertMode = 1)
    Send {u}
  else if (visualMode = 1)
    Send +^{Left}
  else
    Send ^{Left}
return

`;::
  if (insertMode = 1)
    Send {Text};
  else if (visualMode = 1)
    Send +{End}
  else
    Send {End}
return

h::
  if (insertMode = 1)
    Send {h}
  else if (visualMode = 1)
    Send +{Home}
  else
    Send {Home}
return

e::
  if (insertMode = 1)
    Send {e}
  else
    Send ^{Backspace}
return

d::
  if (insertMode = 1)
    Send {d}
  else
    Send {Backspace}
return

r::
  if (insertMode = 1)
    Send {r}
  else
    Send ^{Del}
return

a::
  if (insertMode = 1)
    Send {a}
  else {
    Send #s
    global insertMode = 1
    DisplayModeText()
  }
return

w::
  if (insertMode = 1)
    Send {w}
  else
    Send ^w
return

q::
  if (insertMode = 1)
    Send {q}
  else
    Send ^q
return

s::
  if (insertMode = 1)
    Send {s}
  else {
    if WinActive("ahk_exe slack.exe")
      Send +{Return}
    else
      Send {Return}
  }
return

p::
  if (insertMode = 1)
    Send {p}
  else {
    Send {Space}
  }
return

