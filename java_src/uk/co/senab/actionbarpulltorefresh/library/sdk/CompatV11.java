package uk.co.senab.actionbarpulltorefresh.library.sdk;

import android.animation.ValueAnimator;
import android.view.View;
/* loaded from: classes3.dex */
class CompatV11 {
    CompatV11() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setAlpha(View view, float alpha) {
        view.setAlpha(alpha);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void postOnAnimation(View view, Runnable runnable) {
        view.postDelayed(runnable, ValueAnimator.getFrameDelay());
    }
}
