#pragma once

#ifdef BAI_PLATFORM_WINDOWS

extern Bai::Application* Bai::CreateApplication();

int main()
{
	printf("Bai Engine");
	auto app = Bai::CreateApplication();
	app->Run();
	delete app;
}

#endif