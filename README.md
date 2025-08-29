# ClosestPlane

Track the aircraft nearest to your configured location using ADS-B data from a dump1090 server. The program opens a simple SDL2 window showing flight details and sounds an alert when a plane comes within 5 km.

## Build
### Linux
1. Ensure `libcurl`, `cJSON`, `SDL2`, `SDL2_ttf`, `SDL2_mixer` and `xxd` are installed.
2. Run `make`.

### Windows
1. Install the same dependencies using your preferred package manager.
2. Run `make -f Makefile.win`.

## Controls
- `ESC` or close the window to exit.
- The app refreshes every few seconds and plays an audible alert for nearby traffic.

## Roadmap
- Provide a Windows Makefile and prebuilt binaries.
- Configurable alert radius and update interval.
- GUI widgets for changing location at runtime.
- Packaging scripts and richer aircraft visualisations.
