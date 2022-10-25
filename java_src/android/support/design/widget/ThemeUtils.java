package android.support.design.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v7.appcompat.R;
/* loaded from: classes.dex */
class ThemeUtils {
    private static final int[] APPCOMPAT_CHECK_ATTRS = {R.attr.colorPrimary};

    ThemeUtils() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void checkAppCompatTheme(Context context) {
        boolean failed = false;
        TypedArray a = context.obtainStyledAttributes(APPCOMPAT_CHECK_ATTRS);
        if (!a.hasValue(0)) {
            failed = true;
        }
        a.recycle();
        if (failed) {
            throw new IllegalArgumentException("You need to use a Theme.AppCompat theme (or descendant) with the design library.");
        }
    }
}
