Some important notes

Currently there are no logic mods, so this structure is untestable

LuaMods is actually found by the `enabled.txt` so that folder can be named anything you may actually want
the `shared` folder gets copied into the "shared" folder for ue4ss, this is meant for libraries and configs for example

currently pakmods in subfolders is *slightly* supported
the pakmods will be placed into a seperate folder named the same as the subfolder
so it is reccomended to keep your pakmods either at the root of the zip, or in a subfolder with your mod name

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

example zip contents
```
+--- example
|   +--- example-folder.pak
|   +--- LogicMods
|   |   +--- example-logic.pak
|   +--- LuaMods
|   |   +--- enabled.txt
|   |   +--- Scripts
|   |   |   +--- main.lua
|   |   +--- shared
|   |   |   +--- example.lua
+--- example-root.pak
```

installed path contents
```
+--- LogicMods
|   +--- example
|   |   +--- example-logic.pak
+--- LuaMods
|   +--- example
|   |   +--- enabled.txt
|   |   +--- Scripts
|   |   |   +--- main.lua
|   +--- shared
|   |   +--- example
|   |   |   +--- example.lua
+--- Mods
|   +--- example
|   |   +--- example-folder.pak
|   +--- example-root.pak
```
