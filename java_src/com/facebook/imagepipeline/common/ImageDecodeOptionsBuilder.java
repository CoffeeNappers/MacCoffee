package com.facebook.imagepipeline.common;

import android.graphics.Bitmap;
/* loaded from: classes.dex */
public class ImageDecodeOptionsBuilder {
    private boolean mDecodeAllFrames;
    private boolean mDecodePreviewFrame;
    private boolean mForceStaticImage;
    private boolean mUseLastFrameForPreview;
    private int mMinDecodeIntervalMs = 100;
    private Bitmap.Config mBitmapConfig = Bitmap.Config.ARGB_8888;

    public ImageDecodeOptionsBuilder setFrom(ImageDecodeOptions options) {
        this.mDecodePreviewFrame = options.decodePreviewFrame;
        this.mUseLastFrameForPreview = options.useLastFrameForPreview;
        this.mDecodeAllFrames = options.decodeAllFrames;
        this.mForceStaticImage = options.forceStaticImage;
        this.mBitmapConfig = options.bitmapConfig;
        return this;
    }

    public ImageDecodeOptionsBuilder setMinDecodeIntervalMs(int intervalMs) {
        this.mMinDecodeIntervalMs = intervalMs;
        return this;
    }

    public int getMinDecodeIntervalMs() {
        return this.mMinDecodeIntervalMs;
    }

    public ImageDecodeOptionsBuilder setDecodePreviewFrame(boolean decodePreviewFrame) {
        this.mDecodePreviewFrame = decodePreviewFrame;
        return this;
    }

    public boolean getDecodePreviewFrame() {
        return this.mDecodePreviewFrame;
    }

    public boolean getUseLastFrameForPreview() {
        return this.mUseLastFrameForPreview;
    }

    public ImageDecodeOptionsBuilder setUseLastFrameForPreview(boolean useLastFrameForPreview) {
        this.mUseLastFrameForPreview = useLastFrameForPreview;
        return this;
    }

    public boolean getDecodeAllFrames() {
        return this.mDecodeAllFrames;
    }

    public ImageDecodeOptionsBuilder setDecodeAllFrames(boolean decodeAllFrames) {
        this.mDecodeAllFrames = decodeAllFrames;
        return this;
    }

    public ImageDecodeOptionsBuilder setForceStaticImage(boolean forceStaticImage) {
        this.mForceStaticImage = forceStaticImage;
        return this;
    }

    public boolean getForceStaticImage() {
        return this.mForceStaticImage;
    }

    public Bitmap.Config getBitmapConfig() {
        return this.mBitmapConfig;
    }

    public void setBitmapConfig(Bitmap.Config bitmapConfig) {
        this.mBitmapConfig = bitmapConfig;
    }

    public ImageDecodeOptions build() {
        return new ImageDecodeOptions(this);
    }
}
