```
/modname/[.pak, .ucas, .utoc]           
    =>  pakdir/Mods/modname/[.pak, .ucas, .utoc]
/modname/LogicMods[.pak, .ucas, .utoc]
    => pakdir/LogicMods/modname/[.pak, .ucas, .utoc]

/modname/LuaMods/shared
    => pakdir/LuaMods/shared/modname

if modname/LuaMods/enabled.txt
    /modname/LuaMods/enabled.txt
        => pakdir/LuaMods/modname/enabled.txt
    /modname/LuaMods/Scripts/
        => pakdir/LuaMods/modname/Scripts/
```