#include <Bai.h>

class Sandbox : public Bai::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};



Bai::Application* Bai::CreateApplication()
{
	return new Sandbox();
}