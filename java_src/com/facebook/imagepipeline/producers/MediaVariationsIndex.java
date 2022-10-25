package com.facebook.imagepipeline.producers;

import bolts.Task;
import com.facebook.cache.common.CacheKey;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.MediaVariations;
import java.util.List;
/* loaded from: classes.dex */
public interface MediaVariationsIndex {
    Task<List<MediaVariations.Variant>> getCachedVariants(String str);

    void saveCachedVariant(String str, CacheKey cacheKey, EncodedImage encodedImage);
}
