package com.vkontakte.android.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ListView;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class CustomSlidingDrawer extends ViewGroup {
    private static final int ANIMATION_FRAME_DURATION = 16;
    private static final int COLLAPSED_FULL_CLOSED = -10002;
    private static final int EXPANDED_FULL_OPEN = -10001;
    private static final float MAXIMUM_ACCELERATION = 2000.0f;
    private static final float MAXIMUM_MAJOR_VELOCITY = 200.0f;
    private static final float MAXIMUM_MINOR_VELOCITY = 150.0f;
    private static final float MAXIMUM_TAP_VELOCITY = 100.0f;
    private static final int MSG_ANIMATE = 1000;
    public static final int ORIENTATION_HORIZONTAL = 0;
    public static final int ORIENTATION_VERTICAL = 1;
    private static final int TAP_THRESHOLD = 6;
    private static final int VELOCITY_UNITS = 1000;
    private float downY;
    private boolean mAllowSingleTap;
    private boolean mAnimateOnClick;
    private float mAnimatedAcceleration;
    private float mAnimatedVelocity;
    private boolean mAnimating;
    private long mAnimationLastTime;
    private float mAnimationPosition;
    private int mBottomOffset;
    private View mContent;
    private int mContentId;
    private long mCurrentAnimationTime;
    private boolean mExpanded;
    private final Rect mFrame;
    private View mHandle;
    private int mHandleHeight;
    private int mHandleId;
    private int mHandleWidth;
    private final Handler mHandler;
    private final Rect mInvalidate;
    private boolean mLocked;
    private final int mMaximumAcceleration;
    private final int mMaximumMajorVelocity;
    private final int mMaximumMinorVelocity;
    private final int mMaximumTapVelocity;
    private OnDrawerCloseListener mOnDrawerCloseListener;
    private OnDrawerOpenListener mOnDrawerOpenListener;
    private OnDrawerScrollListener mOnDrawerScrollListener;
    private final int mTapThreshold;
    private int mTopOffset;
    private int mTouchDelta;
    private boolean mTracking;
    private VelocityTracker mVelocityTracker;
    private final int mVelocityUnits;
    private boolean mVertical;
    private float touchslop;

    /* loaded from: classes3.dex */
    public interface OnDrawerCloseListener {
        void onDrawerClosed();
    }

    /* loaded from: classes3.dex */
    public interface OnDrawerOpenListener {
        void onDrawerOpened();
    }

    /* loaded from: classes3.dex */
    public interface OnDrawerScrollListener {
        void onScrollEnded();

        void onScrollStarted();
    }

    public CustomSlidingDrawer(Context context, View handle, View content) {
        this(context, null, 0, -1, -2);
        this.mHandle = handle;
        this.mContent = content;
        content.setVisibility(8);
    }

    public CustomSlidingDrawer(Context context, AttributeSet attrs) {
        this(context, attrs, 0, 0, 0);
    }

    public CustomSlidingDrawer(Context context, AttributeSet attrs, int defStyle) {
        this(context, attrs, defStyle, 0, 0);
    }

    public CustomSlidingDrawer(Context context, AttributeSet attrs, int defStyle, int handleId, int contentId) {
        super(context, attrs, defStyle);
        this.mHandleId = 0;
        this.mContentId = 0;
        this.mFrame = new Rect();
        this.mInvalidate = new Rect();
        this.mHandler = new SlidingHandler();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.SlidingDrawer, defStyle, 0);
        int orientation = a.getInt(0, 1);
        this.mVertical = orientation == 1;
        this.mBottomOffset = (int) a.getDimension(3, 0.0f);
        this.mTopOffset = (int) a.getDimension(4, 0.0f);
        this.mAllowSingleTap = a.getBoolean(5, false);
        this.mAnimateOnClick = a.getBoolean(6, true);
        this.touchslop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
        int handleId2 = a.getResourceId(1, handleId);
        if (handleId2 == 0) {
            throw new IllegalArgumentException("The handle attribute is required and must refer to a valid child.");
        }
        int contentId2 = a.getResourceId(2, contentId);
        if (contentId2 == 0) {
            throw new IllegalArgumentException("The content attribute is required and must refer to a valid child.");
        }
        if (handleId2 == contentId2) {
            throw new IllegalArgumentException("The content and handle attributes must refer to different children.");
        }
        this.mHandleId = handleId2;
        this.mContentId = contentId2;
        float density = getResources().getDisplayMetrics().density;
        this.mTapThreshold = (int) ((6.0f * density) + 0.5f);
        this.mMaximumTapVelocity = (int) ((MAXIMUM_TAP_VELOCITY * density) + 0.5f);
        this.mMaximumMinorVelocity = (int) ((MAXIMUM_MINOR_VELOCITY * density) + 0.5f);
        this.mMaximumMajorVelocity = (int) ((MAXIMUM_MAJOR_VELOCITY * density) + 0.5f);
        this.mMaximumAcceleration = (int) ((MAXIMUM_ACCELERATION * density) + 0.5f);
        this.mVelocityUnits = (int) ((1000.0f * density) + 0.5f);
        a.recycle();
        setAlwaysDrawnWithCacheEnabled(false);
        if (Build.VERSION.SDK_INT < 11) {
            setWillNotDraw(false);
        }
    }

    public void setTopOffset(int off) {
        this.mTopOffset = off;
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        if (this.mHandle == null) {
            this.mHandle = findViewById(this.mHandleId);
        }
        if (this.mHandle == null) {
            throw new IllegalArgumentException("The handle attribute is must refer to an existing child.");
        }
        if (this.mContent == null) {
            this.mContent = findViewById(this.mContentId);
        }
        if (this.mContent == null) {
            throw new IllegalArgumentException("The content attribute is must refer to an existing child.");
        }
        this.mContent.setVisibility(8);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthSpecMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int widthSpecSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int heightSpecMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int heightSpecSize = View.MeasureSpec.getSize(heightMeasureSpec);
        if (widthSpecMode == 0 || heightSpecMode == 0) {
            throw new RuntimeException("SlidingDrawer cannot have UNSPECIFIED dimensions");
        }
        View handle = this.mHandle;
        measureChild(handle, widthMeasureSpec, heightMeasureSpec);
        if (this.mVertical) {
            int height = (heightSpecSize - handle.getMeasuredHeight()) - this.mTopOffset;
            this.mContent.measure(View.MeasureSpec.makeMeasureSpec(widthSpecSize, 1073741824), View.MeasureSpec.makeMeasureSpec(height, 1073741824));
        } else {
            int width = (widthSpecSize - handle.getMeasuredWidth()) - this.mTopOffset;
            this.mContent.measure(View.MeasureSpec.makeMeasureSpec(width, 1073741824), View.MeasureSpec.makeMeasureSpec(heightSpecSize, 1073741824));
        }
        setMeasuredDimension(widthSpecSize, heightSpecSize);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        float f = 0.0f;
        long drawingTime = getDrawingTime();
        View handle = this.mHandle;
        boolean isVertical = this.mVertical;
        drawChild(canvas, handle, drawingTime);
        if (this.mTracking || this.mAnimating) {
            Bitmap cache = this.mContent.getDrawingCache();
            if (cache != null) {
                if (isVertical) {
                    canvas.drawBitmap(cache, 0.0f, handle.getBottom(), (Paint) null);
                    return;
                } else {
                    canvas.drawBitmap(cache, handle.getRight(), 0.0f, (Paint) null);
                    return;
                }
            }
            canvas.save();
            float left = isVertical ? 0.0f : handle.getLeft() - this.mTopOffset;
            if (isVertical) {
                f = handle.getTop() - this.mTopOffset;
            }
            canvas.translate(left, f);
            drawChild(canvas, this.mContent, drawingTime);
            canvas.restore();
        } else if (this.mExpanded) {
            drawChild(canvas, this.mContent, drawingTime);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int childLeft;
        int childTop;
        if (!this.mTracking) {
            int width = r - l;
            int height = b - t;
            View handle = this.mHandle;
            int childWidth = handle.getMeasuredWidth();
            int childHeight = handle.getMeasuredHeight();
            View content = this.mContent;
            if (this.mVertical) {
                childLeft = (width - childWidth) / 2;
                childTop = this.mExpanded ? this.mTopOffset : (height - childHeight) + this.mBottomOffset;
                content.layout(0, this.mTopOffset + childHeight, content.getMeasuredWidth(), this.mTopOffset + childHeight + content.getMeasuredHeight());
            } else {
                childLeft = this.mExpanded ? this.mTopOffset : (width - childWidth) + this.mBottomOffset;
                childTop = (height - childHeight) / 2;
                content.layout(this.mTopOffset + childWidth, 0, this.mTopOffset + childWidth + content.getMeasuredWidth(), content.getMeasuredHeight());
            }
            handle.layout(childLeft, childTop, childLeft + childWidth, childTop + childHeight);
            this.mHandleHeight = handle.getHeight();
            this.mHandleWidth = handle.getWidth();
        }
    }

    private boolean checkListView() {
        if (findViewById(16908298) != null) {
            ListView list = (ListView) findViewById(16908298);
            return list.getFirstVisiblePosition() == 0 && list.getChildAt(0).getTop() == 0;
        }
        return false;
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent event) {
        if (this.mLocked) {
            return false;
        }
        int action = event.getAction();
        float x = event.getX();
        float y = event.getY();
        Rect frame = this.mFrame;
        View handle = this.mHandle;
        if (action == 0) {
            this.downY = event.getY();
            return false;
        }
        handle.getHitRect(frame);
        Log.d("vk", "DownY = " + this.downY + "; y=" + y);
        if (!this.mTracking && !frame.contains((int) x, (int) y) && this.mExpanded && (!checkListView() || this.downY >= y)) {
            return false;
        }
        if ((action == 2 || action == 1) && Math.abs(this.downY - event.getY()) < this.touchslop) {
            return false;
        }
        this.mTracking = true;
        prepareContent();
        if (this.mOnDrawerScrollListener != null) {
            this.mOnDrawerScrollListener.onScrollStarted();
        }
        if (this.mVertical) {
            int top = this.mHandle.getTop();
            this.mTouchDelta = ((int) y) - top;
            prepareTracking(top);
        } else {
            int left = this.mHandle.getLeft();
            this.mTouchDelta = ((int) x) - left;
            prepareTracking(left);
        }
        this.mVelocityTracker.addMovement(event);
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:48:0x00b0, code lost:
        if (r14.mAllowSingleTap == false) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00b2, code lost:
        playSoundEffect(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00b8, code lost:
        if (r14.mExpanded == false) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00ba, code lost:
        if (r6 == false) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00bc, code lost:
        animateClose(r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0107, code lost:
        r3 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0109, code lost:
        if (r6 == false) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x010b, code lost:
        animateOpen(r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x0110, code lost:
        r3 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0112, code lost:
        if (r6 == false) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0114, code lost:
        performFling(r3, r4, false);
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x011a, code lost:
        r3 = r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:81:0x011c  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean onTouchEvent(android.view.MotionEvent r15) {
        /*
            Method dump skipped, instructions count: 310
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.ui.CustomSlidingDrawer.onTouchEvent(android.view.MotionEvent):boolean");
    }

    private void animateClose(int position) {
        prepareTracking(position);
        performFling(position, this.mMaximumAcceleration, true);
    }

    private void animateOpen(int position) {
        prepareTracking(position);
        performFling(position, -this.mMaximumAcceleration, true);
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x0082, code lost:
        if (r8 > (-r6.mMaximumMajorVelocity)) goto L34;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void performFling(int r7, float r8, boolean r9) {
        /*
            r6 = this;
            r5 = 1000(0x3e8, float:1.401E-42)
            r4 = 0
            float r2 = (float) r7
            r6.mAnimationPosition = r2
            r6.mAnimatedVelocity = r8
            boolean r2 = r6.mExpanded
            if (r2 == 0) goto L67
            if (r9 != 0) goto L28
            int r2 = r6.mMaximumMajorVelocity
            float r2 = (float) r2
            int r2 = (r8 > r2 ? 1 : (r8 == r2 ? 0 : -1))
            if (r2 > 0) goto L28
            int r3 = r6.mTopOffset
            boolean r2 = r6.mVertical
            if (r2 == 0) goto L57
            int r2 = r6.mHandleHeight
        L1d:
            int r2 = r2 + r3
            if (r7 <= r2) goto L5a
            int r2 = r6.mMaximumMajorVelocity
            int r2 = -r2
            float r2 = (float) r2
            int r2 = (r8 > r2 ? 1 : (r8 == r2 ? 0 : -1))
            if (r2 <= 0) goto L5a
        L28:
            int r2 = r6.mMaximumAcceleration
            float r2 = (float) r2
            r6.mAnimatedAcceleration = r2
            int r2 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r2 >= 0) goto L33
            r6.mAnimatedVelocity = r4
        L33:
            long r0 = android.os.SystemClock.uptimeMillis()
            r6.mAnimationLastTime = r0
            r2 = 16
            long r2 = r2 + r0
            r6.mCurrentAnimationTime = r2
            r2 = 1
            r6.mAnimating = r2
            android.os.Handler r2 = r6.mHandler
            r2.removeMessages(r5)
            android.os.Handler r2 = r6.mHandler
            android.os.Handler r3 = r6.mHandler
            android.os.Message r3 = r3.obtainMessage(r5)
            long r4 = r6.mCurrentAnimationTime
            r2.sendMessageAtTime(r3, r4)
            r6.stopTracking()
            return
        L57:
            int r2 = r6.mHandleWidth
            goto L1d
        L5a:
            int r2 = r6.mMaximumAcceleration
            int r2 = -r2
            float r2 = (float) r2
            r6.mAnimatedAcceleration = r2
            int r2 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r2 <= 0) goto L33
            r6.mAnimatedVelocity = r4
            goto L33
        L67:
            if (r9 != 0) goto L95
            int r2 = r6.mMaximumMajorVelocity
            float r2 = (float) r2
            int r2 = (r8 > r2 ? 1 : (r8 == r2 ? 0 : -1))
            if (r2 > 0) goto L84
            boolean r2 = r6.mVertical
            if (r2 == 0) goto L90
            int r2 = r6.getHeight()
        L78:
            int r2 = r2 / 2
            if (r7 <= r2) goto L95
            int r2 = r6.mMaximumMajorVelocity
            int r2 = -r2
            float r2 = (float) r2
            int r2 = (r8 > r2 ? 1 : (r8 == r2 ? 0 : -1))
            if (r2 <= 0) goto L95
        L84:
            int r2 = r6.mMaximumAcceleration
            float r2 = (float) r2
            r6.mAnimatedAcceleration = r2
            int r2 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r2 >= 0) goto L33
            r6.mAnimatedVelocity = r4
            goto L33
        L90:
            int r2 = r6.getWidth()
            goto L78
        L95:
            int r2 = r6.mMaximumAcceleration
            int r2 = -r2
            float r2 = (float) r2
            r6.mAnimatedAcceleration = r2
            int r2 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r2 <= 0) goto L33
            r6.mAnimatedVelocity = r4
            goto L33
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.ui.CustomSlidingDrawer.performFling(int, float, boolean):void");
    }

    private void prepareTracking(int position) {
        this.mTracking = true;
        this.mVelocityTracker = VelocityTracker.obtain();
        boolean opening = !this.mExpanded;
        if (opening) {
            this.mAnimatedAcceleration = this.mMaximumAcceleration;
            this.mAnimatedVelocity = this.mMaximumMajorVelocity;
            this.mAnimationPosition = (this.mVertical ? getHeight() - this.mHandleHeight : getWidth() - this.mHandleWidth) + this.mBottomOffset;
            moveHandle((int) this.mAnimationPosition);
            this.mAnimating = true;
            this.mHandler.removeMessages(1000);
            long now = SystemClock.uptimeMillis();
            this.mAnimationLastTime = now;
            this.mCurrentAnimationTime = 16 + now;
            this.mAnimating = true;
            return;
        }
        if (this.mAnimating) {
            this.mAnimating = false;
            this.mHandler.removeMessages(1000);
        }
        moveHandle(position);
    }

    private void moveHandle(int position) {
        View handle = this.mHandle;
        if (this.mVertical) {
            if (position == EXPANDED_FULL_OPEN) {
                handle.offsetTopAndBottom(this.mTopOffset - handle.getTop());
                invalidate();
            } else if (position == COLLAPSED_FULL_CLOSED) {
                handle.offsetTopAndBottom((((this.mBottomOffset + getBottom()) - getTop()) - this.mHandleHeight) - handle.getTop());
                invalidate();
            } else {
                int top = handle.getTop();
                int deltaY = position - top;
                if (position < this.mTopOffset) {
                    deltaY = this.mTopOffset - top;
                } else if (deltaY > (((this.mBottomOffset + getBottom()) - getTop()) - this.mHandleHeight) - top) {
                    deltaY = (((this.mBottomOffset + getBottom()) - getTop()) - this.mHandleHeight) - top;
                }
                handle.offsetTopAndBottom(deltaY);
                Rect frame = this.mFrame;
                Rect region = this.mInvalidate;
                handle.getHitRect(frame);
                region.set(frame);
                region.union(frame.left, frame.top - deltaY, frame.right, frame.bottom - deltaY);
                region.union(0, frame.bottom - deltaY, getWidth(), (frame.bottom - deltaY) + this.mContent.getHeight());
                if (Build.VERSION.SDK_INT >= 11) {
                    invalidate(region);
                } else {
                    invalidate();
                }
            }
        } else if (position == EXPANDED_FULL_OPEN) {
            handle.offsetLeftAndRight(this.mTopOffset - handle.getLeft());
            invalidate();
        } else if (position == COLLAPSED_FULL_CLOSED) {
            handle.offsetLeftAndRight((((this.mBottomOffset + getRight()) - getLeft()) - this.mHandleWidth) - handle.getLeft());
            invalidate();
        } else {
            int left = handle.getLeft();
            int deltaX = position - left;
            if (position < this.mTopOffset) {
                deltaX = this.mTopOffset - left;
            } else if (deltaX > (((this.mBottomOffset + getRight()) - getLeft()) - this.mHandleWidth) - left) {
                deltaX = (((this.mBottomOffset + getRight()) - getLeft()) - this.mHandleWidth) - left;
            }
            handle.offsetLeftAndRight(deltaX);
            Rect frame2 = this.mFrame;
            Rect region2 = this.mInvalidate;
            handle.getHitRect(frame2);
            region2.set(frame2);
            region2.union(frame2.left - deltaX, frame2.top, frame2.right - deltaX, frame2.bottom);
            region2.union(frame2.right - deltaX, 0, (frame2.right - deltaX) + this.mContent.getWidth(), getHeight());
            invalidate(region2);
        }
    }

    private void prepareContent() {
        if (!this.mAnimating) {
            View content = this.mContent;
            if (content.isLayoutRequested()) {
                if (this.mVertical) {
                    int childHeight = this.mHandleHeight;
                    int height = ((getBottom() - getTop()) - childHeight) - this.mTopOffset;
                    content.measure(View.MeasureSpec.makeMeasureSpec(getRight() - getLeft(), 1073741824), View.MeasureSpec.makeMeasureSpec(height, 1073741824));
                    content.layout(0, this.mTopOffset + childHeight, content.getMeasuredWidth(), this.mTopOffset + childHeight + content.getMeasuredHeight());
                } else {
                    int childWidth = this.mHandle.getWidth();
                    int width = ((getRight() - getLeft()) - childWidth) - this.mTopOffset;
                    content.measure(View.MeasureSpec.makeMeasureSpec(width, 1073741824), View.MeasureSpec.makeMeasureSpec(getBottom() - getTop(), 1073741824));
                    content.layout(this.mTopOffset + childWidth, 0, this.mTopOffset + childWidth + content.getMeasuredWidth(), content.getMeasuredHeight());
                }
            }
            content.getViewTreeObserver().dispatchOnPreDraw();
            if (Build.VERSION.SDK_INT < 11 || !content.isHardwareAccelerated()) {
                content.buildDrawingCache();
            }
            content.setVisibility(8);
        }
    }

    private void stopTracking() {
        this.mHandle.setPressed(false);
        this.mTracking = false;
        if (this.mOnDrawerScrollListener != null) {
            this.mOnDrawerScrollListener.onScrollEnded();
        }
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doAnimation() {
        if (this.mAnimating) {
            incrementAnimation();
            if (this.mAnimationPosition >= ((this.mVertical ? getHeight() : getWidth()) + this.mBottomOffset) - 1) {
                this.mAnimating = false;
                closeDrawer();
            } else if (this.mAnimationPosition < this.mTopOffset) {
                this.mAnimating = false;
                openDrawer();
            } else {
                moveHandle((int) this.mAnimationPosition);
                this.mCurrentAnimationTime += 16;
                this.mHandler.sendMessageAtTime(this.mHandler.obtainMessage(1000), this.mCurrentAnimationTime);
            }
        }
    }

    private void incrementAnimation() {
        long now = SystemClock.uptimeMillis();
        float t = ((float) (now - this.mAnimationLastTime)) / 1000.0f;
        float position = this.mAnimationPosition;
        float v = this.mAnimatedVelocity;
        float a = this.mAnimatedAcceleration;
        this.mAnimationPosition = (v * t) + position + (0.5f * a * t * t);
        this.mAnimatedVelocity = (a * t) + v;
        this.mAnimationLastTime = now;
    }

    public void toggle() {
        if (!this.mExpanded) {
            openDrawer();
        } else {
            closeDrawer();
        }
        invalidate();
        requestLayout();
    }

    public void animateToggle() {
        if (!this.mExpanded) {
            animateOpen();
        } else {
            animateClose();
        }
    }

    public void open() {
        openDrawer();
        invalidate();
        requestLayout();
        sendAccessibilityEvent(32);
    }

    public void close() {
        closeDrawer();
        invalidate();
        requestLayout();
    }

    public void animateClose() {
        prepareContent();
        OnDrawerScrollListener scrollListener = this.mOnDrawerScrollListener;
        if (scrollListener != null) {
            scrollListener.onScrollStarted();
        }
        animateClose(this.mVertical ? this.mHandle.getTop() : this.mHandle.getLeft());
        if (scrollListener != null) {
            scrollListener.onScrollEnded();
        }
    }

    public void animateOpen() {
        prepareContent();
        OnDrawerScrollListener scrollListener = this.mOnDrawerScrollListener;
        if (scrollListener != null) {
            scrollListener.onScrollStarted();
        }
        animateOpen(this.mVertical ? this.mHandle.getTop() : this.mHandle.getLeft());
        sendAccessibilityEvent(32);
        if (scrollListener != null) {
            scrollListener.onScrollEnded();
        }
    }

    @Override // android.view.View
    public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
        super.onInitializeAccessibilityEvent(event);
        event.setClassName(CustomSlidingDrawer.class.getName());
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setClassName(CustomSlidingDrawer.class.getName());
    }

    private void closeDrawer() {
        moveHandle(COLLAPSED_FULL_CLOSED);
        this.mContent.setVisibility(8);
        this.mContent.destroyDrawingCache();
        if (this.mExpanded) {
            this.mExpanded = false;
            if (this.mOnDrawerCloseListener != null) {
                this.mOnDrawerCloseListener.onDrawerClosed();
            }
        }
    }

    private void openDrawer() {
        moveHandle(EXPANDED_FULL_OPEN);
        this.mContent.setVisibility(0);
        if (!this.mExpanded) {
            this.mExpanded = true;
            if (this.mOnDrawerOpenListener != null) {
                this.mOnDrawerOpenListener.onDrawerOpened();
            }
        }
    }

    public void setOnDrawerOpenListener(OnDrawerOpenListener onDrawerOpenListener) {
        this.mOnDrawerOpenListener = onDrawerOpenListener;
    }

    public void setOnDrawerCloseListener(OnDrawerCloseListener onDrawerCloseListener) {
        this.mOnDrawerCloseListener = onDrawerCloseListener;
    }

    public void setOnDrawerScrollListener(OnDrawerScrollListener onDrawerScrollListener) {
        this.mOnDrawerScrollListener = onDrawerScrollListener;
    }

    public View getHandle() {
        return this.mHandle;
    }

    public View getContent() {
        return this.mContent;
    }

    public void unlock() {
        this.mLocked = false;
    }

    public void lock() {
        this.mLocked = true;
    }

    public boolean isOpened() {
        return this.mExpanded;
    }

    public boolean isMoving() {
        return this.mTracking || this.mAnimating;
    }

    /* loaded from: classes3.dex */
    private class DrawerToggler implements View.OnClickListener {
        private DrawerToggler() {
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (!CustomSlidingDrawer.this.mLocked) {
                if (CustomSlidingDrawer.this.mAnimateOnClick) {
                    CustomSlidingDrawer.this.animateToggle();
                } else {
                    CustomSlidingDrawer.this.toggle();
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    private class SlidingHandler extends Handler {
        private SlidingHandler() {
        }

        @Override // android.os.Handler
        public void handleMessage(Message m) {
            switch (m.what) {
                case 1000:
                    CustomSlidingDrawer.this.doAnimation();
                    return;
                default:
                    return;
            }
        }
    }
}
