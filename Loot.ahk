/*
Use F5 to rapid-fire picking items for the given time Duration.
*/

#Include "lib/core.ahk"

Duration := GetPreference("Loot", "Duration")

Check(not IsError(Duration), "Could not find Duration preference.")

Secs := Duration // 1000
ShowTip("Loot", "Press F5 to pick up items for " . Secs . " seconds.")

F5::{
    SetTimer Press, 100
    SetTimer Stop, Duration
}

Press() {
    Click
}

Stop() {
    SetTimer Press, 0
}
