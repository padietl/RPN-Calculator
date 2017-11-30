CC := gcc
CFLAGS := -Wall
LDLIBS := -lm
TARGET := rpn
.PHONY: clean

$(TARGET):

clean:
	rm -f $(TARGET)
	
