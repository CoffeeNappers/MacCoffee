package com.vk.attachpicker.util;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.os.Build;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import com.vkontakte.android.R;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
/* loaded from: classes.dex */
public class Utils {
    private static Field positionField;
    private static final ThreadLocal<int[]> tlInt2 = new ThreadLocal<int[]>() { // from class: com.vk.attachpicker.util.Utils.1
        /* JADX INFO: Access modifiers changed from: protected */
        @Override // java.lang.ThreadLocal
        public int[] initialValue() {
            return new int[2];
        }
    };

    public static int interpolateColors(int c0, int c1, float p) {
        int a = interpolate(Color.alpha(c0), Color.alpha(c1), p);
        int r = interpolate(Color.red(c0), Color.red(c1), p);
        int g = interpolate(Color.green(c0), Color.green(c1), p);
        int b = interpolate(Color.blue(c0), Color.blue(c1), p);
        return Color.argb(a, r, g, b);
    }

    public static int interpolate(int src, int dst, float p) {
        return Math.round((dst - src) * p) + src;
    }

    public static int modifyAlpha(int color, int alpha) {
        return (16777215 & color) | (alpha << 24);
    }

    public static int modifyAlpha(int color, float alpha) {
        return modifyAlpha(color, (int) (255.0f * alpha));
    }

    public static int getThemeAccentColor(Context context) {
        TypedValue value = new TypedValue();
        context.getTheme().resolveAttribute(R.attr.colorAccent, value, true);
        return value.data;
    }

    public static int getXOnScreen(View view) {
        int[] coords = tlInt2.get();
        view.getLocationOnScreen(coords);
        return coords[0];
    }

    public static int getYOnScreen(View view) {
        int[] coords = tlInt2.get();
        view.getLocationOnScreen(coords);
        return coords[1];
    }

    public static float clamp(float value, float min, float max) {
        if (value < min) {
            return min;
        }
        return value > max ? max : value;
    }

    public static int clamp(int value, int min, int max) {
        if (value < min) {
            return min;
        }
        return value > max ? max : value;
    }

    @SuppressLint({"NewApi"})
    public static void setStatusBarColor(Window window, int color) {
        if (Build.VERSION.SDK_INT >= 20) {
            try {
                window.addFlags(Integer.MIN_VALUE);
                window.setStatusBarColor(color);
            } catch (Exception e) {
            }
        }
    }

    public static void runOnPreDraw(final View v, final Runnable r) {
        v.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vk.attachpicker.util.Utils.2
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                v.getViewTreeObserver().removeOnPreDrawListener(this);
                r.run();
                return true;
            }
        });
    }

    public static void closeSilently(InputStream is) {
        try {
            is.close();
        } catch (Exception e) {
        }
    }

    public static void closeSilently(OutputStream os) {
        try {
            os.close();
        } catch (Exception e) {
        }
    }

    public static View getPagerActiveView(ViewPager viewPager) {
        PagerAdapter adapter = viewPager.mo1110getAdapter();
        if (adapter == null || adapter.getCount() == 0 || viewPager.getChildCount() == 0) {
            return null;
        }
        if (positionField == null) {
            try {
                positionField = ViewPager.LayoutParams.class.getDeclaredField("position");
                positionField.setAccessible(true);
            } catch (Exception e) {
                throw new RuntimeException("position field not found");
            }
        }
        int currentPosition = viewPager.getCurrentItem();
        for (int i = 0; i < viewPager.getChildCount(); i++) {
            View child = viewPager.getChildAt(i);
            ViewPager.LayoutParams layoutParams = (ViewPager.LayoutParams) child.getLayoutParams();
            if (!layoutParams.isDecor) {
                try {
                    int position = positionField.getInt(layoutParams);
                    if (position == currentPosition) {
                        return child;
                    }
                } catch (Exception e2) {
                }
            }
        }
        return null;
    }
}
