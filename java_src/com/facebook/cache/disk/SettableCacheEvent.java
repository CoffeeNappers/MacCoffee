package com.facebook.cache.disk;

import com.facebook.cache.common.CacheEvent;
import com.facebook.cache.common.CacheEventListener;
import com.facebook.cache.common.CacheKey;
import java.io.IOException;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class SettableCacheEvent implements CacheEvent {
    private static final int MAX_RECYCLED = 5;
    private static final Object RECYCLER_LOCK = new Object();
    private static SettableCacheEvent sFirstRecycledEvent;
    private static int sRecycledCount;
    private CacheKey mCacheKey;
    private long mCacheLimit;
    private long mCacheSize;
    private CacheEventListener.EvictionReason mEvictionReason;
    private IOException mException;
    private long mItemSize;
    private SettableCacheEvent mNextRecycledEvent;
    private String mResourceId;

    public static SettableCacheEvent obtain() {
        synchronized (RECYCLER_LOCK) {
            if (sFirstRecycledEvent != null) {
                SettableCacheEvent eventToReuse = sFirstRecycledEvent;
                sFirstRecycledEvent = eventToReuse.mNextRecycledEvent;
                eventToReuse.mNextRecycledEvent = null;
                sRecycledCount--;
                return eventToReuse;
            }
            return new SettableCacheEvent();
        }
    }

    private SettableCacheEvent() {
    }

    @Override // com.facebook.cache.common.CacheEvent
    @Nullable
    public CacheKey getCacheKey() {
        return this.mCacheKey;
    }

    public SettableCacheEvent setCacheKey(CacheKey cacheKey) {
        this.mCacheKey = cacheKey;
        return this;
    }

    @Override // com.facebook.cache.common.CacheEvent
    @Nullable
    public String getResourceId() {
        return this.mResourceId;
    }

    public SettableCacheEvent setResourceId(String resourceId) {
        this.mResourceId = resourceId;
        return this;
    }

    @Override // com.facebook.cache.common.CacheEvent
    public long getItemSize() {
        return this.mItemSize;
    }

    public SettableCacheEvent setItemSize(long itemSize) {
        this.mItemSize = itemSize;
        return this;
    }

    @Override // com.facebook.cache.common.CacheEvent
    public long getCacheSize() {
        return this.mCacheSize;
    }

    public SettableCacheEvent setCacheSize(long cacheSize) {
        this.mCacheSize = cacheSize;
        return this;
    }

    @Override // com.facebook.cache.common.CacheEvent
    public long getCacheLimit() {
        return this.mCacheLimit;
    }

    public SettableCacheEvent setCacheLimit(long cacheLimit) {
        this.mCacheLimit = cacheLimit;
        return this;
    }

    @Override // com.facebook.cache.common.CacheEvent
    @Nullable
    public IOException getException() {
        return this.mException;
    }

    public SettableCacheEvent setException(IOException exception) {
        this.mException = exception;
        return this;
    }

    @Override // com.facebook.cache.common.CacheEvent
    @Nullable
    public CacheEventListener.EvictionReason getEvictionReason() {
        return this.mEvictionReason;
    }

    public SettableCacheEvent setEvictionReason(CacheEventListener.EvictionReason evictionReason) {
        this.mEvictionReason = evictionReason;
        return this;
    }

    public void recycle() {
        synchronized (RECYCLER_LOCK) {
            if (sRecycledCount < 5) {
                reset();
                sRecycledCount++;
                if (sFirstRecycledEvent != null) {
                    this.mNextRecycledEvent = sFirstRecycledEvent;
                }
                sFirstRecycledEvent = this;
            }
        }
    }

    private void reset() {
        this.mCacheKey = null;
        this.mResourceId = null;
        this.mItemSize = 0L;
        this.mCacheLimit = 0L;
        this.mCacheSize = 0L;
        this.mException = null;
        this.mEvictionReason = null;
    }
}
