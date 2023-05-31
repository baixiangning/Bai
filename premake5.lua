workspace "Bai"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder(solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Bai/venndor/GLFW/include"

include "Bai/vendor/GLFW"


project "Bai"
	location "Bai"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .."/%{prj.name}")
	objdir ("bin-int/" .. outputdir .."/%{prj.name}")


	pchheader "bpch.h"
	pchsource "Bai/src/bpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog-1.11.0/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		--"opengl132.lib"
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