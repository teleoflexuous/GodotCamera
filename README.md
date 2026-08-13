# ProperCamera

ProperCamera is a scene-first 2D and 3D camera toolkit for Godot 4.7. It ships native Camera2D and SpringArm3D rigs, five genre presets, follow/orbit/anchored zoom controls, collision handling, camera effects, visibility/fade helpers, detail bands, and a runnable gallery.

## Install

### Godot Asset Store

In an existing Godot 4.7 project, open **Asset Store**, download ProperCamera,
review the Configure Asset file list, and install it. The Store archive places
the complete runtime package under `addons/proper_camera/`; there is no plugin,
autoload, or project setting to enable.

### Manual install

Copy `addons/proper_camera/` into an existing Godot 4.7 project. Instance
`scenes/camera_rig_2d.tscn` or `scenes/camera_rig_3d.tscn`, assign a preset,
and set a target from the owning gameplay scene.

The core has no autoload and has no required dependencies. The optional InputMap adapter can install missing demo bindings when `install_missing_actions` is enabled; production projects should define their own `camera_*` actions. G.U.I.D.E. support is intentionally a separate companion integration so this package imports cleanly on its own.

Run the gallery by opening `project.godot` and pressing Play. `R` recenters, `F` toggles follow where the preset permits it, `V` toggles first/third person in the character preset, and Escape or the top Back button returns to the gallery.

## Development

The installed addon README and contracts guide contain the API and composition
guide. The repository keeps source examples and GUT tests, but Store archives
exclude them.

Run `tools/run_occlusion_stability_lab.ps1` with a normal Godot executable to
visually inspect the 2-second idle/left/right occlusion stability sequence.
Build a clean Store upload with `tools/package_asset_store.ps1`.

License: [MIT](LICENSE.md).
