package com.vk.core.util;

import android.content.Context;
import android.content.res.Resources;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import com.vk.core.R;
/* loaded from: classes.dex */
public class Screen {
    @Deprecated
    private static Boolean isTablet = null;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum ScreenSize {
        normal,
        large,
        xlarge
    }

    /* loaded from: classes2.dex */
    public interface ViewCallback {
        void view(View view);
    }

    @Deprecated
    public static boolean isTablet() {
        if (isTablet == null) {
            isTablet = Boolean.valueOf(getScreenSize(AppContextHolder.context).ordinal() > ScreenSize.normal.ordinal());
        }
        return isTablet.booleanValue();
    }

    public static boolean isTablet(@NonNull Context ctx) {
        return getScreenSize(ctx).ordinal() > ScreenSize.normal.ordinal();
    }

    @NonNull
    private static ScreenSize getScreenSize(@NonNull Context ctx) {
        ScreenSize[] values;
        String value = ctx.getResources().getString(R.string.screen_size);
        for (ScreenSize type : ScreenSize.values()) {
            if (TextUtils.equals(value, type.name())) {
                return type;
            }
        }
        return ScreenSize.normal;
    }

    public static int dp(int dp) {
        return dp(dp);
    }

    public static int dp(float dp) {
        float scale = getDisplayMetrics().density;
        return (int) ((dp * scale) + 0.5f);
    }

    public static float density() {
        return getDisplayMetrics().density;
    }

    public static int sp(int sp) {
        return sp(sp);
    }

    public static int sp(float sp) {
        float scale = getDisplayMetrics().scaledDensity;
        return (int) ((sp * scale) + 0.5f);
    }

    public static DisplayMetrics getDisplayMetrics() {
        return Resources.getSystem().getDisplayMetrics();
    }

    public static int realWidth() {
        return Math.min(getDisplayMetrics().widthPixels, getDisplayMetrics().heightPixels);
    }

    public static int realHeight() {
        return Math.max(getDisplayMetrics().widthPixels, getDisplayMetrics().heightPixels);
    }

    public static int width() {
        return getDisplayMetrics().widthPixels;
    }

    public static int height() {
        return getDisplayMetrics().heightPixels;
    }

    public static void iterateOverViews(ViewGroup viewGroup, ViewCallback callback) {
        for (int i = 0; i < viewGroup.getChildCount(); i++) {
            View v = viewGroup.getChildAt(i);
            callback.view(v);
            if (v instanceof ViewGroup) {
                iterateOverViews((ViewGroup) v, callback);
            }
        }
    }
}
