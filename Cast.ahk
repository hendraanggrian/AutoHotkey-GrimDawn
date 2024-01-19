; This script binds key F1 to F9 to the hotbars specified in the preferences file. There are 3 types
; of casting:
;
; - Auto: Presses the hotbar every interval in milliseconds.
;   - Format: `Auto,$hotbar,$interval,$centered`
;   - Example: `Auto,1,5000,False`
; - Multi: Spam spells for N times.
;   - Format: `Multi,$hotbar,$counter,$centered`
;   - Example: `Multi,3,2,True`
; - Chain: Combine spells using dash-separated hotbars.
;   - Format: `Chain,$hotbars,$centered`
;   - Example: `Chain,5-6-7,False`

#Include, libs/core.ahk

; load preferences
preference1 := getPreference("Cast", "F1")
preference2 := getPreference("Cast", "F2")
preference3 := getPreference("Cast", "F3")
preference4 := getPreference("Cast", "F4")
preference5 := getPreference("Cast", "F5")
preference6 := getPreference("Cast", "F6")
preference7 := getPreference("Cast", "F7")
preference8 := getPreference("Cast", "F8")
preference9 := getPreference("Cast", "F9")

check(containsPreference(preference1
        , preference2
        , preference3
        , preference4
        , preference5
        , preference6
        , preference7
        , preference8
        , preference9)
    , "Could not find any function key preference.")

; hook is necessary for resetting timer upon manual trigger
message := ""
hook := InputHook("V")

; populate global variables
If (Not isError(preference1)) {
    StringSplit, line, preference1, % ","
    global type1 := line1
    global hotbar1 := line2

    If (type1 = "Auto") {
        global flag1 := False
        global interval1 := line3
        global centered1 := %line4%

        hook.KeyOpt("{" . hotbar1 . "}", "+N")
        message := message . stringifyAuto("F1", hotbar1, interval1, centered1)
    } Else If (type1 = "Multi") {
        global count1 := line3
        global centered1 := %line4%

        message := message . stringifyMulti("F1", hotbar1, count1, centered1)
    } Else If (type1 = "Chain") {
        global centered1 := %line3%

        message := message . stringifyChain("F1", hotbar1, centered1)
    } Else {
        error("F1 has an unrecognizable type.")
    }
}
If (Not isError(preference2)) {
    StringSplit, line, preference2, % ","
    global type2 := line1
    global hotbar2 := line2

    If (type2 = "Auto") {
        global flag2 := False
        global interval2 := line3
        global centered2 := %line4%

        hook.KeyOpt("{" . hotbar2 . "}", "+N")
        message := message . stringifyAuto("F2", hotbar2, interval2, centered2)
    } Else If (type2 = "Multi") {
        global count2 := line3
        global centered2 := %line4%

        message := message . stringifyMulti("F2", hotbar2, count2, centered2)
    } Else If (type2 = "Chain") {
        global centered2 := %line3%

        message := message . stringifyChain("F2", hotbar2, centered2)
    } Else {
        error("F2 has an unrecognizable type.")
    }
}
If (Not isError(preference3)) {
    StringSplit, line, preference3, % ","
    global type3 := line1
    global hotbar3 := line2

    If (type3 = "Auto") {
        global flag3 := False
        global interval3 := line3
        global centered3 := %line4%

        hook.KeyOpt("{" . hotbar3 . "}", "+N")
        message := message . stringifyAuto("F3", hotbar3, interval3, centered3)
    } Else If (type3 = "Multi") {
        global count3 := line3
        global centered3 := %line4%

        message := message . stringifyMulti("F3", hotbar3, count3, centered3)
    } Else If (type3 = "Chain") {
        global centered3 := %line3%

        message := message . stringifyChain("F3", hotbar3, centered3)
    } Else {
        error("F3 has an unrecognizable type.")
    }
}
If (Not isError(preference4)) {
    StringSplit, line, preference4, % ","
    global type4 := line1
    global hotbar4 := line2

    If (type4 = "Auto") {
        global flag4 := False
        global interval4 := line3
        global centered4 := %line4%

        hook.KeyOpt("{" . hotbar4 . "}", "+N")
        message := message . stringifyAuto("F4", hotbar4, interval4, centered4)
    } Else If (type4 = "Multi") {
        global count4 := line3
        global centered4 := %line4%

        message := message . stringifyMulti("F4", hotbar4, count4, centered4)
    } Else If (type4 = "Chain") {
        global centered4 := %line3%

        message := message . stringifyChain("F4", hotbar4, centered4)
    } Else {
        error("F4 has an unrecognizable type.")
    }
}
If (Not isError(preference5)) {
    StringSplit, line, preference5, % ","
    global type5 := line1
    global hotbar5 := line2

    If (type5 = "Auto") {
        global flag5 := False
        global interval5 := line3
        global centered5 := %line4%

        hook.KeyOpt("{" . hotbar5 . "}", "+N")
        message := message . stringifyAuto("F5", hotbar5, interval5, centered5)
    } Else If (type5 = "Multi") {
        global count5 := line3
        global centered5 := %line4%

        message := message . stringifyMulti("F5", hotbar5, count5, centered5)
    } Else If (type5 = "Chain") {
        global centered5 := %line3%

        message := message . stringifyChain("F5", hotbar5, centered5)
    } Else {
        error("F5 has an unrecognizable type.")
    }
}
If (Not isError(preference6)) {
    StringSplit, line, preference6, % ","
    global type6 := line1
    global hotbar6 := line2

    If (type6 = "Auto") {
        global flag6 := False
        global interval6 := line3
        global centered6 := %line4%

        hook.KeyOpt("{" . hotbar6 . "}", "+N")
        message := message . stringifyAuto("F6", hotbar6, interval6, centered6)
    } Else If (type6 = "Multi") {
        global count6 := line3
        global centered6 := %line4%

        message := message . stringifyMulti("F6", hotbar6, count6, centered6)
    } Else If (type6 = "Chain") {
        global centered6 := %line3%

        message := message . stringifyChain("F6", hotbar6, centered6)
    } Else {
        error("F6 has an unrecognizable type.")
    }
}
If (Not isError(preference7)) {
    StringSplit, line, preference7, % ","
    global type7 := line1
    global hotbar7 := line2

    If (type7 = "Auto") {
        global flag7 := False
        global interval7 := line3
        global centered7 := %line4%

        hook.KeyOpt("{" . hotbar7 . "}", "+N")
        message := message . stringifyAuto("F7", hotbar7, interval7, centered7)
    } Else If (type7 = "Multi") {
        global count7 := line3
        global centered7 := %line4%

        message := message . stringifyMulti("F7", hotbar7, count7, centered6)
    } Else If (type7 = "Chain") {
        global centered7 := %line3%

        message := message . stringifyChain("F7", hotbar7, centered7)
    } Else {
        error("F8 has an unrecognizable type.")
    }
}
If (Not isError(preference8)) {
    StringSplit, line, preference8, % ","
    global type8 := line1
    global hotbar8 := line2

    If (type8 = "Auto") {
        global flag8 := False
        global interval8 := line3
        global centered8 := %line4%

        hook.KeyOpt("{" . hotbar8 . "}", "+N")
        message := message . stringifyAuto("F8", hotbar8, interval8, centered8)
    } Else If (type8 = "Multi") {
        global count8 := line3
        global centered8 := %line4%

        message := message . stringifyMulti("F8", hotbar8, count8, centered8)
    } Else If (type8 = "Chain") {
        global centered8 := %line3%

        message := message . stringifyChain("F8", hotbar8, centered8)
    } Else {
        error("F8 has an unrecognizable type.")
    }
}
If (Not isError(preference9)) {
    StringSplit, line, preference9, % ","
    global type9 := line1
    global hotbar9 := line2

    If (type9 = "Auto") {
        global flag9 := False
        global interval9 := line3
        global centered9 := %line4%

        hook.KeyOpt("{" . hotbar9 . "}", "+N")
        message := message . stringifyAuto("F9", hotbar9, interval9, centered9)
    } Else If (type9 = "Multi") {
        global count9 := line3
        global centered9 := %line4%

        message := message . stringifyMulti("F9", hotbar9, count9, centered9)
    } Else If (type9 = "Chain") {
        global centered9 := %line3%

        message := message . stringifyChain("F9", hotbar9, centered9)
    } Else {
        error("F9 has an unrecognizable type.")
    }
}

; show notification and hook
showTip("Cast", message)
hook.OnKeyDown := Func("autocastReset")
hook.Start()

F1::
    If (type1 = "Auto") {
        flag1 := !flag1
        If (flag1) {
            SetTimer, autocast1, % interval1 + 100
        } Else {
            SetTimer, autocast1, Off
        }
    } Else If (type1 = "Multi") {
        doCast(hotbar1, count1, centered1)
    } Else {
        doCast(hotbar1, 1, centered1)
    }
    Return

F2::
    If (type2 = "Auto") {
        flag2 := !flag2
        If (flag2) {
            SetTimer, autocast2, % interval2 + 100
        } Else {
            SetTimer, autocast2, Off
        }
    } Else If (type2 = "Multi") {
        doCast(hotbar2, count2, centered2)
    } Else {
        doCast(hotbar2, 1, centered2)
    }
    Return

F3::
    If (type3 = "Auto") {
        flag3 := !flag3
        If (flag3) {
            SetTimer, autocast3, % interval3 + 100
        } Else {
            SetTimer, autocast3, Off
        }
    } Else If (type3 = "Multi") {
        doCast(hotbar3, count3, centered3)
    } Else {
        doCast(hotbar3, 1, centered3)
    }
    Return

F4::
    If (type4 = "Auto") {
        flag4 := !flag4
        If (flag4) {
            SetTimer, autocast4, % interval4 + 100
        } Else {
            SetTimer, autocast4, Off
        }
    } Else If (type4 = "Multi") {
        doCast(hotbar4, count4, centered4)
    } Else {
        doCast(hotbar4, 1, centered4)
    }
    Return

F5::
    If (type5 = "Auto") {
        flag5 := !flag5
        If (flag5) {
            SetTimer, autocast5, % interval5 + 100
        } Else {
            SetTimer, autocast5, Off
        }
    } Else If (type5 = "Multi") {
        doCast(hotbar5, count5, centered5)
    } Else {
        doCast(hotbar5, 1, centered5)
    }
    Return

F6::
    If (type6 = "Auto") {
        flag6 := !flag6
        If (flag6) {
            SetTimer, autocast6, % interval6 + 100
        } Else {
            SetTimer, autocast6, Off
        }
    } Else If (type6 = "Multi") {
        doCast(hotbar6, count6, centered6)
    } Else {
        doCast(hotbar6, 1, centered6)
    }
    Return

F7::
    If (type7 = "Auto") {
        flag7 := !flag7
        If (flag7) {
            SetTimer, autocast7, % interval7 + 100
        } Else {
            SetTimer, autocast7, Off
        }
    } Else If (type7 = "Multi") {
        doCast(hotbar7, count7, centered7)
    } Else {
        doCast(hotbar7, 1, centered7)
    }
    Return

F8::
    If (type8 = "Auto") {
        flag8 := !flag8
        If (flag8) {
            SetTimer, autocast8, % interval8 + 100
        } Else {
            SetTimer, autocast8, Off
        }
    } Else If (type8 = "Multi") {
        doCast(hotbar8, count8, centered8)
    } Else {
        doCast(hotbar8, 1, centered8)
    }
    Return

F9::
    If (type9 = "Auto") {
        flag9 := !flag9
        If (flag9) {
            SetTimer, autocast9, % interval9 + 100
        } Else {
            SetTimer, autocast9, Off
        }
    } Else If (type9 = "Multi") {
        doCast(hotbar9, count9, centered9)
    } Else {
        doCast(hotbar9, 1, centered9)
    }
    Return

; Singular function triggered by hook to reset particular timer.
autocastReset(obj, vk, sc) {
    hotbar := GetKeyName(Format("vk{:x}", vk))
    If (flag1 And hotbar1 = hotbar) {
        SetTimer, autocast1, % interval1 + 100
    } Else If (flag2 And hotbar2 = hotbar) {
        SetTimer, autocast2, % interval2 + 100
    } Else If (flag3 And hotbar3 = hotbar) {
        SetTimer, autocast3, % interval3 + 100
    } Else If (flag4 And hotbar4 = hotbar) {
        SetTimer, autocast4, % interval4 + 100
    } Else If (flag5 And hotbar5 = hotbar) {
        SetTimer, autocast5, % interval5 + 100
    } Else If (flag6 And hotbar6 = hotbar) {
        SetTimer, autocast6, % interval6 + 100
    } Else If (flag7 And hotbar7 = hotbar) {
        SetTimer, autocast7, % interval7 + 100
    } Else If (flag8 And hotbar8 = hotbar) {
        SetTimer, autocast8, % interval8 + 100
    } Else If (flag9 And hotbar9 = hotbar) {
        SetTimer, autocast9, % interval9 + 100
    }
}

; Multiple functions are needed for unique label name.
autocast1() {
    doCast(hotbar1, 1, centered1)
}
autocast2() {
    doCast(hotbar2, 1, centered2)
}
autocast3() {
    doCast(hotbar3, 1, centered3)
}
autocast4() {
    doCast(hotbar4, 1, centered4)
}
autocast5() {
    doCast(hotbar5, 1, centered5)
}
autocast6() {
    doCast(hotbar6, 1, centered6)
}
autocast7() {
    doCast(hotbar7, 1, centered7)
}
autocast8() {
    doCast(hotbar8, 1, centered8)
}
autocast9() {
    doCast(hotbar9, 1, centered9)
}

; The function that is actually manipulating input.
doCast(hotbar, count, centered) {
    ; remember cursor and move to center
    If (centered) {
        CoordMode, Mouse, Screen
        SysGet, PriMon, Monitor, %MonitorPrimary%
        newX := (PriMonLeft + PriMonRight) // 2
        newY := (PriMonTop + PriMonBottom) // 2
        MouseGetPos, oldX, oldY
        MouseMove, newX, newY
    }

    ; press buttons
    If (InStr(hotbar, "-")) {
        StringSplit, line, hotbar, % "-"
        Loop, %line0% {
            h := line%A_Index%
            Send, {%h% Down}
            Send, {%h% Up}

            Sleep, 100
        }
    } Else {
        Loop, %count% {
            Send, {%hotbar% Down}
            Send, {%hotbar% Up}

            If (count > 1) {
                Sleep, 100
            }
        }
    }

    ; move back to original position
    If (centered) {
        MouseMove, oldX, oldY
    }
}

stringifyAuto(fKey, hotbar, interval, centered) {
    If (Not centered) {
        punctuation := "."
    } Else {
        punctuation := "(centered)."
    }
    secs := interval // 1000
    Return fKey . ": Press " . hotbar
        . " every " . secs
        . " seconds " . punctuation . "`n"
}

stringifyMulti(fKey, hotbar, count, centered) {
    If (Not centered) {
        punctuation := "."
    } Else {
        punctuation := "(centered)."
    }
    Return fKey . ": Press " . hotbar
        . " for " . count
        . " times " . punctuation . "`n"
}

stringifyChain(fKey, hotbars, centered) {
    If (Not centered) {
        punctuation := "."
    } Else {
        punctuation := "(centered)."
    }
    StringReplace, buttons, hotbars, % "-", % ", ", All
    Return fKey . ": Press " . buttons
        . " " . punctuation . "`n"
}
