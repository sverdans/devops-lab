#include <cstring>
#include <iostream>
#include <string>

int main(int argc, char** argv)
{
	auto help_msg = 
		"usage: arrmax [--version] [--help] <%d> [<%d> ...]\n"
		"    --help       provides this message\n"
		"    --version    show product version\n";

	if (argc == 1 || std::strcmp(argv[1], "--help") == 0)
	{
		std::cout << help_msg;
		return EXIT_SUCCESS;
	}

	if (std::strcmp(argv[1], "--version") == 0)
	{
#ifdef ARRMAX_VERSION
		std::cout << "version: "  << ARRMAX_VERSION << '\n';
#endif
		return EXIT_SUCCESS;
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
		return EXIT_FAILURE;
	}
	
	return EXIT_SUCCESS;
}
