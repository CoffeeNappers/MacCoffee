package com.facebook.cache.disk;

import com.facebook.binaryresource.BinaryResource;
import com.facebook.cache.common.WriterCallback;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public interface DiskStorage {

    /* loaded from: classes.dex */
    public static class DiskDumpInfo {
        public List<DiskDumpInfoEntry> entries = new ArrayList();
        public Map<String, Integer> typeCounts = new HashMap();
    }

    /* loaded from: classes.dex */
    public interface Entry {
        String getId();

        /* renamed from: getResource */
        BinaryResource mo191getResource();

        long getSize();

        long getTimestamp();
    }

    /* loaded from: classes.dex */
    public interface Inserter {
        boolean cleanUp();

        BinaryResource commit(Object obj) throws IOException;

        void writeData(WriterCallback writerCallback, Object obj) throws IOException;
    }

    void clearAll() throws IOException;

    boolean contains(String str, Object obj) throws IOException;

    DiskDumpInfo getDumpInfo() throws IOException;

    /* renamed from: getEntries */
    Collection<Entry> mo190getEntries() throws IOException;

    BinaryResource getResource(String str, Object obj) throws IOException;

    String getStorageName();

    Inserter insert(String str, Object obj) throws IOException;

    boolean isEnabled();

    boolean isExternal();

    void purgeUnexpectedResources();

    long remove(Entry entry) throws IOException;

    long remove(String str) throws IOException;

    boolean touch(String str, Object obj) throws IOException;

    /* loaded from: classes.dex */
    public static class DiskDumpInfoEntry {
        public final String firstBits;
        public final String path;
        public final float size;
        public final String type;

        /* JADX INFO: Access modifiers changed from: protected */
        public DiskDumpInfoEntry(String path, String type, float size, String firstBits) {
            this.path = path;
            this.type = type;
            this.size = size;
            this.firstBits = firstBits;
        }
    }
}
