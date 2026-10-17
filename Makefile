
ifeq ($(OS),Windows_NT)
    SDL_PLATFORM_DIR = win_sdl2
    OUTPUT = game.exe
    SDL_CFLAGS = -I./libs/$(SDL_PLATFORM_DIR)/include
    SDL_LIBS = -L./libs/$(SDL_PLATFORM_DIR)/lib -lSDL2
else
    UNAME_S := $(shell uname -s)

    ifeq ($(UNAME_S),Linux)
        SDL_PLATFORM_DIR = linux_sdl2
    endif

    ifeq ($(UNAME_S),Darwin)
        SDL_PLATFORM_DIR = macos_sdl2
    endif

    OUTPUT = game

    SDL_CFLAGS = $(shell pkg-config --cflags sdl2)
    SDL_LIBS = $(shell pkg-config --libs sdl2)
endif

CC = gcc
CFLAGS = -g -Wall -Wextra
SRC = $(wildcard *.c)

all:
	$(CC) $(CFLAGS) $(SRC) $(SDL_CFLAGS) $(SDL_LIBS) -o $(OUTPUT)

clean:
	rm -f $(OUTPUT)

run: all
	./$(OUTPUT)
