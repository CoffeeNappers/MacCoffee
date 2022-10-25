package com.vkontakte.android;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.DecelerateInterpolator;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import java.util.Timer;
import java.util.TimerTask;
/* loaded from: classes2.dex */
public class OverScrollView extends ScrollView {
    public static final int ID_BOTTOM_PADDING_VIEW = 6;
    public static final int ID_TOP_PADDING_VIEW = 5;
    private static final int NOCHANGE_DELAY = 300;
    boolean addingContentAtTop;
    AlphaAnimation anim;
    int collapsedBottomH;
    int collapsedTopH;
    boolean draggingBottom;
    boolean draggingTop;
    boolean isAligned;
    public OnScrollEndListener onScrollEndListener;
    private int prevHeight;
    private int prevViewH;
    private Timer scrollEndTimer;
    float startY;
    float vH;

    /* loaded from: classes2.dex */
    public interface OnScrollEndListener {
        void onScrollEnd(int i, int i2);
    }

    public OverScrollView(Context context) {
        super(context);
        this.draggingBottom = false;
        this.draggingTop = false;
        this.startY = 0.0f;
        this.vH = 0.0f;
        this.collapsedTopH = 0;
        this.collapsedBottomH = 0;
        this.anim = new AlphaAnimation(0.999f, 1.0f);
        this.scrollEndTimer = null;
        this.onScrollEndListener = null;
        this.prevHeight = 0;
        this.prevViewH = 0;
        this.addingContentAtTop = false;
        this.isAligned = false;
    }

    public OverScrollView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.draggingBottom = false;
        this.draggingTop = false;
        this.startY = 0.0f;
        this.vH = 0.0f;
        this.collapsedTopH = 0;
        this.collapsedBottomH = 0;
        this.anim = new AlphaAnimation(0.999f, 1.0f);
        this.scrollEndTimer = null;
        this.onScrollEndListener = null;
        this.prevHeight = 0;
        this.prevViewH = 0;
        this.addingContentAtTop = false;
        this.isAligned = false;
    }

    public OverScrollView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.draggingBottom = false;
        this.draggingTop = false;
        this.startY = 0.0f;
        this.vH = 0.0f;
        this.collapsedTopH = 0;
        this.collapsedBottomH = 0;
        this.anim = new AlphaAnimation(0.999f, 1.0f);
        this.scrollEndTimer = null;
        this.onScrollEndListener = null;
        this.prevHeight = 0;
        this.prevViewH = 0;
        this.addingContentAtTop = false;
        this.isAligned = false;
    }

    public void init() {
    }

    @Override // android.widget.ScrollView, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == 2) {
            if (getScrollY() == 0) {
                if (!this.draggingTop) {
                    startDraggingTop(event);
                }
                float h = event.getY() - this.startY;
                if (h < 0.0f) {
                    endDraggingTop(false);
                    return super.onTouchEvent(event);
                }
                findViewById(5).setLayoutParams(new LinearLayout.LayoutParams(-1, ((int) h) + this.collapsedTopH));
                onDragTop((int) h);
                try {
                    getClass().getMethod("awakenScrollBars", new Class[0]).invoke(this, new Object[0]);
                    return true;
                } catch (Exception e) {
                    return true;
                }
            } else if (getScrollY() == getChildAt(0).getHeight() - getHeight() || (getScrollY() >= (getChildAt(0).getHeight() - getHeight()) - 5 && this.draggingBottom)) {
                if (!this.draggingBottom) {
                    startDraggingBottom(event);
                }
                float h2 = this.startY - event.getY();
                if (h2 < 0.0f) {
                    endDraggingBottom(false);
                    return super.onTouchEvent(event);
                }
                findViewById(6).setLayoutParams(new LinearLayout.LayoutParams(-1, (int) h2));
                post(new Runnable() { // from class: com.vkontakte.android.OverScrollView.1
                    @Override // java.lang.Runnable
                    public void run() {
                        OverScrollView.this.scrollTo(0, 9999999);
                    }
                });
                return true;
            } else if (!this.draggingBottom && this.draggingTop) {
                endDraggingTop(false);
            }
        }
        if (event.getAction() == 1) {
            if (this.draggingTop) {
                endDraggingTop(true);
            }
            if (this.draggingBottom) {
                endDraggingBottom(true);
            }
        }
        return super.onTouchEvent(event);
    }

    protected void startDraggingTop(MotionEvent ev) {
        this.draggingTop = true;
        findViewById(5).clearAnimation();
        this.startY = ev.getY();
    }

    protected void endDraggingTop(boolean animate) {
        if (this.draggingTop) {
            this.vH = findViewById(5).getHeight();
            if (animate && this.vH > 0.0f) {
                this.anim.reset();
                this.anim.setDuration(Math.max(300, (int) this.vH));
                this.anim.setRepeatCount(0);
                ResizingInterpolator ri = new ResizingInterpolator();
                ri.viewID = 5;
                ri.ch = this.collapsedTopH;
                this.anim.setInterpolator(ri);
                findViewById(5).startAnimation(this.anim);
            } else {
                findViewById(5).setLayoutParams(new LinearLayout.LayoutParams(-1, this.collapsedTopH));
            }
            this.draggingTop = false;
        }
    }

    private void startDraggingBottom(MotionEvent ev) {
        this.draggingBottom = true;
        findViewById(6).clearAnimation();
        this.startY = ev.getY();
    }

    private void endDraggingBottom(boolean animate) {
        if (this.draggingBottom) {
            this.vH = findViewById(6).getHeight();
            if (animate && this.vH > 0.0f) {
                this.anim.reset();
                this.anim.setDuration((int) this.vH);
                this.anim.setRepeatCount(0);
                ResizingInterpolator ri = new ResizingInterpolator();
                ri.viewID = 6;
                this.anim.setInterpolator(ri);
                findViewById(6).startAnimation(this.anim);
            } else {
                findViewById(6).setLayoutParams(new LinearLayout.LayoutParams(-1, 0));
            }
            this.draggingBottom = false;
        }
    }

    public void onDragTop(int h) {
    }

    @Override // android.widget.ScrollView, android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        if (!this.isAligned) {
            super.onLayout(changed, l, t, r, b);
            return;
        }
        if (changed && this.prevHeight > 0) {
            scrollBy(0, -(getHeight() - this.prevHeight));
        }
        super.onLayout(changed, l, t, r, b);
        if (!changed && this.addingContentAtTop) {
            View v = getChildAt(0);
            if (v != null) {
                scrollTo(0, (v.getHeight() - this.prevViewH) + getScrollY());
            }
            this.addingContentAtTop = false;
        }
        this.prevHeight = getHeight();
        View v2 = getChildAt(0);
        if (v2 != null) {
            this.prevViewH = v2.getHeight();
        }
    }

    @Override // android.view.View
    protected void onScrollChanged(int l, int t, int oldl, int oldt) {
        super.onScrollChanged(l, t, oldl, oldt);
        if (this.scrollEndTimer != null) {
            this.scrollEndTimer.cancel();
        }
        this.scrollEndTimer = new Timer();
        this.scrollEndTimer.schedule(new ScrollEndTimerTask(), 300L);
    }

    public void postScrollEnd() {
        post(new Runnable() { // from class: com.vkontakte.android.OverScrollView.2
            @Override // java.lang.Runnable
            public void run() {
                if (OverScrollView.this.onScrollEndListener != null) {
                    OverScrollView.this.onScrollEndListener.onScrollEnd(OverScrollView.this.getScrollY(), OverScrollView.this.getHeight());
                }
            }
        });
    }

    /* loaded from: classes2.dex */
    private class ScrollEndTimerTask extends TimerTask {
        private ScrollEndTimerTask() {
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            OverScrollView.this.postScrollEnd();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ResizingInterpolator extends DecelerateInterpolator {
        public int ch;
        public int viewID;

        public ResizingInterpolator() {
            super(2.0f);
            this.ch = 0;
        }

        @Override // android.view.animation.DecelerateInterpolator, android.animation.TimeInterpolator
        public float getInterpolation(float input) {
            float f = super.getInterpolation(input);
            OverScrollView.this.findViewById(this.viewID).setLayoutParams(new LinearLayout.LayoutParams(-1, (int) (((OverScrollView.this.vH - this.ch) * (1.0f - f)) + this.ch)));
            return f;
        }
    }
}
