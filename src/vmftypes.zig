// stinky vmf types

/// Just the entire structure of a VMF
pub const VMFfile = extern struct {
    versioninfo: VersionInfo,

    // from my knowledge visgroups are not compiled
    visgroups: []u8 = "visgroups\n{\n}\n",
    viewsettings: ViewSettings,
    world: World,
};

/// "versioninfo" class
pub const VersionInfo = extern struct {
    editorversion: []u8 = "400",
    editorbuild: []u8 = "100",

    /// I think this should be 0 because if its decompiled then its never been saved
    mapversion: []u8 = "0",

    formatversion: []u8 = "100",

    /// Always 0 because this tool decompiles maps
    prefab: []u8 = "0",
};

/// hammer editor settings
pub const ViewSettings = extern struct {
    bSnapToGrid: []u8 = "1",
    bShowGrid: []u8 = "1",
    bShowLogicalGrid: []u8 = "0",
    nGridSpacing: []u8 = "64",
    bShow3DGrid: []u8 = "0",
};

pub const World = extern struct {
    id: []u8 = "1",
    mapversion: []u8 = "1",
    classname: []u8 = "worldspawn",
    skyname: []u8 = "sky_wasteland02",
};
