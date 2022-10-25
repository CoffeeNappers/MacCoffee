package com.facebook.cache.common;

import com.facebook.common.util.SecureHashUtil;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class CacheKeyUtil {
    public static List<String> getResourceIds(CacheKey key) {
        try {
            if (key instanceof MultiCacheKey) {
                List<CacheKey> keys = ((MultiCacheKey) key).getCacheKeys();
                List<String> ids = new ArrayList<>(keys.size());
                for (int i = 0; i < keys.size(); i++) {
                    ids.add(secureHashKey(keys.get(i)));
                }
                return ids;
            }
            List<String> ids2 = new ArrayList<>(1);
            ids2.add(secureHashKey(key));
            return ids2;
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static String getFirstResourceId(CacheKey key) {
        try {
            if (!(key instanceof MultiCacheKey)) {
                return secureHashKey(key);
            }
            List<CacheKey> keys = ((MultiCacheKey) key).getCacheKeys();
            return secureHashKey(keys.get(0));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    private static String secureHashKey(CacheKey key) throws UnsupportedEncodingException {
        return SecureHashUtil.makeSHA1HashBase64(key.getUriString().getBytes("UTF-8"));
    }
}
