#pragma once

#ifdef BAI_PLATFORM_WINDOWS

extern Bai::Application* Bai::CreateApplication();

int main()
{
	Bai::Log::Init();
	BAI_CORE_WARN("Initialized Log!");
	int a = 5;
	BAI_INFO("Hello!Var={0}",a);


	auto app = Bai::CreateApplication();
	app->Run();
	delete app;
}

#endif