
include <config.scad>;


module snap_feather(
            width,
            height,
            hook_width,
            hook_height,
            hook_cutaway,
            leg_count=3,
            base_height
            )
{
    // feather leg(s)
    difference()
    {
        translate([
            width/2,
            (height-hook_height)/2 - nothing,
            0
            ])
        cube([
            width,
            height - hook_height + 2*nothing,
            material_z
            ], center=true);

        leg_width = width/(2*leg_count-1);
        leg_height = height - hook_height - base_height;
        for (i=[1:leg_count-1])
        {
            translate([
                leg_width/2 + (i*2-1)*leg_width,
                leg_height/2 + base_height,
                0
                ])
            cube([
                leg_width,
                leg_height,
                material_z + 2*nothing
                ], center=true);
        }
    }

    // feather head
    translate([0, height-hook_height, 0])
    intersection()
    {
        translate([0, 0, -material_z/2])
        cube([width+hook_width, hook_height, material_z]);

        translate([(width+hook_width)/2, 0, 0])
        scale([(width+hook_width)/2, hook_height, 1])
        cylinder(r=1, h=material_z, center=true);
    }
}

snap_feather(
    width=5,
    height=40,
    hook_width=3,
    hook_height=5,
    hook_cutaway=4,
    leg_width=2,
    leg_count=3,
    base_height=3
    );
