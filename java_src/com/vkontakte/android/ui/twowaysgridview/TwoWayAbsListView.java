package com.vkontakte.android.ui.twowaysgridview;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.ContextMenu;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewDebug;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.Scroller;
import com.vkontakte.android.ui.twowaysgridview.TwoWayAdapterView;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public abstract class TwoWayAbsListView extends TwoWayAdapterView<ListAdapter> implements ViewTreeObserver.OnTouchModeChangeListener {
    private static final boolean DEBUG = false;
    private static final int INVALID_POINTER = -1;
    static final int LAYOUT_FORCE_BOTTOM = 3;
    static final int LAYOUT_FORCE_TOP = 1;
    static final int LAYOUT_MOVE_SELECTION = 6;
    static final int LAYOUT_NORMAL = 0;
    static final int LAYOUT_SET_SELECTION = 2;
    static final int LAYOUT_SPECIFIC = 4;
    static final int LAYOUT_SYNC = 5;
    private static final boolean PROFILE_FLINGING = false;
    private static final boolean PROFILE_SCROLLING = false;
    static final int SCROLL_HORIZONTAL = 1;
    static final int SCROLL_VERTICAL = 0;
    private static final String TAG = "TwoWayAbsListView";
    static final int TOUCH_MODE_DONE_WAITING = 2;
    static final int TOUCH_MODE_DOWN = 0;
    static final int TOUCH_MODE_FLING = 4;
    private static final int TOUCH_MODE_OFF = 1;
    private static final int TOUCH_MODE_ON = 0;
    static final int TOUCH_MODE_REST = -1;
    static final int TOUCH_MODE_SCROLL = 3;
    static final int TOUCH_MODE_TAP = 1;
    private static final int TOUCH_MODE_UNKNOWN = -1;
    public static final int TRANSCRIPT_MODE_ALWAYS_SCROLL = 2;
    public static final int TRANSCRIPT_MODE_DISABLED = 0;
    public static final int TRANSCRIPT_MODE_NORMAL = 1;
    private int mActivePointerId;
    ListAdapter mAdapter;
    private int mCacheColorHint;
    boolean mCachingStarted;
    private Runnable mClearScrollingCache;
    private ContextMenu.ContextMenuInfo mContextMenuInfo;
    TwoWayAdapterView<ListAdapter>.AdapterDataSetObserver mDataSetObserver;
    private float mDensityScale;
    boolean mDrawSelectorOnTop;
    private boolean mFlingProfilingStarted;
    private boolean mIsChildViewEnabled;
    final boolean[] mIsScrap;
    private int mLastScrollState;
    private int mLastTouchMode;
    private float mLastX;
    private float mLastY;
    int mLayoutMode;
    Rect mListPadding;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    int mMotionPosition;
    int mMotionX;
    int mMotionY;
    private OnScrollListener mOnScrollListener;
    private CheckForKeyLongPress mPendingCheckForKeyLongPress;
    private CheckForLongPress mPendingCheckForLongPress;
    private Runnable mPendingCheckForTap;
    private PerformClick mPerformClick;
    protected boolean mPortraitOrientation;
    final RecycleBin mRecycler;
    int mResurrectToPosition;
    View mScrollDown;
    View mScrollLeft;
    private boolean mScrollProfilingStarted;
    View mScrollRight;
    View mScrollUp;
    protected boolean mScrollVertically;
    private boolean mScrollVerticallyLandscape;
    private boolean mScrollVerticallyPortrait;
    boolean mScrollingCacheEnabled;
    int mSelectedTop;
    int mSelectionBottomPadding;
    int mSelectionLeftPadding;
    int mSelectionRightPadding;
    int mSelectionTopPadding;
    Drawable mSelector;
    Rect mSelectorRect;
    private boolean mSmoothScrollbarEnabled;
    boolean mStackFromBottom;
    EditText mTextFilter;
    private Rect mTouchFrame;
    protected TouchHandler mTouchHandler;
    int mTouchMode;
    private int mTouchSlop;
    private int mTranscriptMode;
    private VelocityTracker mVelocityTracker;
    int mWidthMeasureSpec;

    /* loaded from: classes3.dex */
    public interface OnScrollListener {
        public static final int SCROLL_STATE_FLING = 2;
        public static final int SCROLL_STATE_IDLE = 0;
        public static final int SCROLL_STATE_TOUCH_SCROLL = 1;

        void onScroll(TwoWayAbsListView twoWayAbsListView, int i, int i2, int i3);

        void onScrollStateChanged(TwoWayAbsListView twoWayAbsListView, int i);
    }

    /* loaded from: classes3.dex */
    public interface RecyclerListener {
        void onMovedToScrapHeap(View view);
    }

    abstract void fillGap(boolean z);

    abstract int findMotionRowX(int i);

    abstract int findMotionRowY(int i);

    abstract void setSelectionInt(int i);

    public TwoWayAbsListView(Context context) {
        super(context);
        this.mLayoutMode = 0;
        this.mDrawSelectorOnTop = false;
        this.mSelectorRect = new Rect();
        this.mRecycler = new RecycleBin();
        this.mSelectionLeftPadding = 0;
        this.mSelectionTopPadding = 0;
        this.mSelectionRightPadding = 0;
        this.mSelectionBottomPadding = 0;
        this.mListPadding = new Rect();
        this.mWidthMeasureSpec = 0;
        this.mTouchMode = -1;
        this.mSelectedTop = 0;
        this.mSmoothScrollbarEnabled = true;
        this.mResurrectToPosition = -1;
        this.mContextMenuInfo = null;
        this.mLastTouchMode = -1;
        this.mScrollProfilingStarted = false;
        this.mFlingProfilingStarted = false;
        this.mLastScrollState = 0;
        this.mIsScrap = new boolean[1];
        this.mActivePointerId = -1;
        initAbsListView();
        setupScrollInfo();
    }

    public TwoWayAbsListView(Context context, AttributeSet attrs) {
        this(context, attrs, 16842858);
    }

    public TwoWayAbsListView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mLayoutMode = 0;
        this.mDrawSelectorOnTop = false;
        this.mSelectorRect = new Rect();
        this.mRecycler = new RecycleBin();
        this.mSelectionLeftPadding = 0;
        this.mSelectionTopPadding = 0;
        this.mSelectionRightPadding = 0;
        this.mSelectionBottomPadding = 0;
        this.mListPadding = new Rect();
        this.mWidthMeasureSpec = 0;
        this.mTouchMode = -1;
        this.mSelectedTop = 0;
        this.mSmoothScrollbarEnabled = true;
        this.mResurrectToPosition = -1;
        this.mContextMenuInfo = null;
        this.mLastTouchMode = -1;
        this.mScrollProfilingStarted = false;
        this.mFlingProfilingStarted = false;
        this.mLastScrollState = 0;
        this.mIsScrap = new boolean[1];
        this.mActivePointerId = -1;
        initAbsListView();
        setupScrollInfo();
    }

    private void initAbsListView() {
        boolean z = false;
        setClickable(true);
        setFocusableInTouchMode(true);
        setWillNotDraw(false);
        setAlwaysDrawnWithCacheEnabled(false);
        setScrollingCacheEnabled(true);
        ViewConfiguration configuration = ViewConfiguration.get(this.mContext);
        this.mTouchSlop = configuration.getScaledTouchSlop();
        this.mMinimumVelocity = configuration.getScaledMinimumFlingVelocity();
        this.mMaximumVelocity = configuration.getScaledMaximumFlingVelocity();
        this.mDensityScale = getContext().getResources().getDisplayMetrics().density;
        if (getResources().getConfiguration().orientation != 2) {
            z = true;
        }
        this.mPortraitOrientation = z;
        this.mScrollVertically = true;
    }

    private void setupScrollInfo() {
        this.mScrollVertically = this.mPortraitOrientation ? this.mScrollVerticallyPortrait : this.mScrollVerticallyLandscape;
        if (this.mScrollVertically) {
            this.mTouchHandler = new VerticalTouchHandler();
            setVerticalScrollBarEnabled(true);
            setHorizontalScrollBarEnabled(false);
            setIsVertical(true);
            return;
        }
        this.mTouchHandler = new HorizontalTouchHandler();
        setVerticalScrollBarEnabled(false);
        setHorizontalScrollBarEnabled(true);
        setIsVertical(false);
    }

    private boolean orientationChanged() {
        boolean temp = this.mPortraitOrientation;
        this.mPortraitOrientation = getResources().getConfiguration().orientation != 2;
        boolean result = temp != this.mPortraitOrientation;
        if (result) {
            setupScrollInfo();
            this.mRecycler.scrapActiveViews();
        }
        return result;
    }

    public void setSmoothScrollbarEnabled(boolean enabled) {
        this.mSmoothScrollbarEnabled = enabled;
    }

    @ViewDebug.ExportedProperty
    public boolean isSmoothScrollbarEnabled() {
        return this.mSmoothScrollbarEnabled;
    }

    public void setOnScrollListener(OnScrollListener l) {
        this.mOnScrollListener = l;
        invokeOnItemScrollListener();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void invokeOnItemScrollListener() {
        if (this.mOnScrollListener != null) {
            this.mOnScrollListener.onScroll(this, this.mFirstPosition, getChildCount(), this.mItemCount);
        }
    }

    @ViewDebug.ExportedProperty
    public boolean isScrollingCacheEnabled() {
        return this.mScrollingCacheEnabled;
    }

    public void setScrollingCacheEnabled(boolean enabled) {
        if (this.mScrollingCacheEnabled && !enabled) {
            this.mTouchHandler.clearScrollingCache();
        }
        this.mScrollingCacheEnabled = enabled;
    }

    @Override // android.view.View
    public void getFocusedRect(Rect r) {
        View view = getSelectedView();
        if (view != null && view.getParent() == this) {
            view.getFocusedRect(r);
            offsetDescendantRectToMyCoords(view, r);
            return;
        }
        super.getFocusedRect(r);
    }

    private void useDefaultSelector() {
        setSelector(getResources().getDrawable(17301602));
    }

    @ViewDebug.ExportedProperty
    public boolean isStackFromBottom() {
        return this.mStackFromBottom;
    }

    public void setStackFromBottom(boolean stackFromBottom) {
        if (this.mStackFromBottom != stackFromBottom) {
            this.mStackFromBottom = stackFromBottom;
            requestLayoutIfNecessary();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void requestLayoutIfNecessary() {
        if (getChildCount() > 0) {
            resetList();
            requestLayout();
            invalidate();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public SavedState mo1103createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public SavedState[] mo1104newArray(int size) {
                return new SavedState[size];
            }
        };
        long firstId;
        int height;
        int position;
        long selectedId;
        int viewTop;

        SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            this.selectedId = in.readLong();
            this.firstId = in.readLong();
            this.viewTop = in.readInt();
            this.position = in.readInt();
            this.height = in.readInt();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeLong(this.selectedId);
            out.writeLong(this.firstId);
            out.writeInt(this.viewTop);
            out.writeInt(this.position);
            out.writeInt(this.height);
        }

        public String toString() {
            return "TwoWayAbsListView.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " selectedId=" + this.selectedId + " firstId=" + this.firstId + " viewTop=" + this.viewTop + " position=" + this.position + " height=" + this.height + "}";
        }
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        boolean haveChildren = getChildCount() > 0;
        long selectedId = getSelectedItemId();
        ss.selectedId = selectedId;
        ss.height = getHeight();
        if (selectedId >= 0) {
            ss.viewTop = this.mSelectedTop;
            ss.position = getSelectedItemPosition();
            ss.firstId = -1L;
        } else if (haveChildren) {
            View v = getChildAt(0);
            if (this.mScrollVertically) {
                ss.viewTop = v.getTop();
            } else {
                ss.viewTop = v.getLeft();
            }
            ss.position = this.mFirstPosition;
            ss.firstId = this.mAdapter.getItemId(this.mFirstPosition);
        } else {
            ss.viewTop = 0;
            ss.firstId = -1L;
            ss.position = 0;
        }
        return ss;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        this.mDataChanged = true;
        this.mSyncSize = ss.height;
        if (ss.selectedId >= 0) {
            this.mNeedSync = true;
            this.mSyncRowId = ss.selectedId;
            this.mSyncPosition = ss.position;
            this.mSpecificTop = ss.viewTop;
            this.mSyncMode = 0;
        } else if (ss.firstId >= 0) {
            setSelectedPositionInt(-1);
            setNextSelectedPositionInt(-1);
            this.mNeedSync = true;
            this.mSyncRowId = ss.firstId;
            this.mSyncPosition = ss.position;
            this.mSpecificTop = ss.viewTop;
            this.mSyncMode = 1;
        }
        requestLayout();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.View
    public void onFocusChanged(boolean gainFocus, int direction, Rect previouslyFocusedRect) {
        super.onFocusChanged(gainFocus, direction, previouslyFocusedRect);
        if (gainFocus && this.mSelectedPosition < 0 && !isInTouchMode()) {
            resurrectSelection();
        }
    }

    @Override // android.view.View, android.view.ViewParent
    public void requestLayout() {
        if (!this.mBlockLayoutRequests && !this.mInLayout) {
            super.requestLayout();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void resetList() {
        removeAllViewsInLayout();
        this.mFirstPosition = 0;
        this.mDataChanged = false;
        this.mNeedSync = false;
        this.mOldSelectedPosition = -1;
        this.mOldSelectedRowId = Long.MIN_VALUE;
        setSelectedPositionInt(-1);
        setNextSelectedPositionInt(-1);
        this.mSelectedTop = 0;
        this.mSelectorRect.setEmpty();
        invalidate();
    }

    @Override // android.view.View
    protected int computeVerticalScrollExtent() {
        int count = getChildCount();
        if (count <= 0 || !this.mScrollVertically) {
            return 0;
        }
        if (this.mSmoothScrollbarEnabled) {
            int extent = count * 100;
            View view = getChildAt(0);
            int top = view.getTop();
            int height = view.getHeight();
            if (height > 0) {
                extent += (top * 100) / height;
            }
            View view2 = getChildAt(count - 1);
            int bottom = view2.getBottom();
            int height2 = view2.getHeight();
            if (height2 > 0) {
                return extent - (((bottom - getHeight()) * 100) / height2);
            }
            return extent;
        }
        return 1;
    }

    @Override // android.view.View
    protected int computeVerticalScrollOffset() {
        int index;
        int firstPosition = this.mFirstPosition;
        int childCount = getChildCount();
        if (firstPosition < 0 || childCount <= 0 || !this.mScrollVertically) {
            return 0;
        }
        if (this.mSmoothScrollbarEnabled) {
            View view = getChildAt(0);
            int top = view.getTop();
            int height = view.getHeight();
            if (height <= 0) {
                return 0;
            }
            return Math.max(((firstPosition * 100) - ((top * 100) / height)) + ((int) ((getScrollY() / getHeight()) * this.mItemCount * 100.0f)), 0);
        }
        int count = this.mItemCount;
        if (firstPosition == 0) {
            index = 0;
        } else if (firstPosition + childCount == count) {
            index = count;
        } else {
            index = firstPosition + (childCount / 2);
        }
        return (int) (firstPosition + (childCount * (index / count)));
    }

    @Override // android.view.View
    protected int computeVerticalScrollRange() {
        if (!this.mScrollVertically) {
            return 0;
        }
        if (this.mSmoothScrollbarEnabled) {
            int result = Math.max(this.mItemCount * 100, 0);
            return result;
        }
        int result2 = this.mItemCount;
        return result2;
    }

    @Override // android.view.View
    protected int computeHorizontalScrollExtent() {
        int count = getChildCount();
        if (count <= 0 || this.mScrollVertically) {
            return 0;
        }
        if (this.mSmoothScrollbarEnabled) {
            int extent = count * 100;
            View view = getChildAt(0);
            int left = view.getLeft();
            int width = view.getWidth();
            if (width > 0) {
                extent += (left * 100) / width;
            }
            View view2 = getChildAt(count - 1);
            int right = view2.getRight();
            int width2 = view2.getWidth();
            if (width2 > 0) {
                return extent - (((right - getWidth()) * 100) / width2);
            }
            return extent;
        }
        return 1;
    }

    @Override // android.view.View
    protected int computeHorizontalScrollOffset() {
        int index;
        int firstPosition = this.mFirstPosition;
        int childCount = getChildCount();
        if (firstPosition < 0 || childCount <= 0 || this.mScrollVertically) {
            return 0;
        }
        if (this.mSmoothScrollbarEnabled) {
            View view = getChildAt(0);
            int left = view.getLeft();
            int width = view.getWidth();
            if (width <= 0) {
                return 0;
            }
            return Math.max(((firstPosition * 100) - ((left * 100) / width)) + ((int) ((getScrollX() / getWidth()) * this.mItemCount * 100.0f)), 0);
        }
        int count = this.mItemCount;
        if (firstPosition == 0) {
            index = 0;
        } else if (firstPosition + childCount == count) {
            index = count;
        } else {
            index = firstPosition + (childCount / 2);
        }
        return (int) (firstPosition + (childCount * (index / count)));
    }

    @Override // android.view.View
    protected int computeHorizontalScrollRange() {
        if (this.mScrollVertically) {
            return 0;
        }
        if (this.mSmoothScrollbarEnabled) {
            int result = Math.max(this.mItemCount * 100, 0);
            return result;
        }
        int result2 = this.mItemCount;
        return result2;
    }

    @Override // android.view.View
    protected float getTopFadingEdgeStrength() {
        int count = getChildCount();
        float fadeEdge = super.getTopFadingEdgeStrength();
        if (count != 0 && this.mScrollVertically) {
            if (this.mFirstPosition > 0) {
                return 1.0f;
            }
            int top = getChildAt(0).getTop();
            float fadeLength = getVerticalFadingEdgeLength();
            int paddintTop = getPaddingTop();
            return top < paddintTop ? (-(top - paddintTop)) / fadeLength : fadeEdge;
        }
        return fadeEdge;
    }

    @Override // android.view.View
    protected float getBottomFadingEdgeStrength() {
        int count = getChildCount();
        float fadeEdge = super.getBottomFadingEdgeStrength();
        if (count != 0 && this.mScrollVertically) {
            if ((this.mFirstPosition + count) - 1 < this.mItemCount - 1) {
                return 1.0f;
            }
            int bottom = getChildAt(count - 1).getBottom();
            int height = getHeight();
            float fadeLength = getVerticalFadingEdgeLength();
            int paddingBottom = getPaddingBottom();
            return bottom > height - paddingBottom ? ((bottom - height) + paddingBottom) / fadeLength : fadeEdge;
        }
        return fadeEdge;
    }

    @Override // android.view.View
    protected float getLeftFadingEdgeStrength() {
        int count = getChildCount();
        float fadeEdge = super.getLeftFadingEdgeStrength();
        if (count != 0 && !this.mScrollVertically) {
            if (this.mFirstPosition > 0) {
                return 1.0f;
            }
            int left = getChildAt(0).getLeft();
            float fadeLength = getHorizontalFadingEdgeLength();
            int paddingLeft = getPaddingLeft();
            return left < paddingLeft ? (-(left - paddingLeft)) / fadeLength : fadeEdge;
        }
        return fadeEdge;
    }

    @Override // android.view.View
    protected float getRightFadingEdgeStrength() {
        int count = getChildCount();
        float fadeEdge = super.getRightFadingEdgeStrength();
        if (count != 0 && !this.mScrollVertically) {
            if ((this.mFirstPosition + count) - 1 < this.mItemCount - 1) {
                return 1.0f;
            }
            int right = getChildAt(count - 1).getRight();
            int width = getWidth();
            float fadeLength = getHorizontalFadingEdgeLength();
            int paddingRight = getPaddingRight();
            return right > width - paddingRight ? ((right - width) + paddingRight) / fadeLength : fadeEdge;
        }
        return fadeEdge;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        orientationChanged();
        if (this.mSelector == null) {
            useDefaultSelector();
        }
        Rect listPadding = this.mListPadding;
        listPadding.left = this.mSelectionLeftPadding + getPaddingLeft();
        listPadding.top = this.mSelectionTopPadding + getPaddingTop();
        listPadding.right = this.mSelectionRightPadding + getPaddingRight();
        listPadding.bottom = this.mSelectionBottomPadding + getPaddingBottom();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAdapterView, android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        if (orientationChanged()) {
            setupScrollInfo();
        }
        super.onLayout(changed, l, t, r, b);
        this.mInLayout = true;
        if (changed) {
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                getChildAt(i).forceLayout();
            }
            this.mRecycler.markChildrenDirty();
        }
        layoutChildren();
        this.mInLayout = false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void layoutChildren() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void updateScrollIndicators() {
        int i = 0;
        if (this.mScrollUp != null && this.mScrollVertically) {
            boolean canScrollUp = this.mFirstPosition > 0;
            if (!canScrollUp && getChildCount() > 0) {
                View child = getChildAt(0);
                canScrollUp = child.getTop() < this.mListPadding.top;
            }
            this.mScrollUp.setVisibility(canScrollUp ? 0 : 4);
        }
        if (this.mScrollDown != null && this.mScrollVertically) {
            int count = getChildCount();
            boolean canScrollDown = this.mFirstPosition + count < this.mItemCount;
            if (!canScrollDown && count > 0) {
                View child2 = getChildAt(count - 1);
                canScrollDown = child2.getBottom() > getBottom() - this.mListPadding.bottom;
            }
            this.mScrollDown.setVisibility(canScrollDown ? 0 : 4);
        }
        if (this.mScrollLeft != null && !this.mScrollVertically) {
            boolean canScrollLeft = this.mFirstPosition > 0;
            if (!canScrollLeft && getChildCount() > 0) {
                View child3 = getChildAt(0);
                canScrollLeft = child3.getLeft() < this.mListPadding.left;
            }
            this.mScrollLeft.setVisibility(canScrollLeft ? 0 : 4);
        }
        if (this.mScrollRight != null && !this.mScrollVertically) {
            int count2 = getChildCount();
            boolean canScrollRight = this.mFirstPosition + count2 < this.mItemCount;
            if (!canScrollRight && count2 > 0) {
                View child4 = getChildAt(count2 - 1);
                canScrollRight = child4.getRight() > getRight() - this.mListPadding.right;
            }
            View view = this.mScrollRight;
            if (!canScrollRight) {
                i = 4;
            }
            view.setVisibility(i);
        }
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAdapterView
    @ViewDebug.ExportedProperty
    public View getSelectedView() {
        if (this.mItemCount <= 0 || this.mSelectedPosition < 0) {
            return null;
        }
        return getChildAt(this.mSelectedPosition - this.mFirstPosition);
    }

    public int getListPaddingTop() {
        return this.mListPadding.top;
    }

    public int getListPaddingBottom() {
        return this.mListPadding.bottom;
    }

    public int getListPaddingLeft() {
        return this.mListPadding.left;
    }

    public int getListPaddingRight() {
        return this.mListPadding.right;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public View obtainView(int position, boolean[] isScrap) {
        View child;
        isScrap[0] = false;
        View scrapView = this.mRecycler.getScrapView(position);
        if (scrapView != null) {
            child = this.mAdapter.getView(position, scrapView, this);
            if (child != scrapView) {
                this.mRecycler.addScrapView(scrapView);
                if (this.mCacheColorHint != 0) {
                    child.setDrawingCacheBackgroundColor(this.mCacheColorHint);
                }
            } else {
                isScrap[0] = true;
                child.onFinishTemporaryDetach();
            }
        } else {
            child = this.mAdapter.getView(position, null, this);
            if (this.mCacheColorHint != 0) {
                child.setDrawingCacheBackgroundColor(this.mCacheColorHint);
            }
        }
        return child;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void positionSelector(View sel) {
        Rect selectorRect = this.mSelectorRect;
        selectorRect.set(sel.getLeft(), sel.getTop(), sel.getRight(), sel.getBottom());
        positionSelector(selectorRect.left, selectorRect.top, selectorRect.right, selectorRect.bottom);
        boolean isChildViewEnabled = this.mIsChildViewEnabled;
        if (sel.isEnabled() != isChildViewEnabled) {
            this.mIsChildViewEnabled = !isChildViewEnabled;
            refreshDrawableState();
        }
    }

    private void positionSelector(int l, int t, int r, int b) {
        this.mSelectorRect.set(l - this.mSelectionLeftPadding, t - this.mSelectionTopPadding, this.mSelectionRightPadding + r, this.mSelectionBottomPadding + b);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        boolean drawSelectorOnTop = this.mDrawSelectorOnTop;
        if (!drawSelectorOnTop) {
            drawSelector(canvas);
        }
        super.dispatchDraw(canvas);
        if (drawSelectorOnTop) {
            drawSelector(canvas);
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        if (getChildCount() > 0) {
            this.mDataChanged = true;
            rememberSyncState();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean touchModeDrawsInPressedState() {
        switch (this.mTouchMode) {
            case 1:
            case 2:
                return true;
            default:
                return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean shouldShowSelector() {
        return (hasFocus() && !isInTouchMode()) || touchModeDrawsInPressedState();
    }

    private void drawSelector(Canvas canvas) {
        if (shouldShowSelector() && this.mSelectorRect != null && !this.mSelectorRect.isEmpty()) {
            Drawable selector = this.mSelector;
            if (Build.VERSION.SDK_INT >= 21) {
                selector.setHotspot(this.mLastX, this.mLastY);
            }
            selector.setBounds(this.mSelectorRect);
            selector.draw(canvas);
        }
    }

    public void setDrawSelectorOnTop(boolean onTop) {
        this.mDrawSelectorOnTop = onTop;
    }

    public void setSelector(int resID) {
        setSelector(getResources().getDrawable(resID));
    }

    public void setSelector(Drawable sel) {
        if (this.mSelector != null) {
            this.mSelector.setCallback(null);
            unscheduleDrawable(this.mSelector);
        }
        this.mSelector = sel;
        Rect padding = new Rect();
        sel.getPadding(padding);
        this.mSelectionLeftPadding = padding.left;
        this.mSelectionTopPadding = padding.top;
        this.mSelectionRightPadding = padding.right;
        this.mSelectionBottomPadding = padding.bottom;
        sel.setCallback(this);
        sel.setState(getDrawableState());
    }

    public Drawable getSelector() {
        return this.mSelector;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void keyPressed() {
        if (isEnabled() && isClickable()) {
            Drawable selector = this.mSelector;
            Rect selectorRect = this.mSelectorRect;
            if (selector != null) {
                if ((isFocused() || touchModeDrawsInPressedState()) && selectorRect != null && !selectorRect.isEmpty()) {
                    View v = getChildAt(this.mSelectedPosition - this.mFirstPosition);
                    if (v != null) {
                        if (!v.hasFocusable()) {
                            v.setPressed(true);
                        } else {
                            return;
                        }
                    }
                    setPressed(true);
                    boolean longClickable = isLongClickable();
                    Drawable d = selector.getCurrent();
                    if (d != null && (d instanceof TransitionDrawable)) {
                        if (longClickable) {
                            ((TransitionDrawable) d).startTransition(ViewConfiguration.getLongPressTimeout());
                        } else {
                            ((TransitionDrawable) d).resetTransition();
                        }
                    }
                    if (longClickable && !this.mDataChanged) {
                        if (this.mPendingCheckForKeyLongPress == null) {
                            this.mPendingCheckForKeyLongPress = new CheckForKeyLongPress();
                        }
                        this.mPendingCheckForKeyLongPress.rememberWindowAttachCount();
                        postDelayed(this.mPendingCheckForKeyLongPress, ViewConfiguration.getLongPressTimeout());
                    }
                }
            }
        }
    }

    public void setScrollIndicators(View up, View down, View left, View right) {
        this.mScrollUp = up;
        this.mScrollDown = down;
        this.mScrollLeft = left;
        this.mScrollRight = right;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mSelector != null) {
            this.mSelector.setState(getDrawableState());
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected int[] onCreateDrawableState(int extraSpace) {
        if (this.mIsChildViewEnabled) {
            return super.onCreateDrawableState(extraSpace);
        }
        int enabledState = ENABLED_STATE_SET[0];
        int[] state = super.onCreateDrawableState(extraSpace + 1);
        int enabledPos = -1;
        int i = state.length - 1;
        while (true) {
            if (i < 0) {
                break;
            } else if (state[i] != enabledState) {
                i--;
            } else {
                enabledPos = i;
                break;
            }
        }
        if (enabledPos >= 0) {
            System.arraycopy(state, enabledPos + 1, state, enabledPos, (state.length - enabledPos) - 1);
            return state;
        }
        return state;
    }

    @Override // android.view.View
    public boolean verifyDrawable(Drawable dr) {
        return this.mSelector == dr || super.verifyDrawable(dr);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        ViewTreeObserver treeObserver = getViewTreeObserver();
        if (treeObserver != null) {
            treeObserver.addOnTouchModeChangeListener(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mRecycler.clear();
        ViewTreeObserver treeObserver = getViewTreeObserver();
        if (treeObserver != null) {
            treeObserver.removeOnTouchModeChangeListener(this);
        }
    }

    public void stopScroll() {
        if (this.mTouchHandler != null) {
            this.mTouchHandler.stopScroll();
        }
    }

    ContextMenu.ContextMenuInfo createContextMenuInfo(View view, int position, long id) {
        return new TwoWayAdapterView.AdapterContextMenuInfo(view, position, id);
    }

    /* loaded from: classes3.dex */
    private class WindowRunnnable {
        private int mOriginalAttachCount;

        private WindowRunnnable() {
        }

        public void rememberWindowAttachCount() {
            this.mOriginalAttachCount = TwoWayAbsListView.this.getWindowAttachCount();
        }

        public boolean sameWindow() {
            return TwoWayAbsListView.this.hasWindowFocus() && TwoWayAbsListView.this.getWindowAttachCount() == this.mOriginalAttachCount;
        }
    }

    /* loaded from: classes3.dex */
    private class PerformClick extends WindowRunnnable implements Runnable {
        View mChild;
        int mClickMotionPosition;

        private PerformClick() {
            super();
        }

        @Override // java.lang.Runnable
        public void run() {
            if (!TwoWayAbsListView.this.mDataChanged) {
                ListAdapter adapter = TwoWayAbsListView.this.mAdapter;
                int motionPosition = this.mClickMotionPosition;
                if (adapter != null && TwoWayAbsListView.this.mItemCount > 0 && motionPosition != -1 && motionPosition < adapter.getCount() && sameWindow()) {
                    TwoWayAbsListView.this.performItemClick(this.mChild, motionPosition, adapter.getItemId(motionPosition));
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class CheckForLongPress extends WindowRunnnable implements Runnable {
        private CheckForLongPress() {
            super();
        }

        @Override // java.lang.Runnable
        public void run() {
            int motionPosition = TwoWayAbsListView.this.mMotionPosition;
            View child = TwoWayAbsListView.this.getChildAt(motionPosition - TwoWayAbsListView.this.mFirstPosition);
            if (child != null) {
                int longPressPosition = TwoWayAbsListView.this.mMotionPosition;
                long longPressId = TwoWayAbsListView.this.mAdapter.getItemId(TwoWayAbsListView.this.mMotionPosition);
                boolean handled = false;
                if (sameWindow() && !TwoWayAbsListView.this.mDataChanged) {
                    handled = TwoWayAbsListView.this.performLongPress(child, longPressPosition, longPressId);
                }
                if (handled) {
                    TwoWayAbsListView.this.mTouchMode = -1;
                    TwoWayAbsListView.this.setPressed(false);
                    child.setPressed(false);
                    return;
                }
                TwoWayAbsListView.this.mTouchMode = 2;
            }
        }
    }

    /* loaded from: classes3.dex */
    private class CheckForKeyLongPress extends WindowRunnnable implements Runnable {
        private CheckForKeyLongPress() {
            super();
        }

        @Override // java.lang.Runnable
        public void run() {
            if (TwoWayAbsListView.this.isPressed() && TwoWayAbsListView.this.mSelectedPosition >= 0) {
                int index = TwoWayAbsListView.this.mSelectedPosition - TwoWayAbsListView.this.mFirstPosition;
                View v = TwoWayAbsListView.this.getChildAt(index);
                if (!TwoWayAbsListView.this.mDataChanged) {
                    boolean handled = false;
                    if (sameWindow()) {
                        handled = TwoWayAbsListView.this.performLongPress(v, TwoWayAbsListView.this.mSelectedPosition, TwoWayAbsListView.this.mSelectedRowId);
                    }
                    if (handled) {
                        TwoWayAbsListView.this.setPressed(false);
                        v.setPressed(false);
                        return;
                    }
                    return;
                }
                TwoWayAbsListView.this.setPressed(false);
                if (v != null) {
                    v.setPressed(false);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean performLongPress(View child, int longPressPosition, long longPressId) {
        boolean handled = false;
        if (this.mOnItemLongClickListener != null) {
            handled = this.mOnItemLongClickListener.onItemLongClick(this, child, longPressPosition, longPressId);
        }
        if (!handled) {
            this.mContextMenuInfo = createContextMenuInfo(child, longPressPosition, longPressId);
            handled = super.showContextMenuForChild(this);
        }
        if (handled) {
            performHapticFeedback(0);
        }
        return handled;
    }

    @Override // android.view.View
    protected ContextMenu.ContextMenuInfo getContextMenuInfo() {
        return this.mContextMenuInfo;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public boolean showContextMenuForChild(View originalView) {
        int longPressPosition = getPositionForView(originalView);
        if (longPressPosition >= 0) {
            long longPressId = this.mAdapter.getItemId(longPressPosition);
            boolean handled = false;
            if (this.mOnItemLongClickListener != null) {
                handled = this.mOnItemLongClickListener.onItemLongClick(this, originalView, longPressPosition, longPressId);
            }
            if (!handled) {
                this.mContextMenuInfo = createContextMenuInfo(getChildAt(longPressPosition - this.mFirstPosition), longPressPosition, longPressId);
                boolean handled2 = super.showContextMenuForChild(originalView);
                return handled2;
            }
            return handled;
        }
        return false;
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        return false;
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        switch (keyCode) {
            case 23:
            case 66:
                if (!isEnabled()) {
                    return true;
                }
                if (isClickable() && isPressed() && this.mSelectedPosition >= 0 && this.mAdapter != null && this.mSelectedPosition < this.mAdapter.getCount()) {
                    View view = getChildAt(this.mSelectedPosition - this.mFirstPosition);
                    if (view != null) {
                        performItemClick(view, this.mSelectedPosition, this.mSelectedRowId);
                        view.setPressed(false);
                    }
                    setPressed(false);
                    return true;
                }
                break;
        }
        return super.onKeyUp(keyCode, event);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchSetPressed(boolean pressed) {
    }

    public int pointToPosition(int x, int y) {
        Rect frame = this.mTouchFrame;
        if (frame == null) {
            this.mTouchFrame = new Rect();
            frame = this.mTouchFrame;
        }
        int count = getChildCount();
        for (int i = count - 1; i >= 0; i--) {
            View child = getChildAt(i);
            if (child.getVisibility() == 0) {
                child.getHitRect(frame);
                if (frame.contains(x, y)) {
                    return this.mFirstPosition + i;
                }
            }
        }
        return -1;
    }

    public long pointToRowId(int x, int y) {
        int position = pointToPosition(x, y);
        if (position >= 0) {
            return this.mAdapter.getItemId(position);
        }
        return Long.MIN_VALUE;
    }

    /* loaded from: classes3.dex */
    final class CheckForTap implements Runnable {
        CheckForTap() {
        }

        @Override // java.lang.Runnable
        public void run() {
            Drawable d;
            if (TwoWayAbsListView.this.mTouchMode == 0) {
                TwoWayAbsListView.this.mTouchMode = 1;
                View child = TwoWayAbsListView.this.getChildAt(TwoWayAbsListView.this.mMotionPosition - TwoWayAbsListView.this.mFirstPosition);
                if (child != null && !child.hasFocusable()) {
                    TwoWayAbsListView.this.mLayoutMode = 0;
                    if (!TwoWayAbsListView.this.mDataChanged) {
                        TwoWayAbsListView.this.layoutChildren();
                        child.setPressed(true);
                        TwoWayAbsListView.this.positionSelector(child);
                        TwoWayAbsListView.this.setPressed(true);
                        int longPressTimeout = ViewConfiguration.getLongPressTimeout();
                        boolean longClickable = TwoWayAbsListView.this.isLongClickable();
                        if (TwoWayAbsListView.this.mSelector != null && (d = TwoWayAbsListView.this.mSelector.getCurrent()) != null && (d instanceof TransitionDrawable)) {
                            if (longClickable) {
                                ((TransitionDrawable) d).startTransition(longPressTimeout);
                            } else {
                                ((TransitionDrawable) d).resetTransition();
                            }
                        }
                        if (longClickable) {
                            if (TwoWayAbsListView.this.mPendingCheckForLongPress == null) {
                                TwoWayAbsListView.this.mPendingCheckForLongPress = new CheckForLongPress();
                            }
                            TwoWayAbsListView.this.mPendingCheckForLongPress.rememberWindowAttachCount();
                            TwoWayAbsListView.this.postDelayed(TwoWayAbsListView.this.mPendingCheckForLongPress, longPressTimeout);
                            return;
                        }
                        TwoWayAbsListView.this.mTouchMode = 2;
                        return;
                    }
                    TwoWayAbsListView.this.mTouchMode = 2;
                }
            }
        }
    }

    public boolean startScrollIfNeeded(int delta) {
        return this.mTouchHandler.startScrollIfNeeded(delta);
    }

    @Override // android.view.ViewTreeObserver.OnTouchModeChangeListener
    public void onTouchModeChanged(boolean isInTouchMode) {
        this.mTouchHandler.onTouchModeChanged(isInTouchMode);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        this.mLastX = ev.getX();
        this.mLastY = ev.getY();
        return this.mTouchHandler.onTouchEvent(ev);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        return this.mTouchHandler.onInterceptTouchEvent(ev);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addTouchables(ArrayList<View> views) {
        int count = getChildCount();
        int firstPosition = this.mFirstPosition;
        ListAdapter adapter = this.mAdapter;
        if (adapter != null) {
            for (int i = 0; i < count; i++) {
                View child = getChildAt(i);
                if (adapter.isEnabled(firstPosition + i)) {
                    views.add(child);
                }
                child.addTouchables(views);
            }
        }
    }

    void reportScrollStateChange(int newState) {
        if (newState != this.mLastScrollState && this.mOnScrollListener != null) {
            this.mOnScrollListener.onScrollStateChanged(this, newState);
            this.mLastScrollState = newState;
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        super.onWindowFocusChanged(hasWindowFocus);
        this.mTouchHandler.onWindowFocusChanged(hasWindowFocus);
    }

    public void smoothScrollToPosition(int position) {
        this.mTouchHandler.smoothScrollToPosition(position);
    }

    public void smoothScrollToPosition(int position, int boundPosition) {
        this.mTouchHandler.smoothScrollToPosition(position, boundPosition);
    }

    public void smoothScrollBy(int distance, int duration) {
        this.mTouchHandler.smoothScrollBy(distance, duration);
    }

    int getHeaderViewsCount() {
        return 0;
    }

    int getFooterViewsCount() {
        return 0;
    }

    void hideSelector() {
        if (this.mSelectedPosition != -1) {
            if (this.mLayoutMode != 4) {
                this.mResurrectToPosition = this.mSelectedPosition;
            }
            if (this.mNextSelectedPosition >= 0 && this.mNextSelectedPosition != this.mSelectedPosition) {
                this.mResurrectToPosition = this.mNextSelectedPosition;
            }
            setSelectedPositionInt(-1);
            setNextSelectedPositionInt(-1);
            this.mSelectedTop = 0;
            this.mSelectorRect.setEmpty();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int reconcileSelectedPosition() {
        int position = this.mSelectedPosition;
        if (position < 0) {
            position = this.mResurrectToPosition;
        }
        return Math.min(Math.max(0, position), this.mItemCount - 1);
    }

    int findClosestMotionRowY(int y) {
        int childCount = getChildCount();
        if (childCount == 0) {
            return -1;
        }
        int motionRow = findMotionRowY(y);
        return motionRow == -1 ? (this.mFirstPosition + childCount) - 1 : motionRow;
    }

    int findClosestMotionRow(int x) {
        int childCount = getChildCount();
        if (childCount == 0) {
            return -1;
        }
        int motionRow = findMotionRowX(x);
        return motionRow == -1 ? (this.mFirstPosition + childCount) - 1 : motionRow;
    }

    public void invalidateViews() {
        this.mDataChanged = true;
        rememberSyncState();
        requestLayout();
        invalidate();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean resurrectSelection() {
        return this.mTouchHandler.resurrectSelection();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAdapterView
    public void handleDataChanged() {
        int i = 1;
        int count = this.mItemCount;
        if (count > 0) {
            if (this.mNeedSync) {
                this.mNeedSync = false;
                if (this.mTranscriptMode == 2 || (this.mTranscriptMode == 1 && this.mFirstPosition + getChildCount() >= this.mOldItemCount)) {
                    this.mLayoutMode = 3;
                    return;
                }
                switch (this.mSyncMode) {
                    case 1:
                        this.mLayoutMode = 5;
                        this.mSyncPosition = Math.min(Math.max(0, this.mSyncPosition), count - 1);
                        return;
                    case 0:
                        if (isInTouchMode()) {
                            this.mLayoutMode = 5;
                            this.mSyncPosition = Math.min(Math.max(0, this.mSyncPosition), count - 1);
                            return;
                        }
                        int newPos = findSyncPosition();
                        if (newPos >= 0 && lookForSelectablePosition(newPos, true) == newPos) {
                            this.mSyncPosition = newPos;
                            int size = this.mIsVertical ? getHeight() : getWidth();
                            if (this.mSyncSize == size) {
                                this.mLayoutMode = 5;
                            } else {
                                this.mLayoutMode = 2;
                            }
                            setNextSelectedPositionInt(newPos);
                            return;
                        }
                        break;
                }
            }
            if (!isInTouchMode()) {
                int newPos2 = getSelectedItemPosition();
                if (newPos2 >= count) {
                    newPos2 = count - 1;
                }
                if (newPos2 < 0) {
                    newPos2 = 0;
                }
                int selectablePos = lookForSelectablePosition(newPos2, true);
                if (selectablePos >= 0) {
                    setNextSelectedPositionInt(selectablePos);
                    return;
                }
                int selectablePos2 = lookForSelectablePosition(newPos2, false);
                if (selectablePos2 >= 0) {
                    setNextSelectedPositionInt(selectablePos2);
                    return;
                }
            } else if (this.mResurrectToPosition >= 0) {
                return;
            }
        }
        if (this.mStackFromBottom) {
            i = 3;
        }
        this.mLayoutMode = i;
        this.mSelectedPosition = -1;
        this.mSelectedRowId = Long.MIN_VALUE;
        this.mNextSelectedPosition = -1;
        this.mNextSelectedRowId = Long.MIN_VALUE;
        this.mNeedSync = false;
        checkSelectionChanged();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getDistance(Rect source, Rect dest, int direction) {
        int sX;
        int sY;
        int dX;
        int dY;
        switch (direction) {
            case 1:
            case 2:
                sX = source.right + (source.width() / 2);
                sY = source.top + (source.height() / 2);
                dX = dest.left + (dest.width() / 2);
                dY = dest.top + (dest.height() / 2);
                break;
            case 17:
                sX = source.left;
                sY = source.top + (source.height() / 2);
                dX = dest.right;
                dY = dest.top + (dest.height() / 2);
                break;
            case 33:
                sX = source.left + (source.width() / 2);
                sY = source.top;
                dX = dest.left + (dest.width() / 2);
                dY = dest.bottom;
                break;
            case 66:
                sX = source.right;
                sY = source.top + (source.height() / 2);
                dX = dest.left;
                dY = dest.top + (dest.height() / 2);
                break;
            case 130:
                sX = source.left + (source.width() / 2);
                sY = source.bottom;
                dX = dest.left + (dest.width() / 2);
                dY = dest.top;
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT, FOCUS_FORWARD, FOCUS_BACKWARD}.");
        }
        int deltaX = dX - sX;
        int deltaY = dY - sY;
        return (deltaY * deltaY) + (deltaX * deltaX);
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return new LayoutParams(p);
    }

    @Override // android.view.ViewGroup
    public LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    public void setTranscriptMode(int mode) {
        this.mTranscriptMode = mode;
    }

    public int getTranscriptMode() {
        return this.mTranscriptMode;
    }

    public void setScrollDirectionPortrait(int direction) {
        boolean tempDirection = this.mScrollVerticallyPortrait;
        this.mScrollVerticallyPortrait = direction == 0;
        if (tempDirection != this.mScrollVerticallyPortrait) {
            setupScrollInfo();
            resetList();
            this.mRecycler.clear();
        }
    }

    public int getScrollDirectionPortrait() {
        return this.mScrollVerticallyPortrait ? 0 : 1;
    }

    public void setScrollDirectionLandscape(int direction) {
        boolean tempDirection = this.mScrollVerticallyLandscape;
        this.mScrollVerticallyLandscape = direction == 0;
        if (tempDirection != this.mScrollVerticallyLandscape) {
            setupScrollInfo();
            resetList();
            this.mRecycler.clear();
        }
    }

    public int getScrollDirectionLandscape() {
        return this.mScrollVerticallyLandscape ? 0 : 1;
    }

    @Override // android.view.View
    public int getSolidColor() {
        return this.mCacheColorHint;
    }

    public void setCacheColorHint(int color) {
        if (color != this.mCacheColorHint) {
            this.mCacheColorHint = color;
            int count = getChildCount();
            for (int i = 0; i < count; i++) {
                getChildAt(i).setDrawingCacheBackgroundColor(color);
            }
            this.mRecycler.setCacheColorHint(color);
        }
    }

    public int getCacheColorHint() {
        return this.mCacheColorHint;
    }

    public void reclaimViews(List<View> views) {
        int childCount = getChildCount();
        RecyclerListener listener = this.mRecycler.mRecyclerListener;
        for (int i = 0; i < childCount; i++) {
            View child = getChildAt(i);
            LayoutParams lp = (LayoutParams) child.getLayoutParams();
            if (lp != null && this.mRecycler.shouldRecycleViewType(lp.viewType)) {
                views.add(child);
                if (listener != null) {
                    listener.onMovedToScrapHeap(child);
                }
            }
        }
        this.mRecycler.reclaimScrapViews(views);
        removeAllViewsInLayout();
    }

    protected boolean checkConsistency(int consistency) {
        boolean result = true;
        View[] activeViews = this.mRecycler.mActiveViews;
        int count = activeViews.length;
        for (int i = 0; i < count; i++) {
            if (activeViews[i] != null) {
                result = false;
                Log.d("Consistency", "AbsListView " + this + " has a view in its active recycler: " + activeViews[i]);
            }
        }
        ArrayList<View> scrap = this.mRecycler.mCurrentScrap;
        if (!checkScrap(scrap)) {
            result = false;
        }
        ArrayList<View>[] scraps = this.mRecycler.mScrapViews;
        for (ArrayList<View> arrayList : scraps) {
            if (!checkScrap(arrayList)) {
                result = false;
            }
        }
        return result;
    }

    private boolean checkScrap(ArrayList<View> scrap) {
        if (scrap == null) {
            return true;
        }
        boolean result = true;
        int count = scrap.size();
        for (int i = 0; i < count; i++) {
            View view = scrap.get(i);
            if (view.getParent() != null) {
                result = false;
                Log.d("Consistency", "TwoWayAbsListView " + this + " has a view in its scrap heap still attached to a parent: " + view);
            }
            if (indexOfChild(view) >= 0) {
                result = false;
                Log.d("Consistency", "TwoWayAbsListView " + this + " has a view in its scrap heap that is also a direct child: " + view);
            }
        }
        return result;
    }

    public void setRecyclerListener(RecyclerListener listener) {
        this.mRecycler.mRecyclerListener = listener;
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends ViewGroup.LayoutParams {
        @ViewDebug.ExportedProperty
        boolean forceAdd;
        @ViewDebug.ExportedProperty
        boolean recycledHeaderFooter;
        @ViewDebug.ExportedProperty(mapping = {@ViewDebug.IntToString(from = -1, to = "ITEM_VIEW_TYPE_IGNORE"), @ViewDebug.IntToString(from = -2, to = "ITEM_VIEW_TYPE_HEADER_OR_FOOTER")})
        int viewType;

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
        }

        public LayoutParams(int w, int h) {
            super(w, h);
        }

        public LayoutParams(int w, int h, int viewType) {
            super(w, h);
            this.viewType = viewType;
        }

        public LayoutParams(ViewGroup.LayoutParams source) {
            super(source);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public class RecycleBin {
        private View[] mActiveViews = new View[0];
        private ArrayList<View> mCurrentScrap;
        private int mFirstActivePosition;
        private RecyclerListener mRecyclerListener;
        private ArrayList<View>[] mScrapViews;
        private int mViewTypeCount;

        RecycleBin() {
        }

        public void setViewTypeCount(int viewTypeCount) {
            if (viewTypeCount < 1) {
                throw new IllegalArgumentException("Can't have a viewTypeCount < 1");
            }
            ArrayList<View>[] scrapViews = new ArrayList[viewTypeCount];
            for (int i = 0; i < viewTypeCount; i++) {
                scrapViews[i] = new ArrayList<>();
            }
            this.mViewTypeCount = viewTypeCount;
            this.mCurrentScrap = scrapViews[0];
            this.mScrapViews = scrapViews;
        }

        public void markChildrenDirty() {
            if (this.mViewTypeCount == 1) {
                ArrayList<View> scrap = this.mCurrentScrap;
                int scrapCount = scrap.size();
                for (int i = 0; i < scrapCount; i++) {
                    scrap.get(i).forceLayout();
                }
                return;
            }
            int typeCount = this.mViewTypeCount;
            for (int i2 = 0; i2 < typeCount; i2++) {
                ArrayList<View> scrap2 = this.mScrapViews[i2];
                int scrapCount2 = scrap2.size();
                for (int j = 0; j < scrapCount2; j++) {
                    scrap2.get(j).forceLayout();
                }
            }
        }

        public boolean shouldRecycleViewType(int viewType) {
            return viewType >= 0;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void clear() {
            if (this.mViewTypeCount == 1) {
                ArrayList<View> scrap = this.mCurrentScrap;
                int scrapCount = scrap.size();
                for (int i = 0; i < scrapCount; i++) {
                    TwoWayAbsListView.this.removeDetachedView(scrap.remove((scrapCount - 1) - i), false);
                }
                return;
            }
            int typeCount = this.mViewTypeCount;
            for (int i2 = 0; i2 < typeCount; i2++) {
                ArrayList<View> scrap2 = this.mScrapViews[i2];
                int scrapCount2 = scrap2.size();
                for (int j = 0; j < scrapCount2; j++) {
                    TwoWayAbsListView.this.removeDetachedView(scrap2.remove((scrapCount2 - 1) - j), false);
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void fillActiveViews(int childCount, int firstActivePosition) {
            if (this.mActiveViews.length < childCount) {
                this.mActiveViews = new View[childCount];
            }
            this.mFirstActivePosition = firstActivePosition;
            View[] activeViews = this.mActiveViews;
            for (int i = 0; i < childCount; i++) {
                View child = TwoWayAbsListView.this.getChildAt(i);
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (lp != null && lp.viewType != -2) {
                    activeViews[i] = child;
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public View getActiveView(int position) {
            int index = position - this.mFirstActivePosition;
            View[] activeViews = this.mActiveViews;
            if (index < 0 || index >= activeViews.length) {
                return null;
            }
            View match = activeViews[index];
            activeViews[index] = null;
            return match;
        }

        View getScrapView(int position) {
            ArrayList<View> scrapViews;
            int size;
            if (this.mViewTypeCount == 1) {
                ArrayList<View> scrapViews2 = this.mCurrentScrap;
                int size2 = scrapViews2.size();
                if (size2 <= 0) {
                    return null;
                }
                return scrapViews2.remove(size2 - 1);
            }
            int whichScrap = TwoWayAbsListView.this.mAdapter.getItemViewType(position);
            if (whichScrap >= 0 && whichScrap < this.mScrapViews.length && (size = (scrapViews = this.mScrapViews[whichScrap]).size()) > 0) {
                return scrapViews.remove(size - 1);
            }
            return null;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void addScrapView(View scrap) {
            LayoutParams lp = (LayoutParams) scrap.getLayoutParams();
            if (lp != null) {
                int viewType = lp.viewType;
                if (!shouldRecycleViewType(viewType)) {
                    if (viewType != -2) {
                        TwoWayAbsListView.this.removeDetachedView(scrap, false);
                        return;
                    }
                    return;
                }
                if (this.mViewTypeCount == 1) {
                    scrap.onStartTemporaryDetach();
                    this.mCurrentScrap.add(scrap);
                } else {
                    scrap.onStartTemporaryDetach();
                    this.mScrapViews[viewType].add(scrap);
                }
                if (this.mRecyclerListener != null) {
                    this.mRecyclerListener.onMovedToScrapHeap(scrap);
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void scrapActiveViews() {
            View[] activeViews = this.mActiveViews;
            boolean hasListener = this.mRecyclerListener != null;
            boolean multipleScraps = this.mViewTypeCount > 1;
            ArrayList<View> scrapViews = this.mCurrentScrap;
            int count = activeViews.length;
            for (int i = count - 1; i >= 0; i--) {
                View victim = activeViews[i];
                if (victim != null) {
                    int whichScrap = ((LayoutParams) victim.getLayoutParams()).viewType;
                    activeViews[i] = null;
                    if (!shouldRecycleViewType(whichScrap)) {
                        if (whichScrap != -2) {
                            TwoWayAbsListView.this.removeDetachedView(victim, false);
                        }
                    } else {
                        if (multipleScraps) {
                            scrapViews = this.mScrapViews[whichScrap];
                        }
                        victim.onStartTemporaryDetach();
                        scrapViews.add(victim);
                        if (hasListener) {
                            this.mRecyclerListener.onMovedToScrapHeap(victim);
                        }
                    }
                }
            }
            pruneScrapViews();
        }

        private void pruneScrapViews() {
            int maxViews = this.mActiveViews.length;
            int viewTypeCount = this.mViewTypeCount;
            ArrayList<View>[] scrapViews = this.mScrapViews;
            for (int i = 0; i < viewTypeCount; i++) {
                ArrayList<View> scrapPile = scrapViews[i];
                int size = scrapPile.size();
                int extras = size - maxViews;
                int j = 0;
                int size2 = size - 1;
                while (j < extras) {
                    TwoWayAbsListView.this.removeDetachedView(scrapPile.remove(size2), false);
                    j++;
                    size2--;
                }
            }
        }

        void reclaimScrapViews(List<View> views) {
            if (this.mViewTypeCount == 1) {
                views.addAll(this.mCurrentScrap);
                return;
            }
            int viewTypeCount = this.mViewTypeCount;
            ArrayList<View>[] scrapViews = this.mScrapViews;
            for (int i = 0; i < viewTypeCount; i++) {
                ArrayList<View> scrapPile = scrapViews[i];
                views.addAll(scrapPile);
            }
        }

        void setCacheColorHint(int color) {
            if (this.mViewTypeCount == 1) {
                ArrayList<View> scrap = this.mCurrentScrap;
                int scrapCount = scrap.size();
                for (int i = 0; i < scrapCount; i++) {
                    scrap.get(i).setDrawingCacheBackgroundColor(color);
                }
            } else {
                int typeCount = this.mViewTypeCount;
                for (int i2 = 0; i2 < typeCount; i2++) {
                    ArrayList<View> scrap2 = this.mScrapViews[i2];
                    int scrapCount2 = scrap2.size();
                    for (int j = 0; j < scrapCount2; j++) {
                        scrap2.get(i2).setDrawingCacheBackgroundColor(color);
                    }
                }
            }
            View[] activeViews = this.mActiveViews;
            for (View victim : activeViews) {
                if (victim != null) {
                    victim.setDrawingCacheBackgroundColor(color);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public abstract class TouchHandler {
        protected FlingRunnable mFlingRunnable;
        int mMotionCorrection;
        protected PositionScroller mPositionScroller;

        protected abstract FlingRunnable getFlingRunnable();

        protected abstract PositionScroller getPositionScroller();

        public abstract boolean onInterceptTouchEvent(MotionEvent motionEvent);

        public abstract boolean onTouchEvent(MotionEvent motionEvent);

        abstract boolean resurrectSelection();

        abstract boolean trackMotionScroll(int i, int i2);

        TouchHandler() {
        }

        public void onWindowFocusChanged(boolean hasWindowFocus) {
            int touchMode = TwoWayAbsListView.this.isInTouchMode() ? 0 : 1;
            if (!hasWindowFocus) {
                TwoWayAbsListView.this.setChildrenDrawingCacheEnabled(false);
                if (this.mFlingRunnable != null) {
                    TwoWayAbsListView.this.removeCallbacks(this.mFlingRunnable);
                    this.mFlingRunnable.endFling();
                    if (TwoWayAbsListView.this.getScrollY() != 0) {
                        TwoWayAbsListView.this.scrollTo(TwoWayAbsListView.this.getScrollX(), 0);
                        TwoWayAbsListView.this.invalidate();
                    }
                }
                if (touchMode == 1) {
                    TwoWayAbsListView.this.mResurrectToPosition = TwoWayAbsListView.this.mSelectedPosition;
                }
            } else if (touchMode != TwoWayAbsListView.this.mLastTouchMode && TwoWayAbsListView.this.mLastTouchMode != -1) {
                if (touchMode == 1) {
                    resurrectSelection();
                } else {
                    TwoWayAbsListView.this.hideSelector();
                    TwoWayAbsListView.this.mLayoutMode = 0;
                    TwoWayAbsListView.this.layoutChildren();
                }
            }
            TwoWayAbsListView.this.mLastTouchMode = touchMode;
        }

        public boolean startScrollIfNeeded(int delta) {
            int distance = Math.abs(delta);
            if (distance > TwoWayAbsListView.this.mTouchSlop) {
                createScrollingCache();
                TwoWayAbsListView.this.mTouchMode = 3;
                this.mMotionCorrection = delta;
                Handler handler = TwoWayAbsListView.this.getHandler();
                if (handler != null) {
                    handler.removeCallbacks(TwoWayAbsListView.this.mPendingCheckForLongPress);
                }
                TwoWayAbsListView.this.setPressed(false);
                View motionView = TwoWayAbsListView.this.getChildAt(TwoWayAbsListView.this.mMotionPosition - TwoWayAbsListView.this.mFirstPosition);
                if (motionView != null) {
                    motionView.setPressed(false);
                }
                reportScrollStateChange(1);
                TwoWayAbsListView.this.requestDisallowInterceptTouchEvent(true);
                return true;
            }
            return false;
        }

        public void onTouchModeChanged(boolean isInTouchMode) {
            if (isInTouchMode) {
                TwoWayAbsListView.this.hideSelector();
                if (TwoWayAbsListView.this.getHeight() > 0 && TwoWayAbsListView.this.getChildCount() > 0) {
                    TwoWayAbsListView.this.layoutChildren();
                }
            }
        }

        void reportScrollStateChange(int newState) {
            if (newState != TwoWayAbsListView.this.mLastScrollState && TwoWayAbsListView.this.mOnScrollListener != null) {
                TwoWayAbsListView.this.mOnScrollListener.onScrollStateChanged(TwoWayAbsListView.this, newState);
                TwoWayAbsListView.this.mLastScrollState = newState;
            }
        }

        public void smoothScrollToPosition(int position) {
            if (this.mPositionScroller == null) {
                this.mPositionScroller = getPositionScroller();
            }
            this.mPositionScroller.start(position);
        }

        public void smoothScrollToPosition(int position, int boundPosition) {
            if (this.mPositionScroller == null) {
                this.mPositionScroller = getPositionScroller();
            }
            this.mPositionScroller.start(position, boundPosition);
        }

        public void smoothScrollBy(int distance, int duration) {
            if (this.mFlingRunnable == null) {
                this.mFlingRunnable = getFlingRunnable();
            } else {
                this.mFlingRunnable.endFling();
            }
            this.mFlingRunnable.startScroll(distance, duration);
        }

        void stopScroll() {
            if (this.mFlingRunnable != null) {
                this.mFlingRunnable.stopFling();
            }
        }

        protected void createScrollingCache() {
            if (TwoWayAbsListView.this.mScrollingCacheEnabled && !TwoWayAbsListView.this.mCachingStarted) {
                TwoWayAbsListView.this.setChildrenDrawnWithCacheEnabled(true);
                TwoWayAbsListView.this.setChildrenDrawingCacheEnabled(true);
                TwoWayAbsListView.this.mCachingStarted = true;
            }
        }

        protected void clearScrollingCache() {
            if (TwoWayAbsListView.this.mClearScrollingCache == null) {
                TwoWayAbsListView.this.mClearScrollingCache = new Runnable() { // from class: com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (TwoWayAbsListView.this.mCachingStarted) {
                            TwoWayAbsListView.this.mCachingStarted = false;
                            TwoWayAbsListView.this.setChildrenDrawnWithCacheEnabled(false);
                            if ((TwoWayAbsListView.this.getPersistentDrawingCache() & 2) == 0) {
                                TwoWayAbsListView.this.setChildrenDrawingCacheEnabled(false);
                            }
                            if (!TwoWayAbsListView.this.isAlwaysDrawnWithCacheEnabled()) {
                                TwoWayAbsListView.this.invalidate();
                            }
                        }
                    }
                };
            }
            TwoWayAbsListView.this.post(TwoWayAbsListView.this.mClearScrollingCache);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        /* loaded from: classes3.dex */
        public abstract class FlingRunnable implements Runnable {
            protected Runnable mCheckFlywheel;
            protected final Scroller mScroller;

            abstract void flywheelTouch();

            @Override // java.lang.Runnable
            public abstract void run();

            abstract void start(int i);

            abstract void startScroll(int i, int i2);

            public boolean isScrollingInDirection(float xvel, float yvel) {
                int dx = this.mScroller.getFinalX() - this.mScroller.getStartX();
                int dy = this.mScroller.getFinalY() - this.mScroller.getStartY();
                return !this.mScroller.isFinished() && Math.signum(xvel) == Math.signum((float) dx) && Math.signum(yvel) == Math.signum((float) dy);
            }

            FlingRunnable() {
                this.mScroller = new Scroller(TwoWayAbsListView.this.getContext());
            }

            protected void endFling() {
                TwoWayAbsListView.this.mTouchMode = -1;
                TouchHandler.this.reportScrollStateChange(0);
                TouchHandler.this.clearScrollingCache();
                TwoWayAbsListView.this.removeCallbacks(this);
                if (this.mCheckFlywheel != null) {
                    TwoWayAbsListView.this.removeCallbacks(this.mCheckFlywheel);
                }
                if (TouchHandler.this.mPositionScroller != null) {
                    TwoWayAbsListView.this.removeCallbacks(TouchHandler.this.mPositionScroller);
                }
                this.mScroller.abortAnimation();
            }

            public void stopFling() {
                TwoWayAbsListView.this.removeCallbacks(this);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes3.dex */
        public abstract class PositionScroller implements Runnable {
            protected static final int MOVE_DOWN_BOUND = 3;
            protected static final int MOVE_DOWN_POS = 1;
            protected static final int MOVE_UP_BOUND = 4;
            protected static final int MOVE_UP_POS = 2;
            protected static final int SCROLL_DURATION = 400;
            protected int mBoundPos;
            protected final int mExtraScroll;
            protected int mLastSeenPos;
            protected int mMode;
            protected int mScrollDuration;
            protected int mTargetPos;
            protected boolean mVertical;

            @Override // java.lang.Runnable
            public abstract void run();

            PositionScroller() {
                this.mExtraScroll = ViewConfiguration.get(TwoWayAbsListView.this.mContext).getScaledFadingEdgeLength();
            }

            void start(int position) {
                int viewTravelCount;
                int firstPos = TwoWayAbsListView.this.mFirstPosition;
                int lastPos = (TwoWayAbsListView.this.getChildCount() + firstPos) - 1;
                if (position <= firstPos) {
                    viewTravelCount = (firstPos - position) + 1;
                    this.mMode = 2;
                } else if (position >= lastPos) {
                    viewTravelCount = (position - lastPos) + 1;
                    this.mMode = 1;
                } else {
                    return;
                }
                if (viewTravelCount > 0) {
                    this.mScrollDuration = 400 / viewTravelCount;
                } else {
                    this.mScrollDuration = 400;
                }
                this.mTargetPos = position;
                this.mBoundPos = -1;
                this.mLastSeenPos = -1;
                TwoWayAbsListView.this.post(this);
            }

            void start(int position, int boundPosition) {
                int boundPosFromFirst;
                int viewTravelCount;
                if (boundPosition == -1) {
                    start(position);
                    return;
                }
                int firstPos = TwoWayAbsListView.this.mFirstPosition;
                int lastPos = (TwoWayAbsListView.this.getChildCount() + firstPos) - 1;
                if (position <= firstPos) {
                    int boundPosFromLast = lastPos - boundPosition;
                    if (boundPosFromLast >= 1) {
                        int posTravel = (firstPos - position) + 1;
                        int boundTravel = boundPosFromLast - 1;
                        if (boundTravel < posTravel) {
                            viewTravelCount = boundTravel;
                            this.mMode = 4;
                        } else {
                            viewTravelCount = posTravel;
                            this.mMode = 2;
                        }
                    } else {
                        return;
                    }
                } else if (position >= lastPos && (boundPosFromFirst = boundPosition - firstPos) >= 1) {
                    int posTravel2 = (position - lastPos) + 1;
                    int boundTravel2 = boundPosFromFirst - 1;
                    if (boundTravel2 < posTravel2) {
                        viewTravelCount = boundTravel2;
                        this.mMode = 3;
                    } else {
                        viewTravelCount = posTravel2;
                        this.mMode = 1;
                    }
                } else {
                    return;
                }
                if (viewTravelCount > 0) {
                    this.mScrollDuration = 400 / viewTravelCount;
                } else {
                    this.mScrollDuration = 400;
                }
                this.mTargetPos = position;
                this.mBoundPos = boundPosition;
                this.mLastSeenPos = -1;
                TwoWayAbsListView.this.post(this);
            }

            void stop() {
                TwoWayAbsListView.this.removeCallbacks(this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public class VerticalTouchHandler extends TouchHandler {
        int mLastY;
        int mMotionViewNewTop;
        int mMotionViewOriginalTop;

        VerticalTouchHandler() {
            super();
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        public boolean onTouchEvent(MotionEvent ev) {
            Drawable d;
            if (!TwoWayAbsListView.this.isEnabled()) {
                return TwoWayAbsListView.this.isClickable() || TwoWayAbsListView.this.isLongClickable();
            }
            int action = ev.getAction();
            if (TwoWayAbsListView.this.mVelocityTracker == null) {
                TwoWayAbsListView.this.mVelocityTracker = VelocityTracker.obtain();
            }
            TwoWayAbsListView.this.mVelocityTracker.addMovement(ev);
            switch (action) {
                case 0:
                    int x = (int) ev.getX();
                    int y = (int) ev.getY();
                    int motionPosition = TwoWayAbsListView.this.pointToPosition(x, y);
                    if (!TwoWayAbsListView.this.mDataChanged) {
                        if (TwoWayAbsListView.this.mTouchMode != 4 && motionPosition >= 0 && TwoWayAbsListView.this.getAdapter().isEnabled(motionPosition)) {
                            TwoWayAbsListView.this.mTouchMode = 0;
                            if (TwoWayAbsListView.this.mPendingCheckForTap == null) {
                                TwoWayAbsListView.this.mPendingCheckForTap = new CheckForTap();
                            }
                            TwoWayAbsListView.this.postDelayed(TwoWayAbsListView.this.mPendingCheckForTap, ViewConfiguration.getTapTimeout());
                        } else if (ev.getEdgeFlags() != 0 && motionPosition < 0) {
                            return false;
                        } else {
                            if (TwoWayAbsListView.this.mTouchMode == 4) {
                                createScrollingCache();
                                TwoWayAbsListView.this.mTouchMode = 3;
                                this.mMotionCorrection = 0;
                                motionPosition = TwoWayAbsListView.this.findMotionRowY(y);
                                this.mFlingRunnable.flywheelTouch();
                            }
                        }
                    }
                    if (motionPosition >= 0) {
                        View v = TwoWayAbsListView.this.getChildAt(motionPosition - TwoWayAbsListView.this.mFirstPosition);
                        this.mMotionViewOriginalTop = v.getTop();
                    }
                    TwoWayAbsListView.this.mMotionX = x;
                    TwoWayAbsListView.this.mMotionY = y;
                    TwoWayAbsListView.this.mMotionPosition = motionPosition;
                    this.mLastY = Integer.MIN_VALUE;
                    break;
                case 1:
                    switch (TwoWayAbsListView.this.mTouchMode) {
                        case 0:
                        case 1:
                        case 2:
                            int motionPosition2 = TwoWayAbsListView.this.mMotionPosition;
                            final View child = TwoWayAbsListView.this.getChildAt(motionPosition2 - TwoWayAbsListView.this.mFirstPosition);
                            if (child != null && !child.hasFocusable()) {
                                if (TwoWayAbsListView.this.mTouchMode != 0) {
                                    child.setPressed(false);
                                }
                                if (TwoWayAbsListView.this.mPerformClick == null) {
                                    TwoWayAbsListView.this.mPerformClick = new PerformClick();
                                }
                                final PerformClick performClick = TwoWayAbsListView.this.mPerformClick;
                                performClick.mChild = child;
                                performClick.mClickMotionPosition = motionPosition2;
                                performClick.rememberWindowAttachCount();
                                TwoWayAbsListView.this.mResurrectToPosition = motionPosition2;
                                if (TwoWayAbsListView.this.mTouchMode == 0 || TwoWayAbsListView.this.mTouchMode == 1) {
                                    Handler handler = TwoWayAbsListView.this.getHandler();
                                    if (handler != null) {
                                        handler.removeCallbacks(TwoWayAbsListView.this.mTouchMode == 0 ? TwoWayAbsListView.this.mPendingCheckForTap : TwoWayAbsListView.this.mPendingCheckForLongPress);
                                    }
                                    TwoWayAbsListView.this.mLayoutMode = 0;
                                    if (!TwoWayAbsListView.this.mDataChanged && TwoWayAbsListView.this.mAdapter.isEnabled(motionPosition2)) {
                                        TwoWayAbsListView.this.mTouchMode = 1;
                                        TwoWayAbsListView.this.setSelectedPositionInt(TwoWayAbsListView.this.mMotionPosition);
                                        TwoWayAbsListView.this.layoutChildren();
                                        child.setPressed(true);
                                        TwoWayAbsListView.this.positionSelector(child);
                                        TwoWayAbsListView.this.setPressed(true);
                                        if (TwoWayAbsListView.this.mSelector != null && (d = TwoWayAbsListView.this.mSelector.getCurrent()) != null && (d instanceof TransitionDrawable)) {
                                            ((TransitionDrawable) d).resetTransition();
                                        }
                                        TwoWayAbsListView.this.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.VerticalTouchHandler.1
                                            @Override // java.lang.Runnable
                                            public void run() {
                                                child.setPressed(false);
                                                TwoWayAbsListView.this.setPressed(false);
                                                if (!TwoWayAbsListView.this.mDataChanged) {
                                                    TwoWayAbsListView.this.post(performClick);
                                                }
                                                TwoWayAbsListView.this.mTouchMode = -1;
                                            }
                                        }, ViewConfiguration.getPressedStateDuration());
                                    } else {
                                        TwoWayAbsListView.this.mTouchMode = -1;
                                    }
                                    return true;
                                } else if (!TwoWayAbsListView.this.mDataChanged && TwoWayAbsListView.this.mAdapter.isEnabled(motionPosition2)) {
                                    TwoWayAbsListView.this.post(performClick);
                                }
                            }
                            TwoWayAbsListView.this.mTouchMode = -1;
                            break;
                        case 3:
                            int childCount = TwoWayAbsListView.this.getChildCount();
                            if (childCount > 0) {
                                if (TwoWayAbsListView.this.mFirstPosition != 0 || TwoWayAbsListView.this.getChildAt(0).getTop() < TwoWayAbsListView.this.mListPadding.top || TwoWayAbsListView.this.mFirstPosition + childCount >= TwoWayAbsListView.this.mItemCount || TwoWayAbsListView.this.getChildAt(childCount - 1).getBottom() > TwoWayAbsListView.this.getHeight() - TwoWayAbsListView.this.mListPadding.bottom) {
                                    VelocityTracker velocityTracker = TwoWayAbsListView.this.mVelocityTracker;
                                    velocityTracker.computeCurrentVelocity(1000);
                                    int initialVelocity = (int) velocityTracker.getYVelocity();
                                    if (Math.abs(initialVelocity) > TwoWayAbsListView.this.mMinimumVelocity) {
                                        if (this.mFlingRunnable == null) {
                                            this.mFlingRunnable = new VerticalFlingRunnable();
                                        }
                                        reportScrollStateChange(2);
                                        this.mFlingRunnable.start(-initialVelocity);
                                        break;
                                    } else {
                                        TwoWayAbsListView.this.mTouchMode = -1;
                                        reportScrollStateChange(0);
                                        break;
                                    }
                                } else {
                                    TwoWayAbsListView.this.mTouchMode = -1;
                                    reportScrollStateChange(0);
                                    break;
                                }
                            } else {
                                TwoWayAbsListView.this.mTouchMode = -1;
                                reportScrollStateChange(0);
                                break;
                            }
                            break;
                    }
                    TwoWayAbsListView.this.setPressed(false);
                    TwoWayAbsListView.this.invalidate();
                    Handler handler2 = TwoWayAbsListView.this.getHandler();
                    if (handler2 != null) {
                        handler2.removeCallbacks(TwoWayAbsListView.this.mPendingCheckForLongPress);
                    }
                    if (TwoWayAbsListView.this.mVelocityTracker != null) {
                        TwoWayAbsListView.this.mVelocityTracker.recycle();
                        TwoWayAbsListView.this.mVelocityTracker = null;
                    }
                    TwoWayAbsListView.this.mActivePointerId = -1;
                    break;
                case 2:
                    int y2 = (int) ev.getY();
                    int deltaY = y2 - TwoWayAbsListView.this.mMotionY;
                    switch (TwoWayAbsListView.this.mTouchMode) {
                        case 0:
                        case 1:
                        case 2:
                            startScrollIfNeeded(deltaY);
                            break;
                        case 3:
                            if (y2 != this.mLastY) {
                                int deltaY2 = deltaY - this.mMotionCorrection;
                                int incrementalDeltaY = this.mLastY != Integer.MIN_VALUE ? y2 - this.mLastY : deltaY2;
                                boolean atEdge = false;
                                if (incrementalDeltaY != 0) {
                                    atEdge = trackMotionScroll(deltaY2, incrementalDeltaY);
                                }
                                if (atEdge && TwoWayAbsListView.this.getChildCount() > 0) {
                                    int motionPosition3 = TwoWayAbsListView.this.findMotionRowY(y2);
                                    if (motionPosition3 >= 0) {
                                        this.mMotionViewOriginalTop = TwoWayAbsListView.this.getChildAt(motionPosition3 - TwoWayAbsListView.this.mFirstPosition).getTop();
                                    }
                                    TwoWayAbsListView.this.mMotionY = y2;
                                    TwoWayAbsListView.this.mMotionPosition = motionPosition3;
                                    TwoWayAbsListView.this.invalidate();
                                }
                                this.mLastY = y2;
                                break;
                            }
                            break;
                    }
                case 3:
                    TwoWayAbsListView.this.mTouchMode = -1;
                    TwoWayAbsListView.this.setPressed(false);
                    View motionView = TwoWayAbsListView.this.getChildAt(TwoWayAbsListView.this.mMotionPosition - TwoWayAbsListView.this.mFirstPosition);
                    if (motionView != null) {
                        motionView.setPressed(false);
                    }
                    clearScrollingCache();
                    Handler handler3 = TwoWayAbsListView.this.getHandler();
                    if (handler3 != null) {
                        handler3.removeCallbacks(TwoWayAbsListView.this.mPendingCheckForLongPress);
                    }
                    if (TwoWayAbsListView.this.mVelocityTracker != null) {
                        TwoWayAbsListView.this.mVelocityTracker.recycle();
                        TwoWayAbsListView.this.mVelocityTracker = null;
                    }
                    TwoWayAbsListView.this.mActivePointerId = -1;
                    break;
            }
            return true;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        public boolean onInterceptTouchEvent(MotionEvent ev) {
            int action = ev.getAction();
            switch (action) {
                case 0:
                    int touchMode = TwoWayAbsListView.this.mTouchMode;
                    int x = (int) ev.getX();
                    int y = (int) ev.getY();
                    int motionPosition = TwoWayAbsListView.this.findMotionRowY(y);
                    if (touchMode != 4 && motionPosition >= 0) {
                        View v = TwoWayAbsListView.this.getChildAt(motionPosition - TwoWayAbsListView.this.mFirstPosition);
                        this.mMotionViewOriginalTop = v.getTop();
                        TwoWayAbsListView.this.mMotionX = x;
                        TwoWayAbsListView.this.mMotionY = y;
                        TwoWayAbsListView.this.mMotionPosition = motionPosition;
                        TwoWayAbsListView.this.mTouchMode = 0;
                        clearScrollingCache();
                    }
                    this.mLastY = Integer.MIN_VALUE;
                    TwoWayAbsListView.this.initOrResetVelocityTracker();
                    TwoWayAbsListView.this.mVelocityTracker.addMovement(ev);
                    if (touchMode == 4) {
                        return true;
                    }
                    break;
                case 1:
                    TwoWayAbsListView.this.mTouchMode = -1;
                    TwoWayAbsListView.this.mActivePointerId = -1;
                    reportScrollStateChange(0);
                    break;
                case 2:
                    switch (TwoWayAbsListView.this.mTouchMode) {
                        case 0:
                            if (startScrollIfNeeded(((int) ev.getY()) - TwoWayAbsListView.this.mMotionY)) {
                                return true;
                            }
                            break;
                    }
            }
            return false;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        boolean trackMotionScroll(int deltaY, int incrementalDeltaY) {
            int deltaY2;
            int incrementalDeltaY2;
            int childIndex;
            int childCount = TwoWayAbsListView.this.getChildCount();
            if (childCount == 0) {
                return true;
            }
            int firstTop = TwoWayAbsListView.this.getChildAt(0).getTop();
            int lastBottom = TwoWayAbsListView.this.getChildAt(childCount - 1).getBottom();
            Rect listPadding = TwoWayAbsListView.this.mListPadding;
            int spaceAbove = listPadding.top - firstTop;
            int end = TwoWayAbsListView.this.getHeight() - listPadding.bottom;
            int spaceBelow = lastBottom - end;
            int height = (TwoWayAbsListView.this.getHeight() - TwoWayAbsListView.this.getPaddingBottom()) - TwoWayAbsListView.this.getPaddingTop();
            if (deltaY < 0) {
                deltaY2 = Math.max(-(height - 1), deltaY);
            } else {
                deltaY2 = Math.min(height - 1, deltaY);
            }
            if (incrementalDeltaY < 0) {
                incrementalDeltaY2 = Math.max(-(height - 1), incrementalDeltaY);
            } else {
                incrementalDeltaY2 = Math.min(height - 1, incrementalDeltaY);
            }
            int firstPosition = TwoWayAbsListView.this.mFirstPosition;
            if (firstPosition == 0 && firstTop >= listPadding.top && deltaY2 >= 0) {
                return true;
            }
            if (firstPosition + childCount == TwoWayAbsListView.this.mItemCount && lastBottom <= end && deltaY2 <= 0) {
                return true;
            }
            boolean down = incrementalDeltaY2 < 0;
            boolean inTouchMode = TwoWayAbsListView.this.isInTouchMode();
            if (inTouchMode) {
                TwoWayAbsListView.this.hideSelector();
            }
            int headerViewsCount = TwoWayAbsListView.this.getHeaderViewsCount();
            int footerViewsStart = TwoWayAbsListView.this.mItemCount - TwoWayAbsListView.this.getFooterViewsCount();
            int start = 0;
            int count = 0;
            if (down) {
                int top = listPadding.top - incrementalDeltaY2;
                for (int i = 0; i < childCount; i++) {
                    View child = TwoWayAbsListView.this.getChildAt(i);
                    if (child.getBottom() >= top) {
                        break;
                    }
                    count++;
                    int position = firstPosition + i;
                    if (position >= headerViewsCount && position < footerViewsStart) {
                        TwoWayAbsListView.this.mRecycler.addScrapView(child);
                    }
                }
            } else {
                int bottom = (TwoWayAbsListView.this.getHeight() - listPadding.bottom) - incrementalDeltaY2;
                for (int i2 = childCount - 1; i2 >= 0; i2--) {
                    View child2 = TwoWayAbsListView.this.getChildAt(i2);
                    if (child2.getTop() <= bottom) {
                        break;
                    }
                    start = i2;
                    count++;
                    int position2 = firstPosition + i2;
                    if (position2 >= headerViewsCount && position2 < footerViewsStart) {
                        TwoWayAbsListView.this.mRecycler.addScrapView(child2);
                    }
                }
            }
            this.mMotionViewNewTop = this.mMotionViewOriginalTop + deltaY2;
            TwoWayAbsListView.this.mBlockLayoutRequests = true;
            if (count > 0) {
                TwoWayAbsListView.this.detachViewsFromParent(start, count);
            }
            TwoWayAbsListView.this.offsetChildrenTopAndBottom(incrementalDeltaY2);
            if (down) {
                TwoWayAbsListView.this.mFirstPosition += count;
            }
            TwoWayAbsListView.this.invalidate();
            int absIncrementalDeltaY = Math.abs(incrementalDeltaY2);
            if (spaceAbove < absIncrementalDeltaY || spaceBelow < absIncrementalDeltaY) {
                TwoWayAbsListView.this.fillGap(down);
            }
            if (!inTouchMode && TwoWayAbsListView.this.mSelectedPosition != -1 && (childIndex = TwoWayAbsListView.this.mSelectedPosition - TwoWayAbsListView.this.mFirstPosition) >= 0 && childIndex < TwoWayAbsListView.this.getChildCount()) {
                TwoWayAbsListView.this.positionSelector(TwoWayAbsListView.this.getChildAt(childIndex));
            }
            TwoWayAbsListView.this.mBlockLayoutRequests = false;
            TwoWayAbsListView.this.invokeOnItemScrollListener();
            return false;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        boolean resurrectSelection() {
            int selectedPos;
            int childCount = TwoWayAbsListView.this.getChildCount();
            if (childCount <= 0) {
                return false;
            }
            int selectedTop = 0;
            int childrenTop = TwoWayAbsListView.this.mListPadding.top;
            int childrenBottom = (TwoWayAbsListView.this.getBottom() - TwoWayAbsListView.this.getTop()) - TwoWayAbsListView.this.mListPadding.bottom;
            int firstPosition = TwoWayAbsListView.this.mFirstPosition;
            int toPosition = TwoWayAbsListView.this.mResurrectToPosition;
            boolean down = true;
            if (toPosition >= firstPosition && toPosition < firstPosition + childCount) {
                selectedPos = toPosition;
                View selected = TwoWayAbsListView.this.getChildAt(selectedPos - TwoWayAbsListView.this.mFirstPosition);
                selectedTop = selected.getTop();
                int selectedBottom = selected.getBottom();
                if (selectedTop < childrenTop) {
                    selectedTop = childrenTop + TwoWayAbsListView.this.getVerticalFadingEdgeLength();
                } else if (selectedBottom > childrenBottom) {
                    selectedTop = (childrenBottom - selected.getMeasuredHeight()) - TwoWayAbsListView.this.getVerticalFadingEdgeLength();
                }
            } else if (toPosition < firstPosition) {
                selectedPos = firstPosition;
                int i = 0;
                while (true) {
                    if (i >= childCount) {
                        break;
                    }
                    int top = TwoWayAbsListView.this.getChildAt(i).getTop();
                    if (i == 0) {
                        selectedTop = top;
                        if (firstPosition > 0 || top < childrenTop) {
                            childrenTop += TwoWayAbsListView.this.getVerticalFadingEdgeLength();
                        }
                    }
                    if (top < childrenTop) {
                        i++;
                    } else {
                        selectedPos = firstPosition + i;
                        selectedTop = top;
                        break;
                    }
                }
            } else {
                int itemCount = TwoWayAbsListView.this.mItemCount;
                down = false;
                selectedPos = (firstPosition + childCount) - 1;
                int i2 = childCount - 1;
                while (true) {
                    if (i2 < 0) {
                        break;
                    }
                    View v = TwoWayAbsListView.this.getChildAt(i2);
                    int top2 = v.getTop();
                    int bottom = v.getBottom();
                    if (i2 == childCount - 1) {
                        selectedTop = top2;
                        if (firstPosition + childCount < itemCount || bottom > childrenBottom) {
                            childrenBottom -= TwoWayAbsListView.this.getVerticalFadingEdgeLength();
                        }
                    }
                    if (bottom > childrenBottom) {
                        i2--;
                    } else {
                        selectedPos = firstPosition + i2;
                        selectedTop = top2;
                        break;
                    }
                }
            }
            TwoWayAbsListView.this.mResurrectToPosition = -1;
            TwoWayAbsListView.this.removeCallbacks(this.mFlingRunnable);
            TwoWayAbsListView.this.mTouchMode = -1;
            clearScrollingCache();
            TwoWayAbsListView.this.mSpecificTop = selectedTop;
            int selectedPos2 = TwoWayAbsListView.this.lookForSelectablePosition(selectedPos, down);
            if (selectedPos2 >= firstPosition && selectedPos2 <= TwoWayAbsListView.this.getLastVisiblePosition()) {
                TwoWayAbsListView.this.mLayoutMode = 4;
                TwoWayAbsListView.this.setSelectionInt(selectedPos2);
                TwoWayAbsListView.this.invokeOnItemScrollListener();
            } else {
                selectedPos2 = -1;
            }
            reportScrollStateChange(0);
            return selectedPos2 >= 0;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        protected TouchHandler.PositionScroller getPositionScroller() {
            return new VerticalPositionScroller();
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        protected TouchHandler.FlingRunnable getFlingRunnable() {
            return new VerticalFlingRunnable();
        }

        /* loaded from: classes3.dex */
        private class VerticalFlingRunnable extends TouchHandler.FlingRunnable {
            private static final int FLYWHEEL_TIMEOUT = 40;
            protected int mLastFlingY;

            private VerticalFlingRunnable() {
                super();
            }

            @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.FlingRunnable
            void start(int initialVelocity) {
                int initialY = initialVelocity < 0 ? Integer.MAX_VALUE : 0;
                this.mLastFlingY = initialY;
                this.mScroller.fling(0, initialY, 0, initialVelocity, 0, Integer.MAX_VALUE, 0, Integer.MAX_VALUE);
                TwoWayAbsListView.this.mTouchMode = 4;
                TwoWayAbsListView.this.post(this);
            }

            @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.FlingRunnable
            void startScroll(int distance, int duration) {
                int initialY = distance < 0 ? Integer.MAX_VALUE : 0;
                this.mLastFlingY = initialY;
                this.mScroller.startScroll(0, initialY, 0, distance, duration);
                TwoWayAbsListView.this.mTouchMode = 4;
                TwoWayAbsListView.this.post(this);
            }

            @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.FlingRunnable, java.lang.Runnable
            public void run() {
                int delta;
                switch (TwoWayAbsListView.this.mTouchMode) {
                    case 4:
                        if (TwoWayAbsListView.this.mItemCount == 0 || TwoWayAbsListView.this.getChildCount() == 0) {
                            endFling();
                            return;
                        }
                        Scroller scroller = this.mScroller;
                        boolean more = scroller.computeScrollOffset();
                        int y = scroller.getCurrY();
                        int delta2 = this.mLastFlingY - y;
                        if (delta2 > 0) {
                            TwoWayAbsListView.this.mMotionPosition = TwoWayAbsListView.this.mFirstPosition;
                            View firstView = TwoWayAbsListView.this.getChildAt(0);
                            VerticalTouchHandler.this.mMotionViewOriginalTop = firstView.getTop();
                            delta = Math.min(((TwoWayAbsListView.this.getHeight() - TwoWayAbsListView.this.getPaddingBottom()) - TwoWayAbsListView.this.getPaddingTop()) - 1, delta2);
                        } else {
                            int offsetToLast = TwoWayAbsListView.this.getChildCount() - 1;
                            TwoWayAbsListView.this.mMotionPosition = TwoWayAbsListView.this.mFirstPosition + offsetToLast;
                            View lastView = TwoWayAbsListView.this.getChildAt(offsetToLast);
                            VerticalTouchHandler.this.mMotionViewOriginalTop = lastView.getTop();
                            delta = Math.max(-(((TwoWayAbsListView.this.getHeight() - TwoWayAbsListView.this.getPaddingBottom()) - TwoWayAbsListView.this.getPaddingTop()) - 1), delta2);
                        }
                        boolean atEnd = VerticalTouchHandler.this.trackMotionScroll(delta, delta);
                        if (more && !atEnd) {
                            TwoWayAbsListView.this.invalidate();
                            this.mLastFlingY = y;
                            TwoWayAbsListView.this.post(this);
                            return;
                        }
                        endFling();
                        return;
                    default:
                        return;
                }
            }

            @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.FlingRunnable
            public void flywheelTouch() {
                if (this.mCheckFlywheel == null) {
                    this.mCheckFlywheel = new Runnable() { // from class: com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.VerticalTouchHandler.VerticalFlingRunnable.1
                        @Override // java.lang.Runnable
                        public void run() {
                            VelocityTracker vt = TwoWayAbsListView.this.mVelocityTracker;
                            if (vt != null) {
                                vt.computeCurrentVelocity(1000, TwoWayAbsListView.this.mMaximumVelocity);
                                float yvel = -vt.getYVelocity();
                                if (Math.abs(yvel) >= TwoWayAbsListView.this.mMinimumVelocity && VerticalFlingRunnable.this.isScrollingInDirection(0.0f, yvel)) {
                                    TwoWayAbsListView.this.postDelayed(this, 40L);
                                    return;
                                }
                                VerticalFlingRunnable.this.endFling();
                                TwoWayAbsListView.this.mTouchMode = 3;
                                VerticalTouchHandler.this.reportScrollStateChange(1);
                            }
                        }
                    };
                }
                TwoWayAbsListView.this.postDelayed(this.mCheckFlywheel, 40L);
            }
        }

        /* loaded from: classes3.dex */
        class VerticalPositionScroller extends TouchHandler.PositionScroller {
            VerticalPositionScroller() {
                super();
            }

            @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.PositionScroller, java.lang.Runnable
            public void run() {
                int listHeight = TwoWayAbsListView.this.getHeight();
                int firstPos = TwoWayAbsListView.this.mFirstPosition;
                switch (this.mMode) {
                    case 1:
                        int lastViewIndex = TwoWayAbsListView.this.getChildCount() - 1;
                        int lastPos = firstPos + lastViewIndex;
                        if (lastViewIndex >= 0) {
                            if (lastPos == this.mLastSeenPos) {
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            View lastView = TwoWayAbsListView.this.getChildAt(lastViewIndex);
                            int lastViewHeight = lastView.getHeight();
                            int lastViewPixelsShowing = listHeight - lastView.getTop();
                            VerticalTouchHandler.this.smoothScrollBy((lastViewHeight - lastViewPixelsShowing) + (lastPos < TwoWayAbsListView.this.mItemCount + (-1) ? this.mExtraScroll : TwoWayAbsListView.this.mListPadding.bottom), this.mScrollDuration);
                            this.mLastSeenPos = lastPos;
                            if (lastPos < this.mTargetPos) {
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            return;
                        }
                        return;
                    case 2:
                        if (firstPos == this.mLastSeenPos) {
                            TwoWayAbsListView.this.post(this);
                            return;
                        }
                        View firstView = TwoWayAbsListView.this.getChildAt(0);
                        if (firstView != null) {
                            int firstViewTop = firstView.getTop();
                            VerticalTouchHandler.this.smoothScrollBy(firstViewTop - (firstPos > 0 ? this.mExtraScroll : TwoWayAbsListView.this.mListPadding.top), this.mScrollDuration);
                            this.mLastSeenPos = firstPos;
                            if (firstPos > this.mTargetPos) {
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            return;
                        }
                        return;
                    case 3:
                        int childCount = TwoWayAbsListView.this.getChildCount();
                        if (firstPos != this.mBoundPos && childCount > 1 && firstPos + childCount < TwoWayAbsListView.this.mItemCount) {
                            int nextPos = firstPos + 1;
                            if (nextPos == this.mLastSeenPos) {
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            View nextView = TwoWayAbsListView.this.getChildAt(1);
                            int nextViewHeight = nextView.getHeight();
                            int nextViewTop = nextView.getTop();
                            int extraScroll = this.mExtraScroll;
                            if (nextPos < this.mBoundPos) {
                                VerticalTouchHandler.this.smoothScrollBy(Math.max(0, (nextViewHeight + nextViewTop) - extraScroll), this.mScrollDuration);
                                this.mLastSeenPos = nextPos;
                                TwoWayAbsListView.this.post(this);
                                return;
                            } else if (nextViewTop > extraScroll) {
                                VerticalTouchHandler.this.smoothScrollBy(nextViewTop - extraScroll, this.mScrollDuration);
                                return;
                            } else {
                                return;
                            }
                        }
                        return;
                    case 4:
                        int lastViewIndex2 = TwoWayAbsListView.this.getChildCount() - 2;
                        if (lastViewIndex2 >= 0) {
                            int lastPos2 = firstPos + lastViewIndex2;
                            if (lastPos2 == this.mLastSeenPos) {
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            View lastView2 = TwoWayAbsListView.this.getChildAt(lastViewIndex2);
                            int lastViewHeight2 = lastView2.getHeight();
                            int lastViewTop = lastView2.getTop();
                            int lastViewPixelsShowing2 = listHeight - lastViewTop;
                            this.mLastSeenPos = lastPos2;
                            if (lastPos2 > this.mBoundPos) {
                                VerticalTouchHandler.this.smoothScrollBy(-(lastViewPixelsShowing2 - this.mExtraScroll), this.mScrollDuration);
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            int bottom = listHeight - this.mExtraScroll;
                            int lastViewBottom = lastViewTop + lastViewHeight2;
                            if (bottom > lastViewBottom) {
                                VerticalTouchHandler.this.smoothScrollBy(-(bottom - lastViewBottom), this.mScrollDuration);
                                return;
                            }
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public class HorizontalTouchHandler extends TouchHandler {
        int mLastX;
        int mMotionViewNewLeft;
        int mMotionViewOriginalLeft;

        HorizontalTouchHandler() {
            super();
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        protected TouchHandler.FlingRunnable getFlingRunnable() {
            return new HorizontalFlingRunnable();
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        protected TouchHandler.PositionScroller getPositionScroller() {
            return new HorizontalPositionScroller();
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        public boolean onInterceptTouchEvent(MotionEvent ev) {
            int action = ev.getAction();
            switch (action) {
                case 0:
                    int touchMode = TwoWayAbsListView.this.mTouchMode;
                    int x = (int) ev.getX();
                    int y = (int) ev.getY();
                    int motionPosition = TwoWayAbsListView.this.findMotionRowX(x);
                    if (touchMode != 4 && motionPosition >= 0) {
                        View v = TwoWayAbsListView.this.getChildAt(motionPosition - TwoWayAbsListView.this.mFirstPosition);
                        this.mMotionViewOriginalLeft = v.getLeft();
                        TwoWayAbsListView.this.mMotionX = x;
                        TwoWayAbsListView.this.mMotionY = y;
                        TwoWayAbsListView.this.mMotionPosition = motionPosition;
                        TwoWayAbsListView.this.mTouchMode = 0;
                        clearScrollingCache();
                    }
                    this.mLastX = Integer.MIN_VALUE;
                    TwoWayAbsListView.this.initOrResetVelocityTracker();
                    TwoWayAbsListView.this.mVelocityTracker.addMovement(ev);
                    if (touchMode == 4) {
                        return true;
                    }
                    break;
                case 1:
                    TwoWayAbsListView.this.mTouchMode = -1;
                    TwoWayAbsListView.this.mActivePointerId = -1;
                    reportScrollStateChange(0);
                    break;
                case 2:
                    switch (TwoWayAbsListView.this.mTouchMode) {
                        case 0:
                            if (startScrollIfNeeded(((int) ev.getX()) - TwoWayAbsListView.this.mMotionX)) {
                                return true;
                            }
                            break;
                    }
            }
            return false;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        public boolean onTouchEvent(MotionEvent ev) {
            Drawable d;
            if (!TwoWayAbsListView.this.isEnabled()) {
                return TwoWayAbsListView.this.isClickable() || TwoWayAbsListView.this.isLongClickable();
            }
            int action = ev.getAction();
            if (TwoWayAbsListView.this.mVelocityTracker == null) {
                TwoWayAbsListView.this.mVelocityTracker = VelocityTracker.obtain();
            }
            TwoWayAbsListView.this.mVelocityTracker.addMovement(ev);
            switch (action) {
                case 0:
                    int x = (int) ev.getX();
                    int y = (int) ev.getY();
                    int motionPosition = TwoWayAbsListView.this.pointToPosition(x, y);
                    if (!TwoWayAbsListView.this.mDataChanged) {
                        if (TwoWayAbsListView.this.mTouchMode != 4 && motionPosition >= 0 && TwoWayAbsListView.this.getAdapter().isEnabled(motionPosition)) {
                            TwoWayAbsListView.this.mTouchMode = 0;
                            if (TwoWayAbsListView.this.mPendingCheckForTap == null) {
                                TwoWayAbsListView.this.mPendingCheckForTap = new CheckForTap();
                            }
                            TwoWayAbsListView.this.postDelayed(TwoWayAbsListView.this.mPendingCheckForTap, ViewConfiguration.getTapTimeout());
                        } else if (ev.getEdgeFlags() != 0 && motionPosition < 0) {
                            return false;
                        } else {
                            if (TwoWayAbsListView.this.mTouchMode == 4) {
                                createScrollingCache();
                                TwoWayAbsListView.this.mTouchMode = 3;
                                this.mMotionCorrection = 0;
                                motionPosition = TwoWayAbsListView.this.findMotionRowX(x);
                                this.mFlingRunnable.flywheelTouch();
                            }
                        }
                    }
                    if (motionPosition >= 0) {
                        View v = TwoWayAbsListView.this.getChildAt(motionPosition - TwoWayAbsListView.this.mFirstPosition);
                        this.mMotionViewOriginalLeft = v.getLeft();
                    }
                    TwoWayAbsListView.this.mMotionX = x;
                    TwoWayAbsListView.this.mMotionY = y;
                    TwoWayAbsListView.this.mMotionPosition = motionPosition;
                    this.mLastX = Integer.MIN_VALUE;
                    break;
                case 1:
                    switch (TwoWayAbsListView.this.mTouchMode) {
                        case 0:
                        case 1:
                        case 2:
                            int motionPosition2 = TwoWayAbsListView.this.mMotionPosition;
                            final View child = TwoWayAbsListView.this.getChildAt(motionPosition2 - TwoWayAbsListView.this.mFirstPosition);
                            if (child != null && !child.hasFocusable()) {
                                if (TwoWayAbsListView.this.mTouchMode != 0) {
                                    child.setPressed(false);
                                }
                                if (TwoWayAbsListView.this.mPerformClick == null) {
                                    TwoWayAbsListView.this.mPerformClick = new PerformClick();
                                }
                                final PerformClick performClick = TwoWayAbsListView.this.mPerformClick;
                                performClick.mChild = child;
                                performClick.mClickMotionPosition = motionPosition2;
                                performClick.rememberWindowAttachCount();
                                TwoWayAbsListView.this.mResurrectToPosition = motionPosition2;
                                if (TwoWayAbsListView.this.mTouchMode == 0 || TwoWayAbsListView.this.mTouchMode == 1) {
                                    Handler handler = TwoWayAbsListView.this.getHandler();
                                    if (handler != null) {
                                        handler.removeCallbacks(TwoWayAbsListView.this.mTouchMode == 0 ? TwoWayAbsListView.this.mPendingCheckForTap : TwoWayAbsListView.this.mPendingCheckForLongPress);
                                    }
                                    TwoWayAbsListView.this.mLayoutMode = 0;
                                    if (!TwoWayAbsListView.this.mDataChanged && TwoWayAbsListView.this.mAdapter.isEnabled(motionPosition2)) {
                                        TwoWayAbsListView.this.mTouchMode = 1;
                                        TwoWayAbsListView.this.setSelectedPositionInt(TwoWayAbsListView.this.mMotionPosition);
                                        TwoWayAbsListView.this.layoutChildren();
                                        child.setPressed(true);
                                        TwoWayAbsListView.this.positionSelector(child);
                                        TwoWayAbsListView.this.setPressed(true);
                                        if (TwoWayAbsListView.this.mSelector != null && (d = TwoWayAbsListView.this.mSelector.getCurrent()) != null && (d instanceof TransitionDrawable)) {
                                            ((TransitionDrawable) d).resetTransition();
                                        }
                                        TwoWayAbsListView.this.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.HorizontalTouchHandler.1
                                            @Override // java.lang.Runnable
                                            public void run() {
                                                child.setPressed(false);
                                                TwoWayAbsListView.this.setPressed(false);
                                                if (!TwoWayAbsListView.this.mDataChanged) {
                                                    TwoWayAbsListView.this.post(performClick);
                                                }
                                                TwoWayAbsListView.this.mTouchMode = -1;
                                            }
                                        }, ViewConfiguration.getPressedStateDuration());
                                    } else {
                                        TwoWayAbsListView.this.mTouchMode = -1;
                                    }
                                    return true;
                                } else if (!TwoWayAbsListView.this.mDataChanged && TwoWayAbsListView.this.mAdapter.isEnabled(motionPosition2)) {
                                    TwoWayAbsListView.this.post(performClick);
                                }
                            }
                            TwoWayAbsListView.this.mTouchMode = -1;
                            break;
                        case 3:
                            int childCount = TwoWayAbsListView.this.getChildCount();
                            if (childCount > 0) {
                                if (TwoWayAbsListView.this.mFirstPosition != 0 || TwoWayAbsListView.this.getChildAt(0).getLeft() < TwoWayAbsListView.this.mListPadding.left || TwoWayAbsListView.this.mFirstPosition + childCount >= TwoWayAbsListView.this.mItemCount || TwoWayAbsListView.this.getChildAt(childCount - 1).getRight() > TwoWayAbsListView.this.getWidth() - TwoWayAbsListView.this.mListPadding.right) {
                                    VelocityTracker velocityTracker = TwoWayAbsListView.this.mVelocityTracker;
                                    velocityTracker.computeCurrentVelocity(1000);
                                    int initialVelocity = (int) velocityTracker.getXVelocity();
                                    if (Math.abs(initialVelocity) > TwoWayAbsListView.this.mMinimumVelocity) {
                                        if (this.mFlingRunnable == null) {
                                            this.mFlingRunnable = new HorizontalFlingRunnable();
                                        }
                                        reportScrollStateChange(2);
                                        this.mFlingRunnable.start(-initialVelocity);
                                        break;
                                    } else {
                                        TwoWayAbsListView.this.mTouchMode = -1;
                                        reportScrollStateChange(0);
                                        break;
                                    }
                                } else {
                                    TwoWayAbsListView.this.mTouchMode = -1;
                                    reportScrollStateChange(0);
                                    break;
                                }
                            } else {
                                TwoWayAbsListView.this.mTouchMode = -1;
                                reportScrollStateChange(0);
                                break;
                            }
                            break;
                    }
                    TwoWayAbsListView.this.setPressed(false);
                    TwoWayAbsListView.this.invalidate();
                    Handler handler2 = TwoWayAbsListView.this.getHandler();
                    if (handler2 != null) {
                        handler2.removeCallbacks(TwoWayAbsListView.this.mPendingCheckForLongPress);
                    }
                    if (TwoWayAbsListView.this.mVelocityTracker != null) {
                        TwoWayAbsListView.this.mVelocityTracker.recycle();
                        TwoWayAbsListView.this.mVelocityTracker = null;
                    }
                    TwoWayAbsListView.this.mActivePointerId = -1;
                    break;
                case 2:
                    int x2 = (int) ev.getX();
                    int deltaX = x2 - TwoWayAbsListView.this.mMotionX;
                    switch (TwoWayAbsListView.this.mTouchMode) {
                        case 0:
                        case 1:
                        case 2:
                            startScrollIfNeeded(deltaX);
                            break;
                        case 3:
                            if (x2 != this.mLastX) {
                                int deltaX2 = deltaX - this.mMotionCorrection;
                                int incrementalDeltaX = this.mLastX != Integer.MIN_VALUE ? x2 - this.mLastX : deltaX2;
                                boolean atEdge = false;
                                if (incrementalDeltaX != 0) {
                                    atEdge = trackMotionScroll(deltaX2, incrementalDeltaX);
                                }
                                if (atEdge && TwoWayAbsListView.this.getChildCount() > 0) {
                                    int motionPosition3 = TwoWayAbsListView.this.findMotionRowX(x2);
                                    if (motionPosition3 >= 0) {
                                        this.mMotionViewOriginalLeft = TwoWayAbsListView.this.getChildAt(motionPosition3 - TwoWayAbsListView.this.mFirstPosition).getLeft();
                                    }
                                    TwoWayAbsListView.this.mMotionX = x2;
                                    TwoWayAbsListView.this.mMotionPosition = motionPosition3;
                                    TwoWayAbsListView.this.invalidate();
                                }
                                this.mLastX = x2;
                                break;
                            }
                            break;
                    }
                case 3:
                    TwoWayAbsListView.this.mTouchMode = -1;
                    TwoWayAbsListView.this.setPressed(false);
                    View motionView = TwoWayAbsListView.this.getChildAt(TwoWayAbsListView.this.mMotionPosition - TwoWayAbsListView.this.mFirstPosition);
                    if (motionView != null) {
                        motionView.setPressed(false);
                    }
                    clearScrollingCache();
                    Handler handler3 = TwoWayAbsListView.this.getHandler();
                    if (handler3 != null) {
                        handler3.removeCallbacks(TwoWayAbsListView.this.mPendingCheckForLongPress);
                    }
                    if (TwoWayAbsListView.this.mVelocityTracker != null) {
                        TwoWayAbsListView.this.mVelocityTracker.recycle();
                        TwoWayAbsListView.this.mVelocityTracker = null;
                    }
                    TwoWayAbsListView.this.mActivePointerId = -1;
                    break;
            }
            return true;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        boolean resurrectSelection() {
            int selectedPos;
            int childCount = TwoWayAbsListView.this.getChildCount();
            if (childCount <= 0) {
                return false;
            }
            int selectedLeft = 0;
            int childrenLeft = TwoWayAbsListView.this.mListPadding.top;
            int childrenRight = (TwoWayAbsListView.this.getRight() - TwoWayAbsListView.this.getLeft()) - TwoWayAbsListView.this.mListPadding.right;
            int firstPosition = TwoWayAbsListView.this.mFirstPosition;
            int toPosition = TwoWayAbsListView.this.mResurrectToPosition;
            boolean down = true;
            if (toPosition >= firstPosition && toPosition < firstPosition + childCount) {
                selectedPos = toPosition;
                View selected = TwoWayAbsListView.this.getChildAt(selectedPos - TwoWayAbsListView.this.mFirstPosition);
                selectedLeft = selected.getLeft();
                int selectedRight = selected.getRight();
                if (selectedLeft < childrenLeft) {
                    selectedLeft = childrenLeft + TwoWayAbsListView.this.getHorizontalFadingEdgeLength();
                } else if (selectedRight > childrenRight) {
                    selectedLeft = (childrenRight - selected.getMeasuredWidth()) - TwoWayAbsListView.this.getHorizontalFadingEdgeLength();
                }
            } else if (toPosition < firstPosition) {
                selectedPos = firstPosition;
                int i = 0;
                while (true) {
                    if (i >= childCount) {
                        break;
                    }
                    int left = TwoWayAbsListView.this.getChildAt(i).getLeft();
                    if (i == 0) {
                        selectedLeft = left;
                        if (firstPosition > 0 || left < childrenLeft) {
                            childrenLeft += TwoWayAbsListView.this.getHorizontalFadingEdgeLength();
                        }
                    }
                    if (left < childrenLeft) {
                        i++;
                    } else {
                        selectedPos = firstPosition + i;
                        selectedLeft = left;
                        break;
                    }
                }
            } else {
                int itemCount = TwoWayAbsListView.this.mItemCount;
                down = false;
                selectedPos = (firstPosition + childCount) - 1;
                int i2 = childCount - 1;
                while (true) {
                    if (i2 < 0) {
                        break;
                    }
                    View v = TwoWayAbsListView.this.getChildAt(i2);
                    int left2 = v.getLeft();
                    int right = v.getRight();
                    if (i2 == childCount - 1) {
                        selectedLeft = left2;
                        if (firstPosition + childCount < itemCount || right > childrenRight) {
                            childrenRight -= TwoWayAbsListView.this.getHorizontalFadingEdgeLength();
                        }
                    }
                    if (right > childrenRight) {
                        i2--;
                    } else {
                        selectedPos = firstPosition + i2;
                        selectedLeft = left2;
                        break;
                    }
                }
            }
            TwoWayAbsListView.this.mResurrectToPosition = -1;
            TwoWayAbsListView.this.removeCallbacks(this.mFlingRunnable);
            TwoWayAbsListView.this.mTouchMode = -1;
            clearScrollingCache();
            TwoWayAbsListView.this.mSpecificTop = selectedLeft;
            int selectedPos2 = TwoWayAbsListView.this.lookForSelectablePosition(selectedPos, down);
            if (selectedPos2 >= firstPosition && selectedPos2 <= TwoWayAbsListView.this.getLastVisiblePosition()) {
                TwoWayAbsListView.this.mLayoutMode = 4;
                TwoWayAbsListView.this.setSelectionInt(selectedPos2);
                TwoWayAbsListView.this.invokeOnItemScrollListener();
            } else {
                selectedPos2 = -1;
            }
            reportScrollStateChange(0);
            return selectedPos2 >= 0;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler
        boolean trackMotionScroll(int delta, int incrementalDelta) {
            int delta2;
            int incrementalDelta2;
            int childIndex;
            int childCount = TwoWayAbsListView.this.getChildCount();
            if (childCount == 0) {
                return true;
            }
            int firstLeft = TwoWayAbsListView.this.getChildAt(0).getLeft();
            int lastRight = TwoWayAbsListView.this.getChildAt(childCount - 1).getRight();
            Rect listPadding = TwoWayAbsListView.this.mListPadding;
            int spaceAbove = listPadding.left - firstLeft;
            int end = TwoWayAbsListView.this.getWidth() - listPadding.right;
            int spaceBelow = lastRight - end;
            int width = (TwoWayAbsListView.this.getWidth() - TwoWayAbsListView.this.getPaddingRight()) - TwoWayAbsListView.this.getPaddingLeft();
            if (delta < 0) {
                delta2 = Math.max(-(width - 1), delta);
            } else {
                delta2 = Math.min(width - 1, delta);
            }
            if (incrementalDelta < 0) {
                incrementalDelta2 = Math.max(-(width - 1), incrementalDelta);
            } else {
                incrementalDelta2 = Math.min(width - 1, incrementalDelta);
            }
            int firstPosition = TwoWayAbsListView.this.mFirstPosition;
            if (firstPosition == 0 && firstLeft >= listPadding.left && delta2 >= 0) {
                return true;
            }
            if (firstPosition + childCount == TwoWayAbsListView.this.mItemCount && lastRight <= end && delta2 <= 0) {
                return true;
            }
            boolean down = incrementalDelta2 < 0;
            boolean inTouchMode = TwoWayAbsListView.this.isInTouchMode();
            if (inTouchMode) {
                TwoWayAbsListView.this.hideSelector();
            }
            int headerViewsCount = TwoWayAbsListView.this.getHeaderViewsCount();
            int footerViewsStart = TwoWayAbsListView.this.mItemCount - TwoWayAbsListView.this.getFooterViewsCount();
            int start = 0;
            int count = 0;
            if (down) {
                int left = listPadding.left - incrementalDelta2;
                for (int i = 0; i < childCount; i++) {
                    View child = TwoWayAbsListView.this.getChildAt(i);
                    if (child.getRight() >= left) {
                        break;
                    }
                    count++;
                    int position = firstPosition + i;
                    if (position >= headerViewsCount && position < footerViewsStart) {
                        TwoWayAbsListView.this.mRecycler.addScrapView(child);
                    }
                }
            } else {
                int right = (TwoWayAbsListView.this.getWidth() - listPadding.right) - incrementalDelta2;
                for (int i2 = childCount - 1; i2 >= 0; i2--) {
                    View child2 = TwoWayAbsListView.this.getChildAt(i2);
                    if (child2.getLeft() <= right) {
                        break;
                    }
                    start = i2;
                    count++;
                    int position2 = firstPosition + i2;
                    if (position2 >= headerViewsCount && position2 < footerViewsStart) {
                        TwoWayAbsListView.this.mRecycler.addScrapView(child2);
                    }
                }
            }
            this.mMotionViewNewLeft = this.mMotionViewOriginalLeft + delta2;
            TwoWayAbsListView.this.mBlockLayoutRequests = true;
            if (count > 0) {
                TwoWayAbsListView.this.detachViewsFromParent(start, count);
            }
            TwoWayAbsListView.this.offsetChildrenLeftAndRight(incrementalDelta2);
            if (down) {
                TwoWayAbsListView.this.mFirstPosition += count;
            }
            TwoWayAbsListView.this.invalidate();
            int absIncrementalDelta = Math.abs(incrementalDelta2);
            if (spaceAbove < absIncrementalDelta || spaceBelow < absIncrementalDelta) {
                TwoWayAbsListView.this.fillGap(down);
            }
            if (!inTouchMode && TwoWayAbsListView.this.mSelectedPosition != -1 && (childIndex = TwoWayAbsListView.this.mSelectedPosition - TwoWayAbsListView.this.mFirstPosition) >= 0 && childIndex < TwoWayAbsListView.this.getChildCount()) {
                TwoWayAbsListView.this.positionSelector(TwoWayAbsListView.this.getChildAt(childIndex));
            }
            TwoWayAbsListView.this.mBlockLayoutRequests = false;
            TwoWayAbsListView.this.invokeOnItemScrollListener();
            return false;
        }

        /* loaded from: classes3.dex */
        private class HorizontalFlingRunnable extends TouchHandler.FlingRunnable {
            private static final int FLYWHEEL_TIMEOUT = 40;
            protected int mLastFlingX;

            private HorizontalFlingRunnable() {
                super();
            }

            @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.FlingRunnable
            void start(int initialVelocity) {
                int initialX = initialVelocity < 0 ? Integer.MAX_VALUE : 0;
                this.mLastFlingX = initialX;
                this.mScroller.fling(initialX, 0, initialVelocity, 0, 0, Integer.MAX_VALUE, 0, Integer.MAX_VALUE);
                TwoWayAbsListView.this.mTouchMode = 4;
                TwoWayAbsListView.this.post(this);
            }

            @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.FlingRunnable
            void startScroll(int distance, int duration) {
                int initialX = distance < 0 ? Integer.MAX_VALUE : 0;
                this.mLastFlingX = initialX;
                this.mScroller.startScroll(initialX, 0, distance, 0, duration);
                TwoWayAbsListView.this.mTouchMode = 4;
                TwoWayAbsListView.this.post(this);
            }

            @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.FlingRunnable, java.lang.Runnable
            public void run() {
                int delta;
                switch (TwoWayAbsListView.this.mTouchMode) {
                    case 4:
                        if (TwoWayAbsListView.this.mItemCount == 0 || TwoWayAbsListView.this.getChildCount() == 0) {
                            endFling();
                            return;
                        }
                        Scroller scroller = this.mScroller;
                        boolean more = scroller.computeScrollOffset();
                        int x = scroller.getCurrX();
                        int delta2 = this.mLastFlingX - x;
                        if (delta2 > 0) {
                            TwoWayAbsListView.this.mMotionPosition = TwoWayAbsListView.this.mFirstPosition;
                            View firstView = TwoWayAbsListView.this.getChildAt(0);
                            HorizontalTouchHandler.this.mMotionViewOriginalLeft = firstView.getLeft();
                            delta = Math.min(((TwoWayAbsListView.this.getWidth() - TwoWayAbsListView.this.getPaddingRight()) - TwoWayAbsListView.this.getPaddingLeft()) - 1, delta2);
                        } else {
                            int offsetToLast = TwoWayAbsListView.this.getChildCount() - 1;
                            TwoWayAbsListView.this.mMotionPosition = TwoWayAbsListView.this.mFirstPosition + offsetToLast;
                            View lastView = TwoWayAbsListView.this.getChildAt(offsetToLast);
                            HorizontalTouchHandler.this.mMotionViewOriginalLeft = lastView.getLeft();
                            delta = Math.max(-(((TwoWayAbsListView.this.getWidth() - TwoWayAbsListView.this.getPaddingRight()) - TwoWayAbsListView.this.getPaddingLeft()) - 1), delta2);
                        }
                        boolean atEnd = HorizontalTouchHandler.this.trackMotionScroll(delta, delta);
                        if (more && !atEnd) {
                            TwoWayAbsListView.this.invalidate();
                            this.mLastFlingX = x;
                            TwoWayAbsListView.this.post(this);
                            return;
                        }
                        endFling();
                        return;
                    default:
                        return;
                }
            }

            @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.FlingRunnable
            public void flywheelTouch() {
                if (this.mCheckFlywheel == null) {
                    this.mCheckFlywheel = new Runnable() { // from class: com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.HorizontalTouchHandler.HorizontalFlingRunnable.1
                        @Override // java.lang.Runnable
                        public void run() {
                            VelocityTracker vt = TwoWayAbsListView.this.mVelocityTracker;
                            if (vt != null) {
                                vt.computeCurrentVelocity(1000, TwoWayAbsListView.this.mMaximumVelocity);
                                float xvel = -vt.getXVelocity();
                                if (Math.abs(xvel) >= TwoWayAbsListView.this.mMinimumVelocity && HorizontalFlingRunnable.this.isScrollingInDirection(0.0f, xvel)) {
                                    TwoWayAbsListView.this.postDelayed(this, 40L);
                                    return;
                                }
                                HorizontalFlingRunnable.this.endFling();
                                TwoWayAbsListView.this.mTouchMode = 3;
                                HorizontalTouchHandler.this.reportScrollStateChange(1);
                            }
                        }
                    };
                }
                TwoWayAbsListView.this.postDelayed(this.mCheckFlywheel, 40L);
            }
        }

        /* loaded from: classes3.dex */
        class HorizontalPositionScroller extends TouchHandler.PositionScroller {
            HorizontalPositionScroller() {
                super();
            }

            @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView.TouchHandler.PositionScroller, java.lang.Runnable
            public void run() {
                int listWidth = TwoWayAbsListView.this.getWidth();
                int firstPos = TwoWayAbsListView.this.mFirstPosition;
                switch (this.mMode) {
                    case 1:
                        int lastViewIndex = TwoWayAbsListView.this.getChildCount() - 1;
                        int lastPos = firstPos + lastViewIndex;
                        if (lastViewIndex >= 0) {
                            if (lastPos == this.mLastSeenPos) {
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            View lastView = TwoWayAbsListView.this.getChildAt(lastViewIndex);
                            int lastViewWidth = lastView.getWidth();
                            int lastViewPixelsShowing = listWidth - lastView.getLeft();
                            HorizontalTouchHandler.this.smoothScrollBy((lastViewWidth - lastViewPixelsShowing) + (lastPos < TwoWayAbsListView.this.mItemCount + (-1) ? this.mExtraScroll : TwoWayAbsListView.this.mListPadding.right), this.mScrollDuration);
                            this.mLastSeenPos = lastPos;
                            if (lastPos < this.mTargetPos) {
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            return;
                        }
                        return;
                    case 2:
                        if (firstPos == this.mLastSeenPos) {
                            TwoWayAbsListView.this.post(this);
                            return;
                        }
                        View firstView = TwoWayAbsListView.this.getChildAt(0);
                        if (firstView != null) {
                            int firstViewLeft = firstView.getLeft();
                            HorizontalTouchHandler.this.smoothScrollBy(firstViewLeft - (firstPos > 0 ? this.mExtraScroll : TwoWayAbsListView.this.mListPadding.left), this.mScrollDuration);
                            this.mLastSeenPos = firstPos;
                            if (firstPos > this.mTargetPos) {
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            return;
                        }
                        return;
                    case 3:
                        int childCount = TwoWayAbsListView.this.getChildCount();
                        if (firstPos != this.mBoundPos && childCount > 1 && firstPos + childCount < TwoWayAbsListView.this.mItemCount) {
                            int nextPos = firstPos + 1;
                            if (nextPos == this.mLastSeenPos) {
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            View nextView = TwoWayAbsListView.this.getChildAt(1);
                            int nextViewWidth = nextView.getWidth();
                            int nextViewLeft = nextView.getLeft();
                            int extraScroll = this.mExtraScroll;
                            if (nextPos < this.mBoundPos) {
                                HorizontalTouchHandler.this.smoothScrollBy(Math.max(0, (nextViewWidth + nextViewLeft) - extraScroll), this.mScrollDuration);
                                this.mLastSeenPos = nextPos;
                                TwoWayAbsListView.this.post(this);
                                return;
                            } else if (nextViewLeft > extraScroll) {
                                HorizontalTouchHandler.this.smoothScrollBy(nextViewLeft - extraScroll, this.mScrollDuration);
                                return;
                            } else {
                                return;
                            }
                        }
                        return;
                    case 4:
                        int lastViewIndex2 = TwoWayAbsListView.this.getChildCount() - 2;
                        if (lastViewIndex2 >= 0) {
                            int lastPos2 = firstPos + lastViewIndex2;
                            if (lastPos2 == this.mLastSeenPos) {
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            View lastView2 = TwoWayAbsListView.this.getChildAt(lastViewIndex2);
                            int lastViewWidth2 = lastView2.getWidth();
                            int lastViewLeft = lastView2.getLeft();
                            int lastViewPixelsShowing2 = listWidth - lastViewLeft;
                            this.mLastSeenPos = lastPos2;
                            if (lastPos2 > this.mBoundPos) {
                                HorizontalTouchHandler.this.smoothScrollBy(-(lastViewPixelsShowing2 - this.mExtraScroll), this.mScrollDuration);
                                TwoWayAbsListView.this.post(this);
                                return;
                            }
                            int right = listWidth - this.mExtraScroll;
                            int lastViewRight = lastViewLeft + lastViewWidth2;
                            if (right > lastViewRight) {
                                HorizontalTouchHandler.this.smoothScrollBy(-(right - lastViewRight), this.mScrollDuration);
                                return;
                            }
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initOrResetVelocityTracker() {
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        } else {
            this.mVelocityTracker.clear();
        }
    }
}
