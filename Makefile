TARGET          = arrmax
BINDIR          = build/bin
OBJDIR          = build/obj
PROJECT_SRCS    = $(wildcard source/*.cpp)
PROJECT_OBJS    = $(addprefix $(OBJDIR)/, $(PROJECT_SRCS:.cpp=.cpp.o))
INSTALL_PREFIX ?= /usr/local/bin

$(info "PROJECT_SRCS: $(PROJECT_SRCS)")
$(info "PROJECT_OBJS: $(PROJECT_OBJS)")

CC       = g++
CXXFLAGS = -Wall -Wextra -Werror -O2
LDFLAGS  = 

DIR_GUARD = @mkdir -p $(@D)

.PHONY: all
all: $(TARGET)

$(TARGET): $(PROJECT_OBJS)
	$(DIR_GUARD)
	$(CC) -o $@ $^

$(OBJDIR)/%.cpp.o: %.cpp
	$(DIR_GUARD)
	$(CC) $(CXXFLAGS) -c -o $@ $^

.PHONY: clean install uninstall
clean:
	rm -rf $(BINDIR)/$(TARGET) $(PROJECT_OBJS)

install:
	install $(TARGET) $(PREFIX)

uninstall:
	rm -rf $(PREFIX)/$(TARGET)
