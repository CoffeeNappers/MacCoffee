package com.vk.core.util;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DimenRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.IntegerRes;
import android.support.annotation.NonNull;
import android.support.annotation.PluralsRes;
import android.support.annotation.StringRes;
import android.support.v4.content.ContextCompat;
import android.view.View;
import com.vkontakte.android.VKApplication;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
/* loaded from: classes2.dex */
public final class Resourcer {
    private final Context context;
    private final Resources res;
    private static volatile WeakReference<Resourcer> instance = new WeakReference<>(null);
    private static Map<Context, Resourcer> cache = new WeakHashMap();

    @NonNull
    public static Resourcer of(@NonNull Context context) {
        Resourcer resourcer = cache.get(context);
        if (resourcer == null) {
            Resourcer resourcer2 = new Resourcer(context);
            cache.put(context, resourcer2);
            return resourcer2;
        }
        return resourcer;
    }

    @NonNull
    public static Resourcer from(@NonNull View view) {
        return of(view.getContext());
    }

    @NonNull
    public static Resourcer get() {
        Resourcer r = instance.get();
        if (r == null) {
            synchronized (Resourcer.class) {
                r = instance.get();
                if (r == null) {
                    r = of(VKApplication.context);
                    instance = new WeakReference<>(r);
                }
            }
        }
        return r;
    }

    private Resourcer(@NonNull Context context) {
        this.context = context;
        this.res = context.getResources();
    }

    @NonNull
    public String str(@StringRes int id) {
        return this.res.getString(id);
    }

    @NonNull
    public String str(@StringRes int id, Object... formatArgs) {
        return this.res.getString(id, formatArgs);
    }

    @NonNull
    public String plural(@PluralsRes int id, int quantity) {
        return this.res.getQuantityString(id, quantity);
    }

    @NonNull
    public String pluralArg(@PluralsRes int id, int quantity) {
        return this.res.getQuantityString(id, quantity, Integer.valueOf(quantity));
    }

    @NonNull
    public String pluralArg(@PluralsRes int id, int quantity, Object... formatArgs) {
        return this.res.getQuantityString(id, quantity, formatArgs);
    }

    public float dimF(@DimenRes int id) {
        return this.res.getDimension(id);
    }

    public int dim(@DimenRes int id) {
        return this.res.getDimensionPixelSize(id);
    }

    @ColorInt
    public int color(@ColorRes int id) {
        return ContextCompat.getColor(this.context, id);
    }

    @NonNull
    public ColorStateList colorList(@ColorRes int id) {
        return ContextCompat.getColorStateList(this.context, id);
    }

    @NonNull
    public Drawable drawable(@DrawableRes int id) {
        return ContextCompat.getDrawable(this.context, id);
    }

    public int integer(@IntegerRes int id) {
        return this.res.getInteger(id);
    }
}
