package com.facebook.imagepipeline.common;

import com.facebook.common.util.HashCodeUtil;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
/* loaded from: classes.dex */
public class RotationOptions {
    private static final int DISABLE_ROTATION = -2;
    public static final int NO_ROTATION = 0;
    public static final int ROTATE_180 = 180;
    public static final int ROTATE_270 = 270;
    public static final int ROTATE_90 = 90;
    private static final RotationOptions ROTATION_OPTIONS_AUTO_ROTATE = new RotationOptions(-1, false);
    private static final RotationOptions ROTATION_OPTIONS_DISABLE_ROTATION = new RotationOptions(-2, false);
    private static final RotationOptions ROTATION_OPTIONS_ROTATE_AT_RENDER_TIME = new RotationOptions(-1, true);
    private static final int USE_EXIF_ROTATION_ANGLE = -1;
    private final boolean mDeferUntilRendered;
    private final int mRotation;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface RotationAngle {
    }

    public static RotationOptions autoRotate() {
        return ROTATION_OPTIONS_AUTO_ROTATE;
    }

    public static RotationOptions disableRotation() {
        return ROTATION_OPTIONS_DISABLE_ROTATION;
    }

    public static RotationOptions autoRotateAtRenderTime() {
        return ROTATION_OPTIONS_ROTATE_AT_RENDER_TIME;
    }

    public static RotationOptions forceRotation(int angle) {
        return new RotationOptions(angle, false);
    }

    private RotationOptions(int rotation, boolean canDeferUntilRendered) {
        this.mRotation = rotation;
        this.mDeferUntilRendered = canDeferUntilRendered;
    }

    public boolean useImageMetadata() {
        return this.mRotation == -1;
    }

    public boolean rotationEnabled() {
        return this.mRotation != -2;
    }

    public int getForcedAngle() {
        if (useImageMetadata()) {
            throw new IllegalStateException("Rotation is set to use EXIF");
        }
        return this.mRotation;
    }

    public boolean canDeferUntilRendered() {
        return this.mDeferUntilRendered;
    }

    public int hashCode() {
        return HashCodeUtil.hashCode(Integer.valueOf(this.mRotation), Boolean.valueOf(this.mDeferUntilRendered));
    }

    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof RotationOptions)) {
            return false;
        }
        RotationOptions that = (RotationOptions) other;
        return this.mRotation == that.mRotation && this.mDeferUntilRendered == that.mDeferUntilRendered;
    }

    public String toString() {
        return String.format(null, "%d defer:%b", Integer.valueOf(this.mRotation), Boolean.valueOf(this.mDeferUntilRendered));
    }
}
