TARGET = max_in_arr
PREFIX ?= /usr/local/bin
BUILDIR = build
SRCS = main.cpp
OBJS = $(SRCS:.c=.o)

.PHONY: all clean install uninstall

all: $(TARGET)
$(TARGET): $(OBJS)
    $(CC) -o $(TARGET) $(OBJS) $(CFLAGS)
 
.c.o:
    $(CC) $(CFLAGS)  -c $< -o $@

clean:
    rm -rf $(TARGET) $(OBJS)

install:
    install $(TARGET) $(PREFIX)

uninstall:
    rm -rf $(PREFIX)/$(TARGET)