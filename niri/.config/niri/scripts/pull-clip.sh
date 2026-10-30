#!/bin/bash
env WAYLAND_DISPLAY=wayland-0 wl-paste | env WAYLAND_DISPLAY=wayland-1 wl-copy
