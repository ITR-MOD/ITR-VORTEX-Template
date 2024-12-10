### Mod Types and Structures

#### **PAK Mods**

Standard Unreal Engine `.pak` mods should be placed under `IntoTheRadius2/Content/Paks/Mods/`.

**Recommended Structure:**
- Inside a folder named after your mod at the root of the zip:
    ```
    mod.zip/modName/mod.pak
    ```
  Resulting in:
    ```
    IntoTheRadius2/Content/Paks/Mods/modName/mod.pak
    ```

**Alternative Structure (Not Recommended):**
- If `.pak` files are in a subfolder other than `modName`, they’ll be placed in a folder with the subfolder name.
    ```
    mod.zip/folder/mod.pak
    ```
  Resulting in:
    ```
    IntoTheRadius2/Content/Paks/Mods/folder/mod.pak
    ```

---

#### **Lua Mods**

Lua mods are located in the `IntoTheRadius2/Content/Paks/LuaMods/` directory. The Vortex extension identifies Lua mods by finding an `enabled.txt` file.

**Structure:**
- Place your Lua scripts in a `Scripts` folder and include `enabled.txt`:
    ```
    mod.zip/modName/Scripts/
    mod.zip/modName/enabled.txt
    ```
  Resulting in:
    ```
    IntoTheRadius2/Content/Paks/LuaMods/modName/Scripts/
    IntoTheRadius2/Content/Paks/LuaMods/modName/enabled.txt
    ```

> **Note:** The LuaMods folder can have any name, as the `enabled.txt` file is used to detect the mod.

---

#### **Shared Lua Libraries**

Shared Lua libraries and configs should be inside a `shared` folder within your mod directory. These are copied to the shared directory for `ue4ss`.

**Structure:**
    ```
    mod.zip/modName/shared/
    ```
  Resulting in:
    ```
    IntoTheRadius2/Content/Paks/LuaMods/shared/modName/
    ```

---

#### **LogicMods**

LogicMods are currently untested but should follow the same structure as `.pak` mods. They are installed in `IntoTheRadius2/Content/Paks/LogicMods/`.

**Structure:**
    ```
    mod.zip/modName/mod.pak
    ```
  Resulting in:
    ```
    IntoTheRadius2/Content/Paks/LogicMods/modName/mod.pak
    ```

---

### Notice for FOMOD Installers

**FOMOD installers must now account for the new base path being the game install folder, not the mods folder.**  
This means the root directory for any mod content is located directly within the *Into the Radius 2* installation path, for example:

```
IntoTheRadius2/Content/Paks/Mods/
```

Ensure that your installer reflects this structure.

---

### Custom File Placement

The custom format can be used for custom file placements, such as INI tweaks or game file replacements. Instead of placing files directly into the `IntoTheRadius2/Content/Paks` directory, this format operates off the game directory `./`. 

#### **Usage**

- **`custom.txt` at the root of the zip:** Places all files into the game install directory.
    ```
    mod.zip/custom.txt => * to gameRoot/
    ```

- **`custom.txt` in a subfolder:** Places files in the game install directory based off the path in the zip
    ```
    mod.zip/folder/custom.txt => /folder/* to gameRoot/folder
    ```

This approach is intended as an alternative for FOMODs when it comes to custom file placement; however, using FOMODs is still the preferred method for managing mod installations.

--- 


### Example Mod Archive Structure

Below is an example of how your mod archive should be structured:
The IniSettings line is held as an example
```
mod.zip/
|   +--- example-root.pak
|   +--- example/
|   |   +--- enabled.txt
|   |   +--- example-folder.pak
|   |   +--- LogicMods/
|   |   |   +--- example-logic.pak
|   |   +--- Scripts/
|   |   |   +--- main.lua
|   |   +--- shared/
|   |   |   +--- example.lua
|   +--- IntoTheRadius2/
|   |   +--- Content/
|   |   |   +--- ITR2/
|   |   |   |   +--- IniSettings/
|   |   |   |   |   +--- Settings.ini
|   |   |   |   |   +--- custom.txt
```

---

### Example Installed Path

After installing through Vortex, your mod files will be placed as follows:

```
IntoTheRadius2/Content/Paks/LogicMods/
|   +--- example/
|   |   +--- example-logic.pak

IntoTheRadius2/Content/Paks/LuaMods/
|   +--- example/
|   |   +--- enabled.txt
|   |   +--- Scripts/
|   |   |   +--- main.lua
|   +--- shared/
|   |   +--- example/
|   |   |   +--- example.lua

IntoTheRadius2/Content/Paks/Mods/
|   +--- example/
|   |   +--- example-folder.pak
|   +--- example-root.pak

IntoTheRadius2/Content/ITR2/IniSettings
|   +--- Settings.ini
```
