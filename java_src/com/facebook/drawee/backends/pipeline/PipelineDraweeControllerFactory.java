package com.facebook.drawee.backends.pipeline;

import android.content.res.Resources;
import com.facebook.cache.common.CacheKey;
import com.facebook.common.internal.ImmutableList;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Supplier;
import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.DataSource;
import com.facebook.drawee.components.DeferredReleaser;
import com.facebook.imagepipeline.animated.factory.AnimatedDrawableFactory;
import com.facebook.imagepipeline.cache.MemoryCache;
import com.facebook.imagepipeline.image.CloseableImage;
import java.util.concurrent.Executor;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class PipelineDraweeControllerFactory {
    private AnimatedDrawableFactory mAnimatedDrawableFactory;
    @Nullable
    private Supplier<Boolean> mDebugOverlayEnabledSupplier;
    private DeferredReleaser mDeferredReleaser;
    @Nullable
    private ImmutableList<DrawableFactory> mDrawableFactories;
    private MemoryCache<CacheKey, CloseableImage> mMemoryCache;
    private Resources mResources;
    private Executor mUiThreadExecutor;

    public void init(Resources resources, DeferredReleaser deferredReleaser, AnimatedDrawableFactory animatedDrawableFactory, Executor uiThreadExecutor, MemoryCache<CacheKey, CloseableImage> memoryCache, @Nullable ImmutableList<DrawableFactory> drawableFactories, @Nullable Supplier<Boolean> debugOverlayEnabledSupplier) {
        this.mResources = resources;
        this.mDeferredReleaser = deferredReleaser;
        this.mAnimatedDrawableFactory = animatedDrawableFactory;
        this.mUiThreadExecutor = uiThreadExecutor;
        this.mMemoryCache = memoryCache;
        this.mDrawableFactories = drawableFactories;
        this.mDebugOverlayEnabledSupplier = debugOverlayEnabledSupplier;
    }

    public PipelineDraweeController newController(Supplier<DataSource<CloseableReference<CloseableImage>>> dataSourceSupplier, String id, CacheKey cacheKey, Object callerContext) {
        Preconditions.checkState(this.mResources != null, "init() not called");
        PipelineDraweeController controller = internalCreateController(this.mResources, this.mDeferredReleaser, this.mAnimatedDrawableFactory, this.mUiThreadExecutor, this.mMemoryCache, this.mDrawableFactories, dataSourceSupplier, id, cacheKey, callerContext);
        if (this.mDebugOverlayEnabledSupplier != null) {
            controller.setDrawDebugOverlay(this.mDebugOverlayEnabledSupplier.mo486get().booleanValue());
        }
        return controller;
    }

    protected PipelineDraweeController internalCreateController(Resources resources, DeferredReleaser deferredReleaser, AnimatedDrawableFactory animatedDrawableFactory, Executor uiThreadExecutor, MemoryCache<CacheKey, CloseableImage> memoryCache, @Nullable ImmutableList<DrawableFactory> drawableFactories, Supplier<DataSource<CloseableReference<CloseableImage>>> dataSourceSupplier, String id, CacheKey cacheKey, Object callerContext) {
        return new PipelineDraweeController(resources, deferredReleaser, animatedDrawableFactory, uiThreadExecutor, memoryCache, dataSourceSupplier, id, cacheKey, callerContext, drawableFactories);
    }
}
