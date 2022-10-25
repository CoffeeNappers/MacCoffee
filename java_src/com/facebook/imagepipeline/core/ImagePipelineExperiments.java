package com.facebook.imagepipeline.core;

import com.facebook.common.internal.Supplier;
import com.facebook.common.webp.WebpBitmapFactory;
import com.facebook.imagepipeline.core.ImagePipelineConfig;
/* loaded from: classes.dex */
public class ImagePipelineExperiments {
    private final boolean mDecodeCancellationEnabled;
    private final boolean mExternalCreatedBitmapLogEnabled;
    private final int mForceSmallCacheThresholdBytes;
    private final Supplier<Boolean> mMediaVariationsIndexEnabled;
    private final boolean mSuppressBitmapPrefetching;
    private final boolean mUseDownsamplingRatioForResizing;
    private final WebpBitmapFactory mWebpBitmapFactory;
    private final WebpBitmapFactory.WebpErrorLogger mWebpErrorLogger;
    private final boolean mWebpSupportEnabled;

    private ImagePipelineExperiments(Builder builder, ImagePipelineConfig.Builder configBuilder) {
        this.mForceSmallCacheThresholdBytes = builder.mForceSmallCacheThresholdBytes;
        this.mWebpSupportEnabled = builder.mWebpSupportEnabled;
        this.mExternalCreatedBitmapLogEnabled = builder.mExternalCreatedBitmapLogEnabled;
        if (builder.mMediaVariationsIndexEnabled == null) {
            this.mMediaVariationsIndexEnabled = new Supplier<Boolean>() { // from class: com.facebook.imagepipeline.core.ImagePipelineExperiments.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.facebook.common.internal.Supplier
                /* renamed from: get */
                public Boolean mo486get() {
                    return Boolean.FALSE;
                }
            };
        } else {
            this.mMediaVariationsIndexEnabled = builder.mMediaVariationsIndexEnabled;
        }
        this.mWebpErrorLogger = builder.mWebpErrorLogger;
        this.mDecodeCancellationEnabled = builder.mDecodeCancellationEnabled;
        this.mWebpBitmapFactory = builder.mWebpBitmapFactory;
        this.mSuppressBitmapPrefetching = builder.mSuppressBitmapPrefetching;
        this.mUseDownsamplingRatioForResizing = builder.mUseDownsamplingRatioForResizing;
    }

    public boolean isExternalCreatedBitmapLogEnabled() {
        return this.mExternalCreatedBitmapLogEnabled;
    }

    public int getForceSmallCacheThresholdBytes() {
        return this.mForceSmallCacheThresholdBytes;
    }

    public boolean getMediaVariationsIndexEnabled() {
        return this.mMediaVariationsIndexEnabled.mo486get().booleanValue();
    }

    public boolean getUseDownsamplingRatioForResizing() {
        return this.mUseDownsamplingRatioForResizing;
    }

    public boolean isWebpSupportEnabled() {
        return this.mWebpSupportEnabled;
    }

    public boolean isDecodeCancellationEnabled() {
        return this.mDecodeCancellationEnabled;
    }

    public WebpBitmapFactory.WebpErrorLogger getWebpErrorLogger() {
        return this.mWebpErrorLogger;
    }

    public WebpBitmapFactory getWebpBitmapFactory() {
        return this.mWebpBitmapFactory;
    }

    public static Builder newBuilder(ImagePipelineConfig.Builder configBuilder) {
        return new Builder(configBuilder);
    }

    /* loaded from: classes.dex */
    public static class Builder {
        private final ImagePipelineConfig.Builder mConfigBuilder;
        private WebpBitmapFactory mWebpBitmapFactory;
        private WebpBitmapFactory.WebpErrorLogger mWebpErrorLogger;
        private int mForceSmallCacheThresholdBytes = 0;
        private boolean mWebpSupportEnabled = false;
        private boolean mExternalCreatedBitmapLogEnabled = false;
        private Supplier<Boolean> mMediaVariationsIndexEnabled = null;
        private boolean mDecodeCancellationEnabled = false;
        private boolean mSuppressBitmapPrefetching = false;
        private boolean mUseDownsamplingRatioForResizing = false;

        public Builder(ImagePipelineConfig.Builder configBuilder) {
            this.mConfigBuilder = configBuilder;
        }

        public ImagePipelineConfig.Builder setExternalCreatedBitmapLogEnabled(boolean externalCreatedBitmapLogEnabled) {
            this.mExternalCreatedBitmapLogEnabled = externalCreatedBitmapLogEnabled;
            return this.mConfigBuilder;
        }

        public ImagePipelineConfig.Builder setForceSmallCacheThresholdBytes(int forceSmallCacheThresholdBytes) {
            this.mForceSmallCacheThresholdBytes = forceSmallCacheThresholdBytes;
            return this.mConfigBuilder;
        }

        public ImagePipelineConfig.Builder setMediaVariationsIndexEnabled(Supplier<Boolean> mediaVariationsIndexEnabled) {
            this.mMediaVariationsIndexEnabled = mediaVariationsIndexEnabled;
            return this.mConfigBuilder;
        }

        public ImagePipelineConfig.Builder setWebpSupportEnabled(boolean webpSupportEnabled) {
            this.mWebpSupportEnabled = webpSupportEnabled;
            return this.mConfigBuilder;
        }

        public ImagePipelineConfig.Builder setUseDownsampligRatioForResizing(boolean useDownsamplingRatioForResizing) {
            this.mUseDownsamplingRatioForResizing = useDownsamplingRatioForResizing;
            return this.mConfigBuilder;
        }

        public ImagePipelineConfig.Builder setDecodeCancellationEnabled(boolean decodeCancellationEnabled) {
            this.mDecodeCancellationEnabled = decodeCancellationEnabled;
            return this.mConfigBuilder;
        }

        public ImagePipelineConfig.Builder setWebpErrorLogger(WebpBitmapFactory.WebpErrorLogger webpErrorLogger) {
            this.mWebpErrorLogger = webpErrorLogger;
            return this.mConfigBuilder;
        }

        public ImagePipelineConfig.Builder setWebpBitmapFactory(WebpBitmapFactory webpBitmapFactory) {
            this.mWebpBitmapFactory = webpBitmapFactory;
            return this.mConfigBuilder;
        }

        public ImagePipelineConfig.Builder setSuppressBitmapPrefetching(boolean suppressBitmapPrefetching) {
            this.mSuppressBitmapPrefetching = suppressBitmapPrefetching;
            return this.mConfigBuilder;
        }

        public ImagePipelineExperiments build() {
            return new ImagePipelineExperiments(this, this.mConfigBuilder);
        }
    }
}
