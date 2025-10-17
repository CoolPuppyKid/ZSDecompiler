const std = @import("std");
const bspTypes = @import("bsptypes.zig");
const vmfTypes = @import("vmftypes.zig");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    var file = try std.fs.cwd().openFile("map.bsp", .{});
    defer file.close();

    var reader = file.reader();

    // i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig

    const header: bspTypes.BSPHeader = try reader.readStruct(bspTypes.BSPHeader);

    if (std.mem.eql(u8, &header.ident, "VBSP") == false) {
        return error.GoFuckYourself;
    }

    std.debug.print("BSP FILE:\nIdent: {s},\nVersion: {d},\nRevision: {d}.\n", .{ header.ident, header.version, header.mapRevision });

    const VMFFile: vmfTypes.VMFfile = vmfTypes.VMFfile{};

    const brushes = try readLump([]bspTypes.Brush, allocator, &file, header.lumps[18]);

    for (brushes) |brush| {
        std.debug.print("{d}\n", .{brush.firstside});
    }
}

/// Reads a lump in the given BSP file
/// returns a structure
fn readLump(T: type, allocator: std.mem.Allocator, file: *std.fs.File, lump: bspTypes.Lump) !T {
    try file.seekTo(@intCast(lump.offset));
    const buf = try allocator.alloc(u8, @intCast(lump.length));
    _ = try file.readAll(buf);

    const out: T = @ptrCast(@alignCast(buf));
    return out;
}
