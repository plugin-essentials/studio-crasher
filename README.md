# Plugin Template
This is a template for a plugin with using the reactive LuaU UI library, [vide](https://github.com/centau/vide)!

## Getting Started
1. You are going to be needing [aftman](https://github.com/LPGhatguy/aftman) to manage the toolchain for this plugin.
2. Clone this repository via `git clone`
3. Run `aftman install` to install the toolchain.
4. Edit the following files:
  - `default.project.json` - Change the `name` property to your plugin's name.
  - `wally.toml` - Change the `name` property to your plugin's name in the format: `username/plugin-name`.
  - `src/constants.luau` - Change the `PLUGIN_NAME` and `PLUGIN_ICON` constants to your plugin's name and icon. (You can add onto this constants file for other values)
5. Run `wally install` to install any dependencies.
  - Then run `rojo sourcemap default.project.json --output sourcemap.json` to generate a sourcemap.
  - Finally, run `wally-package-types --sourcemap sourcemap.json Packages/` to re-export all of the types for all of the dependencies listed in `wally.toml`
6. Do whatever you want to do with your plugin
7. Build your plugin with the `rojo build` command (or use the `rojo plugin` command too if you want)