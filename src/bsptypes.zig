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

pub const Plane = extern struct {
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

/// Bsp > 21
pub const BrushSideNew = extern struct {
    planenum: u16,
    texinfo: i16,
    dispinfo: i16,
    bevel: u8,
    thin: u8,
};

/// Bsp < 21
pub const BrushSideOld = extern struct {
    planenum: u16,
    texinfo: i16,
    dispinfo: i16,
    bevel: u8,
};

// Stupid union cause zig sucks and is stinky
pub const BrushSides = union(enum) {
    new: []BrushSideNew,
    old: []BrushSideOld,
};

pub const TexInfo = extern struct {
    textureVecs: f32[2][4],
    lightmapVecs: f32[2][4],
    flags: i32,
    texdata: i32,
};
