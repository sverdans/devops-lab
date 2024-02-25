#include <cstring>
#include <iostream>
#include <string>

#ifndef ARRMAX_VERSION
#define ARRMAX_VERSION ""
#endif

int main(int argc, char** argv)
{
	const char* help_msg = 
		"usage: arrmax [--version] [--help] <%d> [<%d> ...]\n"
		"    --help       provides this message\n"
		"    --version    show product version\n";

	if (argc == 1 || std::strcmp(argv[1], "--help") == 0)
	{
		std::cout << help_msg;
		return 0;
	}

	if (std::strcmp(argv[1], "--version") == 0)
	{
		std::cout << "version: "  << ARRMAX_VERSION << '\n';
		return 0;
	}

	try
	{
		int max = std::stoi(argv[1]);
		for (int i = 2; i < argc; ++i)
		{
			int val = std::stoi(argv[i]);
			if (val > max)
				max = val;
		}
		std::cout << "max: " << max << '\n';
	}
	catch (const std::exception& e)
	{
		std::cout << "can not parse input stream: " << e.what() << '\n' << help_msg;
		return 1;
	}
	
	return 0;
}
