if (-not(Test-Path -Path 'C:\\Users\\cherr\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\user.ahk' -PathType Leaf)) {
    New-Item -ItemType SymbolicLink -Path 'C:\\Users\\cherr\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\user.ahk' -Target "D:\\git\\dotfiles\\windows\\user.ahk"
}

if (-not(Test-Path -Path 'C:\\Users\\cherr\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\startup.bat' -PathType Leaf)) {
    New-Item -ItemType SymbolicLink -Path 'C:\\Users\\cherr\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\startup.bat' -Target "D:\\git\\dotfiles\\windows\\startup.bat"
}

if (-not(Test-Path -Path 'C:\\Users\\cherr\\AppData\\Roaming\\espanso\\match\\base.yml' -PathType Leaf)) {
    New-Item -ItemType SymbolicLink -Path 'C:\\Users\\cherr\\AppData\\Roaming\\espanso\\match\\base.yml' -Target "D:\\git\\dotfiles\\windows\\espanso.yml"
}
