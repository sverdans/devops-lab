PROJECT_SRCS   = $(wildcard source/*.cpp)
PROJECT_OBJS   = $(PROJECT_SRCS:.cpp=.cpp.o)
TARGET         = max_in_arr

$(info "PROJECT_SRCS: $(PROJECT_SRCS)")
$(info "PROJECT_OBJS: $(PROJECT_OBJS)")

CC       = g++
CXXFLAGS = -Wall -Wextra -Werror
LDFLAGS  = 

PREFIX ?= /usr/local/bin

.PHONY: all
all: $(TARGET)

$(TARGET): $(PROJECT_OBJS)
	$(CC) -o $@ $^

%.cpp.o: %.cpp
	$(CC) $(CXXFLAGS) -c -o $@ $^

.PHONY: clean install uninstall
clean:
	rm -rf $(TARGET) $(PROJECT_OBJS)

install:
	install $(TARGET) $(PREFIX)

uninstall:
	rm -rf $(PREFIX)/$(TARGET)
