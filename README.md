# AutoHotkey Grim Dawn

![Autocasting Wind Devil and Mortar Trap.](https://github.com/hendraanggrian/AutoHotkey-GrimDawn/raw/assets/preview.gif)

AutoHotkey scripts for casting, looting, and moving in Grim Dawn.

## Usage

Configure 3 sections of `preferences.ini`.

### Cast

Binds F1-F9 keys to autocast, multi-cast, or chained casting.

```ini
[Cast]
F1=Auto,1,6000,false
F2=Auto,2,9000,true
F3=Multi,3,2,true
F5=Chain,5-6-7,false
```

### Loot

Spam left click for limited time to pick up filtered items on the ground.

```ini
[Loot]
Duration=3000
```

### Move

Press F11 and aim cursor to move character without holding any key. This script
has no configuration.
