package com.vkontakte.android.ui.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.widget.ViewDragHelper;
/* loaded from: classes3.dex */
public class SlidingUpPanelLayout extends ViewGroup {
    private static final float DEFAULT_ANCHOR_POINT = 1.0f;
    private static final boolean DEFAULT_CLIP_PANEL_FLAG = true;
    private static final int DEFAULT_FADE_COLOR = -15326157;
    private static final int DEFAULT_MIN_FLING_VELOCITY = 400;
    private static final boolean DEFAULT_OVERLAY_FLAG = false;
    private static final int DEFAULT_PANEL_HEIGHT = 68;
    private static final int DEFAULT_PARALAX_OFFSET = 0;
    private static final int DEFAULT_SHADOW_HEIGHT = 4;
    private boolean bgAll;
    private int headerPadding;
    private float mAnchorPoint;
    private int mCoveredFadeColor;
    private final Paint mCoveredFadePaint;
    private final ViewDragHelper mDragHelper;
    private View mDragView;
    private int mDragViewResId;
    private boolean mFirstLayout;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private boolean mIsScrollableViewHandlingTouch;
    private boolean mIsSlidingUp;
    private boolean mIsTouchEnabled;
    private boolean mIsUnableToDrag;
    private PanelState mLastNotDraggingSlideState;
    private View mMainView;
    private boolean mOverlayContent;
    private int mPanelHeight;
    private PanelSlideListener mPanelSlideListener;
    private int mParallaxOffset;
    private float mPrevMotionY;
    private View mScrollableView;
    private int mScrollableViewResId;
    private float mSlideOffset;
    private int mSlideRange;
    private PanelState mSlideState;
    private View mSlideableView;
    private RecyclerView mTarget;
    private final Rect mTmpRect;
    private static PanelState DEFAULT_SLIDE_STATE = PanelState.COLLAPSED;
    private static final int[] DEFAULT_ATTRS = {16842927};

    /* loaded from: classes3.dex */
    public interface PanelSlideListener {
        void onPanelAnchored(View view);

        void onPanelCollapsed(View view);

        void onPanelExpanded(View view);

        void onPanelHidden(View view);

        void onPanelSlide(View view, float f);
    }

    /* loaded from: classes3.dex */
    public enum PanelState {
        EXPANDED,
        COLLAPSED,
        ANCHORED,
        HIDDEN,
        DRAGGING
    }

    public SlidingUpPanelLayout(Context context) {
        this(context, null);
    }

    public SlidingUpPanelLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public SlidingUpPanelLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mCoveredFadeColor = DEFAULT_FADE_COLOR;
        this.mCoveredFadePaint = new Paint();
        this.mPanelHeight = -1;
        this.bgAll = false;
        this.mParallaxOffset = -1;
        this.mOverlayContent = false;
        this.mDragViewResId = -1;
        this.mSlideState = DEFAULT_SLIDE_STATE;
        this.mLastNotDraggingSlideState = null;
        this.mAnchorPoint = 1.0f;
        this.mIsScrollableViewHandlingTouch = false;
        this.headerPadding = 0;
        this.mFirstLayout = true;
        this.mTmpRect = new Rect();
        if (isInEditMode()) {
            this.mDragHelper = null;
            return;
        }
        int mMinFlingVelocity = 400;
        if (attrs != null) {
            TypedArray defAttrs = context.obtainStyledAttributes(attrs, DEFAULT_ATTRS);
            if (defAttrs != null) {
                int gravity = defAttrs.getInt(0, 0);
                setGravity(gravity);
                defAttrs.recycle();
            }
            TypedArray ta = context.obtainStyledAttributes(attrs, R.styleable.SlidingUpPanelLayout);
            if (ta != null) {
                this.mPanelHeight = ta.getDimensionPixelSize(0, -1);
                ta.getDimensionPixelSize(1, -1);
                this.mParallaxOffset = ta.getDimensionPixelSize(2, -1);
                mMinFlingVelocity = ta.getInt(4, 400);
                this.mCoveredFadeColor = ta.getColor(3, DEFAULT_FADE_COLOR);
                this.mDragViewResId = ta.getResourceId(5, -1);
                this.mScrollableViewResId = ta.getResourceId(6, -1);
                this.mOverlayContent = ta.getBoolean(7, false);
                this.mAnchorPoint = ta.getFloat(9, 1.0f);
                this.mSlideState = PanelState.values()[ta.getInt(10, DEFAULT_SLIDE_STATE.ordinal())];
                this.bgAll = ta.getBoolean(11, this.bgAll);
                ta.recycle();
            }
        }
        float density = context.getResources().getDisplayMetrics().density;
        if (this.mPanelHeight == -1) {
            this.mPanelHeight = (int) ((68.0f * density) + 0.5f);
        }
        if (this.mParallaxOffset == -1) {
            this.mParallaxOffset = (int) (0.0f * density);
        }
        setWillNotDraw(false);
        this.mDragHelper = ViewDragHelper.create(this, 0.8f, new DragHelperCallback());
        this.mDragHelper.setMinVelocity(mMinFlingVelocity * density);
        this.mIsTouchEnabled = true;
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        if (this.mDragViewResId != -1) {
            setDragView(findViewById(this.mDragViewResId));
        }
        if (this.mScrollableViewResId != -1) {
            setScrollableView(findViewById(this.mScrollableViewResId));
        }
    }

    public void setGravity(int gravity) {
        if (gravity != 48 && gravity != 80) {
            throw new IllegalArgumentException("gravity must be set to either top or bottom");
        }
        this.mIsSlidingUp = gravity == 80;
        if (!this.mFirstLayout) {
            requestLayout();
        }
    }

    public void setHeaderPadding(int headerPadding) {
        this.headerPadding = headerPadding;
    }

    public boolean isTouchEnabled() {
        return (!this.mIsTouchEnabled || this.mSlideableView == null || this.mSlideState == PanelState.HIDDEN) ? false : true;
    }

    public void smoothToBottom() {
        smoothSlideTo(0.0f, 0);
    }

    public void smoothToTop() {
        smoothSlideTo(1.0f, 0);
    }

    public int getCurrentParalaxOffset() {
        int offset = (int) (this.mParallaxOffset * Math.max(this.mSlideOffset, 0.0f));
        return this.mIsSlidingUp ? -offset : offset;
    }

    public void setPanelSlideListener(PanelSlideListener listener) {
        this.mPanelSlideListener = listener;
    }

    public void setDragView(View dragView) {
        if (this.mDragView != null) {
            this.mDragView.setOnClickListener(null);
        }
        this.mDragView = dragView;
        if (this.mDragView != null) {
            this.mDragView.setClickable(true);
            this.mDragView.setFocusable(false);
            this.mDragView.setFocusableInTouchMode(false);
            this.mDragView.setOnClickListener(SlidingUpPanelLayout$$Lambda$1.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$setDragView$0(View v) {
        if (isEnabled() && isTouchEnabled() && this.mSlideState != PanelState.EXPANDED && this.mSlideState != PanelState.ANCHORED) {
            if (this.mAnchorPoint < 1.0f) {
                setPanelState(PanelState.ANCHORED);
            } else {
                setPanelState(PanelState.EXPANDED);
            }
        }
    }

    public void setScrollableView(View scrollableView) {
        this.mScrollableView = scrollableView;
    }

    void dispatchOnPanelSlide(View panel) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelSlide(panel, this.mSlideOffset);
        }
    }

    void dispatchOnPanelExpanded(View panel) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelExpanded(panel);
        }
        sendAccessibilityEvent(32);
    }

    void dispatchOnPanelCollapsed(View panel) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelCollapsed(panel);
        }
        sendAccessibilityEvent(32);
    }

    void dispatchOnPanelAnchored(View panel) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelAnchored(panel);
        }
        sendAccessibilityEvent(32);
    }

    void dispatchOnPanelHidden(View panel) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelHidden(panel);
        }
        sendAccessibilityEvent(32);
    }

    void updateObscuredViewVisibility() {
        int bottom;
        int top;
        int right;
        int left;
        int vis;
        if (getChildCount() != 0) {
            int leftBound = getPaddingLeft();
            int rightBound = getWidth() - getPaddingRight();
            int topBound = getPaddingTop();
            int bottomBound = getHeight() - getPaddingBottom();
            if (this.mSlideableView != null && hasOpaqueBackground(this.mSlideableView)) {
                left = this.mSlideableView.getLeft();
                right = this.mSlideableView.getRight();
                top = this.mSlideableView.getTop();
                bottom = this.mSlideableView.getBottom();
            } else {
                bottom = 0;
                top = 0;
                right = 0;
                left = 0;
            }
            View child = getChildAt(0);
            int clampedChildLeft = Math.max(leftBound, child.getLeft());
            int clampedChildTop = Math.max(topBound, child.getTop());
            int clampedChildRight = Math.min(rightBound, child.getRight());
            int clampedChildBottom = Math.min(bottomBound, child.getBottom());
            if (clampedChildLeft >= left && clampedChildTop >= top && clampedChildRight <= right && clampedChildBottom <= bottom) {
                vis = 4;
            } else {
                vis = 0;
            }
            child.setVisibility(vis);
        }
    }

    void setAllChildrenVisible() {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() == 4) {
                child.setVisibility(0);
            }
        }
    }

    private static boolean hasOpaqueBackground(View v) {
        Drawable bg = v.getBackground();
        return bg != null && bg.getOpacity() == -1;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mFirstLayout = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mFirstLayout = true;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int childWidthSpec;
        int childHeightSpec;
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
        if (widthMode != 1073741824) {
            throw new IllegalStateException("Width must have an exact value or MATCH_PARENT");
        }
        if (heightMode != 1073741824) {
            throw new IllegalStateException("Height must have an exact value or MATCH_PARENT");
        }
        int childCount = getChildCount();
        if (childCount != 2) {
            throw new IllegalStateException("Sliding up panel layout must have exactly 2 children!");
        }
        this.mMainView = getChildAt(1);
        this.mSlideableView = getChildAt(0);
        if (this.mDragView == null) {
            setDragView(this.mSlideableView);
        }
        if (this.mSlideableView.getVisibility() != 0) {
            this.mSlideState = PanelState.HIDDEN;
        }
        int layoutHeight = (heightSize - getPaddingTop()) - getPaddingBottom();
        int layoutWidth = (widthSize - getPaddingLeft()) - getPaddingRight();
        for (int i = 0; i < childCount; i++) {
            View child = getChildAt(i);
            LayoutParams lp = (LayoutParams) child.getLayoutParams();
            if (child.getVisibility() != 8 || i != 0) {
                int height = layoutHeight;
                int width = layoutWidth;
                if (child == this.mMainView) {
                    if (!this.mOverlayContent && this.mSlideState != PanelState.HIDDEN) {
                        height -= this.mPanelHeight;
                    }
                    width -= lp.leftMargin + lp.rightMargin;
                } else if (child == this.mSlideableView) {
                    height -= lp.topMargin;
                }
                if (lp.width == -2) {
                    childWidthSpec = View.MeasureSpec.makeMeasureSpec(width, Integer.MIN_VALUE);
                } else if (lp.width == -1) {
                    childWidthSpec = View.MeasureSpec.makeMeasureSpec(width, 1073741824);
                } else {
                    childWidthSpec = View.MeasureSpec.makeMeasureSpec(lp.width, 1073741824);
                }
                if (lp.height == -2) {
                    childHeightSpec = View.MeasureSpec.makeMeasureSpec(height, Integer.MIN_VALUE);
                } else if (lp.height == -1) {
                    childHeightSpec = View.MeasureSpec.makeMeasureSpec(height, 1073741824);
                } else {
                    childHeightSpec = View.MeasureSpec.makeMeasureSpec(lp.height, 1073741824);
                }
                child.measure(childWidthSpec, childHeightSpec);
                if (child == this.mSlideableView) {
                    this.mSlideRange = this.mSlideableView.getMeasuredHeight() - this.mPanelHeight;
                }
            }
        }
        setMeasuredDimension(widthSize, heightSize);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int childCount = getChildCount();
        if (this.mFirstLayout) {
            switch (this.mSlideState) {
                case EXPANDED:
                    this.mSlideOffset = 1.0f;
                    break;
                case ANCHORED:
                    this.mSlideOffset = this.mAnchorPoint;
                    break;
                case HIDDEN:
                    int newTop = computePanelTopPosition(0.0f) + (this.mIsSlidingUp ? this.mPanelHeight : -this.mPanelHeight);
                    this.mSlideOffset = computeSlideOffset(newTop);
                    break;
                default:
                    this.mSlideOffset = 0.0f;
                    break;
            }
        }
        for (int i = 0; i < childCount; i++) {
            View child = getChildAt(i);
            LayoutParams lp = (LayoutParams) child.getLayoutParams();
            if (child.getVisibility() != 8 || (i != 0 && !this.mFirstLayout)) {
                int childHeight = child.getMeasuredHeight();
                int childTop = paddingTop;
                if (child == this.mSlideableView) {
                    childTop = computePanelTopPosition(this.mSlideOffset);
                }
                if (!this.mIsSlidingUp && child == this.mMainView && !this.mOverlayContent) {
                    childTop = computePanelTopPosition(this.mSlideOffset) + this.mSlideableView.getMeasuredHeight();
                }
                int childBottom = childTop + childHeight;
                int childLeft = paddingLeft + lp.leftMargin;
                int childRight = childLeft + child.getMeasuredWidth();
                child.layout(childLeft, childTop, childRight, childBottom);
            }
        }
        if (this.mFirstLayout) {
            updateObscuredViewVisibility();
        }
        applyParallaxForCurrentSlideOffset();
        this.mFirstLayout = false;
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (h != oldh) {
            this.mFirstLayout = true;
        }
    }

    private boolean canChildScrollUp() {
        if (this.mTarget == null) {
            return false;
        }
        if (Build.VERSION.SDK_INT < 14) {
            RecyclerView absListView = this.mTarget;
            int firstVisiblePosition = ((LinearLayoutManager) absListView.getLayoutManager()).findFirstVisibleItemPosition();
            return absListView.getChildCount() > 0 && (firstVisiblePosition > 0 || absListView.getChildAt(0).getTop() < absListView.getPaddingTop());
        }
        return ViewCompat.canScrollVertically(this.mTarget, -1);
    }

    private boolean touchOnTarget(MotionEvent event) {
        if (this.mTarget != null) {
            int dy = getPaddingTop() + this.headerPadding;
            int top = this.mTarget.getTop() + dy;
            int bottom = this.mTarget.getBottom() + dy;
            return ((float) top) < event.getY() && ((float) bottom) > event.getY();
        }
        return false;
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        if (!touchOnTarget(ev) || !canChildScrollUp()) {
            if (ev.getAction() == 2 && !this.mDragHelper.isDragging() && this.mInitialMotionY > ev.getY()) {
                return false;
            }
            if (this.mIsScrollableViewHandlingTouch) {
                this.mDragHelper.cancel();
                return false;
            }
            int action = MotionEventCompat.getActionMasked(ev);
            float x = ev.getX();
            float y = ev.getY();
            switch (action) {
                case 0:
                    this.mIsUnableToDrag = false;
                    this.mInitialMotionX = x;
                    this.mInitialMotionY = y;
                    break;
                case 1:
                case 3:
                    if (this.mDragHelper.isDragging()) {
                        this.mDragHelper.processTouchEvent(ev);
                        return true;
                    }
                    break;
                case 2:
                    float adx = Math.abs(x - this.mInitialMotionX);
                    float ady = Math.abs(y - this.mInitialMotionY);
                    int dragSlop = this.mDragHelper.getTouchSlop();
                    if ((ady > dragSlop && adx > ady) || !isViewUnder(this.mDragView, (int) this.mInitialMotionX, (int) this.mInitialMotionY)) {
                        this.mDragHelper.cancel();
                        this.mIsUnableToDrag = true;
                        return false;
                    }
                    break;
            }
            return this.mDragHelper.shouldInterceptTouchEvent(ev);
        }
        return false;
    }

    @Override // android.view.View
    public boolean onTouchEvent(@NonNull MotionEvent ev) {
        if (!isEnabled() || !isTouchEnabled()) {
            return super.onTouchEvent(ev);
        }
        try {
            this.mDragHelper.processTouchEvent(ev);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(@NonNull MotionEvent ev) {
        int i = -1;
        int action = MotionEventCompat.getActionMasked(ev);
        if (!isEnabled() || !isTouchEnabled() || (this.mIsUnableToDrag && action != 0)) {
            this.mDragHelper.cancel();
            return super.dispatchTouchEvent(ev);
        }
        float y = ev.getY();
        if (action == 0) {
            this.mIsScrollableViewHandlingTouch = false;
            this.mPrevMotionY = y;
        } else if (action == 2) {
            float dy = y - this.mPrevMotionY;
            this.mPrevMotionY = y;
            if (!isViewUnder(this.mScrollableView, (int) this.mInitialMotionX, (int) this.mInitialMotionY)) {
                return super.dispatchTouchEvent(ev);
            }
            if ((this.mIsSlidingUp ? 1 : -1) * dy > 0.0f) {
                if (getScrollableViewScrollPosition() > 0) {
                    this.mIsScrollableViewHandlingTouch = true;
                    return super.dispatchTouchEvent(ev);
                }
                if (this.mIsScrollableViewHandlingTouch) {
                    MotionEvent up = MotionEvent.obtain(ev);
                    up.setAction(3);
                    super.dispatchTouchEvent(up);
                    up.recycle();
                    ev.setAction(0);
                }
                this.mIsScrollableViewHandlingTouch = false;
                return onTouchEvent(ev);
            }
            if (this.mIsSlidingUp) {
                i = 1;
            }
            if (i * dy < 0.0f) {
                if (this.mSlideOffset < 1.0f) {
                    this.mIsScrollableViewHandlingTouch = false;
                    return onTouchEvent(ev);
                }
                if (!this.mIsScrollableViewHandlingTouch && this.mDragHelper.isDragging()) {
                    this.mDragHelper.cancel();
                    ev.setAction(0);
                }
                this.mIsScrollableViewHandlingTouch = true;
                return super.dispatchTouchEvent(ev);
            }
        } else if (action == 1 && this.mIsScrollableViewHandlingTouch) {
            this.mDragHelper.setDragState(0);
        }
        return super.dispatchTouchEvent(ev);
    }

    private boolean isViewUnder(View view, int x, int y) {
        boolean z = true;
        if (view == null) {
            return false;
        }
        int[] viewLocation = new int[2];
        view.getLocationOnScreen(viewLocation);
        int[] parentLocation = new int[2];
        getLocationOnScreen(parentLocation);
        int screenX = parentLocation[0] + x;
        int screenY = parentLocation[1] + y;
        if (screenX < viewLocation[0] || screenX >= viewLocation[0] + view.getWidth() || screenY < viewLocation[1] || screenY >= viewLocation[1] + view.getHeight()) {
            z = false;
        }
        return z;
    }

    public void setTarget(RecyclerView mTarget) {
        this.mTarget = mTarget;
    }

    private int getScrollableViewScrollPosition() {
        if (this.mTarget != null && this.mTarget.getChildCount() > 0) {
            RecyclerView lv = this.mTarget;
            if (lv.mo1204getAdapter() == null) {
                return 0;
            }
            if (this.mIsSlidingUp) {
                View firstChild = lv.getChildAt(0);
                int firstVisiblePosition = ((LinearLayoutManager) lv.getLayoutManager()).findFirstVisibleItemPosition();
                return (firstChild.getHeight() * firstVisiblePosition) - firstChild.getTop();
            }
            int lastVisiblePosition = ((LinearLayoutManager) lv.getLayoutManager()).findLastVisibleItemPosition();
            View lastChild = lv.getChildAt(lv.getChildCount() - 1);
            return ((((lv.mo1204getAdapter().getItemCount() - lastVisiblePosition) - 1) * lastChild.getHeight()) + lastChild.getBottom()) - lv.getBottom();
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int computePanelTopPosition(float slideOffset) {
        int slidingViewHeight = this.mSlideableView != null ? this.mSlideableView.getMeasuredHeight() : 0;
        int slidePixelOffset = (int) (this.mSlideRange * slideOffset);
        if (this.mIsSlidingUp) {
            return ((getMeasuredHeight() - getPaddingBottom()) - this.mPanelHeight) - slidePixelOffset;
        }
        return (getPaddingTop() - slidingViewHeight) + this.mPanelHeight + slidePixelOffset;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public float computeSlideOffset(int topPosition) {
        int topBoundCollapsed = computePanelTopPosition(0.0f);
        return this.mIsSlidingUp ? (topBoundCollapsed - topPosition) / this.mSlideRange : (topPosition - topBoundCollapsed) / this.mSlideRange;
    }

    public void setPanelState(PanelState state) {
        if (state == null || state == PanelState.DRAGGING) {
            throw new IllegalArgumentException("Panel state cannot be null or DRAGGING.");
        }
        if (!isEnabled()) {
            return;
        }
        if ((this.mFirstLayout || this.mSlideableView != null) && state != this.mSlideState && this.mSlideState != PanelState.DRAGGING) {
            if (this.mFirstLayout) {
                this.mSlideState = state;
                return;
            }
            if (this.mSlideState == PanelState.HIDDEN) {
                this.mSlideableView.setVisibility(0);
                requestLayout();
            }
            switch (state) {
                case EXPANDED:
                    smoothSlideTo(1.0f, 0);
                    return;
                case ANCHORED:
                    smoothSlideTo(this.mAnchorPoint, 0);
                    return;
                case HIDDEN:
                    int newTop = computePanelTopPosition(0.0f) + (this.mIsSlidingUp ? this.mPanelHeight : -this.mPanelHeight);
                    smoothSlideTo(computeSlideOffset(newTop), 0);
                    return;
                case COLLAPSED:
                    smoothSlideTo(0.0f, 0);
                    return;
                default:
                    return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @SuppressLint({"NewApi"})
    public void applyParallaxForCurrentSlideOffset() {
        if (this.mParallaxOffset > 0) {
            int mainViewOffset = getCurrentParalaxOffset();
            if (Build.VERSION.SDK_INT >= 11) {
                this.mMainView.setTranslationY(mainViewOffset);
            } else {
                ViewCompat.setTranslationY(this.mMainView, mainViewOffset);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onPanelDragged(int newTop) {
        this.mLastNotDraggingSlideState = this.mSlideState;
        this.mSlideState = PanelState.DRAGGING;
        this.mSlideOffset = computeSlideOffset(newTop);
        applyParallaxForCurrentSlideOffset();
        dispatchOnPanelSlide(this.mSlideableView);
        LayoutParams lp = (LayoutParams) this.mMainView.getLayoutParams();
        int defaultHeight = ((getHeight() - getPaddingBottom()) - getPaddingTop()) - this.mPanelHeight;
        if (this.mSlideOffset <= 0.0f && !this.mOverlayContent) {
            lp.height = this.mIsSlidingUp ? newTop - getPaddingBottom() : ((getHeight() - getPaddingBottom()) - this.mSlideableView.getMeasuredHeight()) - newTop;
            this.mMainView.requestLayout();
        } else if (lp.height != defaultHeight && !this.mOverlayContent) {
            lp.height = defaultHeight;
            this.mMainView.requestLayout();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        int save = canvas.save(2);
        if (this.mSlideableView != null) {
            canvas.getClipBounds(this.mTmpRect);
            this.mTmpRect.bottom = this.bgAll ? getHeight() : this.mSlideableView.getTop() + this.mSlideableView.getPaddingTop();
            this.mTmpRect.top = 0;
            if (this.mCoveredFadeColor != 0 && this.mSlideOffset > 0.0f) {
                int baseAlpha = (this.mCoveredFadeColor & ViewCompat.MEASURED_STATE_MASK) >>> 24;
                int imag = (int) (baseAlpha * this.mSlideOffset);
                int color = (imag << 24) | (this.mCoveredFadeColor & ViewCompat.MEASURED_SIZE_MASK);
                this.mCoveredFadePaint.setColor(color);
                canvas.drawRect(this.mTmpRect, this.mCoveredFadePaint);
            }
        }
        canvas.restoreToCount(save);
        super.dispatchDraw(canvas);
    }

    boolean smoothSlideTo(float slideOffset, int velocity) {
        if (!isEnabled() || this.mSlideableView == null) {
            return false;
        }
        int panelTop = computePanelTopPosition(slideOffset);
        if (!this.mDragHelper.smoothSlideViewTo(this.mSlideableView, this.mSlideableView.getLeft(), panelTop)) {
            return false;
        }
        setAllChildrenVisible();
        ViewCompat.postInvalidateOnAnimation(this);
        return true;
    }

    @Override // android.view.View
    public void computeScroll() {
        if (this.mDragHelper != null && this.mDragHelper.continueSettling(true)) {
            if (!isEnabled()) {
                this.mDragHelper.abort();
            } else {
                ViewCompat.postInvalidateOnAnimation(this);
            }
        }
    }

    protected boolean canScroll(View v, boolean checkV, int dx, int x, int y) {
        if (v instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) v;
            int scrollX = v.getScrollX();
            int scrollY = v.getScrollY();
            int count = group.getChildCount();
            for (int i = count - 1; i >= 0; i--) {
                View child = group.getChildAt(i);
                if (x + scrollX >= child.getLeft() && x + scrollX < child.getRight() && y + scrollY >= child.getTop() && y + scrollY < child.getBottom() && canScroll(child, true, dx, (x + scrollX) - child.getLeft(), (y + scrollY) - child.getTop())) {
                    return true;
                }
            }
        }
        return checkV && ViewCompat.canScrollHorizontally(v, -dx);
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof ViewGroup.MarginLayoutParams ? new LayoutParams((ViewGroup.MarginLayoutParams) p) : new LayoutParams(p);
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return (p instanceof LayoutParams) && super.checkLayoutParams(p);
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        if (this.mSlideState != PanelState.DRAGGING) {
            ss.mSlideState = this.mSlideState;
        } else {
            ss.mSlideState = this.mLastNotDraggingSlideState;
        }
        return ss;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        this.mSlideState = ss.mSlideState != null ? ss.mSlideState : DEFAULT_SLIDE_STATE;
    }

    /* loaded from: classes3.dex */
    private class DragHelperCallback extends ViewDragHelper.Callback {
        private DragHelperCallback() {
        }

        @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
        public boolean tryCaptureView(View child, int pointerId) {
            return !SlidingUpPanelLayout.this.mIsUnableToDrag && child == SlidingUpPanelLayout.this.mSlideableView;
        }

        @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
        public void onViewDragStateChanged(int state) {
            if (SlidingUpPanelLayout.this.mDragHelper.getViewDragState() == 0) {
                SlidingUpPanelLayout.this.mSlideOffset = SlidingUpPanelLayout.this.computeSlideOffset(SlidingUpPanelLayout.this.mSlideableView.getTop());
                SlidingUpPanelLayout.this.applyParallaxForCurrentSlideOffset();
                if (SlidingUpPanelLayout.this.mSlideOffset == 1.0f) {
                    if (SlidingUpPanelLayout.this.mSlideState != PanelState.EXPANDED) {
                        SlidingUpPanelLayout.this.updateObscuredViewVisibility();
                        SlidingUpPanelLayout.this.mSlideState = PanelState.EXPANDED;
                        SlidingUpPanelLayout.this.dispatchOnPanelExpanded(SlidingUpPanelLayout.this.mSlideableView);
                    }
                } else if (SlidingUpPanelLayout.this.mSlideOffset == 0.0f) {
                    if (SlidingUpPanelLayout.this.mSlideState != PanelState.COLLAPSED) {
                        SlidingUpPanelLayout.this.mSlideState = PanelState.COLLAPSED;
                        SlidingUpPanelLayout.this.dispatchOnPanelCollapsed(SlidingUpPanelLayout.this.mSlideableView);
                    }
                } else if (SlidingUpPanelLayout.this.mSlideOffset >= 0.0f) {
                    if (SlidingUpPanelLayout.this.mSlideState != PanelState.ANCHORED) {
                        SlidingUpPanelLayout.this.updateObscuredViewVisibility();
                        SlidingUpPanelLayout.this.mSlideState = PanelState.ANCHORED;
                        SlidingUpPanelLayout.this.dispatchOnPanelAnchored(SlidingUpPanelLayout.this.mSlideableView);
                    }
                } else {
                    SlidingUpPanelLayout.this.mSlideState = PanelState.HIDDEN;
                    SlidingUpPanelLayout.this.mSlideableView.setVisibility(4);
                    SlidingUpPanelLayout.this.dispatchOnPanelHidden(SlidingUpPanelLayout.this.mSlideableView);
                }
            }
        }

        @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
        public void onViewCaptured(View capturedChild, int activePointerId) {
            SlidingUpPanelLayout.this.setAllChildrenVisible();
        }

        @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
        public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
            SlidingUpPanelLayout.this.onPanelDragged(top);
            SlidingUpPanelLayout.this.invalidate();
        }

        @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
        public void onViewReleased(View releasedChild, float xvel, float yvel) {
            int target;
            float direction = SlidingUpPanelLayout.this.mIsSlidingUp ? -yvel : yvel;
            if (direction > 0.0f && SlidingUpPanelLayout.this.mSlideOffset <= SlidingUpPanelLayout.this.mAnchorPoint) {
                target = SlidingUpPanelLayout.this.computePanelTopPosition(SlidingUpPanelLayout.this.mAnchorPoint);
            } else {
                target = (direction <= 0.0f || SlidingUpPanelLayout.this.mSlideOffset <= SlidingUpPanelLayout.this.mAnchorPoint) ? (direction >= 0.0f || SlidingUpPanelLayout.this.mSlideOffset < SlidingUpPanelLayout.this.mAnchorPoint) ? (direction >= 0.0f || SlidingUpPanelLayout.this.mSlideOffset >= SlidingUpPanelLayout.this.mAnchorPoint) ? SlidingUpPanelLayout.this.mSlideOffset >= (SlidingUpPanelLayout.this.mAnchorPoint + 1.0f) / 2.0f ? SlidingUpPanelLayout.this.computePanelTopPosition(1.0f) : SlidingUpPanelLayout.this.mSlideOffset >= SlidingUpPanelLayout.this.mAnchorPoint / 2.0f ? SlidingUpPanelLayout.this.computePanelTopPosition(SlidingUpPanelLayout.this.mAnchorPoint) : SlidingUpPanelLayout.this.computePanelTopPosition(0.0f) : SlidingUpPanelLayout.this.computePanelTopPosition(0.0f) : SlidingUpPanelLayout.this.computePanelTopPosition(SlidingUpPanelLayout.this.mAnchorPoint) : SlidingUpPanelLayout.this.computePanelTopPosition(1.0f);
            }
            SlidingUpPanelLayout.this.mDragHelper.settleCapturedViewAt(releasedChild.getLeft(), target);
            SlidingUpPanelLayout.this.invalidate();
        }

        @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
        public int getViewVerticalDragRange(View child) {
            return SlidingUpPanelLayout.this.mSlideRange;
        }

        @Override // com.vkontakte.android.ui.widget.ViewDragHelper.Callback
        public int clampViewPositionVertical(View child, int top, int dy) {
            int collapsedTop = SlidingUpPanelLayout.this.computePanelTopPosition(0.0f);
            int expandedTop = SlidingUpPanelLayout.this.computePanelTopPosition(1.0f);
            return SlidingUpPanelLayout.this.mIsSlidingUp ? Math.min(Math.max(top, expandedTop), collapsedTop) : Math.min(Math.max(top, collapsedTop), expandedTop);
        }
    }

    /* loaded from: classes3.dex */
    public static class LayoutParams extends ViewGroup.MarginLayoutParams {
        private static final int[] ATTRS = {16843137};

        public LayoutParams() {
            super(-1, -1);
        }

        public LayoutParams(int width, int height) {
            super(width, height);
        }

        public LayoutParams(ViewGroup.LayoutParams source) {
            super(source);
        }

        public LayoutParams(ViewGroup.MarginLayoutParams source) {
            super(source);
        }

        public LayoutParams(LayoutParams source) {
            super((ViewGroup.MarginLayoutParams) source);
        }

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
            TypedArray a = c.obtainStyledAttributes(attrs, ATTRS);
            a.recycle();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.vkontakte.android.ui.widget.SlidingUpPanelLayout.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public SavedState mo1108createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public SavedState[] mo1109newArray(int size) {
                return new SavedState[size];
            }
        };
        PanelState mSlideState;

        SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            try {
                this.mSlideState = (PanelState) Enum.valueOf(PanelState.class, in.readString());
            } catch (IllegalArgumentException e) {
                this.mSlideState = PanelState.COLLAPSED;
            }
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeString(this.mSlideState.toString());
        }
    }
}
