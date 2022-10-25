package com.danikula.videocache.file;

import java.io.File;
import java.io.IOException;
/* loaded from: classes.dex */
public class TotalSizeLruDiskUsage extends LruDiskUsage {
    private final long maxSize;

    @Override // com.danikula.videocache.file.LruDiskUsage, com.danikula.videocache.file.DiskUsage
    public /* bridge */ /* synthetic */ void touch(File file) throws IOException {
        super.touch(file);
    }

    public TotalSizeLruDiskUsage(long maxSize) {
        if (maxSize <= 0) {
            throw new IllegalArgumentException("Max size must be positive number!");
        }
        this.maxSize = maxSize;
    }

    @Override // com.danikula.videocache.file.LruDiskUsage
    protected boolean accept(File file, long totalSize, int totalCount) {
        return totalSize <= this.maxSize;
    }
}
