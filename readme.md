Some important notes

Currently there are no logic mods, so this structure is untestable

LuaMods is actually found by the `enabled.txt` so that folder can be named anything you may actually want
the `shared` folder gets copied into the "shared" folder for ue4ss, this is meant for libraries and configs for example

currently pakmods in subfolders is *slightly* supported
the pakmods will be placed into a seperate folder named the same as the subfolder
so it is reccomended to keep your pakmods either at the root of the zip, or in a subfolder with your mod name

example zip contents
```
+--- example
|   +--- enabled.txt
|   +--- example-folder.pak
|   +--- LogicMods
|   |   +--- example-logic.pak
|   +--- Scripts
|   |   +--- main.lua
|   +--- shared
|   |   +--- example.lua
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
