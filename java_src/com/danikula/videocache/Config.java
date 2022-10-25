package com.danikula.videocache;

import com.danikula.videocache.file.DiskUsage;
import com.danikula.videocache.file.FileNameGenerator;
import com.danikula.videocache.sourcestorage.SourceInfoStorage;
import java.io.File;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class Config {
    public final File cacheRoot;
    public final DiskUsage diskUsage;
    public final FileNameGenerator fileNameGenerator;
    public final SourceInfoStorage sourceInfoStorage;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Config(File cacheRoot, FileNameGenerator fileNameGenerator, DiskUsage diskUsage, SourceInfoStorage sourceInfoStorage) {
        this.cacheRoot = cacheRoot;
        this.fileNameGenerator = fileNameGenerator;
        this.diskUsage = diskUsage;
        this.sourceInfoStorage = sourceInfoStorage;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public File generateCacheFile(String url) {
        String name = this.fileNameGenerator.generate(url);
        return new File(this.cacheRoot, name);
    }
}
