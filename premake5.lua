workspace "Bai"
	architecture "x64"

	configurations
	{
		"Debuf",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Bai"
	location "Bai"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .."/%{prj.name}")
	objdir ("bin-int/" .. outputdir .."/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog-1.11.0/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0"

		defines
		{
			"BAI_PLATFORM_WINDOWS",
			"BAI_BUILD_DLL",
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .."/Sandbox")
		}
	
	filter "configurations:Debug"
		defines "BAI_DEBUG"
		symbols "On"

	filter "configurations:Debug"
		defines "BAI_RELEASE"
		optimize "On"

	filter "configurations:Debug"
		defines "BAI_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
language "C++"

	targetdir ("bin/" .. outputdir .."/%{prj.name}")
	objdir ("bin-int/" .. outputdir .."/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Bai/vendor/spdlog-1.11.0/include",
		"Bai/src"
	}

	links
	{
		"Bai"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0"

		defines
		{
			"BAI_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "BAI_DEBUG"
		symbols "On"

	filter "configurations:Debug"
		defines "BAI_RELEASE"
		optimize "On"

	filter "configurations:Debug"
		defines "BAI_DIST"
		optimize "On"