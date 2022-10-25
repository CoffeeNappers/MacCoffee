package com.vk.core.util;

import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DimenRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.StringRes;
import android.support.v4.content.ContextCompat;
import com.vkontakte.android.VKApplication;
/* loaded from: classes2.dex */
public final class ResUtils {
    private ResUtils() {
    }

    @NonNull
    public static String str(@StringRes int id) {
        return VKApplication.context.getResources().getString(id);
    }

    @NonNull
    public static String str(@StringRes int id, Object... formatArgs) {
        return VKApplication.context.getResources().getString(id, formatArgs);
    }

    public static float dimF(@DimenRes int id) {
        return VKApplication.context.getResources().getDimension(id);
    }

    public static int dim(@DimenRes int id) {
        return VKApplication.context.getResources().getDimensionPixelSize(id);
    }

    @ColorInt
    public static int color(@ColorRes int id) {
        return ContextCompat.getColor(VKApplication.context, id);
    }

    @NonNull
    public static ColorStateList colorList(@ColorRes int id) {
        return ContextCompat.getColorStateList(VKApplication.context, id);
    }

    @NonNull
    public static Drawable drawable(@DrawableRes int id) {
        return ContextCompat.getDrawable(VKApplication.context, id);
    }
}
