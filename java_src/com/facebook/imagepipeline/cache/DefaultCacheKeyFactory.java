package com.facebook.imagepipeline.cache;

import android.net.Uri;
import com.facebook.cache.common.CacheKey;
import com.facebook.cache.common.SimpleCacheKey;
import com.facebook.imagepipeline.request.ImageRequest;
import com.facebook.imagepipeline.request.Postprocessor;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class DefaultCacheKeyFactory implements CacheKeyFactory {
    private static DefaultCacheKeyFactory sInstance = null;

    public static synchronized DefaultCacheKeyFactory getInstance() {
        DefaultCacheKeyFactory defaultCacheKeyFactory;
        synchronized (DefaultCacheKeyFactory.class) {
            if (sInstance == null) {
                sInstance = new DefaultCacheKeyFactory();
            }
            defaultCacheKeyFactory = sInstance;
        }
        return defaultCacheKeyFactory;
    }

    @Override // com.facebook.imagepipeline.cache.CacheKeyFactory
    public CacheKey getBitmapCacheKey(ImageRequest request, Object callerContext) {
        return new BitmapMemoryCacheKey(getCacheKeySourceUri(request.getSourceUri()).toString(), request.getResizeOptions(), request.getRotationOptions(), request.getImageDecodeOptions(), null, null, callerContext);
    }

    @Override // com.facebook.imagepipeline.cache.CacheKeyFactory
    public CacheKey getPostprocessedBitmapCacheKey(ImageRequest request, Object callerContext) {
        CacheKey postprocessorCacheKey;
        String postprocessorName;
        Postprocessor postprocessor = request.getPostprocessor();
        if (postprocessor != null) {
            postprocessorCacheKey = postprocessor.getPostprocessorCacheKey();
            postprocessorName = postprocessor.getClass().getName();
        } else {
            postprocessorCacheKey = null;
            postprocessorName = null;
        }
        return new BitmapMemoryCacheKey(getCacheKeySourceUri(request.getSourceUri()).toString(), request.getResizeOptions(), request.getRotationOptions(), request.getImageDecodeOptions(), postprocessorCacheKey, postprocessorName, callerContext);
    }

    @Override // com.facebook.imagepipeline.cache.CacheKeyFactory
    public CacheKey getEncodedCacheKey(ImageRequest request, @Nullable Object callerContext) {
        return getEncodedCacheKey(request, request.getSourceUri(), callerContext);
    }

    @Override // com.facebook.imagepipeline.cache.CacheKeyFactory
    public CacheKey getEncodedCacheKey(ImageRequest request, Uri sourceUri, @Nullable Object callerContext) {
        return new SimpleCacheKey(getCacheKeySourceUri(sourceUri).toString());
    }

    protected Uri getCacheKeySourceUri(Uri sourceUri) {
        return sourceUri;
    }
}
