#include <cstring>
#include <iostream>
#include <exception>
#include <span>

#include <arrmax.hpp>

#ifndef ARRMAX_VERSION
#define ARRMAX_VERSION ""
#endif

int main(int argc, char** argv)
{
	const auto& args = std::span<char*>{ argv, static_cast<size_t>(argc) }.subspan(1);

	auto* help_msg = 
		"usage: arrmax [--version] [--help] <%d> [<%d> ...]\n"
		"    --help       provides this message\n"
		"    --version    show product version\n";

	if (args.empty() || std::strcmp(args[0], "--help") == 0)
	{
		std::cout << help_msg;
		return 0;
	}
	else if (std::strcmp(args[0], "--version") == 0)
	{
		std::cout << "version: "  << ARRMAX_VERSION << '\n';
		return 0;
	}

	try
	{
		int res = arrmax::max(args);
		std::cout << "max: " << res << '\n';
	}
	catch (const std::exception& e)
	{
		std::cout << "can not parse input stream: " << e.what() << '\n' << help_msg;
		return 1;
	}
	
	return 0;
}