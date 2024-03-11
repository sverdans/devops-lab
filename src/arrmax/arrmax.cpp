#include <cstddef>
#include <stdexcept>
#include <string>

#include <arrmax/arrmax.hpp>

namespace arrmax
{

int max(const std::span<char*>& args)
{
	if (args.empty())
	{
		throw std::length_error("cannot be empty");
	}

	int max = std::stoi(args[0]);
	for (std::size_t i = 1; i < args.size(); ++i)
	{
		auto val = std::stoi(args[i]);
		if (val > max)
			max = val;
	}
	return max;
}

} // namespace arrmax
