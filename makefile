full:
	7z a example-full.zip example/ example-custom/ example-root.pak

luashared:
	7z a example-luashared.zip example/shared/

luamod:
	7z a example-luamod.zip example/enabled.txt example/Scripts/

logic:
	7z a example-logic.zip example/LogicMods/

normal:
	7z a example-mod.zip example-root.pak example/example-folder.pak

custom:
	7z a example-custom.zip example-custom/

clean:
	rm -f example-full.zip example-luashared.zip example-luamod.zip example-logic.zip example-mod.zip
	
default: clean full
	