# ProperCamera addon

ProperCamera provides reusable `ProperCameraRig2D` and `ProperCameraRig3D` scenes. They separate camera state, follow logic, input, effects, and native output; project scene roots own composition and target wiring.

## Quick start

1. Instance `scenes/camera_rig_2d.tscn` or `scenes/camera_rig_3d.tscn`.
2. Assign a resource from `presets/` or duplicate a preset for the game.
3. Call `set_follow_target(target, true)` from the owning scene.
4. Use direct commands or add `ProperCameraInputMapAdapter`. Enable `install_missing_actions` only for prototypes/examples.

`R` recenters, `F` toggles follow, and `V` toggles the character preset's first/third-person view. Positive zoom input always means zoom in. Normalized zoom is `0` at the close end and `1` at the far end.

## Optional integrations

The core has no required dependencies. G.U.I.D.E. input/remapping support is distributed as a separate companion integration, so installing ProperCamera never requires vendor files or an autoload. Phantom Camera is reflection-only and optional; select its output driver only after binding an explicitly authored PCam.

See `docs/contracts.md` for follow, zoom, collision, fade, and detail-band behavior. The included examples are source material; release packaging excludes examples, docs, and tests.

Copyright (c) 2026 teleoflexuous. Licensed under the [MIT License](LICENSE.md).
