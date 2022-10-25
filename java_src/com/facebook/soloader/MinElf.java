package com.facebook.soloader;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;
/* loaded from: classes.dex */
public final class MinElf {
    public static final int DT_NEEDED = 1;
    public static final int DT_NULL = 0;
    public static final int DT_STRTAB = 5;
    public static final int ELF_MAGIC = 1179403647;
    public static final int PN_XNUM = 65535;
    public static final int PT_DYNAMIC = 2;
    public static final int PT_LOAD = 1;

    public static String[] extract_DT_NEEDED(File elfFile) throws IOException {
        FileInputStream is = new FileInputStream(elfFile);
        try {
            return extract_DT_NEEDED(is.getChannel());
        } finally {
            is.close();
        }
    }

    public static String[] extract_DT_NEEDED(FileChannel fc) throws IOException {
        long d_tag;
        long d_tag2;
        ByteBuffer bb = ByteBuffer.allocate(8);
        bb.order(ByteOrder.LITTLE_ENDIAN);
        if (getu32(fc, bb, 0L) != 1179403647) {
            throw new ElfError("file is not ELF");
        }
        boolean is32 = getu8(fc, bb, 4L) == 1;
        if (getu8(fc, bb, 5L) == 2) {
            bb.order(ByteOrder.BIG_ENDIAN);
        }
        long e_phoff = is32 ? getu32(fc, bb, 28L) : get64(fc, bb, 32L);
        long e_phnum = is32 ? getu16(fc, bb, 44L) : getu16(fc, bb, 56L);
        int e_phentsize = is32 ? getu16(fc, bb, 42L) : getu16(fc, bb, 54L);
        if (e_phnum == 65535) {
            long e_shoff = is32 ? getu32(fc, bb, 32L) : get64(fc, bb, 40L);
            long sh_info = is32 ? getu32(fc, bb, 28 + e_shoff) : getu32(fc, bb, 44 + e_shoff);
            e_phnum = sh_info;
        }
        long dynStart = 0;
        long phdr = e_phoff;
        long i = 0;
        while (true) {
            if (i >= e_phnum) {
                break;
            }
            long p_type = is32 ? getu32(fc, bb, 0 + phdr) : getu32(fc, bb, 0 + phdr);
            if (p_type == 2) {
                long p_offset = is32 ? getu32(fc, bb, 4 + phdr) : get64(fc, bb, 8 + phdr);
                dynStart = p_offset;
            } else {
                phdr += e_phentsize;
                i++;
            }
        }
        if (dynStart == 0) {
            throw new ElfError("ELF file does not contain dynamic linking information");
        }
        int nr_DT_NEEDED = 0;
        long dyn = dynStart;
        long ptr_DT_STRTAB = 0;
        do {
            d_tag = is32 ? getu32(fc, bb, 0 + dyn) : get64(fc, bb, 0 + dyn);
            if (d_tag == 1) {
                if (nr_DT_NEEDED == Integer.MAX_VALUE) {
                    throw new ElfError("malformed DT_NEEDED section");
                }
                nr_DT_NEEDED++;
            } else if (d_tag == 5) {
                ptr_DT_STRTAB = is32 ? getu32(fc, bb, 4 + dyn) : get64(fc, bb, 8 + dyn);
            }
            dyn += is32 ? 8L : 16L;
        } while (d_tag != 0);
        if (ptr_DT_STRTAB == 0) {
            throw new ElfError("Dynamic section string-table not found");
        }
        long off_DT_STRTAB = 0;
        long phdr2 = e_phoff;
        int i2 = 0;
        while (true) {
            if (i2 >= e_phnum) {
                break;
            }
            long p_type2 = is32 ? getu32(fc, bb, 0 + phdr2) : getu32(fc, bb, 0 + phdr2);
            if (p_type2 == 1) {
                long p_vaddr = is32 ? getu32(fc, bb, 8 + phdr2) : get64(fc, bb, 16 + phdr2);
                long p_memsz = is32 ? getu32(fc, bb, 20 + phdr2) : get64(fc, bb, 40 + phdr2);
                if (p_vaddr <= ptr_DT_STRTAB && ptr_DT_STRTAB < p_vaddr + p_memsz) {
                    long p_offset2 = is32 ? getu32(fc, bb, 4 + phdr2) : get64(fc, bb, 8 + phdr2);
                    off_DT_STRTAB = p_offset2 + (ptr_DT_STRTAB - p_vaddr);
                }
            }
            phdr2 += e_phentsize;
            i2++;
        }
        if (off_DT_STRTAB == 0) {
            throw new ElfError("did not find file offset of DT_STRTAB table");
        }
        String[] needed = new String[nr_DT_NEEDED];
        int nr_DT_NEEDED2 = 0;
        long dyn2 = dynStart;
        do {
            d_tag2 = is32 ? getu32(fc, bb, 0 + dyn2) : get64(fc, bb, 0 + dyn2);
            if (d_tag2 == 1) {
                long d_val = is32 ? getu32(fc, bb, 4 + dyn2) : get64(fc, bb, 8 + dyn2);
                needed[nr_DT_NEEDED2] = getSz(fc, bb, off_DT_STRTAB + d_val);
                if (nr_DT_NEEDED2 == Integer.MAX_VALUE) {
                    throw new ElfError("malformed DT_NEEDED section");
                }
                nr_DT_NEEDED2++;
            }
            dyn2 += is32 ? 8L : 16L;
        } while (d_tag2 != 0);
        if (nr_DT_NEEDED2 == needed.length) {
            return needed;
        }
        throw new ElfError("malformed DT_NEEDED section");
    }

    private static String getSz(FileChannel fc, ByteBuffer bb, long offset) throws IOException {
        StringBuilder sb = new StringBuilder();
        while (true) {
            long offset2 = offset + 1;
            short b = getu8(fc, bb, offset);
            if (b != 0) {
                sb.append((char) b);
                offset = offset2;
            } else {
                return sb.toString();
            }
        }
    }

    private static void read(FileChannel fc, ByteBuffer bb, int sz, long offset) throws IOException {
        int numBytesRead;
        bb.position(0);
        bb.limit(sz);
        while (bb.remaining() > 0 && (numBytesRead = fc.read(bb, offset)) != -1) {
            offset += numBytesRead;
        }
        if (bb.remaining() > 0) {
            throw new ElfError("ELF file truncated");
        }
        bb.position(0);
    }

    private static long get64(FileChannel fc, ByteBuffer bb, long offset) throws IOException {
        read(fc, bb, 8, offset);
        return bb.getLong();
    }

    private static long getu32(FileChannel fc, ByteBuffer bb, long offset) throws IOException {
        read(fc, bb, 4, offset);
        return bb.getInt() & 4294967295L;
    }

    private static int getu16(FileChannel fc, ByteBuffer bb, long offset) throws IOException {
        read(fc, bb, 2, offset);
        return bb.getShort() & 65535;
    }

    private static short getu8(FileChannel fc, ByteBuffer bb, long offset) throws IOException {
        read(fc, bb, 1, offset);
        return (short) (bb.get() & 255);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class ElfError extends RuntimeException {
        ElfError(String why) {
            super(why);
        }
    }
}
