extends GutTest

const EXAMPLE_PATHS: Array[String] = [
	"res://addons/proper_camera/examples/2d_management.tscn",
	"res://addons/proper_camera/examples/2d_platformer.tscn",
	"res://addons/proper_camera/examples/3d_character.tscn",
	"res://addons/proper_camera/examples/3d_management.tscn",
	"res://addons/proper_camera/examples/3d_rts_moba.tscn",
	"res://addons/proper_camera/examples/camera_gallery.tscn",
]


func test_all_camera_examples_load_and_have_an_active_camera_contract() -> void:
	for path: String in EXAMPLE_PATHS:
		var packed: PackedScene = load(path) as PackedScene
		assert_not_null(packed, path)
		if packed == null:
			continue
		var instance: Node = packed.instantiate()
		add_child_autofree(instance)
		assert_true(
			instance is Control
			or instance.find_child("ProperCameraRig2D", true, false) is ProperCameraRig2D
			or instance.find_child("ProperCameraRig3D", true, false) is ProperCameraRig3D,
			path
		)
		if not (instance is Control):
			assert_not_null(instance.get_node_or_null("UI/Back"), "%s needs a gallery back button" % path)


func test_release_export_excludes_source_only_examples_docs_and_tests() -> void:
	var attributes: String = FileAccess.get_file_as_string("res://.gitattributes")
	assert_true(attributes.contains("/addons/proper_camera/examples export-ignore"))
	assert_true(attributes.contains("/addons/proper_camera/docs export-ignore"))
	assert_true(attributes.contains("/addons/proper_camera/tests export-ignore"))


func test_reference_camera_settings_control_builds_with_builtin_ui() -> void:
	var packed: PackedScene = load(
		"res://addons/proper_camera/scenes/camera_settings_control.tscn"
	) as PackedScene
	assert_not_null(packed)
	if packed == null:
		return
	var instance: Control = packed.instantiate() as Control
	add_child_autofree(instance)
	assert_not_null(instance.find_child("CapabilityBundle", true, false))
	assert_not_null(instance.find_child("AutoRecenterDelay", true, false))
	assert_not_null(instance.find_child("FOVOverride", true, false))
	assert_not_null(instance.find_child("PreferredDistance", true, false))

