/*
This script binds key F1 to F4 to the Hotbars specified in the preferences file. There are 3 types
of casting:

- Auto: Presses the Hotbar every Interval in milliseconds.
  - Format: `Auto,$Hotbar,$Interval,$Centered`
  - Example: `Auto,1,5000,false`
- Multi: Spam spells for N times.
  - Format: `Multi,$Hotbar,$counter,$Centered`
  - Example: `Multi,3,2,true`
- Chain: Combine spells using dash-separated Hotbars.
  - Format: `Chain,$Hotbars,$Centered`
  - Example: `Chain,5-6-7,false`
*/

#Include "lib/core.ahk"

; load preferences
Preference1 := GetPreference("Cast", "F1")
Preference2 := GetPreference("Cast", "F2")
Preference3 := GetPreference("Cast", "F3")
Preference4 := GetPreference("Cast", "F4")

Check(HasPreferences(Preference1
        , Preference2
        , Preference3
        , Preference4)
    , "Could not find any function key preference.")

; Hook is necessary for resetting timer upon manual trigger
Message := ""
Hook := InputHook("V")

; populate global variables
if (not IsError(Preference1)) {
    Line := StrSplit(Preference1, ",")
    global Flag1 := false
    global Type1 := Line[1]
    global Hotbar1 := Line[2]

    if (Type1 = "Auto") {
        global Interval1 := Line[3]
        global Centered1 := Line[4] = "true"

        Hook.KeyOpt("{" . Hotbar1 . "}", "+N")
        Message := Message . StringifyAuto("F1", Hotbar1, Interval1, Centered1)
    } else if (Type1 = "Multi") {
        global Count1 := Line[3]
        global Centered1 := Line[4] = "true"

        Message := Message . StringifyMulti("F1", Hotbar1, Count1, Centered1)
    } else if (Type1 = "Chain") {
        global Centered1 := Line[3] = "true"

        Message := Message . StringifyChain("F1", Hotbar1, Centered1)
    } else {
        Die("F1 has an unrecognizable type.")
    }
}
if (not IsError(Preference2)) {
    Line := StrSplit(Preference2, ",")
    global Flag2 := false
    global Type2 := Line[1]
    global Hotbar2 := Line[2]

    if (Type2 = "Auto") {
        global Interval2 := Line[3]
        global Centered2 := Line[4] = "true"

        Hook.KeyOpt("{" . Hotbar2 . "}", "+N")
        Message := Message . StringifyAuto("F2", Hotbar2, Interval2, Centered2)
    } else if (Type2 = "Multi") {
        global Count2 := Line[3]
        global Centered2 := Line[4] = "true"

        Message := Message . StringifyMulti("F2", Hotbar2, Count2, Centered2)
    } else if (Type2 = "Chain") {
        global Centered2 := Line[3] = "true"

        Message := Message . StringifyChain("F2", Hotbar2, Centered2)
    } else {
        Die("F2 has an unrecognizable type.")
    }
}
if (not IsError(Preference3)) {
    Line := StrSplit(Preference3, ",")
    global Flag3 := false
    global Type3 := Line[1]
    global Hotbar3 := Line[2]

    if (Type3 = "Auto") {
        global Interval3 := Line[3]
        global Centered3 := Line[4] = "true"

        Hook.KeyOpt("{" . Hotbar3 . "}", "+N")
        Message := Message . StringifyAuto("F3", Hotbar3, Interval3, Centered3)
    } else if (Type3 = "Multi") {
        global Count3 := Line[3]
        global Centered3 := Line[4] = "true"

        Message := Message . StringifyMulti("F3", Hotbar3, Count3, Centered3)
    } else if (Type3 = "Chain") {
        global Centered3 := Line[3] = "true"

        Message := Message . StringifyChain("F3", Hotbar3, Centered3)
    } else {
        Die("F3 has an unrecognizable type.")
    }
}
if (not IsError(Preference4)) {
    Line := StrSplit(Preference4, ",")
    global Flag4 := false
    global Type4 := Line[1]
    global Hotbar4 := Line[2]

    if (Type4 = "Auto") {
        global Interval4 := Line[3]
        global Centered4 := Line[4] = "true"

        Hook.KeyOpt("{" . Hotbar4 . "}", "+N")
        Message := Message . StringifyAuto("F4", Hotbar4, Interval4, Centered4)
    } else if (Type4 = "Multi") {
        global Count4 := Line[3]
        global Centered4 := Line[4] = "true"

        Message := Message . StringifyMulti("F4", Hotbar4, Count4, Centered4)
    } else if (Type4 = "Chain") {
        global Centered4 := Line[3] = "true"

        Message := Message . StringifyChain("F4", Hotbar4, Centered4)
    } else {
        Die("F4 has an unrecognizable type.")
    }
}

; show notification and start hook
ShowTip("Cast", Message)
Hook.OnKeyDown := AutocastReset
Hook.Start()

F1::{
    if (Type1 = "Auto") {
        global Flag1 := !Flag1
        if (Flag1) {
            SetTimer Autocast1, Interval1 + 100
        } else {
            SetTimer Autocast1, 0
        }
    } else if (Type1 = "Multi") {
        DoCast(Hotbar1, Count1, Centered1)
    } else {
        DoCast(Hotbar1, 1, Centered1)
    }
}

F2::{
    if (Type2 = "Auto") {
        global Flag2 := !Flag2
        if (Flag2) {
            SetTimer Autocast2, Interval2 + 100
        } else {
            SetTimer Autocast2, 0
        }
    } else if (Type2 = "Multi") {
        DoCast(Hotbar2, Count2, Centered2)
    } else {
        DoCast(Hotbar2, 1, Centered2)
    }
}

F3::{
    if (Type3 = "Auto") {
        global Flag3 := !Flag3
        if (Flag3) {
            SetTimer Autocast3, Interval3 + 100
        } else {
            SetTimer Autocast3, 0
        }
    } else if (Type3 = "Multi") {
        DoCast(Hotbar3, Count3, Centered3)
    } else {
        DoCast(Hotbar3, 1, Centered3)
    }
}

F4::{
    if (Type4 = "Auto") {
        global Flag4 := !Flag4
        if (Flag4) {
            SetTimer Autocast4, Interval4 + 100
        } else {
            SetTimer Autocast4, 0
        }
    } else if (Type4 = "Multi") {
        DoCast(Hotbar4, Count4, Centered4)
    } else {
        DoCast(Hotbar4, 1, Centered4)
    }
}

/*
Singular function triggered by hook to reset particular timer.
*/
AutocastReset(Obj, VK, SC) {
    Hotbar := GetKeyName(Format("vk{:x}", VK))
    if (Flag1 and Hotbar1 = Hotbar) {
        SetTimer Autocast1, Interval1 + 100
    } else if (Flag2 and Hotbar2 = Hotbar) {
        SetTimer Autocast2, Interval2 + 100
    } else if (Flag3 and Hotbar3 = Hotbar) {
        SetTimer Autocast3, Interval3 + 100
    } else if (Flag4 and Hotbar4 = Hotbar) {
        SetTimer Autocast4, Interval4 + 100
    }
}

; Multiple functions are needed for unique label name.

Autocast1() {
    DoCast(Hotbar1, 1, Centered1)
}
Autocast2() {
    DoCast(Hotbar2, 1, Centered2)
}
Autocast3() {
    DoCast(Hotbar3, 1, Centered3)
}
Autocast4() {
    DoCast(Hotbar4, 1, Centered4)
}

/*
The function that is actually manipulating input.
*/
DoCast(Hotbar, Count, Centered) {
    ; remember cursor and move to center
    if (Centered) {
        CoordMode "Mouse", "Screen"
        MouseGetPos &OldX, &OldY
        MouseMove A_ScreenWidth // 2, A_ScreenHeight // 2
        Sleep 50 ; wait for mouse
    }

    ; press Buttons
    if (InStr(Hotbar, "-")) {
        Line := StrSplit(Hotbar, "-")
        for H in Line {
            Send "{" . H . " down}"
            Send "{" . H . " up}"

            Sleep 100 ; wait for skill
        }
    } else {
        loop Count {
            Send "{" . Hotbar . " down}"
            Send "{" . Hotbar . " up}"

            ; wait for skill
            if (Count > 1) {
                Sleep 100
            }
        }
    }

    ; move back to original position
    if (Centered) {
        MouseMove OldX, OldY
    }
}

StringifyAuto(FKey, Hotbar, Interval, Centered) {
    if (not Centered) {
        Punctuation := "."
    } else {
        Punctuation := "(Centered)."
    }
    Secs := Interval // 1000
    return FKey . ": Press " . Hotbar
        . " every " . Secs
        . " seconds " . Punctuation . "`n"
}

StringifyMulti(FKey, Hotbar, Count, Centered) {
    if (not Centered) {
        Punctuation := "."
    } else {
        Punctuation := "(Centered)."
    }
    return FKey . ": Press " . Hotbar
        . " for " . Count
        . " times " . Punctuation . "`n"
}

StringifyChain(FKey, Hotbars, Centered) {
    if (not Centered) {
        Punctuation := "."
    } else {
        Punctuation := "(Centered)."
    }
    Buttons := StrReplace(Hotbars, "-", ", ")
    return FKey . ": Press " . Buttons
        . " " . Punctuation . "`n"
}
