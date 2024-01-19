; Use F10 to rapid-fire picking items for the given time duration.

#Include, libs/core.ahk

duration := getPreference("Loot", "Duration")

check(Not isError(duration), "Could not find duration preference.")

secs := duration // 1000
showTip("Loot", "Press F10 to pick up items for " . secs . " seconds.")

F10::
    SetTimer, press, 100
    SetTimer, stop, %duration%
    Return

press() {
    Click
}

stop() {
    SetTimer, press, Off
}
