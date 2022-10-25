package com.vk.attachpicker.widget;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.design.widget.CoordinatorLayout;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.VelocityTrackerCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPager;
import android.support.v4.widget.ViewDragHelper;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import com.vk.attachpicker.util.Utils;
import com.vkontakte.android.R;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
/* loaded from: classes.dex */
public class VkBottomSheetBehavior<V extends View> extends CoordinatorLayout.Behavior<V> {
    private static final float HIDE_FRICTION = 0.1f;
    private static final float HIDE_THRESHOLD = 0.5f;
    public static final int STATE_COLLAPSED = 4;
    public static final int STATE_DRAGGING = 1;
    public static final int STATE_EXPANDED = 3;
    public static final int STATE_HIDDEN = 5;
    public static final int STATE_SETTLING = 2;
    private static Field positionField;
    private int mActivePointerId;
    private BottomSheetCallback mCallback;
    private final ViewDragHelper.Callback mDragCallback;
    private boolean mHideable;
    private boolean mIgnoreEvents;
    private int mInitialY;
    private int mLastNestedScrollDy;
    private int mMaxOffset;
    private float mMaximumVelocity;
    private int mMinOffset;
    private boolean mNestedScrolled;
    private WeakReference<View> mNestedScrollingChildRef;
    private int mParentHeight;
    private int mPeekHeight;
    private int mState;
    private boolean mTouchingScrollingChild;
    private VelocityTracker mVelocityTracker;
    private ViewDragHelper mViewDragHelper;
    private WeakReference<V> mViewRef;

    /* loaded from: classes.dex */
    public static abstract class BottomSheetCallback {
        public abstract void onSlide(@NonNull View view, float f);

        public abstract void onStateChanged(@NonNull View view, int i);

        public abstract void onTargetStateChanged(@NonNull View view, int i);
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface State {
    }

    public VkBottomSheetBehavior() {
        this.mState = 4;
        this.mDragCallback = new ViewDragHelper.Callback() { // from class: com.vk.attachpicker.widget.VkBottomSheetBehavior.1
            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public boolean tryCaptureView(View child, int pointerId) {
                View scroll;
                boolean z = true;
                if (VkBottomSheetBehavior.this.mState != 1 && !VkBottomSheetBehavior.this.mTouchingScrollingChild) {
                    if (VkBottomSheetBehavior.this.mState == 3 && VkBottomSheetBehavior.this.mActivePointerId == pointerId && (scroll = (View) VkBottomSheetBehavior.this.mNestedScrollingChildRef.get()) != null && ViewCompat.canScrollVertically(scroll, -1)) {
                        return false;
                    }
                    if (VkBottomSheetBehavior.this.mViewRef == null || VkBottomSheetBehavior.this.mViewRef.get() != child) {
                        z = false;
                    }
                    return z;
                }
                return false;
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
                VkBottomSheetBehavior.this.dispatchOnSlide(top);
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public void onViewDragStateChanged(int state) {
                if (state == 1) {
                    VkBottomSheetBehavior.this.setStateInternal(1);
                }
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public void onViewReleased(View releasedChild, float xvel, float yvel) {
                int top;
                int targetState;
                if (yvel < 0.0f) {
                    top = VkBottomSheetBehavior.this.mMinOffset;
                    targetState = 3;
                } else if (VkBottomSheetBehavior.this.mHideable && VkBottomSheetBehavior.this.shouldHide(releasedChild, yvel)) {
                    top = VkBottomSheetBehavior.this.mParentHeight;
                    targetState = 5;
                } else if (yvel != 0.0f) {
                    top = VkBottomSheetBehavior.this.mMaxOffset;
                    targetState = 4;
                } else {
                    int currentTop = releasedChild.getTop();
                    if (Math.abs(currentTop - VkBottomSheetBehavior.this.mMinOffset) < Math.abs(currentTop - VkBottomSheetBehavior.this.mMaxOffset)) {
                        top = VkBottomSheetBehavior.this.mMinOffset;
                        targetState = 3;
                    } else {
                        top = VkBottomSheetBehavior.this.mMaxOffset;
                        targetState = 4;
                    }
                }
                if (VkBottomSheetBehavior.this.mViewDragHelper.settleCapturedViewAt(releasedChild.getLeft(), top)) {
                    VkBottomSheetBehavior.this.setStateInternal(2);
                    ViewCompat.postOnAnimation(releasedChild, new SettleRunnable(releasedChild, targetState));
                    return;
                }
                VkBottomSheetBehavior.this.setStateInternal(targetState);
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public int clampViewPositionVertical(View child, int top, int dy) {
                return VkBottomSheetBehavior.constrain(top, VkBottomSheetBehavior.this.mMinOffset, VkBottomSheetBehavior.this.mHideable ? VkBottomSheetBehavior.this.mParentHeight : VkBottomSheetBehavior.this.mMaxOffset);
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public int clampViewPositionHorizontal(View child, int left, int dx) {
                return child.getLeft();
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public int getViewVerticalDragRange(View child) {
                return VkBottomSheetBehavior.this.mHideable ? VkBottomSheetBehavior.this.mParentHeight - VkBottomSheetBehavior.this.mMinOffset : VkBottomSheetBehavior.this.mMaxOffset - VkBottomSheetBehavior.this.mMinOffset;
            }
        };
    }

    public VkBottomSheetBehavior(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mState = 4;
        this.mDragCallback = new ViewDragHelper.Callback() { // from class: com.vk.attachpicker.widget.VkBottomSheetBehavior.1
            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public boolean tryCaptureView(View child, int pointerId) {
                View scroll;
                boolean z = true;
                if (VkBottomSheetBehavior.this.mState != 1 && !VkBottomSheetBehavior.this.mTouchingScrollingChild) {
                    if (VkBottomSheetBehavior.this.mState == 3 && VkBottomSheetBehavior.this.mActivePointerId == pointerId && (scroll = (View) VkBottomSheetBehavior.this.mNestedScrollingChildRef.get()) != null && ViewCompat.canScrollVertically(scroll, -1)) {
                        return false;
                    }
                    if (VkBottomSheetBehavior.this.mViewRef == null || VkBottomSheetBehavior.this.mViewRef.get() != child) {
                        z = false;
                    }
                    return z;
                }
                return false;
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
                VkBottomSheetBehavior.this.dispatchOnSlide(top);
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public void onViewDragStateChanged(int state) {
                if (state == 1) {
                    VkBottomSheetBehavior.this.setStateInternal(1);
                }
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public void onViewReleased(View releasedChild, float xvel, float yvel) {
                int top;
                int targetState;
                if (yvel < 0.0f) {
                    top = VkBottomSheetBehavior.this.mMinOffset;
                    targetState = 3;
                } else if (VkBottomSheetBehavior.this.mHideable && VkBottomSheetBehavior.this.shouldHide(releasedChild, yvel)) {
                    top = VkBottomSheetBehavior.this.mParentHeight;
                    targetState = 5;
                } else if (yvel != 0.0f) {
                    top = VkBottomSheetBehavior.this.mMaxOffset;
                    targetState = 4;
                } else {
                    int currentTop = releasedChild.getTop();
                    if (Math.abs(currentTop - VkBottomSheetBehavior.this.mMinOffset) < Math.abs(currentTop - VkBottomSheetBehavior.this.mMaxOffset)) {
                        top = VkBottomSheetBehavior.this.mMinOffset;
                        targetState = 3;
                    } else {
                        top = VkBottomSheetBehavior.this.mMaxOffset;
                        targetState = 4;
                    }
                }
                if (VkBottomSheetBehavior.this.mViewDragHelper.settleCapturedViewAt(releasedChild.getLeft(), top)) {
                    VkBottomSheetBehavior.this.setStateInternal(2);
                    ViewCompat.postOnAnimation(releasedChild, new SettleRunnable(releasedChild, targetState));
                    return;
                }
                VkBottomSheetBehavior.this.setStateInternal(targetState);
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public int clampViewPositionVertical(View child, int top, int dy) {
                return VkBottomSheetBehavior.constrain(top, VkBottomSheetBehavior.this.mMinOffset, VkBottomSheetBehavior.this.mHideable ? VkBottomSheetBehavior.this.mParentHeight : VkBottomSheetBehavior.this.mMaxOffset);
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public int clampViewPositionHorizontal(View child, int left, int dx) {
                return child.getLeft();
            }

            @Override // android.support.v4.widget.ViewDragHelper.Callback
            public int getViewVerticalDragRange(View child) {
                return VkBottomSheetBehavior.this.mHideable ? VkBottomSheetBehavior.this.mParentHeight - VkBottomSheetBehavior.this.mMinOffset : VkBottomSheetBehavior.this.mMaxOffset - VkBottomSheetBehavior.this.mMinOffset;
            }
        };
        ViewConfiguration configuration = ViewConfiguration.get(context);
        this.mMaximumVelocity = configuration.getScaledMaximumFlingVelocity();
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public Parcelable onSaveInstanceState(CoordinatorLayout parent, V child) {
        return new SavedState(super.onSaveInstanceState(parent, child), this.mState);
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public void onRestoreInstanceState(CoordinatorLayout parent, V child, Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(parent, child, ss.getSuperState());
        if (ss.state == 1 || ss.state == 2) {
            this.mState = 4;
        } else {
            this.mState = ss.state;
        }
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onLayoutChild(CoordinatorLayout parent, V child, int layoutDirection) {
        if (this.mState != 1 && this.mState != 2) {
            if (ViewCompat.getFitsSystemWindows(parent) && !ViewCompat.getFitsSystemWindows(child)) {
                ViewCompat.setFitsSystemWindows(child, true);
            }
            parent.onLayoutChild(child, layoutDirection);
        }
        this.mParentHeight = (int) (parent.getHeight() + parent.getContext().getResources().getDimension(R.dimen.picker_tab_panel_height));
        this.mMinOffset = Math.max(0, parent.getHeight() - child.getHeight());
        this.mMaxOffset = Math.max(parent.getHeight() - this.mPeekHeight, this.mMinOffset);
        if (this.mState == 3) {
            ViewCompat.offsetTopAndBottom(child, this.mMinOffset);
        } else if (this.mHideable && this.mState == 5) {
            ViewCompat.offsetTopAndBottom(child, this.mParentHeight);
        } else if (this.mState == 4) {
            ViewCompat.offsetTopAndBottom(child, this.mMaxOffset);
        }
        if (this.mViewDragHelper == null) {
            this.mViewDragHelper = ViewDragHelper.create(parent, this.mDragCallback);
        }
        this.mViewRef = new WeakReference<>(child);
        View scrollingChild = findScrollingChild(child);
        this.mNestedScrollingChildRef = new WeakReference<>(scrollingChild);
        return true;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onInterceptTouchEvent(CoordinatorLayout parent, V child, MotionEvent event) {
        boolean z = true;
        if (!child.isShown()) {
            return false;
        }
        int action = MotionEventCompat.getActionMasked(event);
        if (action == 0) {
            reset();
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(event);
        switch (action) {
            case 0:
                int initialX = (int) event.getX();
                this.mInitialY = (int) event.getY();
                View scroll = this.mNestedScrollingChildRef.get();
                if (scroll != null && parent.isPointInChildBounds(scroll, initialX, this.mInitialY)) {
                    this.mActivePointerId = event.getPointerId(event.getActionIndex());
                    this.mTouchingScrollingChild = true;
                }
                this.mIgnoreEvents = this.mActivePointerId == -1 && !parent.isPointInChildBounds(child, initialX, this.mInitialY);
                break;
            case 1:
            case 3:
                this.mTouchingScrollingChild = false;
                this.mActivePointerId = -1;
                if (this.mIgnoreEvents) {
                    this.mIgnoreEvents = false;
                    return false;
                }
                break;
        }
        if (!this.mIgnoreEvents && this.mViewDragHelper.shouldInterceptTouchEvent(event)) {
            return true;
        }
        View scroll2 = this.mNestedScrollingChildRef.get();
        if (action != 2 || scroll2 == null || this.mIgnoreEvents || this.mState == 1 || parent.isPointInChildBounds(scroll2, (int) event.getX(), (int) event.getY()) || Math.abs(this.mInitialY - event.getY()) <= this.mViewDragHelper.getTouchSlop()) {
            z = false;
        }
        return z;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onTouchEvent(CoordinatorLayout parent, V child, MotionEvent event) {
        if (!child.isShown()) {
            return false;
        }
        int action = MotionEventCompat.getActionMasked(event);
        if (this.mState == 1 && action == 0) {
            return true;
        }
        this.mViewDragHelper.processTouchEvent(event);
        if (action == 0) {
            reset();
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(event);
        if (action != 2 || this.mIgnoreEvents || Math.abs(this.mInitialY - event.getY()) <= this.mViewDragHelper.getTouchSlop()) {
            return true;
        }
        this.mViewDragHelper.captureChildView(child, event.getPointerId(event.getActionIndex()));
        return true;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onStartNestedScroll(CoordinatorLayout coordinatorLayout, V child, View directTargetChild, View target, int nestedScrollAxes) {
        this.mLastNestedScrollDy = 0;
        this.mNestedScrolled = false;
        return (nestedScrollAxes & 2) != 0;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public void onNestedPreScroll(CoordinatorLayout coordinatorLayout, V child, View target, int dx, int dy, int[] consumed) {
        View scrollingChild = this.mNestedScrollingChildRef.get();
        if (target == scrollingChild) {
            int currentTop = child.getTop();
            int newTop = currentTop - dy;
            if (dy > 0) {
                if (newTop < this.mMinOffset) {
                    consumed[1] = currentTop - this.mMinOffset;
                    ViewCompat.offsetTopAndBottom(child, -consumed[1]);
                    setStateInternal(3);
                } else {
                    consumed[1] = dy;
                    ViewCompat.offsetTopAndBottom(child, -dy);
                    setStateInternal(1);
                }
            } else if (dy < 0 && (getState() != 3 || !ViewCompat.canScrollVertically(target, -1))) {
                if (newTop <= this.mMaxOffset || this.mHideable) {
                    consumed[1] = dy;
                    ViewCompat.offsetTopAndBottom(child, -dy);
                    setStateInternal(1);
                } else {
                    consumed[1] = currentTop - this.mMaxOffset;
                    ViewCompat.offsetTopAndBottom(child, -consumed[1]);
                    setStateInternal(4);
                }
            }
            dispatchOnSlide(child.getTop());
            this.mLastNestedScrollDy = dy;
            this.mNestedScrolled = true;
        }
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public void onStopNestedScroll(CoordinatorLayout coordinatorLayout, V child, View target) {
        int top;
        int targetState;
        if (child.getTop() == this.mMinOffset) {
            setStateInternal(3);
        } else if (target == this.mNestedScrollingChildRef.get() && this.mNestedScrolled) {
            if (this.mLastNestedScrollDy > 0) {
                top = this.mMinOffset;
                targetState = 3;
            } else if (this.mHideable && shouldHide(child, getYVelocity())) {
                top = this.mParentHeight;
                targetState = 5;
            } else if (this.mLastNestedScrollDy == 0) {
                int currentTop = child.getTop();
                if (Math.abs(currentTop - this.mMinOffset) < Math.abs(currentTop - this.mMaxOffset)) {
                    top = this.mMinOffset;
                    targetState = 3;
                } else {
                    top = this.mMaxOffset;
                    targetState = 4;
                }
            } else {
                top = this.mMaxOffset;
                targetState = 4;
            }
            if (this.mViewDragHelper.smoothSlideViewTo(child, child.getLeft(), top)) {
                setStateInternal(2);
                ViewCompat.postOnAnimation(child, new SettleRunnable(child, targetState));
            } else {
                setStateInternal(targetState);
            }
            this.mNestedScrolled = false;
        }
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onNestedPreFling(CoordinatorLayout coordinatorLayout, V child, View target, float velocityX, float velocityY) {
        return target == this.mNestedScrollingChildRef.get() && (this.mState != 3 || super.onNestedPreFling(coordinatorLayout, child, target, velocityX, velocityY));
    }

    public final void setPeekHeight(int peekHeight) {
        this.mPeekHeight = Math.max(0, peekHeight);
        this.mMaxOffset = this.mParentHeight - peekHeight;
    }

    public final int getPeekHeight() {
        return this.mPeekHeight;
    }

    public void setHideable(boolean hideable) {
        this.mHideable = hideable;
    }

    public boolean isHideable() {
        return this.mHideable;
    }

    public void setBottomSheetCallback(BottomSheetCallback callback) {
        this.mCallback = callback;
    }

    public final void setState(int state) {
        int top;
        if (state != this.mState) {
            if (this.mViewRef == null) {
                if (state == 4 || state == 3 || (this.mHideable && state == 5)) {
                    this.mState = state;
                    return;
                }
                return;
            }
            V child = this.mViewRef.get();
            if (child != null) {
                if (state == 4) {
                    top = this.mMaxOffset;
                } else if (state == 3) {
                    top = this.mMinOffset;
                } else if (this.mHideable && state == 5) {
                    top = this.mParentHeight;
                } else {
                    throw new IllegalArgumentException("Illegal state argument: " + state);
                }
                setStateInternal(2);
                if (this.mViewDragHelper.smoothSlideViewTo(child, child.getLeft(), top)) {
                    ViewCompat.postOnAnimation(child, new SettleRunnable(child, state));
                }
            }
        }
    }

    public final int getState() {
        return this.mState;
    }

    public void forceState(int state) {
        setStateInternal(state);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStateInternal(int state) {
        if (this.mState != state) {
            this.mState = state;
            View bottomSheet = this.mViewRef.get();
            if (bottomSheet != null && this.mCallback != null) {
                this.mCallback.onStateChanged(bottomSheet, state);
            }
        }
    }

    private void reset() {
        this.mActivePointerId = -1;
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldHide(View child, float yvel) {
        if (child.getTop() < this.mMaxOffset) {
            return false;
        }
        float newTop = child.getTop() + (HIDE_FRICTION * yvel);
        return Math.abs(newTop - ((float) this.mMaxOffset)) / ((float) this.mPeekHeight) > 0.5f;
    }

    private View findScrollingChild(View view) {
        if (!(view instanceof RecyclerView)) {
            if (view instanceof ViewPager) {
                View activeView = Utils.getPagerActiveView((ViewPager) view);
                return findScrollingChild(activeView);
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                int count = group.getChildCount();
                for (int i = 0; i < count; i++) {
                    View scrollingChild = findScrollingChild(group.getChildAt(i));
                    if (scrollingChild != null) {
                        return scrollingChild;
                    }
                }
            }
            return null;
        }
        return view;
    }

    private float getYVelocity() {
        this.mVelocityTracker.computeCurrentVelocity(1000, this.mMaximumVelocity);
        return VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId);
    }

    public void dispatchOnSlide(int top) {
        View bottomSheet = this.mViewRef.get();
        if (bottomSheet != null && this.mCallback != null) {
            if (top > this.mMaxOffset) {
                this.mCallback.onSlide(bottomSheet, (this.mMaxOffset - top) / this.mPeekHeight);
            } else {
                this.mCallback.onSlide(bottomSheet, (this.mMaxOffset - top) / (this.mMaxOffset - this.mMinOffset));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class SettleRunnable implements Runnable {
        private final int mTargetState;
        private final View mView;

        SettleRunnable(View view, int targetState) {
            this.mView = view;
            this.mTargetState = targetState;
            View bottomSheet = (View) VkBottomSheetBehavior.this.mViewRef.get();
            if (bottomSheet != null && VkBottomSheetBehavior.this.mCallback != null) {
                VkBottomSheetBehavior.this.mCallback.onTargetStateChanged(bottomSheet, targetState);
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            if (VkBottomSheetBehavior.this.mViewDragHelper == null || !VkBottomSheetBehavior.this.mViewDragHelper.continueSettling(true)) {
                VkBottomSheetBehavior.this.setStateInternal(this.mTargetState);
            } else {
                ViewCompat.postOnAnimation(this.mView, this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.vk.attachpicker.widget.VkBottomSheetBehavior.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public SavedState mo460createFromParcel(Parcel source) {
                return new SavedState(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public SavedState[] mo461newArray(int size) {
                return new SavedState[size];
            }
        };
        final int state;

        public SavedState(Parcel source) {
            super(source);
            this.state = source.readInt();
        }

        public SavedState(Parcelable superState, int state) {
            super(superState);
            this.state = state;
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.state);
        }
    }

    public static <V extends View> VkBottomSheetBehavior<V> from(V view) {
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (!(params instanceof CoordinatorLayout.LayoutParams)) {
            throw new IllegalArgumentException("The view is not a child of CoordinatorLayout");
        }
        CoordinatorLayout.Behavior behavior = ((CoordinatorLayout.LayoutParams) params).getBehavior();
        if (!(behavior instanceof VkBottomSheetBehavior)) {
            throw new IllegalArgumentException("The view is not associated with BottomSheetBehavior");
        }
        return (VkBottomSheetBehavior) behavior;
    }

    static int constrain(int amount, int low, int high) {
        return amount < low ? low : amount > high ? high : amount;
    }
}
