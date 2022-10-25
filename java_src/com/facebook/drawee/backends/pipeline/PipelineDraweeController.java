package com.facebook.drawee.backends.pipeline;

import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.facebook.cache.common.CacheKey;
import com.facebook.common.internal.ImmutableList;
import com.facebook.common.internal.Objects;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Supplier;
import com.facebook.common.logging.FLog;
import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.DataSource;
import com.facebook.drawable.base.DrawableWithCaches;
import com.facebook.drawee.components.DeferredReleaser;
import com.facebook.drawee.controller.AbstractDraweeController;
import com.facebook.drawee.debug.DebugControllerOverlayDrawable;
import com.facebook.drawee.drawable.OrientedDrawable;
import com.facebook.drawee.drawable.ScaleTypeDrawable;
import com.facebook.drawee.drawable.ScalingUtils;
import com.facebook.drawee.interfaces.DraweeHierarchy;
import com.facebook.imagepipeline.animated.factory.AnimatedDrawableFactory;
import com.facebook.imagepipeline.cache.MemoryCache;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.image.CloseableStaticBitmap;
import com.facebook.imagepipeline.image.ImageInfo;
import java.util.Iterator;
import java.util.concurrent.Executor;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class PipelineDraweeController extends AbstractDraweeController<CloseableReference<CloseableImage>, ImageInfo> {
    private static final Class<?> TAG = PipelineDraweeController.class;
    private final AnimatedDrawableFactory mAnimatedDrawableFactory;
    private CacheKey mCacheKey;
    private Supplier<DataSource<CloseableReference<CloseableImage>>> mDataSourceSupplier;
    private final DrawableFactory mDefaultDrawableFactory;
    private boolean mDrawDebugOverlay;
    @Nullable
    private final ImmutableList<DrawableFactory> mDrawableFactories;
    @Nullable
    private MemoryCache<CacheKey, CloseableImage> mMemoryCache;
    private final Resources mResources;

    public PipelineDraweeController(Resources resources, DeferredReleaser deferredReleaser, AnimatedDrawableFactory animatedDrawableFactory, Executor uiThreadExecutor, MemoryCache<CacheKey, CloseableImage> memoryCache, Supplier<DataSource<CloseableReference<CloseableImage>>> dataSourceSupplier, String id, CacheKey cacheKey, Object callerContext) {
        this(resources, deferredReleaser, animatedDrawableFactory, uiThreadExecutor, memoryCache, dataSourceSupplier, id, cacheKey, callerContext, null);
    }

    public PipelineDraweeController(Resources resources, DeferredReleaser deferredReleaser, AnimatedDrawableFactory animatedDrawableFactory, Executor uiThreadExecutor, MemoryCache<CacheKey, CloseableImage> memoryCache, Supplier<DataSource<CloseableReference<CloseableImage>>> dataSourceSupplier, String id, CacheKey cacheKey, Object callerContext, @Nullable ImmutableList<DrawableFactory> drawableFactories) {
        super(deferredReleaser, uiThreadExecutor, id, callerContext);
        this.mDefaultDrawableFactory = new DrawableFactory() { // from class: com.facebook.drawee.backends.pipeline.PipelineDraweeController.1
            @Override // com.facebook.drawee.backends.pipeline.DrawableFactory
            public boolean supportsImageType(CloseableImage image) {
                return true;
            }

            @Override // com.facebook.drawee.backends.pipeline.DrawableFactory
            public Drawable createDrawable(CloseableImage closeableImage) {
                if (!(closeableImage instanceof CloseableStaticBitmap)) {
                    if (PipelineDraweeController.this.mAnimatedDrawableFactory != null) {
                        return PipelineDraweeController.this.mAnimatedDrawableFactory.create(closeableImage);
                    }
                    return null;
                }
                CloseableStaticBitmap closeableStaticBitmap = (CloseableStaticBitmap) closeableImage;
                Drawable bitmapDrawable = new BitmapDrawable(PipelineDraweeController.this.mResources, closeableStaticBitmap.getUnderlyingBitmap());
                if (closeableStaticBitmap.getRotationAngle() != 0 && closeableStaticBitmap.getRotationAngle() != -1) {
                    return new OrientedDrawable(bitmapDrawable, closeableStaticBitmap.getRotationAngle());
                }
                return bitmapDrawable;
            }
        };
        this.mResources = resources;
        this.mAnimatedDrawableFactory = animatedDrawableFactory;
        this.mMemoryCache = memoryCache;
        this.mCacheKey = cacheKey;
        this.mDrawableFactories = drawableFactories;
        init(dataSourceSupplier);
    }

    public void initialize(Supplier<DataSource<CloseableReference<CloseableImage>>> dataSourceSupplier, String id, CacheKey cacheKey, Object callerContext) {
        super.initialize(id, callerContext);
        init(dataSourceSupplier);
        this.mCacheKey = cacheKey;
    }

    public void setDrawDebugOverlay(boolean drawDebugOverlay) {
        this.mDrawDebugOverlay = drawDebugOverlay;
    }

    private void init(Supplier<DataSource<CloseableReference<CloseableImage>>> dataSourceSupplier) {
        this.mDataSourceSupplier = dataSourceSupplier;
        maybeUpdateDebugOverlay(null);
    }

    protected Resources getResources() {
        return this.mResources;
    }

    @Override // com.facebook.drawee.controller.AbstractDraweeController
    protected DataSource<CloseableReference<CloseableImage>> getDataSource() {
        if (FLog.isLoggable(2)) {
            FLog.v(TAG, "controller %x: getDataSource", Integer.valueOf(System.identityHashCode(this)));
        }
        return this.mDataSourceSupplier.mo486get();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.drawee.controller.AbstractDraweeController
    public Drawable createDrawable(CloseableReference<CloseableImage> image) {
        Drawable drawable;
        Preconditions.checkState(CloseableReference.isValid(image));
        CloseableImage closeableImage = image.get();
        maybeUpdateDebugOverlay(closeableImage);
        if (this.mDrawableFactories != null) {
            Iterator<DrawableFactory> it = this.mDrawableFactories.iterator();
            while (it.hasNext()) {
                DrawableFactory factory = it.next();
                if (factory.supportsImageType(closeableImage) && (drawable = factory.createDrawable(closeableImage)) != null) {
                    return drawable;
                }
            }
        }
        Drawable defaultDrawable = this.mDefaultDrawableFactory.createDrawable(closeableImage);
        if (defaultDrawable != null) {
            return defaultDrawable;
        }
        throw new UnsupportedOperationException("Unrecognized image class: " + closeableImage);
    }

    @Override // com.facebook.drawee.controller.AbstractDraweeController, com.facebook.drawee.interfaces.DraweeController
    public void setHierarchy(@Nullable DraweeHierarchy hierarchy) {
        super.setHierarchy(hierarchy);
        maybeUpdateDebugOverlay(null);
    }

    private void maybeUpdateDebugOverlay(@Nullable CloseableImage image) {
        if (this.mDrawDebugOverlay) {
            Drawable controllerOverlay = getControllerOverlay();
            if (controllerOverlay == null) {
                controllerOverlay = new DebugControllerOverlayDrawable();
                setControllerOverlay(controllerOverlay);
            }
            if (controllerOverlay instanceof DebugControllerOverlayDrawable) {
                DebugControllerOverlayDrawable debugOverlay = (DebugControllerOverlayDrawable) controllerOverlay;
                debugOverlay.setControllerId(getId());
                DraweeHierarchy draweeHierarchy = getHierarchy();
                ScalingUtils.ScaleType scaleType = null;
                if (draweeHierarchy != null) {
                    ScaleTypeDrawable scaleTypeDrawable = ScalingUtils.getActiveScaleTypeDrawable(draweeHierarchy.getTopLevelDrawable());
                    scaleType = scaleTypeDrawable != null ? scaleTypeDrawable.getScaleType() : null;
                }
                debugOverlay.setScaleType(scaleType);
                if (image != null) {
                    debugOverlay.setDimensions(image.getWidth(), image.getHeight());
                    debugOverlay.setImageSize(image.getSizeInBytes());
                    return;
                }
                debugOverlay.reset();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.drawee.controller.AbstractDraweeController
    public ImageInfo getImageInfo(CloseableReference<CloseableImage> image) {
        Preconditions.checkState(CloseableReference.isValid(image));
        return image.get();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.drawee.controller.AbstractDraweeController
    public int getImageHash(@Nullable CloseableReference<CloseableImage> image) {
        if (image != null) {
            return image.getValueHash();
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.drawee.controller.AbstractDraweeController
    public void releaseImage(@Nullable CloseableReference<CloseableImage> image) {
        CloseableReference.closeSafely(image);
    }

    @Override // com.facebook.drawee.controller.AbstractDraweeController
    protected void releaseDrawable(@Nullable Drawable drawable) {
        if (drawable instanceof DrawableWithCaches) {
            ((DrawableWithCaches) drawable).dropCaches();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.facebook.drawee.controller.AbstractDraweeController
    /* renamed from: getCachedImage */
    public CloseableReference<CloseableImage> mo202getCachedImage() {
        if (this.mMemoryCache == null || this.mCacheKey == null) {
            return null;
        }
        CloseableReference<CloseableImage> closeableImage = this.mMemoryCache.get(this.mCacheKey);
        if (closeableImage != null && !closeableImage.get().getQualityInfo().isOfFullQuality()) {
            closeableImage.close();
            return null;
        }
        return closeableImage;
    }

    @Override // com.facebook.drawee.controller.AbstractDraweeController
    public String toString() {
        return Objects.toStringHelper(this).add("super", super.toString()).add("dataSourceSupplier", this.mDataSourceSupplier).toString();
    }
}
