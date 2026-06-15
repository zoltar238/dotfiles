-- Input configuration

hl.config({
    input = {
        kb_layout  = "us,es",
        kb_options = "grp:alt_space_toggle",
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        accel_profile = "flat",
        force_no_accel = true,
        touchpad = {
            natural_scroll = false,
        },
    },
})