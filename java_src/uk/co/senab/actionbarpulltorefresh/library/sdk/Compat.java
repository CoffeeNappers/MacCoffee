package uk.co.senab.actionbarpulltorefresh.library.sdk;

import android.os.Build;
import android.view.View;
/* loaded from: classes3.dex */
public class Compat {
    public static void setAlpha(View view, float alpha) {
        if (Build.VERSION.SDK_INT >= 11) {
            CompatV11.setAlpha(view, alpha);
        } else {
            CompatBase.setAlpha(view, alpha);
        }
    }

    public static void postOnAnimation(View view, Runnable runnable) {
        if (Build.VERSION.SDK_INT >= 16) {
            CompatV16.postOnAnimation(view, runnable);
        } else if (Build.VERSION.SDK_INT >= 11) {
            CompatV11.postOnAnimation(view, runnable);
        } else {
            CompatBase.postOnAnimation(view, runnable);
        }
    }
}
