/*
Simple script to explore location until F6 or left click is pressed again.
*/

#Include "lib/core.ahk"

ShowTip("Move", "Toggle F6 to walk around.")

F6::{
    if (GetKeyState("LButton", "P")) {
        Click "Up"
    } else {
        Click "Down"
    }
}
