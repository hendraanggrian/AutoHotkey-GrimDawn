; Simple script to explore location until F11 or left click is pressed again.

#Include, libs/core.ahk

showTip("Move", "Toggle F11 to walk around.")

F11::
    If (GetKeyState("LButton", "P")) {
        Click, Up
    } Else {
        Click, Down
    }
    Return
