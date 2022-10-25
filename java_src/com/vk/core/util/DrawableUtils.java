package com.vk.core.util;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.widget.TextView;
/* loaded from: classes2.dex */
public final class DrawableUtils {
    public static void setLeft(@NonNull TextView view, @Nullable Drawable drawable, @Nullable ColorStateList tintList) {
        if (drawable != null) {
            if (tintList != null) {
                drawable = tint(drawable, tintList);
            }
            view.setCompoundDrawablesWithIntrinsicBounds(drawable, (Drawable) null, (Drawable) null, (Drawable) null);
            return;
        }
        view.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, (Drawable) null, (Drawable) null);
    }

    public static void setLeft(@NonNull TextView view, @Nullable Drawable drawable) {
        setLeft(view, drawable, (ColorStateList) null);
    }

    public static void setLeft(@NonNull TextView view, @DrawableRes int drawableRes, @ColorRes int colorRes) {
        if (drawableRes == 0) {
            setLeft(view, (Drawable) null);
        } else if (colorRes == 0) {
            setLeft(view, ContextCompat.getDrawable(view.getContext(), drawableRes));
        } else {
            Context context = view.getContext();
            setLeft(view, ContextCompat.getDrawable(context, drawableRes), ContextCompat.getColorStateList(context, colorRes));
        }
    }

    public static void setLeft(@NonNull TextView view, @DrawableRes int drawableRes) {
        setLeft(view, drawableRes, 0);
    }

    public static void setRight(@NonNull TextView view, @Nullable Drawable drawable, @Nullable ColorStateList tintList) {
        if (drawable != null) {
            if (tintList != null) {
                drawable = tint(drawable, tintList);
            }
            view.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, drawable, (Drawable) null);
            return;
        }
        view.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, (Drawable) null, (Drawable) null, (Drawable) null);
    }

    public static void setRight(@NonNull TextView view, @Nullable Drawable drawable) {
        setRight(view, drawable, (ColorStateList) null);
    }

    public static void setRight(@NonNull TextView view, @DrawableRes int drawableRes, @ColorRes int colorRes) {
        if (drawableRes == 0) {
            setRight(view, (Drawable) null);
        } else if (colorRes == 0) {
            setRight(view, ContextCompat.getDrawable(view.getContext(), drawableRes));
        } else {
            Context context = view.getContext();
            setRight(view, ContextCompat.getDrawable(context, drawableRes), ContextCompat.getColorStateList(context, colorRes));
        }
    }

    public static void setRight(@NonNull TextView view, @DrawableRes int drawableRes) {
        setRight(view, drawableRes, 0);
    }

    @NonNull
    public static Drawable tint(@NonNull Drawable drawable, @NonNull ColorStateList tintList) {
        Drawable drawable2 = DrawableCompat.wrap(drawable.mutate());
        DrawableCompat.setTintList(drawable2, tintList);
        return drawable2;
    }

    @NonNull
    public static Drawable tint(@NonNull Context context, @DrawableRes int drawableRes, @ColorRes int colorRes) {
        return tint(ContextCompat.getDrawable(context, drawableRes), ContextCompat.getColorStateList(context, colorRes));
    }

    private DrawableUtils() {
    }
}
