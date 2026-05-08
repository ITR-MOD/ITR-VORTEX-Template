### Mod Types and Structures

---

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

> **Note:** The `LuaMods` folder can have any name, as the `enabled.txt` file is used to detect the mod.

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

LogicMods **require a specific subfolder structure** and are installed into `IntoTheRadius2/Content/Paks/LogicMods/`.

**Structure:**

- Place your LogicMod `.pak` files in a `LogicMods` subfolder within your mod directory.
  The **grandparent folder** of the `.pak` file (i.e., the folder containing the `LogicMods` subfolder) becomes the installed mod name.

    ```
    mod.zip/modName/LogicMods/mod.pak
    ```

  Resulting in:

    ```
    IntoTheRadius2/Content/Paks/LogicMods/modName/mod.pak
    ```

**Key Rules:**

1. The `.pak` file **must** be nested under `modName/LogicMods/` in the mod archive.
2. Do NOT place LogicMod `.pak` files directly under `modName/`—they will be treated as standard PAK mods.

---

#### **SimpleModLoader Mods**

SimpleModLoader mods are installed into `IntoTheRadius2/Content/Mods/` (not inside `Paks`). They are identified by the presence of a `.uplugin` file that shares its base name with the accompanying `.pak`, `.ucas`, and `.utoc` files.

**Structure:**

- All four files must share the same base name and sit in a folder named after your mod:

    ```
    mod.zip/modName/modName.pak
    mod.zip/modName/modName.ucas
    mod.zip/modName/modName.utoc
    mod.zip/modName/modName.uplugin
    ```

  Resulting in:

    ```
    IntoTheRadius2/Content/Mods/modName/modName.pak
    IntoTheRadius2/Content/Mods/modName/modName.ucas
    IntoTheRadius2/Content/Mods/modName/modName.utoc
    IntoTheRadius2/Content/Mods/modName/modName.uplugin
    ```

**Key Rules:**

1. The `.uplugin` file **must** share its base name with the `.pak`/`.ucas`/`.utoc` files — this is what triggers SML detection.
2. Do NOT include a `.uplugin` file in a standard PAK mod; it will be treated as an SML mod and installed to `Content/Mods/` instead of `Content/Paks/Mods/`.

---

### Notice for FOMOD Installers

**FOMOD installers must account for the base path being the game install folder, not the mods folder.**
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

- **`custom.txt` in a subfolder:** Places files in the game install directory based off the path in the zip.

    ```
    mod.zip/folder/custom.txt => /folder/* to gameRoot/folder
    ```

This approach is intended as an alternative for FOMODs when it comes to custom file placement; however, using FOMODs is still the preferred method for managing mod installations.

---

### Example Mod Archive Structure

```
mod.zip/
|   +--- example-root.pak
|   +--- example/
|   |   +--- enabled.txt
|   |   +--- example-folder.pak
|   |   +--- LogicMods/            <-- Required for LogicMods
|   |   |   +--- example-logic.pak
|   |   +--- Scripts/
|   |   |   +--- main.lua
|   |   +--- shared/
|   |   |   +--- example.lua
|   +--- example-sml/              <-- SimpleModLoader mod
|   |   +--- example-sml.pak
|   |   +--- example-sml.uplugin   <-- Triggers SML detection
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
|   +--- example/                  <-- Derived from grandparent folder of example-logic.pak
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

IntoTheRadius2/Content/Mods/
|   +--- example-sml/
|   |   +--- example-sml.pak
|   |   +--- example-sml.uplugin

IntoTheRadius2/Content/ITR2/IniSettings/
|   +--- Settings.ini
```
