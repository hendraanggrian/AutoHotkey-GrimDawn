; Core library is the base of all scripts.

#NoEnv ; generally better performance
#SingleInstance, Force ; faster testing

; Asserts that condition is true, or exits with an error message.
check(value, message) {
    If (Not value) {
        error(message)
    }
}

; Exits the script with an error message.
error(message) {
    MsgBox, 0x10, Error, %message%
    ExitApp, 1
}

; Get value from an INI file.
getPreference(section, key) {
    IniRead, value, preferences.ini, %section%, %key%
    Return value
}

; Set value to an INI file.
setPreference(section, key, value) {
    IniWrite, %value%, preferences.ini, %section%, %key%
}

; Returns true if any preference exists.
containsPreference(preferences*) {
    For Each, Item In preferences
        If (Not isError(Item))
            Return True
    Return False
}

; Returns true if this preference exists.
isError(preference) {
    Return preference = "ERROR"
}

; Show tray-area tip for 3 seconds with Windows 10 workaround.
showTip(title, text) {
    ; activate and wait
    TrayTip, %title%, %text%
    Sleep, 3000

    ; disactivate, see https://documentation.help/AutoHotKey-Functions/TrayTip.htm
    TrayTip
    if SubStr(A_OSVersion, 1, 3) = "10." {
        Menu Tray, NoIcon
        Sleep 500
        Menu Tray, Icon
    }
}
