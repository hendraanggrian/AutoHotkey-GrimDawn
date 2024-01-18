; Tripe-cast hotbars with F5 to F6.

#Include, libs/core.ahk

preference5 := getPreference("Tricast", "F5")
preference6 := getPreference("Tricast", "F6")

message := ""

If (preference5 = "ERROR" And preference6 = "ERROR") {
    MsgBox, 0x10, Error, % "Could not find preference F5 and F6."
    Return
}
If (preference5 <> "ERROR") {
    StringSplit, line, preference5, % ","
    global flag5 := False
    global hotbar5_1 := line1
    global hotbar5_2 := line2
    global hotbar5_3 := line3
    global centered5 := %line4%

    message := combineString(message, "F5", hotbar5_1, hotbar5_2, hotbar5_3, centered5)
}
If (preference6 <> "ERROR") {
    StringSplit, line, preference6, % ","
    global flag6 := False
    global hotbar6_1 := line1
    global hotbar6_2 := line2
    global hotbar6_3 := line3
    global centered8 := %line4%

    message := combineString(message, "F6", hotbar6_1, hotbar6_2, hotbar6_3, centered6)
}

TrayTip, % "Tricast", %message%, 3

F5::doCast(hotbar5_1, hotbar5_2, hotbar5_3, centered5)
F6::doCast(hotbar6_1, hotbar6_2, hotbar6_3, centered6)

doCast(firstHotbar, secondHotbar, thirdHotbar, centered) {
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
    Send, {%firstHotbar% Down}
    Send, {%firstHotbar% Up}
    Sleep, 100
    Send, {%secondHotbar% Down}
    Send, {%secondHotbar% Up}
    Sleep, 100
    Send, {%thirdHotbar% Down}
    Send, {%thirdHotbar% Up}

    ; move back to original position
    If (centered) {
        MouseMove, oldX, oldY
    }
}

combineString(s, fKey, firstHotbar, secondHotbar, thirdHotbar, centered) {
    If (Not centered) {
        punctuation := "."
    } Else {
        punctuation := "(centered)."
    }
    Return s . fKey
        . ": Press " . firstHotbar
        . ", " . secondHotbar
        . ", and " . thirdHotbar
        . " " punctuation . "`n"
}
