package com.vk.imageloader.view;

import android.content.Context;
import android.graphics.drawable.Animatable;
import android.net.Uri;
import android.text.TextUtils;
import android.util.AttributeSet;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.drawee.backends.pipeline.PipelineDraweeControllerBuilder;
import com.facebook.drawee.controller.AbstractDraweeController;
import com.facebook.drawee.controller.BaseControllerListener;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
import com.facebook.drawee.interfaces.DraweeController;
import com.facebook.drawee.interfaces.SimpleDraweeControllerBuilder;
import com.facebook.imagepipeline.common.ResizeOptions;
import com.facebook.imagepipeline.common.RotationOptions;
import com.facebook.imagepipeline.image.ImageInfo;
import com.facebook.imagepipeline.request.BasePostprocessor;
import com.facebook.imagepipeline.request.ImageRequest;
import com.facebook.imagepipeline.request.ImageRequestBuilder;
import com.vk.imageloader.ImageNetworkFailHandler;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.OnLoadCallback;
import com.vk.imageloader.VKImageLoader;
import java.lang.reflect.Method;
/* loaded from: classes2.dex */
public class VKImageView extends GenericVKImageView {
    private static final int MAX_RETRIES = 3;
    public static final RotationOptions ROTATE_OPTIONS = RotationOptions.autoRotate();
    private PipelineDraweeControllerBuilder controllerBuilder;
    private BasePostprocessor highResPostPostprocessor;
    private int imageHeight;
    private int imageWidth;
    private BasePostprocessor lowResPostPostprocessor;
    private OnLoadCallback onLoadCallback;
    private BasePostprocessor postprocessor;
    private int retriesCount;

    static /* synthetic */ int access$308(VKImageView x0) {
        int i = x0.retriesCount;
        x0.retriesCount = i + 1;
        return i;
    }

    public VKImageView(Context context) {
        this(context, null);
    }

    public VKImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public VKImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.retriesCount = 0;
        init();
    }

    private void init() {
        if (!isInEditMode()) {
            this.controllerBuilder = Fresco.newDraweeControllerBuilder();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.imageloader.view.GenericVKImageView
    public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
        builder.setFadeDuration(75);
    }

    protected SimpleDraweeControllerBuilder customizeControllerBuilder(SimpleDraweeControllerBuilder builder) {
        return builder;
    }

    public void setOnLoadCallback(OnLoadCallback onLoadCallback) {
        this.onLoadCallback = onLoadCallback;
    }

    public void setPostprocessor(BasePostprocessor postprocessor) {
        this.postprocessor = postprocessor;
        this.lowResPostPostprocessor = null;
        this.highResPostPostprocessor = null;
    }

    public void setPostprocessor(BasePostprocessor lowResPostPostprocessor, BasePostprocessor highResPostPostprocessor) {
        this.postprocessor = null;
        this.lowResPostPostprocessor = lowResPostPostprocessor;
        this.highResPostPostprocessor = highResPostPostprocessor;
    }

    public boolean hasImage() {
        return getImageWidth() > 0 && getImageHeight() > 0;
    }

    public int getImageWidth() {
        if (getController() != null) {
            return this.imageWidth;
        }
        if (getDrawable() != null) {
            return getDrawable().getIntrinsicWidth();
        }
        return 0;
    }

    public int getImageHeight() {
        if (getController() != null) {
            return this.imageHeight;
        }
        if (getDrawable() != null) {
            return getDrawable().getIntrinsicHeight();
        }
        return 0;
    }

    public float getImageAspectRatio() {
        if (hasImage()) {
            return getImageWidth() / getImageHeight();
        }
        return 0.0f;
    }

    public void clear() {
        setController(null);
    }

    public void cancel() {
        if (!hasImage()) {
            setController(null);
        }
    }

    public void loadResource(int resId) {
        loadResource(resId, null);
    }

    public void loadResource(int resId, ImageSize size) {
        ImageRequestBuilder imageRequestBuilder = ImageRequestBuilder.newBuilderWithResourceId(resId);
        setSizeToRequest(imageRequestBuilder, size);
        proccessImageRequest(imageRequestBuilder, null);
    }

    public void load(String url) {
        load(url, (ImageSize) null);
    }

    public void load(String url, ImageSize size) {
        if (!TextUtils.isEmpty(url)) {
            ImageRequestBuilder imageRequestBuilder = ImageRequestBuilder.newBuilderWithSource(Uri.parse(url));
            if (VKImageLoader.shouldUsePersistentCache(url)) {
                imageRequestBuilder.setCacheChoice(ImageRequest.CacheChoice.SMALL);
            }
            setSizeToRequest(imageRequestBuilder, size);
            proccessImageRequest(imageRequestBuilder, null);
        }
    }

    public void load(Uri uri, ImageSize size) {
        if (uri != null) {
            ImageRequestBuilder imageRequestBuilder = ImageRequestBuilder.newBuilderWithSource(uri);
            setSizeToRequest(imageRequestBuilder, size);
            proccessImageRequest(imageRequestBuilder, null);
        }
    }

    public void load(Uri uri, ImageSize thumbnailSize, ImageSize bigSize) {
        if (uri != null) {
            ImageRequestBuilder thumbnailRequestBuilder = ImageRequestBuilder.newBuilderWithSource(uri);
            setSizeToRequest(thumbnailRequestBuilder, thumbnailSize);
            ImageRequestBuilder bigRequestBuilder = ImageRequestBuilder.newBuilderWithSource(uri);
            setSizeToRequest(bigRequestBuilder, bigSize);
            proccessImageRequest(bigRequestBuilder, thumbnailRequestBuilder);
        }
    }

    public void load(Uri thumnailUri, ImageSize thumbnailSize, Uri bigSizeUri, ImageSize bigSize) {
        if (thumnailUri != null && bigSizeUri != null) {
            ImageRequestBuilder thumbnailRequestBuilder = ImageRequestBuilder.newBuilderWithSource(thumnailUri);
            setSizeToRequest(thumbnailRequestBuilder, thumbnailSize);
            ImageRequestBuilder bigRequestBuilder = ImageRequestBuilder.newBuilderWithSource(bigSizeUri);
            setSizeToRequest(bigRequestBuilder, bigSize);
            proccessImageRequest(bigRequestBuilder, thumbnailRequestBuilder);
        }
    }

    protected void proccessImageRequest(ImageRequestBuilder imageRequestBuilder, ImageRequestBuilder lowResImageRequestBuilder) {
        imageRequestBuilder.setRotationOptions(ROTATE_OPTIONS);
        if (lowResImageRequestBuilder != null) {
            lowResImageRequestBuilder.setRotationOptions(ROTATE_OPTIONS);
        }
        if (this.postprocessor != null) {
            imageRequestBuilder.setPostprocessor(this.postprocessor);
            if (lowResImageRequestBuilder != null) {
                lowResImageRequestBuilder.setPostprocessor(this.postprocessor);
            }
        } else if (this.lowResPostPostprocessor != null || this.highResPostPostprocessor != null) {
            if (imageRequestBuilder != null && this.highResPostPostprocessor != null) {
                imageRequestBuilder.setPostprocessor(this.highResPostPostprocessor);
            }
            if (lowResImageRequestBuilder != null && lowResImageRequestBuilder != null) {
                lowResImageRequestBuilder.setPostprocessor(this.lowResPostPostprocessor);
            }
        }
        PipelineDraweeControllerBuilder builder = this.controllerBuilder.reset();
        builder.setImageRequest(imageRequestBuilder.build());
        if (lowResImageRequestBuilder != null) {
            builder.setLowResImageRequest(lowResImageRequestBuilder.build());
            builder.setRetainImageOnFailure(true);
        }
        builder.mo210setOldController(getController());
        builder.mo209setCallerContext((Object) null);
        builder.setControllerListener(new BaseControllerListener<ImageInfo>() { // from class: com.vk.imageloader.view.VKImageView.1
            @Override // com.facebook.drawee.controller.BaseControllerListener, com.facebook.drawee.controller.ControllerListener
            public void onFinalImageSet(String id, ImageInfo imageInfo, Animatable animatable) {
                VKImageView.this.imageWidth = imageInfo.getWidth();
                VKImageView.this.imageHeight = imageInfo.getHeight();
                if (VKImageView.this.onLoadCallback != null) {
                    VKImageView.this.onLoadCallback.onSuccess(VKImageView.this.imageWidth, VKImageView.this.imageHeight);
                }
            }

            @Override // com.facebook.drawee.controller.BaseControllerListener, com.facebook.drawee.controller.ControllerListener
            public void onFailure(String id, Throwable throwable) {
                VKImageView.this.imageWidth = 0;
                VKImageView.this.imageHeight = 0;
                if (VKImageView.this.onLoadCallback != null) {
                    VKImageView.this.onLoadCallback.onFailure();
                }
                if (VKImageView.this.retriesCount < 3) {
                    VKImageView.access$308(VKImageView.this);
                    VKImageView.this.retryImageRequest();
                    return;
                }
                ImageNetworkFailHandler.onNetworkFail(VKImageView.this);
            }
        });
        DraweeController controller = customizeControllerBuilder(builder).mo208build();
        setController(controller);
        this.retriesCount = 0;
    }

    public void retryImageRequest() {
        DraweeController controller = getController();
        if (controller != null && !hasImage()) {
            getHierarchy().reset();
            ReflectionHolder.submitRequest(controller);
        }
    }

    private static void setSizeToRequest(ImageRequestBuilder imageRequestBuilder, ImageSize size) {
        if (imageRequestBuilder != null && size != null) {
            imageRequestBuilder.setResizeOptions(new ResizeOptions(size.getPixelsSize(), size.getPixelsSize()));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class ReflectionHolder {
        public static Method submitRequestMethod;

        private ReflectionHolder() {
        }

        static {
            try {
                submitRequestMethod = AbstractDraweeController.class.getDeclaredMethod("submitRequest", new Class[0]);
                submitRequestMethod.setAccessible(true);
            } catch (NoSuchMethodException e) {
                throw new RuntimeException("Can't find submitRequest method in AbstractDraweeController");
            }
        }

        public static void submitRequest(DraweeController draweeController) {
            try {
                submitRequestMethod.invoke(draweeController, new Object[0]);
            } catch (Exception e) {
                throw new RuntimeException("Can't invoke submitRequest method in AbstractDraweeController");
            }
        }
    }
}
