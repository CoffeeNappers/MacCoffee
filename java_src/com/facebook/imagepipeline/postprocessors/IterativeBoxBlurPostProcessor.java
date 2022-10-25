package com.facebook.imagepipeline.postprocessors;

import android.graphics.Bitmap;
import com.facebook.cache.common.CacheKey;
import com.facebook.cache.common.SimpleCacheKey;
import com.facebook.common.internal.Preconditions;
import com.facebook.imagepipeline.nativecode.NativeBlurFilter;
import com.facebook.imagepipeline.request.BasePostprocessor;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class IterativeBoxBlurPostProcessor extends BasePostprocessor {
    private static final int DEFAULT_ITERATIONS = 3;
    private final int mBlurRadius;
    private CacheKey mCacheKey;
    private final int mIterations;

    public IterativeBoxBlurPostProcessor(int blurRadius) {
        this(3, blurRadius);
    }

    public IterativeBoxBlurPostProcessor(int iterations, int blurRadius) {
        boolean z = true;
        Preconditions.checkArgument(iterations > 0);
        Preconditions.checkArgument(blurRadius <= 0 ? false : z);
        this.mIterations = iterations;
        this.mBlurRadius = blurRadius;
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor
    public void process(Bitmap bitmap) {
        NativeBlurFilter.iterativeBoxBlur(bitmap, this.mIterations, this.mBlurRadius);
    }

    @Override // com.facebook.imagepipeline.request.BasePostprocessor, com.facebook.imagepipeline.request.Postprocessor
    @Nullable
    public CacheKey getPostprocessorCacheKey() {
        if (this.mCacheKey == null) {
            String key = String.format(null, "i%dr%d", Integer.valueOf(this.mIterations), Integer.valueOf(this.mBlurRadius));
            this.mCacheKey = new SimpleCacheKey(key);
        }
        return this.mCacheKey;
    }
}
