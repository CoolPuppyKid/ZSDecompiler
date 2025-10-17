const std = @import("std");
const bspTypes = @import("bsptypes.zig");

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

    const lump1 = try readLump(allocator, &file, header.lumps[1]);
    std.debug.print("Lump 1:\n{s}\n", .{lump1});
}

fn readLump(allocator: std.mem.Allocator, file: *std.fs.File, lump: bspTypes.Lump) ![]u8 {
    try file.seekTo(@intCast(lump.offset));
    const buf = try allocator.alloc(u8, @intCast(lump.length));
    _ = try file.readAll(buf);
    return buf;
}
