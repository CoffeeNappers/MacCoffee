package uk.co.senab.actionbarpulltorefresh.library.sdk;

import android.view.View;
/* loaded from: classes3.dex */
class CompatBase {
    CompatBase() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setAlpha(View view, float alpha) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void postOnAnimation(View view, Runnable runnable) {
        view.postDelayed(runnable, 10L);
    }
}
