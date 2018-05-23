
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
    // Right feather
    translate([width/2 - feather_width, 0, 0])
    snap_feather(
        width = feather_width,
        height = height,
        hook_width = feather_hook_width,
        hook_height = feather_hook_height,
        hook_cutaway  = feather_hook_cutaway,
        base_height = feather_base_height
        );

    // Left feather
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

    // Middle support's base cuboid
    translate([0, (height-feather_hook_height)/2 - nothing, 0])
    cube([stick_width, height - feather_hook_height + 2*nothing, material_z], center=true);

    // Middle support's rounded head
    translate([0, height-feather_hook_height, 0])
    intersection()
    {
        translate([0, feather_hook_height/2, 0])
        cube([stick_width, feather_hook_height, material_z], center=true);

        scale([stick_width/2, feather_hook_height, 1])
        cylinder(r=1, h=material_z, center=true);
    }

    // Fill inbetween the feathers
    fill_left_x = -width/2 + feather_width*1.2;
    fill_right_x = +width/2 - feather_width*1.2;
    fill_height = height - feather_hook_height - material_z - nothing;
    linear_extrude(material_z, center=true)
    polygon([
        [fill_left_x, -nothing],
        [fill_left_x + feather_hook_width, fill_height],
        [fill_right_x - feather_hook_width, fill_height],
        [fill_right_x, -nothing]
        ]);
}

snap_joint();
