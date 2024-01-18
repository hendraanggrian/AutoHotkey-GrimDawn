; Core library is the base of all scripts.

#NoEnv ; generally better performance
#SingleInstance, Force ; faster testing

; Get value from an INI file.
getPreference(section, key) {
    IniRead, value, preferences.ini, %section%, %key%
    Return value
}

; Set value to an INI file.
setPreference(section, key, value) {
    IniWrite, %value%, preferences.ini, %section%, %key%
}
