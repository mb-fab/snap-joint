
include <config.scad>;
use <snap-joint.scad>;
use <snap-nut.scad>;

module test_joint()
{
    difference()
    {
        y = snap_joint_height - snap_joint_feather_hook_height - material_z;
        d = 5;
        translate([0, y/2 - d/2, 0])
        cube([
            snap_joint_width + snap_joint_feather_hook_width + 10,
            y + d,
            material_z
            ], center=true);

        translate([0, y/2, 0])
        cube([
            snap_joint_width + 2,
            y + nothing,
            material_z + nothing
            ], center=true);
    }
    snap_joint();
}

module test_nut()
{
    rotate([90, 0, 0])
    difference()
    {
        cube([
            snap_joint_width + snap_joint_feather_hook_width + 10,
            material_z,
            material_z + 10
            ], center=true);
        snap_nut_cutout();
    }
}


test_joint();

translate([0, snap_joint_height+5, 0])
rotate([90, 0, 0])
test_nut();
