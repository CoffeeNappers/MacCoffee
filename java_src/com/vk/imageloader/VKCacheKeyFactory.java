package com.vk.imageloader;

import android.net.Uri;
import com.facebook.imagepipeline.cache.DefaultCacheKeyFactory;
/* loaded from: classes2.dex */
public class VKCacheKeyFactory extends DefaultCacheKeyFactory {
    private static VKCacheKeyFactory sInstance = null;

    protected VKCacheKeyFactory() {
    }

    public static synchronized VKCacheKeyFactory getInstance() {
        VKCacheKeyFactory vKCacheKeyFactory;
        synchronized (VKCacheKeyFactory.class) {
            if (sInstance == null) {
                sInstance = new VKCacheKeyFactory();
            }
            vKCacheKeyFactory = sInstance;
        }
        return vKCacheKeyFactory;
    }

    @Override // com.facebook.imagepipeline.cache.DefaultCacheKeyFactory
    protected Uri getCacheKeySourceUri(Uri sourceUri) {
        if (sourceUri == null) {
            return null;
        }
        String url = sourceUri.toString();
        if (isDocWithParamsImage(url)) {
            return Uri.parse(getRawUrl(url));
        }
        return sourceUri;
    }

    private boolean isDocWithParamsImage(String url) {
        return (url.startsWith("https://vk.com/doc") || url.startsWith("http://vk.com/doc")) && url.contains("?");
    }

    private String getRawUrl(String url) {
        return url.substring(0, url.indexOf("?"));
    }
}
