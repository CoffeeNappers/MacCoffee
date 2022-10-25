package com.facebook.common.statfs;

import android.annotation.SuppressLint;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.os.SystemClock;
import com.facebook.common.internal.Throwables;
import java.io.File;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;
import org.mp4parser.aspectj.lang.JoinPoint;
@ThreadSafe
/* loaded from: classes.dex */
public class StatFsHelper {
    private static final long RESTAT_INTERVAL_MS = TimeUnit.MINUTES.toMillis(2);
    private static StatFsHelper sStatsFsHelper;
    private volatile File mExternalPath;
    private volatile File mInternalPath;
    @GuardedBy(JoinPoint.SYNCHRONIZATION_LOCK)
    private long mLastRestatTime;
    private volatile StatFs mInternalStatFs = null;
    private volatile StatFs mExternalStatFs = null;
    private volatile boolean mInitialized = false;
    private final Lock lock = new ReentrantLock();

    /* loaded from: classes.dex */
    public enum StorageType {
        INTERNAL,
        EXTERNAL
    }

    public static synchronized StatFsHelper getInstance() {
        StatFsHelper statFsHelper;
        synchronized (StatFsHelper.class) {
            if (sStatsFsHelper == null) {
                sStatsFsHelper = new StatFsHelper();
            }
            statFsHelper = sStatsFsHelper;
        }
        return statFsHelper;
    }

    protected StatFsHelper() {
    }

    private void ensureInitialized() {
        if (!this.mInitialized) {
            this.lock.lock();
            try {
                if (!this.mInitialized) {
                    this.mInternalPath = Environment.getDataDirectory();
                    this.mExternalPath = Environment.getExternalStorageDirectory();
                    updateStats();
                    this.mInitialized = true;
                }
            } finally {
                this.lock.unlock();
            }
        }
    }

    public boolean testLowDiskSpace(StorageType storageType, long freeSpaceThreshold) {
        ensureInitialized();
        long availableStorageSpace = getAvailableStorageSpace(storageType);
        return availableStorageSpace <= 0 || availableStorageSpace < freeSpaceThreshold;
    }

    @SuppressLint({"DeprecatedMethod"})
    public long getFreeStorageSpace(StorageType storageType) {
        long blockSize;
        long availableBlocks;
        ensureInitialized();
        maybeUpdateStats();
        StatFs statFS = storageType == StorageType.INTERNAL ? this.mInternalStatFs : this.mExternalStatFs;
        if (statFS != null) {
            if (Build.VERSION.SDK_INT >= 18) {
                blockSize = statFS.getBlockSizeLong();
                availableBlocks = statFS.getFreeBlocksLong();
            } else {
                blockSize = statFS.getBlockSize();
                availableBlocks = statFS.getFreeBlocks();
            }
            return blockSize * availableBlocks;
        }
        return -1L;
    }

    @SuppressLint({"DeprecatedMethod"})
    public long getTotalStorageSpace(StorageType storageType) {
        long blockSize;
        long totalBlocks;
        ensureInitialized();
        maybeUpdateStats();
        StatFs statFS = storageType == StorageType.INTERNAL ? this.mInternalStatFs : this.mExternalStatFs;
        if (statFS != null) {
            if (Build.VERSION.SDK_INT >= 18) {
                blockSize = statFS.getBlockSizeLong();
                totalBlocks = statFS.getBlockCountLong();
            } else {
                blockSize = statFS.getBlockSize();
                totalBlocks = statFS.getBlockCount();
            }
            return blockSize * totalBlocks;
        }
        return -1L;
    }

    @SuppressLint({"DeprecatedMethod"})
    public long getAvailableStorageSpace(StorageType storageType) {
        long blockSize;
        long availableBlocks;
        ensureInitialized();
        maybeUpdateStats();
        StatFs statFS = storageType == StorageType.INTERNAL ? this.mInternalStatFs : this.mExternalStatFs;
        if (statFS != null) {
            if (Build.VERSION.SDK_INT >= 18) {
                blockSize = statFS.getBlockSizeLong();
                availableBlocks = statFS.getAvailableBlocksLong();
            } else {
                blockSize = statFS.getBlockSize();
                availableBlocks = statFS.getAvailableBlocks();
            }
            return blockSize * availableBlocks;
        }
        return 0L;
    }

    private void maybeUpdateStats() {
        if (this.lock.tryLock()) {
            try {
                if (SystemClock.uptimeMillis() - this.mLastRestatTime > RESTAT_INTERVAL_MS) {
                    updateStats();
                }
            } finally {
                this.lock.unlock();
            }
        }
    }

    public void resetStats() {
        if (this.lock.tryLock()) {
            try {
                ensureInitialized();
                updateStats();
            } finally {
                this.lock.unlock();
            }
        }
    }

    @GuardedBy(JoinPoint.SYNCHRONIZATION_LOCK)
    private void updateStats() {
        this.mInternalStatFs = updateStatsHelper(this.mInternalStatFs, this.mInternalPath);
        this.mExternalStatFs = updateStatsHelper(this.mExternalStatFs, this.mExternalPath);
        this.mLastRestatTime = SystemClock.uptimeMillis();
    }

    private StatFs updateStatsHelper(@Nullable StatFs statfs, @Nullable File dir) {
        if (dir == null || !dir.exists()) {
            return null;
        }
        try {
            if (statfs == null) {
                statfs = createStatFs(dir.getAbsolutePath());
            } else {
                statfs.restat(dir.getAbsolutePath());
            }
        } catch (IllegalArgumentException e) {
            statfs = null;
        } catch (Throwable ex) {
            throw Throwables.propagate(ex);
        }
        return statfs;
    }

    protected static StatFs createStatFs(String path) {
        return new StatFs(path);
    }
}
