
include <config.scad>;
use <snap-feather.scad>;

module snap_joint(
            width = snap_joint_width,
            height = snap_joint_height,
            feather_width = snap_joint_feather_width,
            feather_hook_width = snap_joint_feather_hook_width,
            feather_hook_height = snap_joint_feather_hook_height,
            feather_hook_cutaway = snap_joint_feather_hook_cutaway,
            feather_base_height = snap_joint_feather_base_height,
            stick_width = snap_joint_stick_width
            )
{
    translate([width/2 - feather_width, 0, 0])
    snap_feather(
        width = feather_width,
        height = height,
        hook_width = feather_hook_width,
        hook_height = feather_hook_height,
        hook_cutaway  = feather_hook_cutaway,
        base_height = feather_base_height
        );

    translate([-width/2 + feather_width, 0, 0])
    rotate([0, 180, 0])
    snap_feather(
        width = feather_width,
        height = height,
        hook_width = feather_hook_width,
        hook_height = feather_hook_height,
        hook_cutaway  = feather_hook_cutaway,
        base_height = feather_base_height
        );

    translate([0, height/2 - nothing, 0])
    cube([stick_width, height + 2*nothing, material_z], center=true);
}

snap_joint();
