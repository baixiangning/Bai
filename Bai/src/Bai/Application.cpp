#include "Application.h"

#include "Events/ApplicationEvent.h"
#include "Bai/Log.h"

namespace Bai {

	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		BAI_TRACE(e);
		while (true);
	}
}
