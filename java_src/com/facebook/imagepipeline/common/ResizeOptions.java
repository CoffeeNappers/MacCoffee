package com.facebook.imagepipeline.common;

import com.facebook.common.internal.Preconditions;
import com.facebook.common.util.HashCodeUtil;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class ResizeOptions {
    public static final float DEFAULT_ROUNDUP_FRACTION = 0.6666667f;
    public final int height;
    public final float maxBitmapSize;
    public final float roundUpFraction;
    public final int width;

    @Nullable
    public static ResizeOptions forDimensions(int width, int height) {
        if (width <= 0 || height <= 0) {
            return null;
        }
        return new ResizeOptions(width, height);
    }

    @Nullable
    public static ResizeOptions forSquareSize(int size) {
        if (size <= 0) {
            return null;
        }
        return new ResizeOptions(size, size);
    }

    public ResizeOptions(int width, int height) {
        this(width, height, 2048.0f);
    }

    public ResizeOptions(int width, int height, float maxBitmapSize) {
        this(width, height, maxBitmapSize, 0.6666667f);
    }

    public ResizeOptions(int width, int height, float maxBitmapSize, float roundUpFraction) {
        boolean z = true;
        Preconditions.checkArgument(width > 0);
        Preconditions.checkArgument(height <= 0 ? false : z);
        this.width = width;
        this.height = height;
        this.maxBitmapSize = maxBitmapSize;
        this.roundUpFraction = roundUpFraction;
    }

    public int hashCode() {
        return HashCodeUtil.hashCode(this.width, this.height);
    }

    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ResizeOptions)) {
            return false;
        }
        ResizeOptions that = (ResizeOptions) other;
        return this.width == that.width && this.height == that.height;
    }

    public String toString() {
        return String.format(null, "%dx%d", Integer.valueOf(this.width), Integer.valueOf(this.height));
    }
}
