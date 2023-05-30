<<<<<<< HEAD
#include "Application.h"

=======
#include "bpch.h"
#include "Application.h"
>>>>>>> 32dbe8cb6aca538352f10dcc2c278daa8f220f26
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
