/*
Core library is the base of all scripts.
*/

#SingleInstance Force ; faster testing

/*
Asserts that condition is true, or exits with an error message.
*/
Check(Condition, Message) {
    if (not Condition) {
        Die(Message)
    }
}

/*
Exits the script with an error message.
*/
Die(Message) {
    MsgBox Message,, 0x10
    ExitApp 1
}

/*
Get value from an INI file.
*/
GetPreference(Section, Key) {
    return IniRead("preferences.ini", Section, Key, "ERROR")
}

/*
Set value to an INI file.
*/
SetPreference(Section, Key, Val) {
    IniWrite Val, "preferences.ini", Section, Key
}

/*
Returns true if any preference exists.
*/
HasPreferences(Preferences*) {
    for Preference in Preferences
        if (not IsError(Preference))
            return true
    return false
}

/*
Returns true if this preference exists.
*/
IsError(Preference) {
    return Preference = "ERROR"
}

/*
Show tray-area tip for 3 seconds with Windows 10 workaround.
*/
ShowTip(Title, Text) {
    ; activate and wait
    TrayTip Text, Title
    Sleep 3000

    ; disactivate, see https://documentation.help/AutoHotKey-Functions/TrayTip.htm
    TrayTip
    if SubStr(A_OSVersion, 1, 3) = "10." {
        A_IconHidden := true
        Sleep 200
        A_IconHidden := false
    }
}
