; Toggleable script with F1 and F2.

#Include, libs/core.ahk

preference1 := getPreference("Autocast", "F1")
preference2 := getPreference("Autocast", "F2")

message := ""
hook := InputHook("V")

If (preference1 = "ERROR" And preference2 = "ERROR") {
    MsgBox, 0x10, Error, % "Could not find preference F1 and F2."
    Return
}
If (preference1 <> "ERROR") {
    StringSplit, line, preference1, % ","
    global flag1 := False
    global hotbar1 := line1
    global interval1 := line2
    global centered1 := %line3%

    message := combineString(message, "F1", hotbar1, interval1, centered1)
    hook.KeyOpt("{" . hotbar1 . "}", "+N")
}
If (preference2 <> "ERROR") {
    StringSplit, line, preference2, % ","
    global flag2 := False
    global hotbar2 := line1
    global interval2 := line2
    global centered2 := %line3%

    message := combineString(message, "F2", hotbar2, interval2, centered2)
    hook.KeyOpt("{" . hotbar2 . "}", "+N")
}

TrayTip, % "Autocast", %message%, 3
hook.OnKeyDown := Func("reset")
hook.Start()

F1::toggle(hotbar1)
F2::toggle(hotbar2)

reset(obj, vk, sc) {
    hotbar := GetKeyName(Format("vk{:x}", vk))
    If (flag1 And hotbar1 = hotbar) {
        SetTimer, cast1, % interval1 + 100
    } Else If (flag2 And hotbar2 = hotbar) {
        SetTimer, cast2, % interval2 + 100
    }
}

toggle(hotbar) {
    If (hotbar = hotbar1 And preference1 <> "ERROR") {
        flag1 := !flag1
        If (flag1) {
            SetTimer, cast1, % interval1 + 100
        } Else {
            SetTimer, cast1, Off
        }
    } Else If (hotbar = hotbar2 And preference2 <> "ERROR") {
        flag2 := !flag2
        If (flag2) {
            SetTimer, cast2, % interval2 + 100
        } Else {
            SetTimer, cast2, Off
        }
    }
}

cast1() {
    doCast(hotbar1, centered1)
}

cast2() {
    doCast(hotbar2, centered2)
}

doCast(hotbar, centered) {
    ; remember cursor and move to center
    If (centered) {
        CoordMode, Mouse, Screen
        SysGet, PriMon, Monitor, %MonitorPrimary%
        newX := (PriMonLeft + PriMonRight) // 2
        newY := (PriMonTop + PriMonBottom) // 2
        MouseGetPos, oldX, oldY
        MouseMove, newX, newY
    }

    ; press button
    Send, {%hotbar% Down}
    Send, {%hotbar% Up}

    ; move back to original position
    If (centered) {
        MouseMove, oldX, oldY
    }
}

combineString(s, fKey, hotbar, interval, centered) {
    If (Not centered) {
        punctuation := "."
    } Else {
        punctuation := "(centered)."
    }
    secs := interval // 1000
    Return s . fKey
        . ": Press " . hotbar
        . " every " . secs
        . " seconds " . punctuation . "`n"
}
