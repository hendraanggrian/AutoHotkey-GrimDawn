# AutoHotkey Grim Dawn

AutoHotkey scripts for automatically triggering Grim Dawn skills given
intervals.

## Usage

Configure 3 sections of `preferences.ini`.

### Autocast

The comma-separated values are hotbar key, interval in milliseconds, and whether
to target center on cast. Only binds F1 and F2.

```ini
[Autocast]
F1=1,6000,False
F2=2,9000,True
```

### Dualcast

Enter first and second hotbar keys, followed by whether to target center on
cast. Only binds F3 and F4.

```ini
[Dualcast]
F3=3,4,True
```

### Tricast

Enter first, second, and third hotbar keys, followed by whether to target center
on cast. Only binds F5 and F6.

```ini
[Tricast]
F5=5,6,7,False
```
