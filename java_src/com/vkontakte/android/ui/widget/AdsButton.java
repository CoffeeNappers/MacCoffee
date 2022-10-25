package com.vkontakte.android.ui.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import com.vk.attachpicker.widget.RobotoMediumTextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.CubicBezierInterpolator;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes3.dex */
public class AdsButton extends FrameLayout {
    private static final int ANIMATION_DELAY = 4000;
    private static final Interpolator interpolator = new CubicBezierInterpolator(0.455f, 0.03f, 0.515f, 0.955f);
    private AnimatorSet animator;
    private final RobotoMediumTextView firstPhaseButton;
    private final boolean hasActivity;
    private boolean needStateReset;
    private final RobotoMediumTextView secondPhaseButton;

    public AdsButton(Context context) {
        this(context, null);
    }

    public AdsButton(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public AdsButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.firstPhaseButton = new RobotoMediumTextView(new ContextThemeWrapper(context, (int) R.style.ads_button_first_phase));
        this.secondPhaseButton = new RobotoMediumTextView(new ContextThemeWrapper(context, (int) R.style.ads_button_second_phase));
        this.secondPhaseButton.setVisibility(8);
        addView(this.firstPhaseButton);
        addView(this.secondPhaseButton);
        Activity activity = Utils.castToActivity(context);
        if (activity != null) {
            this.hasActivity = true;
            final Rect rect = new Rect();
            final Rect rootRect = new Rect();
            View list = activity.findViewById(R.id.list);
            final View rootView = list == null ? activity.getWindow().getDecorView() : list;
            final int navigationHeight = ViewUtils.getNavigationBarHeight(context);
            getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.widget.AdsButton.1
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    if (AdsButton.this.needStateReset) {
                        AdsButton.this.getGlobalVisibleRect(rect);
                        rootView.getGlobalVisibleRect(rootRect);
                        rootRect.offset(0, -navigationHeight);
                        if (AdsButton.this.getMeasuredHeight() == rect.height() && rootRect.contains(rect)) {
                            AdsButton.this.needStateReset = false;
                            AdsButton.this.animateView();
                            return true;
                        }
                        return true;
                    }
                    return true;
                }
            });
            return;
        }
        this.hasActivity = false;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.firstPhaseButton.setVisibility(0);
        this.secondPhaseButton.setVisibility(8);
        if (this.hasActivity) {
            this.needStateReset = true;
        } else {
            animateView();
        }
    }

    public void setText(CharSequence text) {
        this.firstPhaseButton.setText(text);
        this.secondPhaseButton.setText(text);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void animateView() {
        if (this.animator != null) {
            this.animator.removeAllListeners();
            this.animator.cancel();
        }
        this.animator = new AnimatorSet();
        this.animator.playTogether(ObjectAnimator.ofFloat(this.secondPhaseButton, View.ALPHA, 0.0f, 1.0f));
        this.animator.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ui.widget.AdsButton.2
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animation) {
                AdsButton.this.secondPhaseButton.setAlpha(0.0f);
                AdsButton.this.secondPhaseButton.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.widget.AdsButton.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        AdsButton.this.secondPhaseButton.setVisibility(0);
                    }
                }, animation.getStartDelay());
            }

            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                AdsButton.this.firstPhaseButton.setVisibility(8);
            }
        });
        this.animator.setDuration(500L);
        this.animator.setStartDelay(4000L);
        this.animator.setInterpolator(interpolator);
        this.animator.start();
    }
}
