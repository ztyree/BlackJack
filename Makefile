#CC=clang++
CC=g++

CFLAGS  = -std=c++11
CFLAGS  += -O3
CFLAGS  += -g -c -Wall
SOURCES=main.cpp game.cpp player.cpp cards.cpp
#-pg -D_DEBUG
LDFLAGS += -L/home/ztyree/SoarSuite/bin/linux64 -I/home/ztyree/SoarSuite/include -pthread -lSoar -ldl -Wl,-rpath,/home/ztyree/SoarSuite/bin/linux64
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=bj_soar

all: $(SOURCES) $(EXECUTABLE) clean

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

main.o: game.h player.h cards.h
.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm $(OBJECTS)
