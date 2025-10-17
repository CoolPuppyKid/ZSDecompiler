// stinky vmf types

/// Just the entire structure of a VMF
pub const VMFfile = struct {
    versioninfo: VersionInfo,

    // from my knowledge visgroups are not compiled
    visgroups: []u8 = "visgroups\n{\n}\n",
    viewsettings: ViewSettings,
    world: World,
};

/// "versioninfo" class
pub const VersionInfo = struct {
    editorversion: []const u8 = "400",
    editorbuild: []const u8 = "100",

    /// I think this should be 0 because if its decompiled then its never been saved
    mapversion: []const u8 = "0",

    formatversion: []const u8 = "100",

    /// Always 0 because this tool decompiles maps
    prefab: []const u8 = "0",
};

/// hammer editor settings
pub const ViewSettings = struct {
    bSnapToGrid: []const u8 = "1",
    bShowGrid: []const u8 = "1",
    bShowLogicalGrid: []const u8 = "0",
    nGridSpacing: []const u8 = "64",
    bShow3DGrid: []const u8 = "0",
};

pub const World = struct {
    id: []u8 = "1",
    mapversion: []u8 = "1",
    classname: []u8 = "worldspawn",
    skyname: []u8 = "sky_wasteland02",
    solids: []Solid = &[_]Solid{},
};

pub const Solid = struct {
    id: []u8 = "1",
    sides: []Side = &[_]Solid{},
};

pub const Side = struct {
    id: []u8 = "1",
    plane: []u8 = "NULL",
    material: []u8 = "BRICK/BRICKFLOOR001A",
    uaxis: []u8 = "NULL",
    vaxis: []u8 = "NULL",
    rotation: []u8 = "0",
    lightmapscale: []u8 = "16",
    smoothing_groups: []u8 = "0",
    contents: []u8 = "1",
    flags: []u8 = "0",
    dispinfo: Dispinfo,
};

pub const Dispinfo = struct {};
