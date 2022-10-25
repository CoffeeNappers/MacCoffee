package com.my.target.core.utils;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.util.StateSet;
import android.util.TypedValue;
import android.view.View;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
/* compiled from: UIutils.java */
/* loaded from: classes2.dex */
public final class l {
    private static final AtomicInteger b = new AtomicInteger(1);
    private final Context a;

    public l(Context context) {
        this.a = context;
    }

    public final int a(int i) {
        return (int) TypedValue.applyDimension(1, i, this.a.getResources().getDisplayMetrics());
    }

    public final int b(int i) {
        return (int) TypedValue.applyDimension(2, i, this.a.getResources().getDisplayMetrics());
    }

    public static boolean c(int i) {
        return Build.VERSION.SDK_INT >= i;
    }

    private static int e(int i) {
        Color.colorToHSV(i, r0);
        float[] fArr = {0.0f, 0.0f, fArr[2] * 0.7f};
        return Color.HSVToColor(fArr);
    }

    public static int d(int i) {
        float[] fArr = new float[3];
        Color.colorToHSV(i, fArr);
        return Color.HSVToColor(128, fArr);
    }

    public static void a(View view, int i, int i2) {
        ColorDrawable colorDrawable = new ColorDrawable(i);
        ColorDrawable colorDrawable2 = new ColorDrawable(i2);
        StateListDrawable stateListDrawable = new StateListDrawable();
        stateListDrawable.addState(new int[]{16842919}, colorDrawable2);
        stateListDrawable.addState(StateSet.WILD_CARD, colorDrawable);
        if (c(21)) {
            view.setBackground(new RippleDrawable(new ColorStateList(new int[][]{new int[]{16842919}, StateSet.WILD_CARD}, new int[]{e(i2), e(i)}), stateListDrawable, null));
        } else if (!c(18)) {
            view.setBackgroundDrawable(stateListDrawable);
        } else {
            view.setBackground(stateListDrawable);
        }
    }

    public static void a(View view, int i, int i2, int i3) {
        a(view, i, i2, 0, 0, i3);
    }

    public static void a(View view, int i, int i2, int i3, int i4, int i5) {
        GradientDrawable gradientDrawable = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{i, i});
        gradientDrawable.setCornerRadius(i5);
        GradientDrawable gradientDrawable2 = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{i2, i2});
        gradientDrawable2.setCornerRadius(i5);
        if (i3 != 0) {
            gradientDrawable.setStroke(i4, i3);
            gradientDrawable2.setStroke(i4, i3);
        }
        StateListDrawable stateListDrawable = new StateListDrawable();
        stateListDrawable.addState(new int[]{16842919}, gradientDrawable2);
        stateListDrawable.addState(StateSet.WILD_CARD, gradientDrawable);
        if (c(21)) {
            view.setBackground(new RippleDrawable(new ColorStateList(new int[][]{new int[]{16842919}, StateSet.WILD_CARD}, new int[]{e(i2), e(i)}), stateListDrawable, null));
        } else if (!c(16)) {
            view.setBackgroundDrawable(stateListDrawable);
        } else {
            view.setBackground(stateListDrawable);
        }
    }

    public static int a() {
        int i;
        int i2;
        if (Build.VERSION.SDK_INT < 17) {
            do {
                i = b.get();
                i2 = i + 1;
                if (i2 > 16777215) {
                    i2 = 1;
                }
            } while (!b.compareAndSet(i, i2));
            return i;
        }
        return View.generateViewId();
    }

    @SuppressLint({"DefaultLocale"})
    public static String a(float f) {
        return String.format("%d:%02d", Long.valueOf(TimeUnit.MILLISECONDS.toMinutes(f * 1000.0f)), Long.valueOf(TimeUnit.MILLISECONDS.toSeconds(f * 1000.0f) - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(1000.0f * f))));
    }
}
