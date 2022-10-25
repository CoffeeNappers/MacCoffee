package com.facebook.cache.common;

import android.net.Uri;
import com.facebook.common.internal.Preconditions;
/* loaded from: classes.dex */
public class SimpleCacheKey implements CacheKey {
    final String mKey;

    public SimpleCacheKey(String key) {
        this.mKey = (String) Preconditions.checkNotNull(key);
    }

    @Override // com.facebook.cache.common.CacheKey
    public String toString() {
        return this.mKey;
    }

    @Override // com.facebook.cache.common.CacheKey
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof SimpleCacheKey) {
            SimpleCacheKey otherKey = (SimpleCacheKey) o;
            return this.mKey.equals(otherKey.mKey);
        }
        return false;
    }

    @Override // com.facebook.cache.common.CacheKey
    public int hashCode() {
        return this.mKey.hashCode();
    }

    @Override // com.facebook.cache.common.CacheKey
    public boolean containsUri(Uri uri) {
        return this.mKey.contains(uri.toString());
    }

    @Override // com.facebook.cache.common.CacheKey
    public String getUriString() {
        return this.mKey;
    }
}
