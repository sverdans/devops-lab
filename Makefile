TARGET          = arrmax
BINDIR          = build/bin
OBJDIR          = build/obj
PROJECT_SRCS    = $(wildcard source/*.cpp)
PROJECT_OBJS    = $(addprefix $(OBJDIR)/, $(PROJECT_SRCS:.cpp=.cpp.o))
INSTALL_PREFIX ?= /usr/local/bin

ARRMAX_VERSION  = 1.0.0

$(info "PROJECT_SRCS: $(PROJECT_SRCS)")
$(info "PROJECT_OBJS: $(PROJECT_OBJS)")

CC       = g++
DEFINES += -DARRMAX_VERSION=\"$(ARRMAX_VERSION)\"
CXXFLAGS = -Wall -Wextra -Werror -O2
LDFLAGS  = 

DIR_GUARD = @mkdir -p $(@D)

.PHONY: is_gcc
is_gcc:
	@if ! [ -x "$$(command -v $(CC))" ]; then      \
		echo "Compiler $(CC) was not found";       \
		echo "for ubuntu use \"apt install gcc\""; \
	fi
	$(info "gcc checked")

.PHONY: all
all:
	is_gcc
	$(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET): $(PROJECT_OBJS)
	$(DIR_GUARD)
	$(CC) -o $@ $^

$(OBJDIR)/%.cpp.o: %.cpp
	$(DIR_GUARD)
	$(CC) $(CXXFLAGS) $(DEFINES) -c -o $@ $^

.PHONY: clean install uninstall
clean:
	rm -rf $(BINDIR)/$(TARGET) $(PROJECT_OBJS)

install:
	install $(BINDIR)/$(TARGET) $(INSTALL_PREFIX)

uninstall:
	rm -rf $(INSTALL_PREFIX)/$(TARGET)
