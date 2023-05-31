#pragma once
#include "bpch.h"

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"


namespace Bai {

	class BAI_API Log
	{
	public:
		static void Init();

		inline  static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline  static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

//Core log macros
#define BAI_CORE_TRACE(...)		::Bai::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define BAI_CORE_INFO(...)		::Bai::Log::GetCoreLogger()->info(__VA_ARGS__)
#define BAI_CORE_WARN(...)		::Bai::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define BAI_CORE_ERROR(...)		::Bai::Log::GetCoreLogger()->error(__VA_ARGS__)
#define BAI_CORE_FATAL(...)		::Bai::Log::GetCoreLogger()->fatal(__VA_ARGS__)

//Client log macros
#define BAI_TRACE(...)		::Bai::Log::GetClientLogger()->trace(__VA_ARGS__)
#define BAI_INFO(...)		::Bai::Log::GetClientLogger()->info(__VA_ARGS__)
#define BAI_WARN(...)		::Bai::Log::GetClientLogger()->warn(__VA_ARGS__)
#define BAI_ERROR(...)		::Bai::Log::GetClientLogger()->error(__VA_ARGS__)
#define BAI_FATAL(...)		::Bai::Log::GetClientLogger()->fatal(__VA_ARGS__)


