#pragma once

#if BAI_PLATFORM_WINDOWS
	#ifdef BAI_BUILD_DLL
		#define BAI_API __declspec(dllexport)
	#else
		#define BAI_API __declspec(dllimport)
	#endif
#else
	#error BAI only support Windows!
#endif // BAI_PLATFORM_WINDOWS

#define BIT(x) (1<<x)

