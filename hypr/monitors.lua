-- Monitor configuration
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@165",
    position = "0x0",
    scale = 1,
    bitdepth = 10,
    cm = "hdr"
})

hl.monitor({
    output = "DP-2",
    mode = "1920x1080@240",
    position = "2560x0",
    scale = 1,
    bitdepth = 10
})
