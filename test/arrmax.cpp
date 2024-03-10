#include <vector>

#include <gtest/gtest.h>

#include <arrmax.hpp>

TEST(ARRMAX, AscendingOrderArgs)
{
	std::vector<char*> params = { "-2", "-1", "0", "1", "2" };
	ASSERT_EQ(arrmax::max({params}), 2);
}

TEST(ARRMAX, DescendingOrderArgs)
{
	std::vector<char*> params = { "2", "1", "0", "-1", "-2" };
	ASSERT_EQ(arrmax::max(params), 2);
}

TEST(ARRMAX, RandomOrderArgs)
{
	std::vector<char*> params = { "-99", "100", "37", "45", "-8" };
	ASSERT_EQ(arrmax::max(params), 100);
}

TEST(ARRMAX, InvalidArgs)
{
	std::vector<char*> params = { "1", "2", "foo" };
	ASSERT_THROW(arrmax::max(params), std::invalid_argument);
}

TEST(ARRMAX, EmptyArgs)
{
	std::vector<char*> params = {};
	ASSERT_THROW(arrmax::max(params), std::length_error);
}
