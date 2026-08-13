param(
    [string]$GodotBin = "godot"
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
& $GodotBin --path $root --rendering-driver opengl3 res://addons/proper_camera/examples/occlusion_stability_lab.tscn --quit-after 9
if ($LASTEXITCODE -ne 0) {
    throw "The non-headless Occlusion Stability Lab smoke run failed."
}
