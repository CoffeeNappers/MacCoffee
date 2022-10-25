package com.facebook.imagepipeline.cache;

import bolts.Task;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.ImageRequest;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public interface DiskCachePolicy {
    Task<EncodedImage> createAndStartCacheReadTask(ImageRequest imageRequest, Object obj, AtomicBoolean atomicBoolean);

    void writeToCache(EncodedImage encodedImage, ImageRequest imageRequest, Object obj);
}
