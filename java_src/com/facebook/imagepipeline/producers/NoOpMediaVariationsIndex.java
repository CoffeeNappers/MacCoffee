package com.facebook.imagepipeline.producers;

import bolts.Task;
import com.facebook.cache.common.CacheKey;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.MediaVariations;
import java.util.List;
/* loaded from: classes.dex */
public class NoOpMediaVariationsIndex implements MediaVariationsIndex {
    @Override // com.facebook.imagepipeline.producers.MediaVariationsIndex
    public Task<List<MediaVariations.Variant>> getCachedVariants(String mediaId) {
        return Task.forResult(null);
    }

    @Override // com.facebook.imagepipeline.producers.MediaVariationsIndex
    public void saveCachedVariant(String mediaId, CacheKey cacheKey, EncodedImage encodedImage) {
    }
}
