package com.vkontakte.android.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.animation.TypeEvaluator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.support.v4.view.MotionEventCompat;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.WrapperListAdapter;
import com.facebook.imagepipeline.common.RotationOptions;
import com.vk.core.util.AnimationUtils;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes3.dex */
public class ReorderableListView extends ListView {
    private static final TypeEvaluator<Rect> sBoundEvaluator = new TypeEvaluator<Rect>() { // from class: com.vkontakte.android.ui.ReorderableListView.5
        @Override // android.animation.TypeEvaluator
        public Rect evaluate(float fraction, Rect startValue, Rect endValue) {
            return new Rect(interpolate(startValue.left, endValue.left, fraction), interpolate(startValue.top, endValue.top, fraction), interpolate(startValue.right, endValue.right, fraction), interpolate(startValue.bottom, endValue.bottom, fraction));
        }

        public int interpolate(int start, int end, float fraction) {
            return (int) (start + ((end - start) * fraction));
        }
    };
    private final int INVALID_ID;
    private final int INVALID_POINTER_ID;
    private final int MOVE_DURATION;
    private final int SMOOTH_SCROLL_AMOUNT_AT_EDGE;
    private DragListener dragListener;
    private long mAboveItemId;
    private int mActivePointerId;
    private long mBelowItemId;
    private boolean mCellIsMobile;
    private int mDownX;
    private int mDownY;
    private BitmapDrawable mHoverCell;
    private Rect mHoverCellCurrentBounds;
    private Rect mHoverCellOriginalBounds;
    private boolean mIsMobileScrolling;
    private boolean mIsWaitingForScrollFinish;
    private int mLastEventY;
    private long mMobileItemId;
    private AdapterView.OnItemLongClickListener mOnItemLongClickListener;
    private AbsListView.OnScrollListener mScrollListener;
    private int mScrollState;
    private int mSmoothScrollAmountAtEdge;
    private int mTotalOffset;
    private int prevOrientation;

    /* loaded from: classes3.dex */
    public interface DragListener {
        void onDragDrop(long j);

        void onDragStart(long j);
    }

    /* loaded from: classes3.dex */
    public interface DraggableChecker {
        boolean canDragItem(int i);

        boolean canDragToPosition(int i);
    }

    /* loaded from: classes3.dex */
    public interface Swappable {
        void swapItems(int i, int i2);
    }

    public ReorderableListView(Context context) {
        super(context);
        this.SMOOTH_SCROLL_AMOUNT_AT_EDGE = 15;
        this.MOVE_DURATION = AnimationUtils.DELAY_MID;
        this.mLastEventY = -1;
        this.mDownY = -1;
        this.mDownX = -1;
        this.mTotalOffset = 0;
        this.mCellIsMobile = false;
        this.mIsMobileScrolling = false;
        this.mSmoothScrollAmountAtEdge = 0;
        this.INVALID_ID = -1;
        this.mAboveItemId = -1L;
        this.mMobileItemId = -1L;
        this.mBelowItemId = -1L;
        this.INVALID_POINTER_ID = -1;
        this.mActivePointerId = -1;
        this.mIsWaitingForScrollFinish = false;
        this.mScrollState = 0;
        this.mOnItemLongClickListener = new AdapterView.OnItemLongClickListener() { // from class: com.vkontakte.android.ui.ReorderableListView.1
            @Override // android.widget.AdapterView.OnItemLongClickListener
            public boolean onItemLongClick(AdapterView<?> arg0, View arg1, int pos, long id) {
                ReorderableListView.this.mTotalOffset = 0;
                if (!(ReorderableListView.this.getAdapter() instanceof DraggableChecker) || ((DraggableChecker) ReorderableListView.this.getAdapter()).canDragItem(pos)) {
                    int position = ReorderableListView.this.pointToPosition(ReorderableListView.this.mDownX, ReorderableListView.this.mDownY);
                    int itemNum = position - ReorderableListView.this.getFirstVisiblePosition();
                    View selectedView = ReorderableListView.this.getChildAt(itemNum);
                    ReorderableListView.this.mMobileItemId = ReorderableListView.this.getAdapter().getItemId(position);
                    ReorderableListView.this.mHoverCell = ReorderableListView.this.getAndAddHoverView(selectedView);
                    selectedView.setVisibility(4);
                    ReorderableListView.this.mCellIsMobile = true;
                    ReorderableListView.this.updateNeighborViewsForID(ReorderableListView.this.mMobileItemId);
                    if (ReorderableListView.this.dragListener != null) {
                        ReorderableListView.this.dragListener.onDragStart(ReorderableListView.this.mMobileItemId);
                    }
                    return true;
                }
                return false;
            }
        };
        this.mScrollListener = new AbsListView.OnScrollListener() { // from class: com.vkontakte.android.ui.ReorderableListView.6
            private int mCurrentFirstVisibleItem;
            private int mCurrentScrollState;
            private int mCurrentVisibleItemCount;
            private int mPreviousFirstVisibleItem = -1;
            private int mPreviousVisibleItemCount = -1;

            @Override // android.widget.AbsListView.OnScrollListener
            public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
                this.mCurrentFirstVisibleItem = firstVisibleItem;
                this.mCurrentVisibleItemCount = visibleItemCount;
                this.mPreviousFirstVisibleItem = this.mPreviousFirstVisibleItem == -1 ? this.mCurrentFirstVisibleItem : this.mPreviousFirstVisibleItem;
                this.mPreviousVisibleItemCount = this.mPreviousVisibleItemCount == -1 ? this.mCurrentVisibleItemCount : this.mPreviousVisibleItemCount;
                checkAndHandleFirstVisibleCellChange();
                checkAndHandleLastVisibleCellChange();
                this.mPreviousFirstVisibleItem = this.mCurrentFirstVisibleItem;
                this.mPreviousVisibleItemCount = this.mCurrentVisibleItemCount;
            }

            @Override // android.widget.AbsListView.OnScrollListener
            public void onScrollStateChanged(AbsListView view, int scrollState) {
                this.mCurrentScrollState = scrollState;
                ReorderableListView.this.mScrollState = scrollState;
                isScrollCompleted();
            }

            private void isScrollCompleted() {
                if (this.mCurrentVisibleItemCount > 0 && this.mCurrentScrollState == 0) {
                    if (!ReorderableListView.this.mCellIsMobile || !ReorderableListView.this.mIsMobileScrolling) {
                        if (ReorderableListView.this.mIsWaitingForScrollFinish) {
                            ReorderableListView.this.touchEventsEnded();
                            return;
                        }
                        return;
                    }
                    ReorderableListView.this.handleMobileCellScroll();
                }
            }

            public void checkAndHandleFirstVisibleCellChange() {
                if (this.mCurrentFirstVisibleItem != this.mPreviousFirstVisibleItem && ReorderableListView.this.mCellIsMobile && ReorderableListView.this.mMobileItemId != -1) {
                    ReorderableListView.this.updateNeighborViewsForID(ReorderableListView.this.mMobileItemId);
                    ReorderableListView.this.handleCellSwitch();
                }
            }

            public void checkAndHandleLastVisibleCellChange() {
                int currentLastVisibleItem = this.mCurrentFirstVisibleItem + this.mCurrentVisibleItemCount;
                int previousLastVisibleItem = this.mPreviousFirstVisibleItem + this.mPreviousVisibleItemCount;
                if (currentLastVisibleItem != previousLastVisibleItem && ReorderableListView.this.mCellIsMobile && ReorderableListView.this.mMobileItemId != -1) {
                    ReorderableListView.this.updateNeighborViewsForID(ReorderableListView.this.mMobileItemId);
                    ReorderableListView.this.handleCellSwitch();
                }
            }
        };
        init(context);
    }

    public ReorderableListView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.SMOOTH_SCROLL_AMOUNT_AT_EDGE = 15;
        this.MOVE_DURATION = AnimationUtils.DELAY_MID;
        this.mLastEventY = -1;
        this.mDownY = -1;
        this.mDownX = -1;
        this.mTotalOffset = 0;
        this.mCellIsMobile = false;
        this.mIsMobileScrolling = false;
        this.mSmoothScrollAmountAtEdge = 0;
        this.INVALID_ID = -1;
        this.mAboveItemId = -1L;
        this.mMobileItemId = -1L;
        this.mBelowItemId = -1L;
        this.INVALID_POINTER_ID = -1;
        this.mActivePointerId = -1;
        this.mIsWaitingForScrollFinish = false;
        this.mScrollState = 0;
        this.mOnItemLongClickListener = new AdapterView.OnItemLongClickListener() { // from class: com.vkontakte.android.ui.ReorderableListView.1
            @Override // android.widget.AdapterView.OnItemLongClickListener
            public boolean onItemLongClick(AdapterView<?> arg0, View arg1, int pos, long id) {
                ReorderableListView.this.mTotalOffset = 0;
                if (!(ReorderableListView.this.getAdapter() instanceof DraggableChecker) || ((DraggableChecker) ReorderableListView.this.getAdapter()).canDragItem(pos)) {
                    int position = ReorderableListView.this.pointToPosition(ReorderableListView.this.mDownX, ReorderableListView.this.mDownY);
                    int itemNum = position - ReorderableListView.this.getFirstVisiblePosition();
                    View selectedView = ReorderableListView.this.getChildAt(itemNum);
                    ReorderableListView.this.mMobileItemId = ReorderableListView.this.getAdapter().getItemId(position);
                    ReorderableListView.this.mHoverCell = ReorderableListView.this.getAndAddHoverView(selectedView);
                    selectedView.setVisibility(4);
                    ReorderableListView.this.mCellIsMobile = true;
                    ReorderableListView.this.updateNeighborViewsForID(ReorderableListView.this.mMobileItemId);
                    if (ReorderableListView.this.dragListener != null) {
                        ReorderableListView.this.dragListener.onDragStart(ReorderableListView.this.mMobileItemId);
                    }
                    return true;
                }
                return false;
            }
        };
        this.mScrollListener = new AbsListView.OnScrollListener() { // from class: com.vkontakte.android.ui.ReorderableListView.6
            private int mCurrentFirstVisibleItem;
            private int mCurrentScrollState;
            private int mCurrentVisibleItemCount;
            private int mPreviousFirstVisibleItem = -1;
            private int mPreviousVisibleItemCount = -1;

            @Override // android.widget.AbsListView.OnScrollListener
            public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
                this.mCurrentFirstVisibleItem = firstVisibleItem;
                this.mCurrentVisibleItemCount = visibleItemCount;
                this.mPreviousFirstVisibleItem = this.mPreviousFirstVisibleItem == -1 ? this.mCurrentFirstVisibleItem : this.mPreviousFirstVisibleItem;
                this.mPreviousVisibleItemCount = this.mPreviousVisibleItemCount == -1 ? this.mCurrentVisibleItemCount : this.mPreviousVisibleItemCount;
                checkAndHandleFirstVisibleCellChange();
                checkAndHandleLastVisibleCellChange();
                this.mPreviousFirstVisibleItem = this.mCurrentFirstVisibleItem;
                this.mPreviousVisibleItemCount = this.mCurrentVisibleItemCount;
            }

            @Override // android.widget.AbsListView.OnScrollListener
            public void onScrollStateChanged(AbsListView view, int scrollState) {
                this.mCurrentScrollState = scrollState;
                ReorderableListView.this.mScrollState = scrollState;
                isScrollCompleted();
            }

            private void isScrollCompleted() {
                if (this.mCurrentVisibleItemCount > 0 && this.mCurrentScrollState == 0) {
                    if (!ReorderableListView.this.mCellIsMobile || !ReorderableListView.this.mIsMobileScrolling) {
                        if (ReorderableListView.this.mIsWaitingForScrollFinish) {
                            ReorderableListView.this.touchEventsEnded();
                            return;
                        }
                        return;
                    }
                    ReorderableListView.this.handleMobileCellScroll();
                }
            }

            public void checkAndHandleFirstVisibleCellChange() {
                if (this.mCurrentFirstVisibleItem != this.mPreviousFirstVisibleItem && ReorderableListView.this.mCellIsMobile && ReorderableListView.this.mMobileItemId != -1) {
                    ReorderableListView.this.updateNeighborViewsForID(ReorderableListView.this.mMobileItemId);
                    ReorderableListView.this.handleCellSwitch();
                }
            }

            public void checkAndHandleLastVisibleCellChange() {
                int currentLastVisibleItem = this.mCurrentFirstVisibleItem + this.mCurrentVisibleItemCount;
                int previousLastVisibleItem = this.mPreviousFirstVisibleItem + this.mPreviousVisibleItemCount;
                if (currentLastVisibleItem != previousLastVisibleItem && ReorderableListView.this.mCellIsMobile && ReorderableListView.this.mMobileItemId != -1) {
                    ReorderableListView.this.updateNeighborViewsForID(ReorderableListView.this.mMobileItemId);
                    ReorderableListView.this.handleCellSwitch();
                }
            }
        };
        init(context);
    }

    public ReorderableListView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.SMOOTH_SCROLL_AMOUNT_AT_EDGE = 15;
        this.MOVE_DURATION = AnimationUtils.DELAY_MID;
        this.mLastEventY = -1;
        this.mDownY = -1;
        this.mDownX = -1;
        this.mTotalOffset = 0;
        this.mCellIsMobile = false;
        this.mIsMobileScrolling = false;
        this.mSmoothScrollAmountAtEdge = 0;
        this.INVALID_ID = -1;
        this.mAboveItemId = -1L;
        this.mMobileItemId = -1L;
        this.mBelowItemId = -1L;
        this.INVALID_POINTER_ID = -1;
        this.mActivePointerId = -1;
        this.mIsWaitingForScrollFinish = false;
        this.mScrollState = 0;
        this.mOnItemLongClickListener = new AdapterView.OnItemLongClickListener() { // from class: com.vkontakte.android.ui.ReorderableListView.1
            @Override // android.widget.AdapterView.OnItemLongClickListener
            public boolean onItemLongClick(AdapterView<?> arg0, View arg1, int pos, long id) {
                ReorderableListView.this.mTotalOffset = 0;
                if (!(ReorderableListView.this.getAdapter() instanceof DraggableChecker) || ((DraggableChecker) ReorderableListView.this.getAdapter()).canDragItem(pos)) {
                    int position = ReorderableListView.this.pointToPosition(ReorderableListView.this.mDownX, ReorderableListView.this.mDownY);
                    int itemNum = position - ReorderableListView.this.getFirstVisiblePosition();
                    View selectedView = ReorderableListView.this.getChildAt(itemNum);
                    ReorderableListView.this.mMobileItemId = ReorderableListView.this.getAdapter().getItemId(position);
                    ReorderableListView.this.mHoverCell = ReorderableListView.this.getAndAddHoverView(selectedView);
                    selectedView.setVisibility(4);
                    ReorderableListView.this.mCellIsMobile = true;
                    ReorderableListView.this.updateNeighborViewsForID(ReorderableListView.this.mMobileItemId);
                    if (ReorderableListView.this.dragListener != null) {
                        ReorderableListView.this.dragListener.onDragStart(ReorderableListView.this.mMobileItemId);
                    }
                    return true;
                }
                return false;
            }
        };
        this.mScrollListener = new AbsListView.OnScrollListener() { // from class: com.vkontakte.android.ui.ReorderableListView.6
            private int mCurrentFirstVisibleItem;
            private int mCurrentScrollState;
            private int mCurrentVisibleItemCount;
            private int mPreviousFirstVisibleItem = -1;
            private int mPreviousVisibleItemCount = -1;

            @Override // android.widget.AbsListView.OnScrollListener
            public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
                this.mCurrentFirstVisibleItem = firstVisibleItem;
                this.mCurrentVisibleItemCount = visibleItemCount;
                this.mPreviousFirstVisibleItem = this.mPreviousFirstVisibleItem == -1 ? this.mCurrentFirstVisibleItem : this.mPreviousFirstVisibleItem;
                this.mPreviousVisibleItemCount = this.mPreviousVisibleItemCount == -1 ? this.mCurrentVisibleItemCount : this.mPreviousVisibleItemCount;
                checkAndHandleFirstVisibleCellChange();
                checkAndHandleLastVisibleCellChange();
                this.mPreviousFirstVisibleItem = this.mCurrentFirstVisibleItem;
                this.mPreviousVisibleItemCount = this.mCurrentVisibleItemCount;
            }

            @Override // android.widget.AbsListView.OnScrollListener
            public void onScrollStateChanged(AbsListView view, int scrollState) {
                this.mCurrentScrollState = scrollState;
                ReorderableListView.this.mScrollState = scrollState;
                isScrollCompleted();
            }

            private void isScrollCompleted() {
                if (this.mCurrentVisibleItemCount > 0 && this.mCurrentScrollState == 0) {
                    if (!ReorderableListView.this.mCellIsMobile || !ReorderableListView.this.mIsMobileScrolling) {
                        if (ReorderableListView.this.mIsWaitingForScrollFinish) {
                            ReorderableListView.this.touchEventsEnded();
                            return;
                        }
                        return;
                    }
                    ReorderableListView.this.handleMobileCellScroll();
                }
            }

            public void checkAndHandleFirstVisibleCellChange() {
                if (this.mCurrentFirstVisibleItem != this.mPreviousFirstVisibleItem && ReorderableListView.this.mCellIsMobile && ReorderableListView.this.mMobileItemId != -1) {
                    ReorderableListView.this.updateNeighborViewsForID(ReorderableListView.this.mMobileItemId);
                    ReorderableListView.this.handleCellSwitch();
                }
            }

            public void checkAndHandleLastVisibleCellChange() {
                int currentLastVisibleItem = this.mCurrentFirstVisibleItem + this.mCurrentVisibleItemCount;
                int previousLastVisibleItem = this.mPreviousFirstVisibleItem + this.mPreviousVisibleItemCount;
                if (currentLastVisibleItem != previousLastVisibleItem && ReorderableListView.this.mCellIsMobile && ReorderableListView.this.mMobileItemId != -1) {
                    ReorderableListView.this.updateNeighborViewsForID(ReorderableListView.this.mMobileItemId);
                    ReorderableListView.this.handleCellSwitch();
                }
            }
        };
        init(context);
    }

    public void init(Context context) {
        super.setOnItemLongClickListener(this.mOnItemLongClickListener);
        setOnScrollListener(this.mScrollListener);
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        this.mSmoothScrollAmountAtEdge = (int) (15.0f / metrics.density);
    }

    public void setDragListener(DragListener dl) {
        this.dragListener = dl;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public BitmapDrawable getAndAddHoverView(View v) {
        int w = v.getWidth();
        int h = v.getHeight();
        int top = v.getTop();
        int left = v.getLeft();
        Bitmap b = getBitmapWithBorder(v);
        BitmapDrawable drawable = new BitmapDrawable(getResources(), b);
        drawable.setAlpha(RotationOptions.ROTATE_180);
        this.mHoverCellOriginalBounds = new Rect(left, top, left + w, top + h);
        this.mHoverCellCurrentBounds = new Rect(this.mHoverCellOriginalBounds);
        drawable.setBounds(this.mHoverCellCurrentBounds);
        return drawable;
    }

    private Bitmap getBitmapWithBorder(View v) {
        Bitmap bitmap = getBitmapFromView(v);
        return bitmap;
    }

    private Bitmap getBitmapFromView(View v) {
        Bitmap bitmap = Bitmap.createBitmap(v.getWidth(), v.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        if (v.getBackground() == null) {
            Paint bgPaint = new Paint();
            bgPaint.setColor(-1);
            canvas.drawRect(new Rect(0, 0, v.getWidth(), v.getHeight()), bgPaint);
        }
        v.draw(canvas);
        return bitmap;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateNeighborViewsForID(long itemID) {
        long j = -1;
        int position = getPositionForID(itemID);
        this.mAboveItemId = position <= 0 ? -1L : getAdapter().getItemId(position - 1);
        if (position < getAdapter().getCount() - 1) {
            j = getAdapter().getItemId(position + 1);
        }
        this.mBelowItemId = j;
    }

    public View getViewForID(long itemID) {
        int firstVisiblePosition = getFirstVisiblePosition();
        for (int i = 0; i < getChildCount(); i++) {
            View v = getChildAt(i);
            int position = firstVisiblePosition + i;
            long id = getAdapter().getItemId(position);
            if (id == itemID) {
                return v;
            }
        }
        return null;
    }

    public int getPositionForID(long itemID) {
        View v = getViewForID(itemID);
        if (v == null) {
            return -1;
        }
        return getPositionForView(v);
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (this.mHoverCell != null) {
            this.mHoverCell.draw(canvas);
        }
    }

    private void lockOrientation() {
        this.prevOrientation = Utils.castToActivity(getContext()).getRequestedOrientation();
        Utils.castToActivity(getContext()).setRequestedOrientation(ViewUtils.getScreenOrientation(Utils.castToActivity(getContext())));
    }

    private void unlockOrientation() {
        Utils.castToActivity(getContext()).setRequestedOrientation(this.prevOrientation);
    }

    @Override // android.widget.AbsListView, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getAction() & 255) {
            case 0:
                this.mDownX = (int) event.getX();
                this.mDownY = (int) event.getY();
                this.mActivePointerId = event.getPointerId(0);
                lockOrientation();
                break;
            case 1:
                touchEventsEnded();
                break;
            case 2:
                if (this.mActivePointerId != -1) {
                    int pointerIndex = event.findPointerIndex(this.mActivePointerId);
                    this.mLastEventY = (int) event.getY(pointerIndex);
                    int deltaY = this.mLastEventY - this.mDownY;
                    if (this.mCellIsMobile) {
                        this.mHoverCellCurrentBounds.offsetTo(this.mHoverCellOriginalBounds.left, this.mHoverCellOriginalBounds.top + deltaY + this.mTotalOffset);
                        this.mHoverCell.setBounds(this.mHoverCellCurrentBounds);
                        invalidate();
                        handleCellSwitch();
                        this.mIsMobileScrolling = false;
                        handleMobileCellScroll();
                        return false;
                    }
                }
                break;
            case 3:
                touchEventsCancelled();
                break;
            case 6:
                int pointerIndex2 = (event.getAction() & MotionEventCompat.ACTION_POINTER_INDEX_MASK) >> 8;
                int pointerId = event.getPointerId(pointerIndex2);
                if (pointerId == this.mActivePointerId) {
                    touchEventsEnded();
                    break;
                }
                break;
        }
        return super.onTouchEvent(event);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleCellSwitch() {
        final int deltaY = this.mLastEventY - this.mDownY;
        int deltaYTotal = this.mHoverCellOriginalBounds.top + this.mTotalOffset + deltaY;
        View belowView = getViewForID(this.mBelowItemId);
        View mobileView = getViewForID(this.mMobileItemId);
        View aboveView = getViewForID(this.mAboveItemId);
        boolean isBelow = belowView != null && deltaYTotal > belowView.getTop();
        boolean isAbove = aboveView != null && deltaYTotal < aboveView.getTop();
        if (isBelow || isAbove) {
            final long switchItemID = isBelow ? this.mBelowItemId : this.mAboveItemId;
            View switchView = isBelow ? belowView : aboveView;
            int originalItem = getPositionForView(mobileView);
            if (!(getAdapter() instanceof DraggableChecker) || ((DraggableChecker) getAdapter()).canDragToPosition(getPositionForView(switchView))) {
                if (switchView == null) {
                    updateNeighborViewsForID(this.mMobileItemId);
                    return;
                }
                ListAdapter adapter = getAdapter();
                if (!(adapter instanceof Swappable) && (adapter instanceof WrapperListAdapter)) {
                    adapter = ((WrapperListAdapter) adapter).getWrappedAdapter();
                }
                ((Swappable) adapter).swapItems(originalItem, getPositionForView(switchView));
                ((BaseAdapter) adapter).notifyDataSetChanged();
                this.mDownY = this.mLastEventY;
                final int switchViewStartTop = switchView.getTop();
                mobileView.setVisibility(0);
                switchView.setVisibility(4);
                updateNeighborViewsForID(this.mMobileItemId);
                final ViewTreeObserver observer = getViewTreeObserver();
                observer.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.ReorderableListView.2
                    @Override // android.view.ViewTreeObserver.OnPreDrawListener
                    public boolean onPreDraw() {
                        observer.removeOnPreDrawListener(this);
                        View switchView2 = ReorderableListView.this.getViewForID(switchItemID);
                        ReorderableListView.this.mTotalOffset += deltaY;
                        int switchViewNewTop = switchView2.getTop();
                        int delta = switchViewStartTop - switchViewNewTop;
                        switchView2.setTranslationY(delta);
                        ObjectAnimator animator = ObjectAnimator.ofFloat(switchView2, View.TRANSLATION_Y, 0.0f);
                        animator.setDuration(150L);
                        animator.start();
                        return true;
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void touchEventsEnded() {
        final View mobileView = getViewForID(this.mMobileItemId);
        if (this.mCellIsMobile || this.mIsWaitingForScrollFinish) {
            this.mCellIsMobile = false;
            this.mIsWaitingForScrollFinish = false;
            this.mIsMobileScrolling = false;
            this.mActivePointerId = -1;
            if (this.mScrollState != 0) {
                this.mIsWaitingForScrollFinish = true;
                return;
            }
            this.mHoverCellCurrentBounds.offsetTo(this.mHoverCellOriginalBounds.left, mobileView.getTop());
            ObjectAnimator hoverViewAnimator = ObjectAnimator.ofObject(this.mHoverCell, "bounds", sBoundEvaluator, this.mHoverCellCurrentBounds);
            hoverViewAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.vkontakte.android.ui.ReorderableListView.3
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    ReorderableListView.this.invalidate();
                }
            });
            hoverViewAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.ui.ReorderableListView.4
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animation) {
                    ReorderableListView.this.setEnabled(false);
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    ReorderableListView.this.mAboveItemId = -1L;
                    ReorderableListView.this.mMobileItemId = -1L;
                    ReorderableListView.this.mBelowItemId = -1L;
                    mobileView.setVisibility(0);
                    ReorderableListView.this.mHoverCell = null;
                    ReorderableListView.this.setEnabled(true);
                    ReorderableListView.this.invalidate();
                }
            });
            hoverViewAnimator.start();
            unlockOrientation();
            if (this.dragListener != null) {
                this.dragListener.onDragDrop(this.mMobileItemId);
                return;
            }
            return;
        }
        touchEventsCancelled();
    }

    private void touchEventsCancelled() {
        View mobileView = getViewForID(this.mMobileItemId);
        if (this.mCellIsMobile) {
            this.mAboveItemId = -1L;
            this.mMobileItemId = -1L;
            this.mBelowItemId = -1L;
            mobileView.setVisibility(0);
            this.mHoverCell = null;
            invalidate();
        }
        this.mCellIsMobile = false;
        this.mIsMobileScrolling = false;
        this.mActivePointerId = -1;
        unlockOrientation();
    }

    @Override // android.widget.AdapterView
    public void setOnItemLongClickListener(AdapterView.OnItemLongClickListener listener) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleMobileCellScroll() {
        this.mIsMobileScrolling = handleMobileCellScroll(this.mHoverCellCurrentBounds);
    }

    public boolean handleMobileCellScroll(Rect r) {
        int offset = computeVerticalScrollOffset();
        int height = getHeight();
        int extent = computeVerticalScrollExtent();
        int range = computeVerticalScrollRange();
        int hoverViewTop = r.top;
        int hoverHeight = r.height();
        if (hoverViewTop <= 0 && offset > 0) {
            smoothScrollBy(-this.mSmoothScrollAmountAtEdge, 0);
            return true;
        } else if (hoverViewTop + hoverHeight < height || offset + extent >= range) {
            return false;
        } else {
            smoothScrollBy(this.mSmoothScrollAmountAtEdge, 0);
            return true;
        }
    }
}
