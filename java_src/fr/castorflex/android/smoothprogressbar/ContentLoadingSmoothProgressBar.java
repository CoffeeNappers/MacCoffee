package fr.castorflex.android.smoothprogressbar;

import android.content.Context;
import android.util.AttributeSet;
/* loaded from: classes3.dex */
public class ContentLoadingSmoothProgressBar extends SmoothProgressBar {
    private static final int MIN_DELAY = 500;
    private static final int MIN_SHOW_TIME = 500;
    private final Runnable mDelayedHide;
    private final Runnable mDelayedShow;
    private boolean mDismissed;
    private boolean mPostedHide;
    private boolean mPostedShow;
    private long mStartTime;

    public ContentLoadingSmoothProgressBar(Context context) {
        this(context, null);
    }

    public ContentLoadingSmoothProgressBar(Context context, AttributeSet attrs) {
        super(context, attrs, 0);
        this.mStartTime = -1L;
        this.mPostedHide = false;
        this.mPostedShow = false;
        this.mDismissed = false;
        this.mDelayedHide = new Runnable() { // from class: fr.castorflex.android.smoothprogressbar.ContentLoadingSmoothProgressBar.1
            @Override // java.lang.Runnable
            public void run() {
                ContentLoadingSmoothProgressBar.this.mPostedHide = false;
                ContentLoadingSmoothProgressBar.this.mStartTime = -1L;
                ContentLoadingSmoothProgressBar.this.setVisibility(8);
            }
        };
        this.mDelayedShow = new Runnable() { // from class: fr.castorflex.android.smoothprogressbar.ContentLoadingSmoothProgressBar.2
            @Override // java.lang.Runnable
            public void run() {
                ContentLoadingSmoothProgressBar.this.mPostedShow = false;
                if (!ContentLoadingSmoothProgressBar.this.mDismissed) {
                    ContentLoadingSmoothProgressBar.this.mStartTime = System.currentTimeMillis();
                    ContentLoadingSmoothProgressBar.this.setVisibility(0);
                }
            }
        };
    }

    @Override // android.widget.ProgressBar, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        removeCallbacks();
    }

    @Override // android.widget.ProgressBar, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks();
    }

    private void removeCallbacks() {
        removeCallbacks(this.mDelayedHide);
        removeCallbacks(this.mDelayedShow);
    }

    public void hide() {
        this.mDismissed = true;
        removeCallbacks(this.mDelayedShow);
        long diff = System.currentTimeMillis() - this.mStartTime;
        if (diff >= 500 || this.mStartTime == -1) {
            setVisibility(8);
        } else if (!this.mPostedHide) {
            postDelayed(this.mDelayedHide, 500 - diff);
            this.mPostedHide = true;
        }
    }

    public void show() {
        this.mStartTime = -1L;
        this.mDismissed = false;
        removeCallbacks(this.mDelayedHide);
        if (!this.mPostedShow) {
            postDelayed(this.mDelayedShow, 500L);
            this.mPostedShow = true;
        }
    }
}
