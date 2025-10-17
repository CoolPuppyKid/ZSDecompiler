// epic file stuf
pub const Lump = extern struct {
    offset: i32,
    length: i32,
    version: i32,
    fourCC: [4]u8,
};

pub const BSPHeader = extern struct {
    ident: [4]u8,
    version: i32,
    lumps: [64]Lump,
    mapRevision: i32,
};

// Stupid less sigma and epic geometry stuff

pub const Vector = extern struct {
    x: f32,
    y: f32,
    z: f32,
};

    normal: Vector,
    dist: f32,
    // I cant call it type because thats a zig keyword
    planeType: i32,
};

pub const Brush = extern struct {
    firstside: i32,
    numsides: i32,
    contents: i32,
};

// Bsp > 21
pub const BrushSideNew = extern struct {
    planenum: u16,
    texinfo: i16,
    dispinfo: i16,
    bevel: u8,
    thin: u8,
};

// Bsp < 21
pub const BrushSideOld = extern struct {
    planenum: u16,
    texinfo: i16,
    dispinfo: i16,
    bevel: u8,
};
