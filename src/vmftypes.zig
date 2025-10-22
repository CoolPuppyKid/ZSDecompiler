// stinky vmf types

/// Just the entire structure of a VMF
pub const VMFfile = struct {
    versioninfo: VersionInfo,

    // from my knowledge visgroups are not compiled
    visgroups: []const u8 = "visgroups\n{\n}\n",
    viewsettings: ViewSettings,
    world: World,

    pub fn init() VMFfile {
        return VMFfile{
            .versioninfo = VersionInfo.init(),
            .visgroups = "visgroups\n{\n}\n",
            .viewsettings = ViewSettings.init(),
            .world = World.init(),
        };
    }
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

    pub fn init() VersionInfo {
        return VersionInfo{
            .editorversion = "400",
            .editorbuild = "100",
            .mapversion = "0",
            .formatversion = "100",
            .prefab = "0",
        };
    }
};

/// hammer editor settings
pub const ViewSettings = struct {
    bSnapToGrid: []const u8 = "1",
    bShowGrid: []const u8 = "1",
    bShowLogicalGrid: []const u8 = "0",
    nGridSpacing: []const u8 = "64",
    bShow3DGrid: []const u8 = "0",

    pub fn init() ViewSettings {
        return ViewSettings{
            .bSnapToGrid = "1",
            .bShowGrid = "1",
            .bShowLogicalGrid = "0",
            .nGridSpacing = "64",
            .bShow3DGrid = "0",
        };
    }
};

pub const World = struct {
    id: []u8 = "1",
    mapversion: []u8 = "1",
    classname: []u8 = "worldspawn",
    skyname: []u8 = "sky_wasteland02",
    solids: []Solid = &[_]Solid{},

    pub fn init() World {
        return World{
            .id = "1",
            .mapversion = "1",
            .classname = "worldspawn",
            .skyname = "sky_wasteland02",
            .solids = &[_]Solid{},
        };
    }
};

pub const Solid = struct {
    id: []u8 = "1",
    sides: []Side = &[_]Solid{},

    pub fn init() Solid {
        return Solid{
            .id = "1",
            .sides = &[_]Side{},
        };
    }
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

    pub fn init() Side {
        return Side{
            .id = "1",
            .plane = "NULL",
            .material = "BRICK/BRICKFLOOR001A",
            .uaxis = "NULL",
            .vaxis = "NULL",
            .rotation = "0",
            .lightmapscale = "16",
            .smoothing_groups = "0",
            .contents = "1",
            .flags = "0",
            .dispinfo = Dispinfo{},
        };
    }
};

pub const Dispinfo = struct {};
