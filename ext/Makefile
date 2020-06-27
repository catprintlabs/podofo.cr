PODOFO_INCLUDE_DIR := /usr/local

CXXFLAGS := -lpodofo
CPPFILES := podofo_binding.cpp
OBJFILES := $(CPPFILES:.cpp=.o)
LIBFILE  := podofo_binding.a

CC ?= g++
AR ?= ar
RM ?= rm

all: $(LIBFILE)

clean:
	$(RM) -f $(OBJFILES)
	$(RM) -f $(LIBFILE)

$(LIBFILE): $(OBJFILES)
	$(AR) rcs $@ $^

%.o: %.cpp
	$(CC) -std=c++11 -c -o $@ $< $(CXXFLAGS)

.PHONY: clean
