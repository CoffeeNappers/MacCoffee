package com.facebook.imagepipeline.request;

import android.net.Uri;
import com.facebook.common.internal.Objects;
import com.facebook.common.util.UriUtil;
import com.facebook.imagepipeline.common.ImageDecodeOptions;
import com.facebook.imagepipeline.common.Priority;
import com.facebook.imagepipeline.common.ResizeOptions;
import com.facebook.imagepipeline.common.RotationOptions;
import com.facebook.imagepipeline.listener.RequestListener;
import java.io.File;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;
@Immutable
/* loaded from: classes.dex */
public class ImageRequest {
    private final CacheChoice mCacheChoice;
    private final ImageDecodeOptions mImageDecodeOptions;
    private final boolean mIsDiskCacheEnabled;
    private final boolean mLocalThumbnailPreviewsEnabled;
    private final RequestLevel mLowestPermittedRequestLevel;
    @Nullable
    private final MediaVariations mMediaVariations;
    private final Postprocessor mPostprocessor;
    private final boolean mProgressiveRenderingEnabled;
    @Nullable
    private final RequestListener mRequestListener;
    private final Priority mRequestPriority;
    @Nullable
    private final ResizeOptions mResizeOptions;
    private final RotationOptions mRotationOptions;
    private File mSourceFile;
    private final Uri mSourceUri;

    /* loaded from: classes.dex */
    public enum CacheChoice {
        SMALL,
        DEFAULT
    }

    public static ImageRequest fromFile(@Nullable File file) {
        if (file == null) {
            return null;
        }
        return fromUri(UriUtil.getUriForFile(file));
    }

    public static ImageRequest fromUri(@Nullable Uri uri) {
        if (uri == null) {
            return null;
        }
        return ImageRequestBuilder.newBuilderWithSource(uri).build();
    }

    public static ImageRequest fromUri(@Nullable String uriString) {
        if (uriString == null || uriString.length() == 0) {
            return null;
        }
        return fromUri(Uri.parse(uriString));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ImageRequest(ImageRequestBuilder builder) {
        this.mCacheChoice = builder.getCacheChoice();
        this.mSourceUri = builder.getSourceUri();
        this.mMediaVariations = builder.getMediaVariations();
        this.mProgressiveRenderingEnabled = builder.isProgressiveRenderingEnabled();
        this.mLocalThumbnailPreviewsEnabled = builder.isLocalThumbnailPreviewsEnabled();
        this.mImageDecodeOptions = builder.getImageDecodeOptions();
        this.mResizeOptions = builder.getResizeOptions();
        this.mRotationOptions = builder.getRotationOptions() == null ? RotationOptions.autoRotate() : builder.getRotationOptions();
        this.mRequestPriority = builder.getRequestPriority();
        this.mLowestPermittedRequestLevel = builder.getLowestPermittedRequestLevel();
        this.mIsDiskCacheEnabled = builder.isDiskCacheEnabled();
        this.mPostprocessor = builder.getPostprocessor();
        this.mRequestListener = builder.getRequestListener();
    }

    public CacheChoice getCacheChoice() {
        return this.mCacheChoice;
    }

    public Uri getSourceUri() {
        return this.mSourceUri;
    }

    @Nullable
    public MediaVariations getMediaVariations() {
        return this.mMediaVariations;
    }

    public int getPreferredWidth() {
        if (this.mResizeOptions != null) {
            return this.mResizeOptions.width;
        }
        return 2048;
    }

    public int getPreferredHeight() {
        if (this.mResizeOptions != null) {
            return this.mResizeOptions.height;
        }
        return 2048;
    }

    @Nullable
    public ResizeOptions getResizeOptions() {
        return this.mResizeOptions;
    }

    public RotationOptions getRotationOptions() {
        return this.mRotationOptions;
    }

    @Deprecated
    public boolean getAutoRotateEnabled() {
        return this.mRotationOptions.useImageMetadata();
    }

    public ImageDecodeOptions getImageDecodeOptions() {
        return this.mImageDecodeOptions;
    }

    public boolean getProgressiveRenderingEnabled() {
        return this.mProgressiveRenderingEnabled;
    }

    public boolean getLocalThumbnailPreviewsEnabled() {
        return this.mLocalThumbnailPreviewsEnabled;
    }

    public Priority getPriority() {
        return this.mRequestPriority;
    }

    public RequestLevel getLowestPermittedRequestLevel() {
        return this.mLowestPermittedRequestLevel;
    }

    public boolean isDiskCacheEnabled() {
        return this.mIsDiskCacheEnabled;
    }

    public synchronized File getSourceFile() {
        if (this.mSourceFile == null) {
            this.mSourceFile = new File(this.mSourceUri.getPath());
        }
        return this.mSourceFile;
    }

    @Nullable
    public Postprocessor getPostprocessor() {
        return this.mPostprocessor;
    }

    @Nullable
    public RequestListener getRequestListener() {
        return this.mRequestListener;
    }

    public boolean equals(Object o) {
        if (!(o instanceof ImageRequest)) {
            return false;
        }
        ImageRequest request = (ImageRequest) o;
        return Objects.equal(this.mSourceUri, request.mSourceUri) && Objects.equal(this.mCacheChoice, request.mCacheChoice) && Objects.equal(this.mMediaVariations, request.mMediaVariations) && Objects.equal(this.mSourceFile, request.mSourceFile);
    }

    public int hashCode() {
        return Objects.hashCode(this.mCacheChoice, this.mSourceUri, this.mMediaVariations, this.mSourceFile);
    }

    public String toString() {
        return Objects.toStringHelper(this).add("uri", this.mSourceUri).add("cacheChoice", this.mCacheChoice).add("decodeOptions", this.mImageDecodeOptions).add("postprocessor", this.mPostprocessor).add("priority", this.mRequestPriority).add("resizeOptions", this.mResizeOptions).add("rotationOptions", this.mRotationOptions).add("mediaVariations", this.mMediaVariations).toString();
    }

    /* loaded from: classes.dex */
    public enum RequestLevel {
        FULL_FETCH(1),
        DISK_CACHE(2),
        ENCODED_MEMORY_CACHE(3),
        BITMAP_MEMORY_CACHE(4);
        
        private int mValue;

        RequestLevel(int value) {
            this.mValue = value;
        }

        public int getValue() {
            return this.mValue;
        }

        public static RequestLevel getMax(RequestLevel requestLevel1, RequestLevel requestLevel2) {
            return requestLevel1.getValue() > requestLevel2.getValue() ? requestLevel1 : requestLevel2;
        }
    }
}
