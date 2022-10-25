package com.facebook.cache.disk;

import com.facebook.binaryresource.BinaryResource;
import com.facebook.cache.common.CacheErrorLogger;
import com.facebook.cache.disk.DiskStorage;
import com.facebook.common.file.FileTree;
import com.facebook.common.file.FileUtils;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Supplier;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.logging.FLog;
import java.io.File;
import java.io.IOException;
import java.util.Collection;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class DynamicDefaultDiskStorage implements DiskStorage {
    private static final Class<?> TAG = DynamicDefaultDiskStorage.class;
    private final String mBaseDirectoryName;
    private final Supplier<File> mBaseDirectoryPathSupplier;
    private final CacheErrorLogger mCacheErrorLogger;
    @VisibleForTesting
    volatile State mCurrentState = new State(null, null);
    private final int mVersion;

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    /* loaded from: classes.dex */
    public static class State {
        @Nullable
        public final DiskStorage delegate;
        @Nullable
        public final File rootDirectory;

        @VisibleForTesting
        State(@Nullable File rootDirectory, @Nullable DiskStorage delegate) {
            this.delegate = delegate;
            this.rootDirectory = rootDirectory;
        }
    }

    public DynamicDefaultDiskStorage(int version, Supplier<File> baseDirectoryPathSupplier, String baseDirectoryName, CacheErrorLogger cacheErrorLogger) {
        this.mVersion = version;
        this.mCacheErrorLogger = cacheErrorLogger;
        this.mBaseDirectoryPathSupplier = baseDirectoryPathSupplier;
        this.mBaseDirectoryName = baseDirectoryName;
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public boolean isEnabled() {
        try {
            return get().isEnabled();
        } catch (IOException e) {
            return false;
        }
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public boolean isExternal() {
        try {
            return get().isExternal();
        } catch (IOException e) {
            return false;
        }
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public String getStorageName() {
        try {
            return get().getStorageName();
        } catch (IOException e) {
            return "";
        }
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public BinaryResource getResource(String resourceId, Object debugInfo) throws IOException {
        return get().getResource(resourceId, debugInfo);
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public boolean contains(String resourceId, Object debugInfo) throws IOException {
        return get().contains(resourceId, debugInfo);
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public boolean touch(String resourceId, Object debugInfo) throws IOException {
        return get().touch(resourceId, debugInfo);
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public void purgeUnexpectedResources() {
        try {
            get().purgeUnexpectedResources();
        } catch (IOException ioe) {
            FLog.e(TAG, "purgeUnexpectedResources", ioe);
        }
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public DiskStorage.Inserter insert(String resourceId, Object debugInfo) throws IOException {
        return get().insert(resourceId, debugInfo);
    }

    @Override // com.facebook.cache.disk.DiskStorage
    /* renamed from: getEntries */
    public Collection<DiskStorage.Entry> mo190getEntries() throws IOException {
        return get().mo190getEntries();
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public long remove(DiskStorage.Entry entry) throws IOException {
        return get().remove(entry);
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public long remove(String resourceId) throws IOException {
        return get().remove(resourceId);
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public void clearAll() throws IOException {
        get().clearAll();
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public DiskStorage.DiskDumpInfo getDumpInfo() throws IOException {
        return get().getDumpInfo();
    }

    @VisibleForTesting
    synchronized DiskStorage get() throws IOException {
        if (shouldCreateNewStorage()) {
            deleteOldStorageIfNecessary();
            createStorage();
        }
        return (DiskStorage) Preconditions.checkNotNull(this.mCurrentState.delegate);
    }

    private boolean shouldCreateNewStorage() {
        State currentState = this.mCurrentState;
        return currentState.delegate == null || currentState.rootDirectory == null || !currentState.rootDirectory.exists();
    }

    @VisibleForTesting
    void deleteOldStorageIfNecessary() {
        if (this.mCurrentState.delegate != null && this.mCurrentState.rootDirectory != null) {
            FileTree.deleteRecursively(this.mCurrentState.rootDirectory);
        }
    }

    private void createStorage() throws IOException {
        File rootDirectory = new File(this.mBaseDirectoryPathSupplier.mo486get(), this.mBaseDirectoryName);
        createRootDirectoryIfNecessary(rootDirectory);
        DiskStorage storage = new DefaultDiskStorage(rootDirectory, this.mVersion, this.mCacheErrorLogger);
        this.mCurrentState = new State(rootDirectory, storage);
    }

    @VisibleForTesting
    void createRootDirectoryIfNecessary(File rootDirectory) throws IOException {
        try {
            FileUtils.mkdirs(rootDirectory);
            FLog.d(TAG, "Created cache directory %s", rootDirectory.getAbsolutePath());
        } catch (FileUtils.CreateDirectoryException cde) {
            this.mCacheErrorLogger.logError(CacheErrorLogger.CacheErrorCategory.WRITE_CREATE_DIR, TAG, "createRootDirectoryIfNecessary", cde);
            throw cde;
        }
    }
}
