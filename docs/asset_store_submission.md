# Godot Asset Store submission

ProperCamera is prepared as an Asset Store addon: its distributable payload is
`addons/proper_camera/`, it has an MIT license, a plugin manifest, and a
repository-root `.gitattributes` that strips examples, tests, and author docs
from a source archive.

## Listing draft

- **Name:** ProperCamera
- **Category:** Tools / Camera
- **Godot version:** 4.7
- **License:** MIT
- **Repository:** `https://github.com/teleoflexuous/GodotCamera`
- **Icon:** `https://raw.githubusercontent.com/teleoflexuous/GodotCamera/main/media/proper_camera_icon.svg`
- **Short description:** Scene-first 2D and 3D camera rigs with genre presets, follow, anchored zoom, collision, effects, and detail bands.
- **Description:** ProperCamera provides reusable Camera2D and SpringArm3D rigs for platformer, character, management, RTS, and MOBA games. It keeps gameplay input and targets scene-owned, provides InputMap defaults for the gallery, and has no required runtime dependency or autoload. Phantom Camera and G.U.I.D.E. are optional integrations.

## Publisher steps

1. Sign in to the Godot Asset Store with the account that will own the listing
   and complete its publisher/contact details.
2. Create a new asset listing and use the draft metadata above. Add at least
   one 16:9 gallery screenshot and a clear product icon; the SVG URL above is
   a ready icon source, but a PNG cover image is recommended for the listing.
3. Publish a GitHub release/tag (start with `v1.0.0`) and attach or link the
   source archive. Verify the archive contains `addons/proper_camera/` and
   `LICENSE.md`, and excludes author-only examples, tests, and docs.
4. Submit for review, then update the listing changelog and Godot compatibility
   field for each release.

The package does not bundle G.U.I.D.E. or Phantom Camera. Mention optional
integrations in the listing rather than marking them as required dependencies.
