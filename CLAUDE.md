# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ChaosHelper is a C# plugin for Asheron's Call using the Decal framework. It provides a customizable button interface for in-game commands, chat automation, and UI management.

## Build Commands

This is a Visual Studio C# project targeting .NET Framework 2.0. Build using:
- Visual Studio: Open `ChaosHelper.sln` and build (F6 or Build menu)
- MSBuild: `msbuild ChaosHelper.sln /p:Configuration=Release`

The post-build event automatically copies the compiled DLL to `DEPLOY\ChaosHelper.dll`.

## Architecture

### Core Components

- **PluginCore.cs** (PluginCore:46): Main plugin class inheriting from PluginBase, handles UI generation, event management, and command dispatch
- **Globals.cs** (Globals:8): Static globals container for plugin name, host, and core manager references
- **PopoutWindow.cs**: Manages detachable/popout window functionality for tabs
- **Util.cs**: Utility functions for file I/O, configuration parsing, and logging
- **VirindiControlExtensions.cs**: Custom control wrappers and extensions for the UI framework

### UI Framework

The plugin uses VirindiViewService for UI rendering with:
- **mainView.xml**: Main window layout definition
- **popoutView.xml**: Popout window layout definition
- **VirindiViews/**: Wrapper classes for different UI systems (Decal, MyHuds)

### Configuration System

- **chaoshelper_config.txt**: Button configuration with layout references and command mappings
- **main.layout**: UI layout definitions for tabs, button positioning, and window properties
- **chaoshelper.ini**: Default settings (chat command, profile)

Configuration uses a two-file system:
1. `.layout` files define UI structure (tabs, button positioning, window size, colors)
2. `.txt` files define button content overrides (text, commands, visibility)

### Button Color Customization

Buttons support customizable colors via the new `ColoredButton` type in layout files:
- **Color names**: `red`, `blue`, `green`, `yellow`, `orange`, `purple`, `black`, `white`, `gray`, `brown`, `pink`, `cyan`, `magenta`
- **Hex codes**: 6-character hex values without # prefix (e.g., `FF0000`, `00FF00`)

**Layout file (.layout) syntax:** `ColoredButton [span],[color],[text],[command],[param]`

Examples:
```
// In .layout file:
ColoredButton	1,red,Attack Mode,!attack
ColoredButton	2,FF0000,Wide Red Button,!red
ColoredButton	1,blue,Defense Mode,!defense
Button		1,Standard Button,!standard  // Standard button = no color
```

**Config file (.txt):** No color specifications needed - colors are defined in layout file only.

### Command Processing

Commands support special tokens:
- `[player]`: Replaced with current character name
- `[loc]`: Replaced with current coordinates
- `[chatloc]`: Replaced with current chat command prefix

Chat commands:
- `/ch setprofile <file>`: Load configuration file
- `/ch setchatcommand <prefix>`: Set chat command prefix
- `/ch settab <number>`: Switch to tab
- `/ch help`: Show available commands

## Key File Patterns

- Core logic: `PluginCore.cs` handles all main functionality
- Custom controls: `ChaosHud*` classes in VirindiControlExtensions.cs
- Configuration parsing: Methods like `GenerateLayout()` in PluginCore.cs:239
- Event handling: Button events registered dynamically based on configuration
- Command dispatch: `DispatchCommand()` and `GenerateFinalCommandString()` in PluginCore.cs

## Dependencies

- Decal.Adapter.dll (Asheron's Call plugin framework)
- VirindiViewService.dll (UI framework)
- .NET Framework 2.0

Reference paths are hardcoded to typical AC installation directories in the .csproj file.