#pragma once
#include <SDL2/SDL.h>
#ifdef __cplusplus
extern "C" {
#endif
SDL_Surface *IMG_Load(const char *file);
SDL_Surface *IMG_Load_RW(SDL_RWops *src, int freesrc);
#ifdef __cplusplus
}
#endif
