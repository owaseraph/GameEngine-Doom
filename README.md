# DOOM

A small C/SDL2 prototype for experimenting with DOOM-style player movement and sector-based rendering.

## Status

The project currently contains:

- Player position, height, and viewing-angle data.
- Keyboard mappings and frame-rate-independent movement logic.
- Game-state timing and delta-time calculation.
- Wall, portal, sector, and renderer data structures.
- A basic random-number utility.

The project does not yet contain a working game window or renderer. `GameLoop` is empty, and the functions declared in `r_renderer.h` have no implementation file. The current executable builds, then exits immediately.

## Requirements

- GCC or another C compiler.
- GNU Make.
- SDL2 files in the platform-specific `libs` directory.

The current Linux build expects SDL2 under `libs/linux_sdl2/`. On Debian or Ubuntu, the compiler and common SDL2 development package can be installed with:

```sh
sudo apt install build-essential libsdl2-dev
```

## Build

From the project directory:

```sh
make
```

The Makefile links both SDL2 and the C math library (`-lm`), which is required for the `sin` and `cos` calls in `k_keyboard.c`.

Run the compiled program with:

```sh
make run
```

`make run` only launches the existing executable; it does not build it first. Use `make` before it when necessary. Remove the executable with:

```sh
make clean
```

The output is `game` on Linux and macOS, and `game.exe` on Windows.

## Planned Controls

These bindings are defined in `k_keyboard.c`. They will become active once SDL initialization and the main loop are implemented.

| Key | Action |
| --- | --- |
| `W` / `S` | Move forward / backward |
| `A` / `D` | Turn left / right |
| `Q` / `E` | Strafe left / right |
| `Space` / `Left Ctrl` | Move up / down |
| `M` | Toggle map state |
| `O` | Toggle debug mode |
| `Escape` | Quit |

## Files

| File | Purpose |
| --- | --- |
| `main.c` | Application entry point and future game loop. |
| `g_game_state.h/.c` | Shared runtime state and frame timing. |
| `k_keyboard.h/.c` | Key bindings, SDL events, and player movement input. |
| `p_player.h/.c` | Player data and initialization. |
| `r_renderer.h` | Renderer data structures and function declarations. |
| `typedefs.h` | Shared types such as `vec2_t`. |
| `u_utils.h/.c` | Small general-purpose utilities. |
| `Makefile` | Platform paths and build commands. |

## Next Milestone

Implement SDL startup and shutdown, create a window, complete `GameLoop`, and drain all pending SDL events each frame. Then add `r_renderer.c` and render a small test map made from sectors, walls, and portals.

## License

See [LICENSE](LICENSE).