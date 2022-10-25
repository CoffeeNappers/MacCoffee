package com.facebook.cache.disk;

import android.os.Environment;
import com.facebook.binaryresource.BinaryResource;
import com.facebook.binaryresource.FileBinaryResource;
import com.facebook.cache.common.CacheErrorLogger;
import com.facebook.cache.common.WriterCallback;
import com.facebook.cache.disk.DiskStorage;
import com.facebook.common.file.FileTree;
import com.facebook.common.file.FileTreeVisitor;
import com.facebook.common.file.FileUtils;
import com.facebook.common.internal.CountingOutputStream;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.time.Clock;
import com.facebook.common.time.SystemClock;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class DefaultDiskStorage implements DiskStorage {
    private static final String CONTENT_FILE_EXTENSION = ".cnt";
    private static final String DEFAULT_DISK_STORAGE_VERSION_PREFIX = "v2";
    private static final int SHARDING_BUCKET_COUNT = 100;
    private static final String TEMP_FILE_EXTENSION = ".tmp";
    private final CacheErrorLogger mCacheErrorLogger;
    private final Clock mClock;
    private final boolean mIsExternal;
    private final File mRootDirectory;
    private final File mVersionDirectory;
    private static final Class<?> TAG = DefaultDiskStorage.class;
    static final long TEMP_FILE_LIFETIME_MS = TimeUnit.MINUTES.toMillis(30);

    public DefaultDiskStorage(File rootDirectory, int version, CacheErrorLogger cacheErrorLogger) {
        Preconditions.checkNotNull(rootDirectory);
        this.mRootDirectory = rootDirectory;
        this.mIsExternal = isExternal(rootDirectory, cacheErrorLogger);
        this.mVersionDirectory = new File(this.mRootDirectory, getVersionSubdirectoryName(version));
        this.mCacheErrorLogger = cacheErrorLogger;
        recreateDirectoryIfVersionChanges();
        this.mClock = SystemClock.get();
    }

    private static boolean isExternal(File directory, CacheErrorLogger cacheErrorLogger) {
        String appCacheDirPath = null;
        try {
            File extStoragePath = Environment.getExternalStorageDirectory();
            if (extStoragePath == null) {
                return false;
            }
            String cacheDirPath = extStoragePath.toString();
            try {
                appCacheDirPath = directory.getCanonicalPath();
                if (!appCacheDirPath.contains(cacheDirPath)) {
                    return false;
                }
                return true;
            } catch (IOException e) {
                cacheErrorLogger.logError(CacheErrorLogger.CacheErrorCategory.OTHER, TAG, "failed to read folder to check if external: " + appCacheDirPath, e);
                return false;
            }
        } catch (Exception e2) {
            cacheErrorLogger.logError(CacheErrorLogger.CacheErrorCategory.OTHER, TAG, "failed to get the external storage directory!", e2);
            return false;
        }
    }

    @VisibleForTesting
    static String getVersionSubdirectoryName(int version) {
        return String.format(null, "%s.ols%d.%d", DEFAULT_DISK_STORAGE_VERSION_PREFIX, 100, Integer.valueOf(version));
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public boolean isEnabled() {
        return true;
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public boolean isExternal() {
        return this.mIsExternal;
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public String getStorageName() {
        String directoryName = this.mRootDirectory.getAbsolutePath();
        return EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + directoryName.substring(directoryName.lastIndexOf(47) + 1, directoryName.length()) + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + directoryName.hashCode();
    }

    private void recreateDirectoryIfVersionChanges() {
        boolean recreateBase = false;
        if (!this.mRootDirectory.exists()) {
            recreateBase = true;
        } else if (!this.mVersionDirectory.exists()) {
            recreateBase = true;
            FileTree.deleteRecursively(this.mRootDirectory);
        }
        if (recreateBase) {
            try {
                FileUtils.mkdirs(this.mVersionDirectory);
            } catch (FileUtils.CreateDirectoryException e) {
                this.mCacheErrorLogger.logError(CacheErrorLogger.CacheErrorCategory.WRITE_CREATE_DIR, TAG, "version directory could not be created: " + this.mVersionDirectory, null);
            }
        }
    }

    /* loaded from: classes.dex */
    private static class IncompleteFileException extends IOException {
        public final long actual;
        public final long expected;

        public IncompleteFileException(long expected, long actual) {
            super("File was not written completely. Expected: " + expected + ", found: " + actual);
            this.expected = expected;
            this.actual = actual;
        }
    }

    @VisibleForTesting
    File getContentFileFor(String resourceId) {
        return new File(getFilename(resourceId));
    }

    private String getSubdirectoryPath(String resourceId) {
        String subdirectory = String.valueOf(Math.abs(resourceId.hashCode() % 100));
        return this.mVersionDirectory + File.separator + subdirectory;
    }

    private File getSubdirectory(String resourceId) {
        return new File(getSubdirectoryPath(resourceId));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class EntriesCollector implements FileTreeVisitor {
        private final List<DiskStorage.Entry> result;

        private EntriesCollector() {
            this.result = new ArrayList();
        }

        @Override // com.facebook.common.file.FileTreeVisitor
        public void preVisitDirectory(File directory) {
        }

        @Override // com.facebook.common.file.FileTreeVisitor
        public void visitFile(File file) {
            FileInfo info = DefaultDiskStorage.this.getShardFileInfo(file);
            if (info != null && info.type == FileType.CONTENT) {
                this.result.add(new EntryImpl(info.resourceId, file));
            }
        }

        @Override // com.facebook.common.file.FileTreeVisitor
        public void postVisitDirectory(File directory) {
        }

        public List<DiskStorage.Entry> getEntries() {
            return Collections.unmodifiableList(this.result);
        }
    }

    /* loaded from: classes.dex */
    private class PurgingVisitor implements FileTreeVisitor {
        private boolean insideBaseDirectory;

        private PurgingVisitor() {
        }

        @Override // com.facebook.common.file.FileTreeVisitor
        public void preVisitDirectory(File directory) {
            if (!this.insideBaseDirectory && directory.equals(DefaultDiskStorage.this.mVersionDirectory)) {
                this.insideBaseDirectory = true;
            }
        }

        @Override // com.facebook.common.file.FileTreeVisitor
        public void visitFile(File file) {
            if (!this.insideBaseDirectory || !isExpectedFile(file)) {
                file.delete();
            }
        }

        @Override // com.facebook.common.file.FileTreeVisitor
        public void postVisitDirectory(File directory) {
            if (!DefaultDiskStorage.this.mRootDirectory.equals(directory) && !this.insideBaseDirectory) {
                directory.delete();
            }
            if (this.insideBaseDirectory && directory.equals(DefaultDiskStorage.this.mVersionDirectory)) {
                this.insideBaseDirectory = false;
            }
        }

        private boolean isExpectedFile(File file) {
            boolean z = false;
            FileInfo info = DefaultDiskStorage.this.getShardFileInfo(file);
            if (info == null) {
                return false;
            }
            if (info.type == FileType.TEMP) {
                return isRecentFile(file);
            }
            if (info.type == FileType.CONTENT) {
                z = true;
            }
            Preconditions.checkState(z);
            return true;
        }

        private boolean isRecentFile(File file) {
            return file.lastModified() > DefaultDiskStorage.this.mClock.now() - DefaultDiskStorage.TEMP_FILE_LIFETIME_MS;
        }
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public void purgeUnexpectedResources() {
        FileTree.walkFileTree(this.mRootDirectory, new PurgingVisitor());
    }

    private void mkdirs(File directory, String message) throws IOException {
        try {
            FileUtils.mkdirs(directory);
        } catch (FileUtils.CreateDirectoryException cde) {
            this.mCacheErrorLogger.logError(CacheErrorLogger.CacheErrorCategory.WRITE_CREATE_DIR, TAG, message, cde);
            throw cde;
        }
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public DiskStorage.Inserter insert(String resourceId, Object debugInfo) throws IOException {
        FileInfo info = new FileInfo(FileType.TEMP, resourceId);
        File parent = getSubdirectory(info.resourceId);
        if (!parent.exists()) {
            mkdirs(parent, "insert");
        }
        try {
            File file = info.createTempFile(parent);
            return new InserterImpl(resourceId, file);
        } catch (IOException ioe) {
            this.mCacheErrorLogger.logError(CacheErrorLogger.CacheErrorCategory.WRITE_CREATE_TEMPFILE, TAG, "insert", ioe);
            throw ioe;
        }
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public BinaryResource getResource(String resourceId, Object debugInfo) {
        File file = getContentFileFor(resourceId);
        if (file.exists()) {
            file.setLastModified(this.mClock.now());
            return FileBinaryResource.createOrNull(file);
        }
        return null;
    }

    private String getFilename(String resourceId) {
        FileInfo fileInfo = new FileInfo(FileType.CONTENT, resourceId);
        String path = getSubdirectoryPath(fileInfo.resourceId);
        return fileInfo.toPath(path);
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public boolean contains(String resourceId, Object debugInfo) {
        return query(resourceId, false);
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public boolean touch(String resourceId, Object debugInfo) {
        return query(resourceId, true);
    }

    private boolean query(String resourceId, boolean touch) {
        File contentFile = getContentFileFor(resourceId);
        boolean exists = contentFile.exists();
        if (touch && exists) {
            contentFile.setLastModified(this.mClock.now());
        }
        return exists;
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public long remove(DiskStorage.Entry entry) {
        EntryImpl entryImpl = (EntryImpl) entry;
        FileBinaryResource resource = entryImpl.mo191getResource();
        return doRemove(resource.getFile());
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public long remove(String resourceId) {
        return doRemove(getContentFileFor(resourceId));
    }

    private long doRemove(File contentFile) {
        if (!contentFile.exists()) {
            return 0L;
        }
        long length = contentFile.length();
        if (!contentFile.delete()) {
            return -1L;
        }
        return length;
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public void clearAll() {
        FileTree.deleteContents(this.mRootDirectory);
    }

    @Override // com.facebook.cache.disk.DiskStorage
    public DiskStorage.DiskDumpInfo getDumpInfo() throws IOException {
        List<DiskStorage.Entry> entries = mo190getEntries();
        DiskStorage.DiskDumpInfo dumpInfo = new DiskStorage.DiskDumpInfo();
        for (DiskStorage.Entry entry : entries) {
            DiskStorage.DiskDumpInfoEntry infoEntry = dumpCacheEntry(entry);
            String type = infoEntry.type;
            if (!dumpInfo.typeCounts.containsKey(type)) {
                dumpInfo.typeCounts.put(type, 0);
            }
            dumpInfo.typeCounts.put(type, Integer.valueOf(dumpInfo.typeCounts.get(type).intValue() + 1));
            dumpInfo.entries.add(infoEntry);
        }
        return dumpInfo;
    }

    private DiskStorage.DiskDumpInfoEntry dumpCacheEntry(DiskStorage.Entry entry) throws IOException {
        EntryImpl entryImpl = (EntryImpl) entry;
        String firstBits = "";
        byte[] bytes = entryImpl.mo191getResource().read();
        String type = typeOfBytes(bytes);
        if (type.equals("undefined") && bytes.length >= 4) {
            firstBits = String.format(null, "0x%02X 0x%02X 0x%02X 0x%02X", Byte.valueOf(bytes[0]), Byte.valueOf(bytes[1]), Byte.valueOf(bytes[2]), Byte.valueOf(bytes[3]));
        }
        String path = entryImpl.mo191getResource().getFile().getPath();
        return new DiskStorage.DiskDumpInfoEntry(path, type, (float) entryImpl.getSize(), firstBits);
    }

    private String typeOfBytes(byte[] bytes) {
        if (bytes.length >= 2) {
            if (bytes[0] == -1 && bytes[1] == -40) {
                return "jpg";
            }
            if (bytes[0] == -119 && bytes[1] == 80) {
                return "png";
            }
            if (bytes[0] == 82 && bytes[1] == 73) {
                return "webp";
            }
            if (bytes[0] == 71 && bytes[1] == 73) {
                return "gif";
            }
        }
        return "undefined";
    }

    @Override // com.facebook.cache.disk.DiskStorage
    /* renamed from: getEntries  reason: collision with other method in class */
    public List<DiskStorage.Entry> mo190getEntries() throws IOException {
        EntriesCollector collector = new EntriesCollector();
        FileTree.walkFileTree(this.mVersionDirectory, collector);
        return collector.getEntries();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    /* loaded from: classes.dex */
    public static class EntryImpl implements DiskStorage.Entry {
        private final String id;
        private final FileBinaryResource resource;
        private long size;
        private long timestamp;

        private EntryImpl(String id, File cachedFile) {
            Preconditions.checkNotNull(cachedFile);
            this.id = (String) Preconditions.checkNotNull(id);
            this.resource = FileBinaryResource.createOrNull(cachedFile);
            this.size = -1L;
            this.timestamp = -1L;
        }

        @Override // com.facebook.cache.disk.DiskStorage.Entry
        public String getId() {
            return this.id;
        }

        @Override // com.facebook.cache.disk.DiskStorage.Entry
        public long getTimestamp() {
            if (this.timestamp < 0) {
                File cachedFile = this.resource.getFile();
                this.timestamp = cachedFile.lastModified();
            }
            return this.timestamp;
        }

        @Override // com.facebook.cache.disk.DiskStorage.Entry
        /* renamed from: getResource  reason: collision with other method in class */
        public FileBinaryResource mo191getResource() {
            return this.resource;
        }

        @Override // com.facebook.cache.disk.DiskStorage.Entry
        public long getSize() {
            if (this.size < 0) {
                this.size = this.resource.size();
            }
            return this.size;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public FileInfo getShardFileInfo(File file) {
        FileInfo info = FileInfo.fromFile(file);
        if (info == null) {
            return null;
        }
        File expectedDirectory = getSubdirectory(info.resourceId);
        boolean isCorrect = expectedDirectory.equals(file.getParentFile());
        if (!isCorrect) {
            info = null;
        }
        return info;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public enum FileType {
        CONTENT(DefaultDiskStorage.CONTENT_FILE_EXTENSION),
        TEMP(DefaultDiskStorage.TEMP_FILE_EXTENSION);
        
        public final String extension;

        FileType(String extension) {
            this.extension = extension;
        }

        public static FileType fromExtension(String extension) {
            if (DefaultDiskStorage.CONTENT_FILE_EXTENSION.equals(extension)) {
                return CONTENT;
            }
            if (DefaultDiskStorage.TEMP_FILE_EXTENSION.equals(extension)) {
                return TEMP;
            }
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class FileInfo {
        public final String resourceId;
        public final FileType type;

        private FileInfo(FileType type, String resourceId) {
            this.type = type;
            this.resourceId = resourceId;
        }

        public String toString() {
            return this.type + "(" + this.resourceId + ")";
        }

        public String toPath(String parentPath) {
            return parentPath + File.separator + this.resourceId + this.type.extension;
        }

        public File createTempFile(File parent) throws IOException {
            File f = File.createTempFile(this.resourceId + ".", DefaultDiskStorage.TEMP_FILE_EXTENSION, parent);
            return f;
        }

        @Nullable
        public static FileInfo fromFile(File file) {
            String name = file.getName();
            int pos = name.lastIndexOf(46);
            if (pos <= 0) {
                return null;
            }
            String ext = name.substring(pos);
            FileType type = FileType.fromExtension(ext);
            if (type == null) {
                return null;
            }
            String resourceId = name.substring(0, pos);
            if (type.equals(FileType.TEMP)) {
                int numPos = resourceId.lastIndexOf(46);
                if (numPos <= 0) {
                    return null;
                }
                resourceId = resourceId.substring(0, numPos);
            }
            return new FileInfo(type, resourceId);
        }
    }

    @VisibleForTesting
    /* loaded from: classes.dex */
    class InserterImpl implements DiskStorage.Inserter {
        private final String mResourceId;
        @VisibleForTesting
        final File mTemporaryFile;

        public InserterImpl(String resourceId, File temporaryFile) {
            this.mResourceId = resourceId;
            this.mTemporaryFile = temporaryFile;
        }

        @Override // com.facebook.cache.disk.DiskStorage.Inserter
        public void writeData(WriterCallback callback, Object debugInfo) throws IOException {
            try {
                FileOutputStream fileStream = new FileOutputStream(this.mTemporaryFile);
                try {
                    CountingOutputStream countingStream = new CountingOutputStream(fileStream);
                    callback.write(countingStream);
                    countingStream.flush();
                    long length = countingStream.getCount();
                    fileStream.close();
                    if (this.mTemporaryFile.length() != length) {
                        throw new IncompleteFileException(length, this.mTemporaryFile.length());
                    }
                } catch (Throwable th) {
                    fileStream.close();
                    throw th;
                }
            } catch (FileNotFoundException fne) {
                DefaultDiskStorage.this.mCacheErrorLogger.logError(CacheErrorLogger.CacheErrorCategory.WRITE_UPDATE_FILE_NOT_FOUND, DefaultDiskStorage.TAG, "updateResource", fne);
                throw fne;
            }
        }

        @Override // com.facebook.cache.disk.DiskStorage.Inserter
        public BinaryResource commit(Object debugInfo) throws IOException {
            CacheErrorLogger.CacheErrorCategory category;
            File targetFile = DefaultDiskStorage.this.getContentFileFor(this.mResourceId);
            try {
                FileUtils.rename(this.mTemporaryFile, targetFile);
                if (targetFile.exists()) {
                    targetFile.setLastModified(DefaultDiskStorage.this.mClock.now());
                }
                return FileBinaryResource.createOrNull(targetFile);
            } catch (FileUtils.RenameException re) {
                Throwable cause = re.getCause();
                if (cause == null) {
                    category = CacheErrorLogger.CacheErrorCategory.WRITE_RENAME_FILE_OTHER;
                } else if (cause instanceof FileUtils.ParentDirNotFoundException) {
                    category = CacheErrorLogger.CacheErrorCategory.WRITE_RENAME_FILE_TEMPFILE_PARENT_NOT_FOUND;
                } else if (cause instanceof FileNotFoundException) {
                    category = CacheErrorLogger.CacheErrorCategory.WRITE_RENAME_FILE_TEMPFILE_NOT_FOUND;
                } else {
                    category = CacheErrorLogger.CacheErrorCategory.WRITE_RENAME_FILE_OTHER;
                }
                DefaultDiskStorage.this.mCacheErrorLogger.logError(category, DefaultDiskStorage.TAG, "commit", re);
                throw re;
            }
        }

        @Override // com.facebook.cache.disk.DiskStorage.Inserter
        public boolean cleanUp() {
            return !this.mTemporaryFile.exists() || this.mTemporaryFile.delete();
        }
    }
}
