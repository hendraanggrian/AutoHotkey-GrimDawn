; Double-cast hotbars with F3 and F4.

#Include, libs/core.ahk

preference3 := getPreference("Dualcast", "F3")
preference4 := getPreference("Dualcast", "F4")

message := ""

If (preference3 = "ERROR" And preference4 = "ERROR") {
    MsgBox, 0x10, Error, % "Could not find preference F3 and F4."
    Return
}
If (preference3 <> "ERROR") {
    StringSplit, line, preference3, % ","
    global flag3 := False
    global hotbar3_1 := line1
    global hotbar3_2 := line2
    global centered3 := %line3%

    message := combineString(message, "F3", hotbar3_1, hotbar3_2, centered1)
}
If (preference4 <> "ERROR") {
    StringSplit, line, preference4, % ","
    global flag4 := False
    global hotbar4_1 := line1
    global hotbar4_2 := line2
    global centered4 := %line3%

    message := combineString(message, "F4", hotbar4_1, hotbar4_2, centered2)
}

TrayTip, % "Dualcast", %message%, 3

F3::doCast(hotbar3_1, hotbar3_2, centered3)
F4::doCast(hotbar4_1, hotbar4_2, centered4)

doCast(firstHotbar, secondHotbar, centered) {
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

combineString(s, fKey, firstHotbar, secondHotbar, centered) {
    If (Not centered) {
        punctuation := "."
    } Else {
        punctuation := "(centered)."
    }
    Return s . fKey
        . ": Press " . firstHotbar
        . " and " . secondHotbar
        . " " punctuation . "`n"
}
