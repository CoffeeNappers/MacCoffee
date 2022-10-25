package com.vkontakte.android.ui.layout;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateDecelerateInterpolator;
import com.vkontakte.android.R;
import com.vkontakte.android.functions.VoidFBool;
import com.vkontakte.android.functions.VoidFloat;
/* loaded from: classes3.dex */
public class ExpandableBarLayout extends ViewGroup {
    private static final int ANIMATION_DURATION = 400;
    private static final int SCRIM_MAX_OPACITY = 102;
    private View mBackgroundView;
    private View mExpandButton;
    private View mExpandPanel;
    private TimeInterpolator mInterpolator;
    private VoidFloat mListener;
    private VoidFBool mOpenListener;
    private boolean mOpened;
    private final Paint mScrimPaint;
    private Drawable mShadow;

    public ExpandableBarLayout(Context context) {
        super(context);
        this.mInterpolator = new AccelerateDecelerateInterpolator();
        setWillNotDraw(false);
        this.mScrimPaint = new Paint();
        this.mScrimPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
        this.mScrimPaint.setAlpha(102);
        this.mShadow = getResources().getDrawable(R.drawable.bg_search_expand_shadow);
    }

    public ExpandableBarLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mInterpolator = new AccelerateDecelerateInterpolator();
        setWillNotDraw(false);
        this.mScrimPaint = new Paint();
        this.mScrimPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
        this.mScrimPaint.setAlpha(102);
        this.mShadow = getResources().getDrawable(R.drawable.bg_search_expand_shadow);
    }

    public ExpandableBarLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mInterpolator = new AccelerateDecelerateInterpolator();
        setWillNotDraw(false);
        this.mScrimPaint = new Paint();
        this.mScrimPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
        this.mScrimPaint.setAlpha(102);
        this.mShadow = getResources().getDrawable(R.drawable.bg_search_expand_shadow);
    }

    @TargetApi(21)
    public ExpandableBarLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mInterpolator = new AccelerateDecelerateInterpolator();
        setWillNotDraw(false);
        this.mScrimPaint = new Paint();
        this.mScrimPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
        this.mScrimPaint.setAlpha(102);
        this.mShadow = getResources().getDrawable(R.drawable.bg_search_expand_shadow);
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        this.mBackgroundView = getChildAt(0);
        this.mExpandButton = getChildAt(1);
        this.mExpandPanel = getChildAt(2);
        if (this.mExpandPanel != null) {
            this.mExpandButton.setOnClickListener(ExpandableBarLayout$$Lambda$1.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onFinishInflate$0(View view) {
        toggle();
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean hasTransientState() {
        return false;
    }

    @Override // android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int childMeasureWidth = View.MeasureSpec.makeMeasureSpec((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), 1073741824);
        int height = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        if (this.mExpandButton.getLayoutParams().height >= 0) {
            this.mExpandButton.measure(childMeasureWidth, View.MeasureSpec.makeMeasureSpec(this.mExpandButton.getLayoutParams().height, 1073741824));
        } else {
            this.mExpandButton.measure(childMeasureWidth, View.MeasureSpec.makeMeasureSpec(height, Integer.MIN_VALUE));
        }
        int height2 = height - this.mExpandButton.getMeasuredHeight();
        if (this.mExpandPanel != null) {
            this.mExpandPanel.measure(childMeasureWidth, View.MeasureSpec.makeMeasureSpec(height2, Integer.MIN_VALUE));
        }
        this.mBackgroundView.measure(childMeasureWidth, View.MeasureSpec.makeMeasureSpec(height2, 1073741824));
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int left = getPaddingLeft();
        int top = getPaddingTop();
        int buttonBottom = top + (this.mExpandButton == null ? 0 : this.mExpandButton.getMeasuredHeight());
        if (this.mBackgroundView != null) {
            this.mBackgroundView.layout(left, buttonBottom, this.mBackgroundView.getMeasuredWidth() + left, this.mBackgroundView.getMeasuredHeight() + buttonBottom);
        }
        if (this.mExpandPanel != null && this.mExpandPanel.getVisibility() == 0) {
            this.mExpandPanel.layout(left, buttonBottom, this.mExpandPanel.getMeasuredWidth() + left, this.mExpandPanel.getMeasuredHeight() + buttonBottom);
        }
        if (this.mExpandButton != null) {
            this.mExpandButton.layout(left, top, this.mExpandButton.getMeasuredWidth() + left, buttonBottom);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (this.mOpened && this.mExpandPanel != null) {
            int bottom = (int) (this.mExpandPanel.getBottom() + this.mExpandPanel.getTranslationY());
            canvas.drawRect(0.0f, bottom, getRight(), getBottom(), this.mScrimPaint);
            if (this.mShadow != null) {
                this.mShadow.setBounds(0, bottom, getWidth(), this.mShadow.getIntrinsicHeight() + bottom);
                this.mShadow.draw(canvas);
            }
        } else if (this.mShadow != null) {
            this.mShadow.setBounds(0, this.mExpandButton.getBottom(), getWidth(), this.mExpandButton.getBottom() + this.mShadow.getIntrinsicHeight());
            this.mShadow.draw(canvas);
        }
    }

    @Override // android.view.ViewGroup
    protected boolean drawChild(Canvas canvas, View child, long drawingTime) {
        if (this.mOpened && child == this.mBackgroundView && this.mExpandPanel != null) {
            int count = canvas.save();
            canvas.clipRect(0.0f, this.mExpandPanel.getBottom() + this.mExpandPanel.getTranslationY(), getWidth(), getHeight());
            boolean result = super.drawChild(canvas, child, drawingTime);
            canvas.restoreToCount(count);
            return result;
        } else if (child == this.mExpandPanel) {
            int count2 = canvas.save();
            canvas.clipRect(0, this.mExpandButton.getBottom(), getWidth(), getBottom());
            boolean result2 = super.drawChild(canvas, child, drawingTime);
            canvas.restoreToCount(count2);
            return result2;
        } else {
            boolean result3 = super.drawChild(canvas, child, drawingTime);
            return result3;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent event) {
        if (this.mOpened && this.mExpandPanel != null) {
            int bottom = (int) (this.mExpandPanel.getBottom() + this.mExpandPanel.getTranslationY());
            if (event.getY() > bottom) {
                if (event.getAction() != 1 && event.getAction() != 3) {
                    return true;
                }
                closePanel();
                return true;
            }
        }
        return super.dispatchTouchEvent(event);
    }

    public void openPanel() {
        if (this.mExpandPanel != null) {
            ObjectAnimator animator = ObjectAnimator.ofFloat(this.mExpandPanel, "translationY", -this.mExpandPanel.getMeasuredHeight(), 0.0f);
            animator.setDuration(400L);
            animator.setInterpolator(this.mInterpolator);
            animator.addListener(new Animator.AnimatorListener() { // from class: com.vkontakte.android.ui.layout.ExpandableBarLayout.1
                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animation) {
                    ExpandableBarLayout.this.mOpened = true;
                    ExpandableBarLayout.this.mExpandPanel.setVisibility(0);
                    if (ExpandableBarLayout.this.mOpenListener != null) {
                        ExpandableBarLayout.this.mOpenListener.f(ExpandableBarLayout.this.mOpened);
                    }
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animation) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationRepeat(Animator animation) {
                }
            });
            animator.addUpdateListener(ExpandableBarLayout$$Lambda$2.lambdaFactory$(this));
            animator.start();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$openPanel$1(ValueAnimator animation) {
        float interpolation = animation.getAnimatedFraction();
        if (this.mListener != null) {
            this.mListener.f(interpolation);
        }
        this.mScrimPaint.setAlpha((int) (102.0f * interpolation));
        invalidate();
    }

    public void closePanel() {
        if (this.mExpandPanel != null) {
            ObjectAnimator animator = ObjectAnimator.ofFloat(this.mExpandPanel, "translationY", 0.0f, -this.mExpandPanel.getMeasuredHeight());
            animator.setDuration(400L);
            animator.setInterpolator(this.mInterpolator);
            animator.addListener(new Animator.AnimatorListener() { // from class: com.vkontakte.android.ui.layout.ExpandableBarLayout.2
                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animation) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    ExpandableBarLayout.this.mOpened = false;
                    ExpandableBarLayout.this.mExpandPanel.setVisibility(8);
                    if (ExpandableBarLayout.this.mOpenListener != null) {
                        ExpandableBarLayout.this.mOpenListener.f(ExpandableBarLayout.this.mOpened);
                    }
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animation) {
                    ExpandableBarLayout.this.mOpened = false;
                    ExpandableBarLayout.this.mExpandPanel.setVisibility(8);
                    if (ExpandableBarLayout.this.mOpenListener != null) {
                        ExpandableBarLayout.this.mOpenListener.f(ExpandableBarLayout.this.mOpened);
                    }
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationRepeat(Animator animation) {
                }
            });
            animator.addUpdateListener(ExpandableBarLayout$$Lambda$3.lambdaFactory$(this));
            animator.start();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$closePanel$2(ValueAnimator animation) {
        float interpolation = 1.0f - animation.getAnimatedFraction();
        if (this.mListener != null) {
            this.mListener.f(interpolation);
        }
        this.mScrimPaint.setAlpha((int) (102.0f * interpolation));
        invalidate();
    }

    public void setProgressListener(VoidFloat listener) {
        this.mListener = listener;
    }

    public void setOpenListener(VoidFBool listener) {
        this.mOpenListener = listener;
    }

    public void toggle() {
        if (this.mOpened) {
            closePanel();
        } else {
            openPanel();
        }
    }

    public boolean isOpened() {
        return this.mOpened;
    }
}
