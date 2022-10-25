package me.zhanghai.android.materialprogressbar.internal;

import android.animation.ObjectAnimator;
import android.graphics.Path;
import android.os.Build;
import android.util.Property;
/* loaded from: classes3.dex */
public class ObjectAnimatorCompat {
    private ObjectAnimatorCompat() {
    }

    public static ObjectAnimator ofArgb(Object target, String propertyName, int... values) {
        return Build.VERSION.SDK_INT >= 21 ? ObjectAnimatorCompatLollipop.ofArgb(target, propertyName, values) : ObjectAnimatorCompatBase.ofArgb(target, propertyName, values);
    }

    public static <T> ObjectAnimator ofArgb(T target, Property<T, Integer> property, int... values) {
        return Build.VERSION.SDK_INT >= 21 ? ObjectAnimatorCompatLollipop.ofArgb(target, property, values) : ObjectAnimatorCompatBase.ofArgb(target, property, values);
    }

    public static ObjectAnimator ofFloat(Object target, String xPropertyName, String yPropertyName, Path path) {
        return Build.VERSION.SDK_INT >= 21 ? ObjectAnimatorCompatLollipop.ofFloat(target, xPropertyName, yPropertyName, path) : ObjectAnimatorCompatBase.ofFloat(target, xPropertyName, yPropertyName, path);
    }

    public static <T> ObjectAnimator ofFloat(T target, Property<T, Float> xProperty, Property<T, Float> yProperty, Path path) {
        return Build.VERSION.SDK_INT >= 21 ? ObjectAnimatorCompatLollipop.ofFloat(target, xProperty, yProperty, path) : ObjectAnimatorCompatBase.ofFloat(target, xProperty, yProperty, path);
    }

    public static ObjectAnimator ofInt(Object target, String xPropertyName, String yPropertyName, Path path) {
        return Build.VERSION.SDK_INT >= 21 ? ObjectAnimatorCompatLollipop.ofInt(target, xPropertyName, yPropertyName, path) : ObjectAnimatorCompatBase.ofInt(target, xPropertyName, yPropertyName, path);
    }

    public static <T> ObjectAnimator ofInt(T target, Property<T, Integer> xProperty, Property<T, Integer> yProperty, Path path) {
        return Build.VERSION.SDK_INT >= 21 ? ObjectAnimatorCompatLollipop.ofInt(target, xProperty, yProperty, path) : ObjectAnimatorCompatBase.ofInt(target, xProperty, yProperty, path);
    }
}
