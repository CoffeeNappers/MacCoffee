package com.vkontakte.android.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.graphics.Rect;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.ListView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes3.dex */
public class SwipeDismissListViewTouchListener implements View.OnTouchListener {
    private long mAnimationTime;
    private DismissCallbacks mCallbacks;
    private int mDownPosition;
    private View mDownView;
    private float mDownX;
    private float mDownY;
    private ListView mListView;
    private int mMaxFlingVelocity;
    private int mMinFlingVelocity;
    private boolean mPaused;
    private int mSlop;
    private boolean mSwiping;
    private int mSwipingSlop;
    private VelocityTracker mVelocityTracker;
    private int mViewWidth = 1;
    private List<PendingDismissData> mPendingDismisses = new ArrayList();
    private int mDismissAnimationRefCount = 0;

    /* loaded from: classes3.dex */
    public interface DismissCallbacks {
        boolean canDismiss(int i);

        void onDismiss(ListView listView, int[] iArr);
    }

    static /* synthetic */ int access$106(SwipeDismissListViewTouchListener x0) {
        int i = x0.mDismissAnimationRefCount - 1;
        x0.mDismissAnimationRefCount = i;
        return i;
    }

    public SwipeDismissListViewTouchListener(ListView listView, DismissCallbacks callbacks) {
        ViewConfiguration vc = ViewConfiguration.get(listView.getContext());
        this.mSlop = vc.getScaledTouchSlop();
        this.mMinFlingVelocity = vc.getScaledMinimumFlingVelocity() * 16;
        this.mMaxFlingVelocity = vc.getScaledMaximumFlingVelocity();
        this.mAnimationTime = listView.getContext().getResources().getInteger(17694720);
        this.mListView = listView;
        this.mCallbacks = callbacks;
    }

    public void setEnabled(boolean enabled) {
        this.mPaused = !enabled;
    }

    public AbsListView.OnScrollListener makeScrollListener() {
        return new AbsListView.OnScrollListener() { // from class: com.vkontakte.android.ui.SwipeDismissListViewTouchListener.1
            @Override // android.widget.AbsListView.OnScrollListener
            public void onScrollStateChanged(AbsListView absListView, int scrollState) {
                boolean z = true;
                SwipeDismissListViewTouchListener swipeDismissListViewTouchListener = SwipeDismissListViewTouchListener.this;
                if (scrollState == 1) {
                    z = false;
                }
                swipeDismissListViewTouchListener.setEnabled(z);
            }

            @Override // android.widget.AbsListView.OnScrollListener
            public void onScroll(AbsListView absListView, int i, int i1, int i2) {
            }
        };
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (this.mViewWidth < 2) {
            this.mViewWidth = this.mListView.getWidth();
        }
        switch (motionEvent.getActionMasked()) {
            case 0:
                if (this.mPaused) {
                    return false;
                }
                Rect rect = new Rect();
                int childCount = this.mListView.getChildCount();
                int[] listViewCoords = new int[2];
                this.mListView.getLocationOnScreen(listViewCoords);
                int x = ((int) motionEvent.getRawX()) - listViewCoords[0];
                int y = ((int) motionEvent.getRawY()) - listViewCoords[1];
                int i = 0;
                while (true) {
                    if (i < childCount) {
                        View child = this.mListView.getChildAt(i);
                        child.getHitRect(rect);
                        if (!rect.contains(x, y)) {
                            i++;
                        } else {
                            this.mDownView = child;
                        }
                    }
                }
                if (this.mDownView != null) {
                    this.mDownX = motionEvent.getRawX();
                    this.mDownY = motionEvent.getRawY();
                    this.mDownPosition = this.mListView.getPositionForView(this.mDownView);
                    if (this.mCallbacks.canDismiss(this.mDownPosition)) {
                        this.mVelocityTracker = VelocityTracker.obtain();
                        this.mVelocityTracker.addMovement(motionEvent);
                    } else {
                        this.mDownView = null;
                    }
                }
                return false;
            case 1:
                if (this.mVelocityTracker != null) {
                    float deltaX = motionEvent.getRawX() - this.mDownX;
                    this.mVelocityTracker.addMovement(motionEvent);
                    this.mVelocityTracker.computeCurrentVelocity(1000);
                    float velocityX = this.mVelocityTracker.getXVelocity();
                    float absVelocityX = Math.abs(velocityX);
                    float absVelocityY = Math.abs(this.mVelocityTracker.getYVelocity());
                    boolean dismiss = false;
                    boolean dismissRight = false;
                    if (Math.abs(deltaX) > this.mViewWidth / 2 && this.mSwiping) {
                        dismiss = true;
                        dismissRight = deltaX > 0.0f;
                    } else if (this.mMinFlingVelocity <= absVelocityX && absVelocityX <= this.mMaxFlingVelocity && absVelocityY < absVelocityX && this.mSwiping) {
                        dismiss = ((velocityX > 0.0f ? 1 : (velocityX == 0.0f ? 0 : -1)) < 0) == ((deltaX > 0.0f ? 1 : (deltaX == 0.0f ? 0 : -1)) < 0);
                        dismissRight = this.mVelocityTracker.getXVelocity() > 0.0f;
                    }
                    if (dismiss && this.mDownPosition != -1) {
                        final View downView = this.mDownView;
                        final int downPosition = this.mDownPosition;
                        this.mDismissAnimationRefCount++;
                        this.mDownView.animate().translationX(dismissRight ? this.mViewWidth : -this.mViewWidth).alpha(0.0f).setDuration(this.mAnimationTime).setListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ui.SwipeDismissListViewTouchListener.2
                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                            public void onAnimationEnd(Animator animation) {
                                SwipeDismissListViewTouchListener.this.performDismiss(downView, downPosition);
                            }
                        });
                    } else {
                        this.mDownView.animate().translationX(0.0f).alpha(1.0f).setDuration(this.mAnimationTime).setListener(null);
                    }
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                    this.mDownX = 0.0f;
                    this.mDownY = 0.0f;
                    this.mDownView = null;
                    this.mDownPosition = -1;
                    this.mSwiping = false;
                    break;
                }
                break;
            case 2:
                if (this.mVelocityTracker != null && !this.mPaused) {
                    this.mVelocityTracker.addMovement(motionEvent);
                    float deltaX2 = motionEvent.getRawX() - this.mDownX;
                    float deltaY = motionEvent.getRawY() - this.mDownY;
                    if (Math.abs(deltaX2) > this.mSlop && Math.abs(deltaY) < Math.abs(deltaX2) / 2.0f) {
                        this.mSwiping = true;
                        this.mSwipingSlop = deltaX2 > 0.0f ? this.mSlop : -this.mSlop;
                        this.mListView.requestDisallowInterceptTouchEvent(true);
                        MotionEvent cancelEvent = MotionEvent.obtain(motionEvent);
                        cancelEvent.setAction((motionEvent.getActionIndex() << 8) | 3);
                        this.mListView.onTouchEvent(cancelEvent);
                        cancelEvent.recycle();
                    }
                    if (this.mSwiping) {
                        this.mDownView.setTranslationX(deltaX2 - this.mSwipingSlop);
                        this.mDownView.setAlpha(Math.max(0.0f, Math.min(1.0f, 1.0f - ((2.0f * Math.abs(deltaX2)) / this.mViewWidth))));
                        return true;
                    }
                }
                break;
            case 3:
                if (this.mVelocityTracker != null) {
                    if (this.mDownView != null && this.mSwiping) {
                        this.mDownView.animate().translationX(0.0f).alpha(1.0f).setDuration(this.mAnimationTime).setListener(null);
                    }
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                    this.mDownX = 0.0f;
                    this.mDownY = 0.0f;
                    this.mDownView = null;
                    this.mDownPosition = -1;
                    this.mSwiping = false;
                    break;
                }
                break;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public class PendingDismissData implements Comparable<PendingDismissData> {
        public int position;
        public View view;

        public PendingDismissData(int position, View view) {
            this.position = position;
            this.view = view;
        }

        @Override // java.lang.Comparable
        public int compareTo(PendingDismissData other) {
            return other.position - this.position;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void performDismiss(final View dismissView, int dismissPosition) {
        final ViewGroup.LayoutParams lp = dismissView.getLayoutParams();
        final int originalHeight = dismissView.getHeight();
        ValueAnimator animator = ValueAnimator.ofInt(originalHeight, 1).setDuration(this.mAnimationTime);
        animator.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ui.SwipeDismissListViewTouchListener.3
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                SwipeDismissListViewTouchListener.access$106(SwipeDismissListViewTouchListener.this);
                if (SwipeDismissListViewTouchListener.this.mDismissAnimationRefCount == 0) {
                    Collections.sort(SwipeDismissListViewTouchListener.this.mPendingDismisses);
                    int[] dismissPositions = new int[SwipeDismissListViewTouchListener.this.mPendingDismisses.size()];
                    for (int i = SwipeDismissListViewTouchListener.this.mPendingDismisses.size() - 1; i >= 0; i--) {
                        dismissPositions[i] = ((PendingDismissData) SwipeDismissListViewTouchListener.this.mPendingDismisses.get(i)).position;
                    }
                    SwipeDismissListViewTouchListener.this.mCallbacks.onDismiss(SwipeDismissListViewTouchListener.this.mListView, dismissPositions);
                    SwipeDismissListViewTouchListener.this.mDownPosition = -1;
                    for (PendingDismissData pendingDismiss : SwipeDismissListViewTouchListener.this.mPendingDismisses) {
                        pendingDismiss.view.setAlpha(1.0f);
                        pendingDismiss.view.setTranslationX(0.0f);
                        ViewGroup.LayoutParams lp2 = pendingDismiss.view.getLayoutParams();
                        lp2.height = originalHeight;
                        pendingDismiss.view.setLayoutParams(lp2);
                    }
                    long time = SystemClock.uptimeMillis();
                    MotionEvent cancelEvent = MotionEvent.obtain(time, time, 3, 0.0f, 0.0f, 0);
                    SwipeDismissListViewTouchListener.this.mListView.dispatchTouchEvent(cancelEvent);
                    SwipeDismissListViewTouchListener.this.mPendingDismisses.clear();
                }
            }
        });
        animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.ui.SwipeDismissListViewTouchListener.4
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                lp.height = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                dismissView.setLayoutParams(lp);
            }
        });
        this.mPendingDismisses.add(new PendingDismissData(dismissPosition, dismissView));
        animator.start();
    }
}
