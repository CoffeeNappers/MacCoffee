package com.facebook.imagepipeline.common;

import android.graphics.Bitmap;
import javax.annotation.concurrent.Immutable;
@Immutable
/* loaded from: classes.dex */
public class ImageDecodeOptions {
    private static final ImageDecodeOptions DEFAULTS = newBuilder().build();
    public final Bitmap.Config bitmapConfig;
    public final boolean decodeAllFrames;
    public final boolean decodePreviewFrame;
    public final boolean forceStaticImage;
    public final int minDecodeIntervalMs;
    public final boolean useLastFrameForPreview;

    public ImageDecodeOptions(ImageDecodeOptionsBuilder b) {
        this.minDecodeIntervalMs = b.getMinDecodeIntervalMs();
        this.decodePreviewFrame = b.getDecodePreviewFrame();
        this.useLastFrameForPreview = b.getUseLastFrameForPreview();
        this.decodeAllFrames = b.getDecodeAllFrames();
        this.forceStaticImage = b.getForceStaticImage();
        this.bitmapConfig = b.getBitmapConfig();
    }

    public static ImageDecodeOptions defaults() {
        return DEFAULTS;
    }

    public static ImageDecodeOptionsBuilder newBuilder() {
        return new ImageDecodeOptionsBuilder();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ImageDecodeOptions that = (ImageDecodeOptions) o;
        return this.decodePreviewFrame == that.decodePreviewFrame && this.useLastFrameForPreview == that.useLastFrameForPreview && this.decodeAllFrames == that.decodeAllFrames && this.forceStaticImage == that.forceStaticImage && this.bitmapConfig == that.bitmapConfig;
    }

    public int hashCode() {
        int i = 1;
        int result = this.minDecodeIntervalMs;
        int i2 = ((((((result * 31) + (this.decodePreviewFrame ? 1 : 0)) * 31) + (this.useLastFrameForPreview ? 1 : 0)) * 31) + (this.decodeAllFrames ? 1 : 0)) * 31;
        if (!this.forceStaticImage) {
            i = 0;
        }
        int result2 = i2 + i;
        return (result2 * 31) + this.bitmapConfig.ordinal();
    }

    public String toString() {
        return String.format(null, "%d-%b-%b-%b-%b-%s", Integer.valueOf(this.minDecodeIntervalMs), Boolean.valueOf(this.decodePreviewFrame), Boolean.valueOf(this.useLastFrameForPreview), Boolean.valueOf(this.decodeAllFrames), Boolean.valueOf(this.forceStaticImage), this.bitmapConfig.name());
    }
}
