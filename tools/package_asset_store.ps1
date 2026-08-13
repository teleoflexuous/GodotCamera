param(
    [string]$GodotBin = "godot",
    [string]$Version = "1.0.2",
    [switch]$SkipValidation
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$addonSource = Join-Path $root "addons\proper_camera"
if (-not (Test-Path -LiteralPath $addonSource)) {
    throw "Missing installable addon at $addonSource"
}

$dist = Join-Path $root "dist"
$stage = Join-Path ([System.IO.Path]::GetTempPath()) ("proper-camera-stage-" + [guid]::NewGuid())
$probe = Join-Path ([System.IO.Path]::GetTempPath()) ("proper-camera-probe-" + [guid]::NewGuid())
$archive = Join-Path $dist ("ProperCamera-v{0}.zip" -f $Version)

try {
    New-Item -ItemType Directory -Force -Path (Join-Path $stage "addons") | Out-Null
    Copy-Item -LiteralPath $addonSource -Destination (Join-Path $stage "addons") -Recurse -Force
    Remove-Item -LiteralPath (Join-Path $stage "addons\proper_camera\tests") -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -LiteralPath (Join-Path $stage "addons\proper_camera\examples") -Recurse -Force -ErrorAction SilentlyContinue
    New-Item -ItemType Directory -Force -Path $dist | Out-Null
    if (Test-Path -LiteralPath $archive) { Remove-Item -LiteralPath $archive -Force }
    Compress-Archive -Path (Join-Path $stage "addons") -DestinationPath $archive -CompressionLevel Optimal

    if (-not $SkipValidation) {
        Expand-Archive -LiteralPath $archive -DestinationPath $probe -Force
        @'
; Temporary Store archive probe project.
config_version=5

[application]
config/name="ProperCamera Package Probe"
config/features=PackedStringArray("4.7")
'@ | Set-Content -LiteralPath (Join-Path $probe "project.godot") -Encoding utf8
        @'
extends SceneTree

const SCENES: PackedStringArray = [
    "res://addons/proper_camera/scenes/camera_rig_2d.tscn",
    "res://addons/proper_camera/scenes/camera_rig_3d.tscn",
]

func _init() -> void:
    for path: String in SCENES:
        var scene: PackedScene = load(path) as PackedScene
        if scene == null:
            push_error("Store archive failed to load %s" % path)
            quit(1)
            return
        var instance: Node = scene.instantiate()
        instance.free()
    quit(OK)
'@ | Set-Content -LiteralPath (Join-Path $probe "probe.gd") -Encoding utf8
        & $GodotBin --headless --path $probe --import
        if ($LASTEXITCODE -ne 0) { throw "Godot import failed for Store archive probe." }
        & $GodotBin --headless --path $probe --script res://probe.gd
        if ($LASTEXITCODE -ne 0) { throw "Godot scene probe failed for Store archive." }
    }

    Write-Output "Built and validated $archive"
}
finally {
    Remove-Item -LiteralPath $stage -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -LiteralPath $probe -Recurse -Force -ErrorAction SilentlyContinue
}
