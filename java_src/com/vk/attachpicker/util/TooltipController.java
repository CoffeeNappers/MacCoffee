package com.vk.attachpicker.util;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
/* loaded from: classes2.dex */
public class TooltipController {
    public static final String KEY_FILTERS_TOOLTIP = "filters_tooltip";
    public static final String KEY_FONT_TOOLTIP = "font_tooltip";
    public static final String KEY_STICKER_TOOLTIP = "sticker_tooltip";
    public static final String KEY_TEXT_TOOLTIP = "text_tooltip";
    private View tooltipView;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Runnable showTooltip = TooltipController$$Lambda$1.lambdaFactory$(this);
    private final Runnable hideTooltip = TooltipController$$Lambda$2.lambdaFactory$(this);

    public static boolean shouldShowTooltip(String key) {
        boolean contains = Prefs.pickerPrefs().getBoolean(key, false);
        if (contains) {
            return false;
        }
        Prefs.pickerPrefs().edit().putBoolean(key, true).commit();
        return true;
    }

    public TooltipController(View tooltipView) {
        this.tooltipView = tooltipView;
        this.tooltipView.setVisibility(8);
        this.tooltipView.setAlpha(0.0f);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0() {
        this.tooltipView.setVisibility(0);
        this.tooltipView.animate().alpha(1.0f).setListener(null).start();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1() {
        this.tooltipView.animate().alpha(0.0f).setListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.util.TooltipController.1
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                TooltipController.this.tooltipView.setVisibility(8);
            }
        }).start();
    }

    public void cancel() {
        this.handler.removeCallbacks(this.showTooltip);
        this.handler.removeCallbacks(this.hideTooltip);
    }

    public void showTooltip(long delay) {
        cancel();
        this.handler.postDelayed(this.showTooltip, delay);
    }

    public void hideTooltip(long delay) {
        cancel();
        this.handler.postDelayed(this.hideTooltip, delay);
    }

    public void showTooltip() {
        showTooltip(300L);
    }

    public void hideTooltip() {
        hideTooltip(0L);
    }
}
