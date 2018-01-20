
include <config.scad>;
use <snap-joint.scad>;
use <snap-nut.scad>;

difference()
{
    y = snap_joint_height - material_z;
    translate([0, y/2 - 10, 0])
    cube([
        snap_joint_width + snap_joint_feather_hook_width + 10,
        y + 10,
        material_z
        ], center=true);

    translate([0, y/2, 0])
    cube([
        snap_joint_width + 2,
        y,
        material_z + nothing
        ], center=true);
}
snap_joint();

translate([0, snap_joint_height+5, 0])
difference()
{
    cube([
        snap_joint_width + 10,
        material_z,
        material_z + 10
        ], center=true);
    snap_nut_cutout();
}
