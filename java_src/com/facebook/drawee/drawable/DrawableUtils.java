package com.facebook.drawee.drawable;

import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class DrawableUtils {
    @Nullable
    public static Drawable cloneDrawable(Drawable drawable) {
        if (drawable instanceof CloneableDrawable) {
            return ((CloneableDrawable) drawable).mo212cloneDrawable();
        }
        Drawable.ConstantState constantState = drawable.getConstantState();
        if (constantState == null) {
            return null;
        }
        return constantState.newDrawable();
    }

    public static void copyProperties(Drawable to, Drawable from) {
        if (from != null && to != null && to != from) {
            to.setBounds(from.getBounds());
            to.setChangingConfigurations(from.getChangingConfigurations());
            to.setLevel(from.getLevel());
            to.setVisible(from.isVisible(), false);
            to.setState(from.getState());
        }
    }

    public static void setDrawableProperties(Drawable drawable, DrawableProperties properties) {
        if (drawable != null && properties != null) {
            properties.applyTo(drawable);
        }
    }

    public static void setCallbacks(Drawable drawable, @Nullable Drawable.Callback callback, @Nullable TransformCallback transformCallback) {
        if (drawable != null) {
            drawable.setCallback(callback);
            if (drawable instanceof TransformAwareDrawable) {
                ((TransformAwareDrawable) drawable).setTransformCallback(transformCallback);
            }
        }
    }

    public static int multiplyColorAlpha(int color, int alpha) {
        if (alpha != 255) {
            if (alpha == 0) {
                return color & ViewCompat.MEASURED_SIZE_MASK;
            }
            int colorAlpha = color >>> 24;
            int multipliedAlpha = (colorAlpha * (alpha + (alpha >> 7))) >> 8;
            return (multipliedAlpha << 24) | (16777215 & color);
        }
        return color;
    }

    public static int getOpacityFromColor(int color) {
        int colorAlpha = color >>> 24;
        if (colorAlpha == 255) {
            return -1;
        }
        if (colorAlpha == 0) {
            return -2;
        }
        return -3;
    }
}
