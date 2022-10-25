package net.hockeyapp.android.utils;

import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.support.v4.view.ViewCompat;
/* loaded from: classes3.dex */
public class ViewHelper {
    public static Drawable getGradient() {
        int[] colors = {ViewCompat.MEASURED_STATE_MASK, 0};
        GradientDrawable gradient = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, colors);
        return gradient;
    }
}
