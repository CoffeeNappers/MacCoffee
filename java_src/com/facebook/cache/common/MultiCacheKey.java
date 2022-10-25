package com.facebook.cache.common;

import android.net.Uri;
import com.facebook.common.internal.Preconditions;
import java.util.List;
/* loaded from: classes.dex */
public class MultiCacheKey implements CacheKey {
    final List<CacheKey> mCacheKeys;

    public MultiCacheKey(List<CacheKey> cacheKeys) {
        this.mCacheKeys = (List) Preconditions.checkNotNull(cacheKeys);
    }

    public List<CacheKey> getCacheKeys() {
        return this.mCacheKeys;
    }

    @Override // com.facebook.cache.common.CacheKey
    public String toString() {
        return "MultiCacheKey:" + this.mCacheKeys.toString();
    }

    @Override // com.facebook.cache.common.CacheKey
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof MultiCacheKey) {
            MultiCacheKey otherKey = (MultiCacheKey) o;
            return this.mCacheKeys.equals(otherKey.mCacheKeys);
        }
        return false;
    }

    @Override // com.facebook.cache.common.CacheKey
    public int hashCode() {
        return this.mCacheKeys.hashCode();
    }

    @Override // com.facebook.cache.common.CacheKey
    public boolean containsUri(Uri uri) {
        for (int i = 0; i < this.mCacheKeys.size(); i++) {
            if (this.mCacheKeys.get(i).containsUri(uri)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.facebook.cache.common.CacheKey
    public String getUriString() {
        return this.mCacheKeys.get(0).getUriString();
    }
}
