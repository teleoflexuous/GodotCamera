# Godot Asset Store submission

ProperCamera is prepared as an Asset Store **Addon**. Its distributable payload
is `addons/proper_camera/`; it has an MIT license, no required plugin/autoload
or submodule, and a repository-root `.gitattributes` that strips source-only
examples and tests from GitHub source archives.

## Listing draft

- **Name:** ProperCamera
- **Type:** Addon
- **Godot version:** 4.7
- **License:** MIT
- **Repository:** `https://github.com/teleoflexuous/GodotCamera`
- **Short description:** Scene-first 2D and 3D camera rigs with genre presets, follow, anchored zoom, collision, effects, and detail bands.
- **Description:** ProperCamera provides reusable Camera2D and SpringArm3D rigs for platformer, character, management, RTS, and MOBA games. It keeps gameplay input and targets scene-owned, provides InputMap defaults for the gallery, and has no required runtime dependency or autoload. Phantom Camera and G.U.I.D.E. are optional integrations.

## Publisher steps

1. Sign in to the Godot Asset Store with the account that will own the listing
   and complete its publisher/contact details.
2. Create publisher `teleoflexuous` and asset slug `proper-camera`, agree to
   the Store terms, and enter the draft metadata in Settings. Add the GitHub
   source link, MIT license, and relevant `2D`, `3D`, `camera`, `RTS`, and
   `platformer` tags.
3. In Media, upload `media/proper_camera_thumbnail.png` and gallery screenshots
   captured from the non-headless gallery and Occlusion Stability Lab.
4. Build `dist/ProperCamera-v1.0.0.zip` with
   `tools/package_asset_store.ps1`; upload that archive in Versions, set the
   supported Godot range, changelog, and any additional information.
5. Disclose AI-assisted implementation in the Store's mandatory AI disclosure
   field. The thumbnail is a rasterization of the repository SVG, not a
   generative image.
6. Submit for review. Every later version receives its own archive, changelog,
   and compatibility range.

The package does not bundle G.U.I.D.E. or Phantom Camera. Mention optional
integrations in the listing rather than marking them as required dependencies.
