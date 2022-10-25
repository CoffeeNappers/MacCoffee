package com.facebook.drawee.backends.pipeline;

import android.content.Context;
import android.net.Uri;
import com.facebook.cache.common.CacheKey;
import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.DataSource;
import com.facebook.drawee.controller.AbstractDraweeControllerBuilder;
import com.facebook.drawee.controller.ControllerListener;
import com.facebook.drawee.interfaces.DraweeController;
import com.facebook.imagepipeline.cache.CacheKeyFactory;
import com.facebook.imagepipeline.common.RotationOptions;
import com.facebook.imagepipeline.core.ImagePipeline;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.image.ImageInfo;
import com.facebook.imagepipeline.request.ImageRequest;
import com.facebook.imagepipeline.request.ImageRequestBuilder;
import java.util.Set;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class PipelineDraweeControllerBuilder extends AbstractDraweeControllerBuilder<PipelineDraweeControllerBuilder, ImageRequest, CloseableReference<CloseableImage>, ImageInfo> {
    private final ImagePipeline mImagePipeline;
    private final PipelineDraweeControllerFactory mPipelineDraweeControllerFactory;

    public PipelineDraweeControllerBuilder(Context context, PipelineDraweeControllerFactory pipelineDraweeControllerFactory, ImagePipeline imagePipeline, Set<ControllerListener> boundControllerListeners) {
        super(context, boundControllerListeners);
        this.mImagePipeline = imagePipeline;
        this.mPipelineDraweeControllerFactory = pipelineDraweeControllerFactory;
    }

    @Override // com.facebook.drawee.interfaces.SimpleDraweeControllerBuilder
    /* renamed from: setUri */
    public PipelineDraweeControllerBuilder mo205setUri(@Nullable Uri uri) {
        if (uri == null) {
            return (PipelineDraweeControllerBuilder) super.setImageRequest(null);
        }
        ImageRequest imageRequest = ImageRequestBuilder.newBuilderWithSource(uri).setRotationOptions(RotationOptions.autoRotateAtRenderTime()).build();
        return (PipelineDraweeControllerBuilder) super.setImageRequest(imageRequest);
    }

    @Override // com.facebook.drawee.interfaces.SimpleDraweeControllerBuilder
    /* renamed from: setUri */
    public PipelineDraweeControllerBuilder mo206setUri(@Nullable String uriString) {
        return (uriString == null || uriString.isEmpty()) ? (PipelineDraweeControllerBuilder) super.setImageRequest(ImageRequest.fromUri(uriString)) : mo205setUri(Uri.parse(uriString));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.drawee.controller.AbstractDraweeControllerBuilder
    /* renamed from: obtainController */
    public PipelineDraweeController mo204obtainController() {
        DraweeController oldController = getOldController();
        if (oldController instanceof PipelineDraweeController) {
            PipelineDraweeController controller = (PipelineDraweeController) oldController;
            controller.initialize(obtainDataSourceSupplier(), generateUniqueControllerId(), getCacheKey(), getCallerContext());
            return controller;
        }
        return this.mPipelineDraweeControllerFactory.newController(obtainDataSourceSupplier(), generateUniqueControllerId(), getCacheKey(), getCallerContext());
    }

    private CacheKey getCacheKey() {
        ImageRequest imageRequest = getImageRequest();
        CacheKeyFactory cacheKeyFactory = this.mImagePipeline.getCacheKeyFactory();
        if (cacheKeyFactory == null || imageRequest == null) {
            return null;
        }
        if (imageRequest.getPostprocessor() != null) {
            CacheKey cacheKey = cacheKeyFactory.getPostprocessedBitmapCacheKey(imageRequest, getCallerContext());
            return cacheKey;
        }
        CacheKey cacheKey2 = cacheKeyFactory.getBitmapCacheKey(imageRequest, getCallerContext());
        return cacheKey2;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.drawee.controller.AbstractDraweeControllerBuilder
    public DataSource<CloseableReference<CloseableImage>> getDataSourceForRequest(ImageRequest imageRequest, Object callerContext, AbstractDraweeControllerBuilder.CacheLevel cacheLevel) {
        return this.mImagePipeline.fetchDecodedImage(imageRequest, callerContext, convertCacheLevelToRequestLevel(cacheLevel));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.facebook.drawee.controller.AbstractDraweeControllerBuilder
    /* renamed from: getThis */
    public PipelineDraweeControllerBuilder mo203getThis() {
        return this;
    }

    public static ImageRequest.RequestLevel convertCacheLevelToRequestLevel(AbstractDraweeControllerBuilder.CacheLevel cacheLevel) {
        switch (cacheLevel) {
            case FULL_FETCH:
                return ImageRequest.RequestLevel.FULL_FETCH;
            case DISK_CACHE:
                return ImageRequest.RequestLevel.DISK_CACHE;
            case BITMAP_MEMORY_CACHE:
                return ImageRequest.RequestLevel.BITMAP_MEMORY_CACHE;
            default:
                throw new RuntimeException("Cache level" + cacheLevel + "is not supported. ");
        }
    }
}
