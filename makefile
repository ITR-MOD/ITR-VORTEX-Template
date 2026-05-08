full:
	7z a example-full.zip example/ example-custom/ example-sml/ example-root.pak

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

sml: simplemodloader
simplemodloader:
	7z a example-simplemodloader.zip example-sml/


clean:
	rm -f example-full.zip example-luashared.zip example-luamod.zip example-logic.zip example-mod.zip example-custom.zip
	
default: clean full
	