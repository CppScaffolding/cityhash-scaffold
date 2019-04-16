-- scaffold geniefile for cityhash

cityhash_script = path.getabsolute(path.getdirectory(_SCRIPT))
cityhash_root = path.join(cityhash_script, "cityhash")

cityhash_includedirs = {
	path.join(cityhash_script, "config"),
	cityhash_root,
}

cityhash_libdirs = {}
cityhash_links = {}
cityhash_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { cityhash_includedirs }
	end,

	_add_defines = function()
		defines { cityhash_defines }
	end,

	_add_libdirs = function()
		libdirs { cityhash_libdirs }
	end,

	_add_external_links = function()
		links { cityhash_links }
	end,

	_add_self_links = function()
		links { "cityhash" }
	end,

	_create_projects = function()

project "cityhash"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		cityhash_includedirs,
	}

	defines {}

	files {
		path.join(cityhash_script, "config", "**.h"),
		path.join(cityhash_root, "**.h"),
		path.join(cityhash_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
