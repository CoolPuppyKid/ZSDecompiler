// stinky vmf types

/// Just the entire structure of a VMF
pub const VMFfile = extern struct {
    versioninfo: VersionInfo,

    // from my knowledge visgroups are not compiled
    visgroups: []u8 = "visgroups\n{\n}\n",
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
