
include <config.scad>;

module snap_nut_cutout(
            width = snap_joint_width,
            feather_width = snap_joint_feather_width,
            feather_hook_width = snap_joint_feather_hook_width,
            stick_width = snap_joint_stick_width
            )
{
    translate([
        width/2 - feather_width/2 - feather_hook_width/2,
        0,
        0
        ])
    cube([
        feather_width + feather_hook_width,
        material_z*2,
        material_z
        ], center=true);

    translate([
        -width/2 + feather_width/2 + feather_hook_width/2,
        0,
        0
        ])
    cube([
        feather_width + feather_hook_width,
        material_z*2,
        material_z
        ], center=true);

    cube([
        stick_width,
        material_z*2,
        material_z
        ], center=true);
}

snap_nut_cutout();
