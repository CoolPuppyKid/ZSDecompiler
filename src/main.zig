const std = @import("std");
const zsTypes = @import("zstypes.zig");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    var file = try std.fs.cwd().openFile("map.bsp", .{});
    defer file.close();

    var reader = file.reader();

    // i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig i hate zig

    const header: zsTypes.BSPHeader = try reader.readStruct(zsTypes.BSPHeader);

    if (std.mem.eql(u8, &header.ident, "VBSP") == false) {
        return error.GoFuckYourself;
    }

    std.debug.print("BSP FILE:\nIdent: {s},\nVersion: {d},\nRevision: {d}.\n", .{ header.ident, header.version, header.mapRevision });

    const lump1 = try readLump(allocator, &file, header.lumps[0]);
    std.debug.print("Lump 1:\n{s}\n", .{lump1});
}

fn readLump(allocator: std.mem.Allocator, file: *std.fs.File, lump: zsTypes.Lump) ![]u8 {
    try file.seekTo(@intCast(lump.offset));
    const buf = try allocator.alloc(u8, @intCast(lump.length));
    _ = try file.readAll(buf);
    return buf;
}
