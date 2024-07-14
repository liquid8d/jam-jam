extends Node

@export var origin:XROrigin3D
@export var autohandtrack:Node3D
@export var skeleton:Skeleton3D

var xr_interface:XRInterface
const TRACK = preload("res://assets/scenes/hands/track.tscn")
@onready var left_controller: XRController3D = $"../../LeftController"
@onready var right_controller: XRController3D = $"../../RightController"

var hand = 0
const radius = 0.01
var joints = [
	[ OpenXRInterface.HAND_JOINT_WRIST, OpenXRInterface.HAND_JOINT_THUMB_METACARPAL, OpenXRInterface.HAND_JOINT_THUMB_PROXIMAL, OpenXRInterface.HAND_JOINT_THUMB_DISTAL, OpenXRInterface.HAND_JOINT_THUMB_TIP ],
	[ OpenXRInterface.HAND_JOINT_WRIST, OpenXRInterface.HAND_JOINT_INDEX_METACARPAL, OpenXRInterface.HAND_JOINT_INDEX_PROXIMAL, OpenXRInterface.HAND_JOINT_INDEX_INTERMEDIATE, OpenXRInterface.HAND_JOINT_INDEX_DISTAL, OpenXRInterface.HAND_JOINT_INDEX_TIP ],
	[ OpenXRInterface.HAND_JOINT_WRIST, OpenXRInterface.HAND_JOINT_MIDDLE_METACARPAL, OpenXRInterface.HAND_JOINT_MIDDLE_PROXIMAL, OpenXRInterface.HAND_JOINT_MIDDLE_INTERMEDIATE, OpenXRInterface.HAND_JOINT_MIDDLE_DISTAL, OpenXRInterface.HAND_JOINT_MIDDLE_TIP ],
	[ OpenXRInterface.HAND_JOINT_WRIST, OpenXRInterface.HAND_JOINT_RING_METACARPAL, OpenXRInterface.HAND_JOINT_RING_PROXIMAL, OpenXRInterface.HAND_JOINT_RING_INTERMEDIATE, OpenXRInterface.HAND_JOINT_RING_DISTAL, OpenXRInterface.HAND_JOINT_RING_TIP ],
	[ OpenXRInterface.HAND_JOINT_WRIST, OpenXRInterface.HAND_JOINT_LITTLE_METACARPAL, OpenXRInterface.HAND_JOINT_LITTLE_PROXIMAL, OpenXRInterface.HAND_JOINT_LITTLE_INTERMEDIATE, OpenXRInterface.HAND_JOINT_LITTLE_DISTAL, OpenXRInterface.HAND_JOINT_LITTLE_TIP ]
]

func _ready():
	find_xr()
	add_trackers()

func find_xr():
	xr_interface = XRServer.find_interface('OpenXR')
	#hook_bones(skeleton.get_bone_children(0))

func clear_children():
	for child in get_children():
		child.free()

func add_trackers():
	print("add trackers")
	clear_children()
	if not origin:
		print("no origin, ignoring hook_joints")
		return
	if xr_interface:
		var joint_pos = getoxrjointpositions()
		var joint_rot = getoxrjointrotations()
		for j in range(OpenXRInterface.HAND_JOINT_MAX):
			if autohandtrack.has_node("J%D" % j):
				# add a tracker
				var autotrack = autohandtrack.get_node("J%D" % j)
				var tracker = TRACK.instantiate()
				tracker.transform = autotrack.global_transform
				add_child(tracker)
				tracker.name = "J" + str(j) + "_Tracker"
				tracker.set_owner(self)
				tracker.add_to_group("fingertip")

func update_joints():
	if not origin:
		print("no origin, ignoring hook_joints")
		return
	if xr_interface:
		var joint_pos = getoxrjointpositions()
		var joint_rot = getoxrjointrotations()
		for j in range(OpenXRInterface.HAND_JOINT_MAX):
			if autohandtrack.has_node("J%D" % j):
				var autotrack = autohandtrack.get_node("J%D" % j)
				autotrack.global_transform = Transform3D(origin.basis * Basis(joint_rot[j]).scaled(Vector3(radius, radius, radius)), origin.global_transform * joint_pos[j])
				
	else:
		print("unable to hook autohand joints")
	# find joints from autohand and add colliders

func getoxrjointpositions():
	if not xr_interface:
		return
	var oxrjps = [ ]
	for j in range(OpenXRInterface.HAND_JOINT_MAX):
		oxrjps.push_back(xr_interface.get_hand_joint_position(hand, j))
	return oxrjps

func getoxrjointrotations():
	if not xr_interface:
		return
	var oxrjrot = [ ]
	for j in range(OpenXRInterface.HAND_JOINT_MAX):
		oxrjrot.push_back(xr_interface.get_hand_joint_rotation(hand, j))
	return oxrjrot
	
func hook_bones(children:PackedInt32Array):
	for bone in children:
		var bone_name = skeleton.get_bone_name(bone)
		var bone_transform = skeleton.get_bone_global_pose(bone)
		print(bone_name)
		# add a tracker
		var tracker = TRACK.instantiate()
		tracker.transform = bone_transform
		add_child(tracker)
		tracker.name = bone_name
		tracker.set_owner(self)
		tracker.add_to_group("fingertip")
		hook_bones(skeleton.get_bone_children(bone))

func update_bones(children:PackedInt32Array):
	for bone in children:
		var bone_name = skeleton.get_bone_name(bone)
		var tracker:Node3D = get_node("./" + bone_name)
		# set tracker transform to pose transform
		if tracker:
			tracker.global_transform = skeleton.global_transform
			#var pose := skeleton.get_bone_global_pose()
			#Transform3D(xr_origin.global_transform * Basis(pose.)
			#tracker.global_transform = Transform3D(origin_transform * Basis()
#			xr_origin.global_transform
#			Transform3D(xrt.basis*Basis(oxrjrot[j]).scaled(Vector3(knuckleradius, knuckleradius, knuckleradius)), xrt*oxrjps[j])
		update_bones(skeleton.get_bone_children(bone))

func _on_left_tracking_changed(tracking: bool) -> void:
	left_controller.visible = !tracking

func _on_right_tracking_changed(tracking: bool) -> void:
	right_controller.visible = !tracking

func _physics_process(delta: float) -> void:
	update_joints()
