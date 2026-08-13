# ProperCamera

ProperCamera is a scene-first 2D and 3D camera toolkit for Godot 4.7. It ships native Camera2D and SpringArm3D rigs, five genre presets, follow/orbit/anchored zoom controls, collision handling, camera effects, visibility/fade helpers, detail bands, and a runnable gallery.

## Install

Copy `addons/proper_camera/` into a Godot 4.7 project, then enable **ProperCamera** in Project Settings > Plugins. Instance `scenes/camera_rig_2d.tscn` or `scenes/camera_rig_3d.tscn`, assign a preset, and set a target from the owning gameplay scene.

The core has no autoload and has no required dependencies. The optional InputMap adapter can install missing demo bindings when `install_missing_actions` is enabled; production projects should define their own `camera_*` actions. G.U.I.D.E. support is intentionally a separate companion integration so this package imports cleanly on its own.

Run the gallery by opening `project.godot` and pressing Play. `R` recenters, `F` toggles follow where the preset permits it, `V` toggles first/third person in the character preset, and Escape or the top Back button returns to the gallery.

## Development

The addon-local README contains the API and composition guide. The repository keeps source examples and GUT tests, but `.gitattributes` excludes them from Store installations.

License: [MIT](LICENSE.md).
