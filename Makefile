# Makefile for the graphical aircraft finder application
# It links against libcurl, cJSON, SDL2, SDL2_ttf, and SDL2_mixer.
# It also automatically embeds the font file into the executable.

CC = gcc
TARGET = find_closest_plane
SRCS = main.c cjson/cJSON.c

# Get compiler and linker flags from sdl2-config
SDL_CFLAGS = $(shell sdl2-config --cflags)
SDL_LDFLAGS = $(shell sdl2-config --libs) -lSDL2_ttf -lSDL2_mixer

# Add all flags together
CFLAGS = -Wall -g -Icjson $(SDL_CFLAGS)
LDFLAGS = -lcurl -lm $(SDL_LDFLAGS)

OBJS = $(SRCS:.c=.o)

all: $(TARGET)

# Rule to convert the font file into a C header file
font_data.h: PressStart2P-Regular.ttf
	@echo "Embedding font..."
	@xxd -i PressStart2P-Regular.ttf > font_data.h

# Make sure the font header is generated before compiling main.c
main.o: main.c font_data.h

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET) $(LDFLAGS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJS) font_data.h

