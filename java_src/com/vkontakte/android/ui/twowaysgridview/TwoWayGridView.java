package com.vkontakte.android.ui.twowaysgridview;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.SoundEffectConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.GridLayoutAnimationController;
import android.widget.ListAdapter;
import com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView;
import com.vkontakte.android.ui.twowaysgridview.TwoWayAdapterView;
/* loaded from: classes3.dex */
public class TwoWayGridView extends TwoWayAbsListView {
    public static final int AUTO_FIT = -1;
    public static final boolean DEBUG = false;
    public static final int NO_STRETCH = 0;
    public static final int STRETCH_COLUMN_WIDTH = 2;
    public static final int STRETCH_SPACING = 1;
    public static final int STRETCH_SPACING_UNIFORM = 3;
    public static final String TAG = "TwoWayGridView";
    private int mColumnWidth;
    private int mGravity;
    protected GridBuilder mGridBuilder;
    private int mHorizontalSpacing;
    private int mNumColumns;
    private int mNumRows;
    private View mReferenceView;
    private View mReferenceViewInSelectedRow;
    private int mRequestedColumnWidth;
    private int mRequestedHorizontalSpacing;
    private int mRequestedNumColumns;
    private int mRequestedNumRows;
    private int mRequestedRowHeight;
    private int mRequestedVerticalSpacing;
    private int mRowHeight;
    private int mStretchMode;
    private final Rect mTempRect;
    private int mVerticalSpacing;

    public TwoWayGridView(Context context) {
        super(context);
        this.mNumColumns = -1;
        this.mNumRows = -1;
        this.mHorizontalSpacing = 0;
        this.mVerticalSpacing = 0;
        this.mStretchMode = 2;
        this.mReferenceView = null;
        this.mReferenceViewInSelectedRow = null;
        this.mGravity = 3;
        this.mTempRect = new Rect();
        this.mGridBuilder = null;
        setupGridType();
    }

    public TwoWayGridView(Context context, AttributeSet attrs) {
        this(context, attrs, 16842865);
    }

    public TwoWayGridView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mNumColumns = -1;
        this.mNumRows = -1;
        this.mHorizontalSpacing = 0;
        this.mVerticalSpacing = 0;
        this.mStretchMode = 2;
        this.mReferenceView = null;
        this.mReferenceViewInSelectedRow = null;
        this.mGravity = 3;
        this.mTempRect = new Rect();
        this.mGridBuilder = null;
        setupGridType();
    }

    private void setupGridType() {
        if (this.mScrollVertically) {
            this.mGridBuilder = new VerticalGridBuilder();
        } else {
            this.mGridBuilder = new HorizontalGridBuilder();
        }
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAdapterView
    public ListAdapter getAdapter() {
        return this.mAdapter;
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAdapterView
    public void setAdapter(ListAdapter adapter) {
        int position;
        if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mDataSetObserver);
        }
        resetList();
        this.mRecycler.clear();
        this.mAdapter = adapter;
        this.mOldSelectedPosition = -1;
        this.mOldSelectedRowId = Long.MIN_VALUE;
        if (this.mAdapter != null) {
            this.mOldItemCount = this.mItemCount;
            this.mItemCount = this.mAdapter.getCount();
            this.mDataChanged = true;
            checkFocus();
            this.mDataSetObserver = new TwoWayAdapterView.AdapterDataSetObserver();
            this.mAdapter.registerDataSetObserver(this.mDataSetObserver);
            this.mRecycler.setViewTypeCount(this.mAdapter.getViewTypeCount());
            if (this.mStackFromBottom) {
                position = lookForSelectablePosition(this.mItemCount - 1, false);
            } else {
                position = lookForSelectablePosition(0, true);
            }
            setSelectedPositionInt(position);
            setNextSelectedPositionInt(position);
            checkSelectionChanged();
        } else {
            checkFocus();
            checkSelectionChanged();
        }
        requestLayout();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAdapterView
    public int lookForSelectablePosition(int position, boolean lookDown) {
        ListAdapter adapter = this.mAdapter;
        if (adapter == null || isInTouchMode()) {
            return -1;
        }
        if (position >= 0 && position < this.mItemCount) {
            return position;
        }
        return -1;
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView
    void fillGap(boolean down) {
        this.mGridBuilder.fillGap(down);
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView
    int findMotionRowY(int y) {
        int childCount = getChildCount();
        if (childCount > 0) {
            int numColumns = this.mNumColumns;
            if (!this.mStackFromBottom) {
                for (int i = 0; i < childCount; i += numColumns) {
                    if (y <= getChildAt(i).getBottom()) {
                        return this.mFirstPosition + i;
                    }
                }
            } else {
                for (int i2 = childCount - 1; i2 >= 0; i2 -= numColumns) {
                    if (y >= getChildAt(i2).getTop()) {
                        return this.mFirstPosition + i2;
                    }
                }
            }
        }
        return -1;
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView
    int findMotionRowX(int x) {
        int childCount = getChildCount();
        if (childCount > 0) {
            int numRows = this.mNumRows;
            if (!this.mStackFromBottom) {
                for (int i = 0; i < childCount; i += numRows) {
                    if (x <= getChildAt(i).getRight()) {
                        return this.mFirstPosition + i;
                    }
                }
            } else {
                for (int i2 = childCount - 1; i2 >= 0; i2 -= numRows) {
                    if (x >= getChildAt(i2).getLeft()) {
                        return this.mFirstPosition + i2;
                    }
                }
            }
        }
        return -1;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if ((this.mScrollVertically && !(this.mGridBuilder instanceof VerticalGridBuilder)) || (!this.mScrollVertically && !(this.mGridBuilder instanceof HorizontalGridBuilder))) {
            setupGridType();
        }
        this.mGridBuilder.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    @Override // android.view.ViewGroup
    protected void attachLayoutAnimationParameters(View child, ViewGroup.LayoutParams params, int index, int count) {
        GridLayoutAnimationController.AnimationParameters animationParams = (GridLayoutAnimationController.AnimationParameters) params.layoutAnimationParameters;
        if (animationParams == null) {
            animationParams = new GridLayoutAnimationController.AnimationParameters();
            params.layoutAnimationParameters = animationParams;
        }
        animationParams.count = count;
        animationParams.index = index;
        animationParams.columnsCount = this.mNumColumns;
        animationParams.rowsCount = count / this.mNumColumns;
        if (!this.mStackFromBottom) {
            animationParams.column = index % this.mNumColumns;
            animationParams.row = index / this.mNumColumns;
            return;
        }
        int invertedIndex = (count - 1) - index;
        animationParams.column = (this.mNumColumns - 1) - (invertedIndex % this.mNumColumns);
        animationParams.row = (animationParams.rowsCount - 1) - (invertedIndex / this.mNumColumns);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView
    public void layoutChildren() {
        boolean blockLayoutRequests = this.mBlockLayoutRequests;
        if (!blockLayoutRequests) {
            this.mBlockLayoutRequests = true;
        }
        try {
            super.layoutChildren();
            invalidate();
            if (this.mAdapter == null) {
                resetList();
                invokeOnItemScrollListener();
                if (!blockLayoutRequests) {
                    return;
                }
                return;
            }
            this.mGridBuilder.layoutChildren();
            if (!blockLayoutRequests) {
                this.mBlockLayoutRequests = false;
            }
        } finally {
            if (!blockLayoutRequests) {
                this.mBlockLayoutRequests = false;
            }
        }
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAdapterView
    public void setSelection(int position) {
        if (!isInTouchMode()) {
            setNextSelectedPositionInt(position);
        } else {
            this.mResurrectToPosition = position;
        }
        this.mLayoutMode = 2;
        requestLayout();
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView
    void setSelectionInt(int position) {
        this.mGridBuilder.setSelectionInt(position);
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView, android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        return commonKey(keyCode, 1, event);
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyMultiple(int keyCode, int repeatCount, KeyEvent event) {
        return commonKey(keyCode, repeatCount, event);
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView, android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        return commonKey(keyCode, 1, event);
    }

    private boolean commonKey(int keyCode, int count, KeyEvent event) {
        if (this.mAdapter == null) {
            return false;
        }
        if (this.mDataChanged) {
            layoutChildren();
        }
        boolean handled = false;
        int action = event.getAction();
        if (action != 1) {
            if (this.mSelectedPosition < 0) {
                switch (keyCode) {
                    case 19:
                    case 20:
                    case 21:
                    case 22:
                    case 23:
                    case 62:
                    case 66:
                        resurrectSelection();
                        return true;
                }
            }
            switch (keyCode) {
                case 19:
                    if (!event.isAltPressed()) {
                        handled = this.mGridBuilder.arrowScroll(33);
                        break;
                    } else {
                        handled = fullScroll(33);
                        break;
                    }
                case 20:
                    if (!event.isAltPressed()) {
                        handled = this.mGridBuilder.arrowScroll(130);
                        break;
                    } else {
                        handled = fullScroll(130);
                        break;
                    }
                case 21:
                    if (!event.isAltPressed()) {
                        handled = this.mGridBuilder.arrowScroll(17);
                        break;
                    } else {
                        handled = fullScroll(33);
                        break;
                    }
                case 22:
                    if (!event.isAltPressed()) {
                        handled = this.mGridBuilder.arrowScroll(66);
                        break;
                    } else {
                        handled = fullScroll(130);
                        break;
                    }
                case 23:
                case 66:
                    if (getChildCount() > 0 && event.getRepeatCount() == 0) {
                        keyPressed();
                    }
                    return true;
                case 62:
                    if (!event.isShiftPressed()) {
                        handled = pageScroll(130);
                        break;
                    } else {
                        handled = pageScroll(33);
                        break;
                    }
            }
        }
        if (handled) {
            return true;
        }
        switch (action) {
            case 0:
                return super.onKeyDown(keyCode, event);
            case 1:
                return super.onKeyUp(keyCode, event);
            case 2:
                return super.onKeyMultiple(keyCode, count, event);
            default:
                return false;
        }
    }

    boolean pageScroll(int direction) {
        int nextPage = -1;
        if (direction == 33) {
            nextPage = Math.max(0, (this.mSelectedPosition - getChildCount()) - 1);
        } else if (direction == 130) {
            nextPage = Math.min(this.mItemCount - 1, (this.mSelectedPosition + getChildCount()) - 1);
        }
        if (nextPage >= 0) {
            setSelectionInt(nextPage);
            invokeOnItemScrollListener();
            return true;
        }
        return false;
    }

    boolean fullScroll(int direction) {
        boolean moved = false;
        if (direction == 33) {
            this.mLayoutMode = 2;
            setSelectionInt(0);
            invokeOnItemScrollListener();
            moved = true;
        } else if (direction == 130) {
            this.mLayoutMode = 2;
            setSelectionInt(this.mItemCount - 1);
            invokeOnItemScrollListener();
            moved = true;
        }
        if (moved) {
        }
        return moved;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView, android.view.View
    public void onFocusChanged(boolean gainFocus, int direction, Rect previouslyFocusedRect) {
        super.onFocusChanged(gainFocus, direction, previouslyFocusedRect);
        int closestChildIndex = -1;
        if (gainFocus && previouslyFocusedRect != null) {
            previouslyFocusedRect.offset(getScrollX(), getScrollY());
            Rect otherRect = this.mTempRect;
            int minDistance = Integer.MAX_VALUE;
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                if (this.mGridBuilder.isCandidateSelection(i, direction)) {
                    View other = getChildAt(i);
                    other.getDrawingRect(otherRect);
                    offsetDescendantRectToMyCoords(other, otherRect);
                    int distance = getDistance(previouslyFocusedRect, otherRect, direction);
                    if (distance < minDistance) {
                        minDistance = distance;
                        closestChildIndex = i;
                    }
                }
            }
        }
        if (closestChildIndex >= 0) {
            setSelection(this.mFirstPosition + closestChildIndex);
        } else {
            requestLayout();
        }
    }

    public void setGravity(int gravity) {
        if (this.mGravity != gravity) {
            this.mGravity = gravity;
            requestLayoutIfNecessary();
        }
    }

    public void setHorizontalSpacing(int horizontalSpacing) {
        if (horizontalSpacing != this.mRequestedHorizontalSpacing) {
            this.mRequestedHorizontalSpacing = horizontalSpacing;
            requestLayoutIfNecessary();
        }
    }

    public void setVerticalSpacing(int verticalSpacing) {
        if (verticalSpacing != this.mRequestedVerticalSpacing) {
            this.mRequestedVerticalSpacing = verticalSpacing;
            requestLayoutIfNecessary();
        }
    }

    public void setStretchMode(int stretchMode) {
        if (stretchMode != this.mStretchMode) {
            this.mStretchMode = stretchMode;
            requestLayoutIfNecessary();
        }
    }

    public int getStretchMode() {
        return this.mStretchMode;
    }

    public void setColumnWidth(int columnWidth) {
        if (columnWidth != this.mRequestedColumnWidth) {
            this.mRequestedColumnWidth = columnWidth;
            requestLayoutIfNecessary();
        }
    }

    public void setRowHeight(int rowHeight) {
        if (rowHeight != this.mRequestedRowHeight) {
            this.mRequestedRowHeight = rowHeight;
            requestLayoutIfNecessary();
        }
    }

    public void setNumColumns(int numColumns) {
        if (numColumns != this.mRequestedNumColumns) {
            this.mRequestedNumColumns = numColumns;
            requestLayoutIfNecessary();
        }
    }

    public void setNumRows(int numRows) {
        if (numRows != this.mRequestedNumRows) {
            this.mRequestedNumRows = numRows;
            requestLayoutIfNecessary();
        }
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView, android.view.View
    protected int computeVerticalScrollExtent() {
        int count = getChildCount();
        if (count <= 0 || !this.mScrollVertically) {
            return 0;
        }
        int numColumns = this.mNumColumns;
        int rowCount = ((count + numColumns) - 1) / numColumns;
        int extent = rowCount * 100;
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

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView, android.view.View
    protected int computeVerticalScrollOffset() {
        if (this.mFirstPosition < 0 || getChildCount() <= 0 || !this.mScrollVertically) {
            return 0;
        }
        View view = getChildAt(0);
        int top = view.getTop();
        int height = view.getHeight();
        if (height <= 0) {
            return 0;
        }
        int numColumns = this.mNumColumns;
        int whichRow = this.mFirstPosition / numColumns;
        int rowCount = ((this.mItemCount + numColumns) - 1) / numColumns;
        return Math.max(((whichRow * 100) - ((top * 100) / height)) + ((int) ((getScrollY() / getHeight()) * rowCount * 100.0f)), 0);
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView, android.view.View
    protected int computeVerticalScrollRange() {
        if (!this.mScrollVertically) {
            return 0;
        }
        int numColumns = this.mNumColumns;
        int rowCount = ((this.mItemCount + numColumns) - 1) / numColumns;
        return Math.max(rowCount * 100, 0);
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView, android.view.View
    protected int computeHorizontalScrollExtent() {
        int count = getChildCount();
        if (count <= 0 || this.mScrollVertically) {
            return 0;
        }
        int numRows = this.mNumRows;
        int columnCount = ((count + numRows) - 1) / numRows;
        int extent = columnCount * 100;
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

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView, android.view.View
    protected int computeHorizontalScrollOffset() {
        if (this.mFirstPosition < 0 || getChildCount() <= 0 || this.mScrollVertically) {
            return 0;
        }
        View view = getChildAt(0);
        int left = view.getLeft();
        int width = view.getWidth();
        if (width <= 0) {
            return 0;
        }
        int numRows = this.mNumRows;
        int whichColumn = this.mFirstPosition / numRows;
        int columnCount = ((this.mItemCount + numRows) - 1) / numRows;
        return Math.max(((whichColumn * 100) - ((left * 100) / width)) + ((int) ((getScrollX() / getWidth()) * columnCount * 100.0f)), 0);
    }

    @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayAbsListView, android.view.View
    protected int computeHorizontalScrollRange() {
        if (this.mScrollVertically) {
            return 0;
        }
        int numRows = this.mNumRows;
        int columnCount = ((this.mItemCount + numRows) - 1) / numRows;
        return Math.max(columnCount * 100, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public abstract class GridBuilder {
        protected abstract boolean arrowScroll(int i);

        protected abstract void fillGap(boolean z);

        protected abstract boolean isCandidateSelection(int i, int i2);

        protected abstract void layoutChildren();

        protected abstract View makeAndAddView(int i, int i2, boolean z, int i3, boolean z2, int i4);

        protected abstract void onMeasure(int i, int i2);

        protected abstract void setSelectionInt(int i);

        private GridBuilder() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class VerticalGridBuilder extends GridBuilder {
        private VerticalGridBuilder() {
            super();
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected View makeAndAddView(int position, int y, boolean flow, int childrenLeft, boolean selected, int where) {
            View child;
            if (!TwoWayGridView.this.mDataChanged && (child = TwoWayGridView.this.mRecycler.getActiveView(position)) != null) {
                setupChild(child, position, y, flow, childrenLeft, selected, true, where);
                return child;
            }
            View child2 = TwoWayGridView.this.obtainView(position, TwoWayGridView.this.mIsScrap);
            setupChild(child2, position, y, flow, childrenLeft, selected, TwoWayGridView.this.mIsScrap[0], where);
            return child2;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected void fillGap(boolean down) {
            int position;
            int numColumns = TwoWayGridView.this.mNumColumns;
            int verticalSpacing = TwoWayGridView.this.mVerticalSpacing;
            int count = TwoWayGridView.this.getChildCount();
            if (down) {
                int startOffset = count > 0 ? TwoWayGridView.this.getChildAt(count - 1).getBottom() + verticalSpacing : TwoWayGridView.this.getListPaddingTop();
                int position2 = TwoWayGridView.this.mFirstPosition + count;
                if (TwoWayGridView.this.mStackFromBottom) {
                    position2 += numColumns - 1;
                }
                fillDown(position2, startOffset);
                correctTooHigh(numColumns, verticalSpacing, TwoWayGridView.this.getChildCount());
                return;
            }
            int startOffset2 = count > 0 ? TwoWayGridView.this.getChildAt(0).getTop() - verticalSpacing : TwoWayGridView.this.getHeight() - TwoWayGridView.this.getListPaddingBottom();
            int position3 = TwoWayGridView.this.mFirstPosition;
            if (!TwoWayGridView.this.mStackFromBottom) {
                position = position3 - numColumns;
            } else {
                position = position3 - 1;
            }
            fillUp(position, startOffset2);
            correctTooLow(numColumns, verticalSpacing, TwoWayGridView.this.getChildCount());
        }

        private View fillDown(int pos, int nextTop) {
            View selectedView = null;
            int end = (TwoWayGridView.this.getBottom() - TwoWayGridView.this.getTop()) - TwoWayGridView.this.mListPadding.bottom;
            while (nextTop < end && pos < TwoWayGridView.this.mItemCount) {
                View temp = makeRow(pos, nextTop, true);
                if (temp != null) {
                    selectedView = temp;
                }
                nextTop = TwoWayGridView.this.mReferenceView.getBottom() + TwoWayGridView.this.mVerticalSpacing;
                pos += TwoWayGridView.this.mNumColumns;
            }
            return selectedView;
        }

        private View makeRow(int startPos, int y, boolean flow) {
            int last;
            int columnWidth = TwoWayGridView.this.mColumnWidth;
            int horizontalSpacing = TwoWayGridView.this.mHorizontalSpacing;
            int nextLeft = TwoWayGridView.this.mListPadding.left + (TwoWayGridView.this.mStretchMode == 3 ? horizontalSpacing : 0);
            if (!TwoWayGridView.this.mStackFromBottom) {
                last = Math.min(TwoWayGridView.this.mNumColumns + startPos, TwoWayGridView.this.mItemCount);
            } else {
                last = startPos + 1;
                startPos = Math.max(0, (startPos - TwoWayGridView.this.mNumColumns) + 1);
                if (last - startPos < TwoWayGridView.this.mNumColumns) {
                    nextLeft += (TwoWayGridView.this.mNumColumns - (last - startPos)) * (columnWidth + horizontalSpacing);
                }
            }
            View selectedView = null;
            boolean hasFocus = TwoWayGridView.this.shouldShowSelector();
            boolean inClick = TwoWayGridView.this.touchModeDrawsInPressedState();
            int selectedPosition = TwoWayGridView.this.mSelectedPosition;
            View child = null;
            int pos = startPos;
            while (pos < last) {
                boolean selected = pos == selectedPosition;
                int where = flow ? -1 : pos - startPos;
                child = makeAndAddView(pos, y, flow, nextLeft, selected, where);
                nextLeft += columnWidth;
                if (pos < last - 1) {
                    nextLeft += horizontalSpacing;
                }
                if (selected && (hasFocus || inClick)) {
                    selectedView = child;
                }
                pos++;
            }
            TwoWayGridView.this.mReferenceView = child;
            if (selectedView != null) {
                TwoWayGridView.this.mReferenceViewInSelectedRow = TwoWayGridView.this.mReferenceView;
            }
            return selectedView;
        }

        private View fillUp(int pos, int nextBottom) {
            View selectedView = null;
            int end = TwoWayGridView.this.mListPadding.top;
            while (nextBottom > end && pos >= 0) {
                View temp = makeRow(pos, nextBottom, false);
                if (temp != null) {
                    selectedView = temp;
                }
                nextBottom = TwoWayGridView.this.mReferenceView.getTop() - TwoWayGridView.this.mVerticalSpacing;
                TwoWayGridView.this.mFirstPosition = pos;
                pos -= TwoWayGridView.this.mNumColumns;
            }
            if (TwoWayGridView.this.mStackFromBottom) {
                TwoWayGridView.this.mFirstPosition = Math.max(0, pos + 1);
            }
            return selectedView;
        }

        private View fillFromTop(int nextTop) {
            TwoWayGridView.this.mFirstPosition = Math.min(TwoWayGridView.this.mFirstPosition, TwoWayGridView.this.mSelectedPosition);
            TwoWayGridView.this.mFirstPosition = Math.min(TwoWayGridView.this.mFirstPosition, TwoWayGridView.this.mItemCount - 1);
            if (TwoWayGridView.this.mFirstPosition < 0) {
                TwoWayGridView.this.mFirstPosition = 0;
            }
            TwoWayGridView.this.mFirstPosition -= TwoWayGridView.this.mFirstPosition % TwoWayGridView.this.mNumColumns;
            return fillDown(TwoWayGridView.this.mFirstPosition, nextTop);
        }

        private View fillFromBottom(int lastPosition, int nextBottom) {
            int invertedPosition = (TwoWayGridView.this.mItemCount - 1) - Math.min(Math.max(lastPosition, TwoWayGridView.this.mSelectedPosition), TwoWayGridView.this.mItemCount - 1);
            int lastPosition2 = (TwoWayGridView.this.mItemCount - 1) - (invertedPosition - (invertedPosition % TwoWayGridView.this.mNumColumns));
            return fillUp(lastPosition2, nextBottom);
        }

        private View fillSelection(int childrenTop, int childrenBottom) {
            int rowStart;
            int selectedPosition = TwoWayGridView.this.reconcileSelectedPosition();
            int numColumns = TwoWayGridView.this.mNumColumns;
            int verticalSpacing = TwoWayGridView.this.mVerticalSpacing;
            int rowEnd = -1;
            if (!TwoWayGridView.this.mStackFromBottom) {
                rowStart = selectedPosition - (selectedPosition % numColumns);
            } else {
                int invertedSelection = (TwoWayGridView.this.mItemCount - 1) - selectedPosition;
                rowEnd = (TwoWayGridView.this.mItemCount - 1) - (invertedSelection - (invertedSelection % numColumns));
                rowStart = Math.max(0, (rowEnd - numColumns) + 1);
            }
            int fadingEdgeLength = TwoWayGridView.this.getVerticalFadingEdgeLength();
            int topSelectionPixel = getTopSelectionPixel(childrenTop, fadingEdgeLength, rowStart);
            View sel = makeRow(TwoWayGridView.this.mStackFromBottom ? rowEnd : rowStart, topSelectionPixel, true);
            TwoWayGridView.this.mFirstPosition = rowStart;
            View referenceView = TwoWayGridView.this.mReferenceView;
            if (!TwoWayGridView.this.mStackFromBottom) {
                fillDown(rowStart + numColumns, referenceView.getBottom() + verticalSpacing);
                pinToBottom(childrenBottom);
                fillUp(rowStart - numColumns, referenceView.getTop() - verticalSpacing);
                adjustViewsUpOrDown();
            } else {
                int bottomSelectionPixel = getBottomSelectionPixel(childrenBottom, fadingEdgeLength, numColumns, rowStart);
                int offset = bottomSelectionPixel - referenceView.getBottom();
                TwoWayGridView.this.offsetChildrenTopAndBottom(offset);
                fillUp(rowStart - 1, referenceView.getTop() - verticalSpacing);
                pinToTop(childrenTop);
                fillDown(rowEnd + numColumns, referenceView.getBottom() + verticalSpacing);
                adjustViewsUpOrDown();
            }
            return sel;
        }

        private View fillSpecific(int position, int top) {
            int motionRowStart;
            View below;
            View above;
            int numColumns = TwoWayGridView.this.mNumColumns;
            int motionRowEnd = -1;
            if (!TwoWayGridView.this.mStackFromBottom) {
                motionRowStart = position - (position % numColumns);
            } else {
                int invertedSelection = (TwoWayGridView.this.mItemCount - 1) - position;
                motionRowEnd = (TwoWayGridView.this.mItemCount - 1) - (invertedSelection - (invertedSelection % numColumns));
                motionRowStart = Math.max(0, (motionRowEnd - numColumns) + 1);
            }
            View temp = makeRow(TwoWayGridView.this.mStackFromBottom ? motionRowEnd : motionRowStart, top, true);
            TwoWayGridView.this.mFirstPosition = motionRowStart;
            View referenceView = TwoWayGridView.this.mReferenceView;
            if (referenceView != null) {
                int verticalSpacing = TwoWayGridView.this.mVerticalSpacing;
                if (!TwoWayGridView.this.mStackFromBottom) {
                    above = fillUp(motionRowStart - numColumns, referenceView.getTop() - verticalSpacing);
                    adjustViewsUpOrDown();
                    below = fillDown(motionRowStart + numColumns, referenceView.getBottom() + verticalSpacing);
                    int childCount = TwoWayGridView.this.getChildCount();
                    if (childCount > 0) {
                        correctTooHigh(numColumns, verticalSpacing, childCount);
                    }
                } else {
                    below = fillDown(motionRowEnd + numColumns, referenceView.getBottom() + verticalSpacing);
                    adjustViewsUpOrDown();
                    above = fillUp(motionRowStart - 1, referenceView.getTop() - verticalSpacing);
                    int childCount2 = TwoWayGridView.this.getChildCount();
                    if (childCount2 > 0) {
                        correctTooLow(numColumns, verticalSpacing, childCount2);
                    }
                }
                if (temp != null) {
                    return temp;
                }
                return above != null ? above : below;
            }
            return null;
        }

        private void correctTooHigh(int numColumns, int verticalSpacing, int childCount) {
            int lastPosition = (TwoWayGridView.this.mFirstPosition + childCount) - 1;
            if (lastPosition == TwoWayGridView.this.mItemCount - 1 && childCount > 0) {
                View lastChild = TwoWayGridView.this.getChildAt(childCount - 1);
                int lastBottom = lastChild.getBottom();
                int end = (TwoWayGridView.this.getBottom() - TwoWayGridView.this.getTop()) - TwoWayGridView.this.mListPadding.bottom;
                int bottomOffset = end - lastBottom;
                View firstChild = TwoWayGridView.this.getChildAt(0);
                int firstTop = firstChild.getTop();
                if (bottomOffset <= 0) {
                    return;
                }
                if (TwoWayGridView.this.mFirstPosition > 0 || firstTop < TwoWayGridView.this.mListPadding.top) {
                    if (TwoWayGridView.this.mFirstPosition == 0) {
                        bottomOffset = Math.min(bottomOffset, TwoWayGridView.this.mListPadding.top - firstTop);
                    }
                    TwoWayGridView.this.offsetChildrenTopAndBottom(bottomOffset);
                    if (TwoWayGridView.this.mFirstPosition > 0) {
                        int i = TwoWayGridView.this.mFirstPosition;
                        if (TwoWayGridView.this.mStackFromBottom) {
                            numColumns = 1;
                        }
                        fillUp(i - numColumns, firstChild.getTop() - verticalSpacing);
                        adjustViewsUpOrDown();
                    }
                }
            }
        }

        private void correctTooLow(int numColumns, int verticalSpacing, int childCount) {
            if (TwoWayGridView.this.mFirstPosition == 0 && childCount > 0) {
                View firstChild = TwoWayGridView.this.getChildAt(0);
                int firstTop = firstChild.getTop();
                int start = TwoWayGridView.this.mListPadding.top;
                int end = (TwoWayGridView.this.getBottom() - TwoWayGridView.this.getTop()) - TwoWayGridView.this.mListPadding.bottom;
                int topOffset = firstTop - start;
                View lastChild = TwoWayGridView.this.getChildAt(childCount - 1);
                int lastBottom = lastChild.getBottom();
                int lastPosition = (TwoWayGridView.this.mFirstPosition + childCount) - 1;
                if (topOffset <= 0) {
                    return;
                }
                if (lastPosition < TwoWayGridView.this.mItemCount - 1 || lastBottom > end) {
                    if (lastPosition == TwoWayGridView.this.mItemCount - 1) {
                        topOffset = Math.min(topOffset, lastBottom - end);
                    }
                    TwoWayGridView.this.offsetChildrenTopAndBottom(-topOffset);
                    if (lastPosition < TwoWayGridView.this.mItemCount - 1) {
                        if (!TwoWayGridView.this.mStackFromBottom) {
                            numColumns = 1;
                        }
                        fillDown(lastPosition + numColumns, lastChild.getBottom() + verticalSpacing);
                        adjustViewsUpOrDown();
                    }
                }
            }
        }

        private View fillFromSelection(int selectedTop, int childrenTop, int childrenBottom) {
            int rowStart;
            int fadingEdgeLength = TwoWayGridView.this.getVerticalFadingEdgeLength();
            int selectedPosition = TwoWayGridView.this.mSelectedPosition;
            int numColumns = TwoWayGridView.this.mNumColumns;
            int verticalSpacing = TwoWayGridView.this.mVerticalSpacing;
            int rowEnd = -1;
            if (!TwoWayGridView.this.mStackFromBottom) {
                rowStart = selectedPosition - (selectedPosition % numColumns);
            } else {
                int invertedSelection = (TwoWayGridView.this.mItemCount - 1) - selectedPosition;
                rowEnd = (TwoWayGridView.this.mItemCount - 1) - (invertedSelection - (invertedSelection % numColumns));
                rowStart = Math.max(0, (rowEnd - numColumns) + 1);
            }
            int topSelectionPixel = getTopSelectionPixel(childrenTop, fadingEdgeLength, rowStart);
            int bottomSelectionPixel = getBottomSelectionPixel(childrenBottom, fadingEdgeLength, numColumns, rowStart);
            View sel = makeRow(TwoWayGridView.this.mStackFromBottom ? rowEnd : rowStart, selectedTop, true);
            TwoWayGridView.this.mFirstPosition = rowStart;
            View referenceView = TwoWayGridView.this.mReferenceView;
            adjustForTopFadingEdge(referenceView, topSelectionPixel, bottomSelectionPixel);
            adjustForBottomFadingEdge(referenceView, topSelectionPixel, bottomSelectionPixel);
            if (!TwoWayGridView.this.mStackFromBottom) {
                fillUp(rowStart - numColumns, referenceView.getTop() - verticalSpacing);
                adjustViewsUpOrDown();
                fillDown(rowStart + numColumns, referenceView.getBottom() + verticalSpacing);
            } else {
                fillDown(rowEnd + numColumns, referenceView.getBottom() + verticalSpacing);
                adjustViewsUpOrDown();
                fillUp(rowStart - 1, referenceView.getTop() - verticalSpacing);
            }
            return sel;
        }

        private int getBottomSelectionPixel(int childrenBottom, int fadingEdgeLength, int numColumns, int rowStart) {
            if ((rowStart + numColumns) - 1 >= TwoWayGridView.this.mItemCount - 1) {
                return childrenBottom;
            }
            int bottomSelectionPixel = childrenBottom - fadingEdgeLength;
            return bottomSelectionPixel;
        }

        private int getTopSelectionPixel(int childrenTop, int fadingEdgeLength, int rowStart) {
            if (rowStart <= 0) {
                return childrenTop;
            }
            int topSelectionPixel = childrenTop + fadingEdgeLength;
            return topSelectionPixel;
        }

        private void adjustForBottomFadingEdge(View childInSelectedRow, int topSelectionPixel, int bottomSelectionPixel) {
            if (childInSelectedRow.getBottom() > bottomSelectionPixel) {
                int spaceAbove = childInSelectedRow.getTop() - topSelectionPixel;
                int spaceBelow = childInSelectedRow.getBottom() - bottomSelectionPixel;
                int offset = Math.min(spaceAbove, spaceBelow);
                TwoWayGridView.this.offsetChildrenTopAndBottom(-offset);
            }
        }

        private void adjustForTopFadingEdge(View childInSelectedRow, int topSelectionPixel, int bottomSelectionPixel) {
            if (childInSelectedRow.getTop() < topSelectionPixel) {
                int spaceAbove = topSelectionPixel - childInSelectedRow.getTop();
                int spaceBelow = bottomSelectionPixel - childInSelectedRow.getBottom();
                int offset = Math.min(spaceAbove, spaceBelow);
                TwoWayGridView.this.offsetChildrenTopAndBottom(offset);
            }
        }

        private void determineColumns(int availableSpace) {
            int requestedHorizontalSpacing = TwoWayGridView.this.mRequestedHorizontalSpacing;
            int stretchMode = TwoWayGridView.this.mStretchMode;
            int requestedColumnWidth = TwoWayGridView.this.mRequestedColumnWidth;
            TwoWayGridView.this.mVerticalSpacing = TwoWayGridView.this.mRequestedVerticalSpacing;
            if (TwoWayGridView.this.mRequestedNumColumns == -1) {
                if (requestedColumnWidth > 0) {
                    TwoWayGridView.this.mNumColumns = (availableSpace + requestedHorizontalSpacing) / (requestedColumnWidth + requestedHorizontalSpacing);
                } else {
                    TwoWayGridView.this.mNumColumns = 2;
                }
            } else {
                TwoWayGridView.this.mNumColumns = TwoWayGridView.this.mRequestedNumColumns;
            }
            if (TwoWayGridView.this.mNumColumns <= 0) {
                TwoWayGridView.this.mNumColumns = 1;
            }
            switch (stretchMode) {
                case 0:
                    TwoWayGridView.this.mColumnWidth = requestedColumnWidth;
                    TwoWayGridView.this.mHorizontalSpacing = requestedHorizontalSpacing;
                    return;
                default:
                    switch (stretchMode) {
                        case 1:
                            int spaceLeftOver = (availableSpace - (TwoWayGridView.this.mNumColumns * requestedColumnWidth)) - ((TwoWayGridView.this.mNumColumns - 1) * requestedHorizontalSpacing);
                            TwoWayGridView.this.mColumnWidth = requestedColumnWidth;
                            if (TwoWayGridView.this.mNumColumns <= 1) {
                                TwoWayGridView.this.mHorizontalSpacing = requestedHorizontalSpacing + spaceLeftOver;
                                return;
                            }
                            TwoWayGridView.this.mHorizontalSpacing = (spaceLeftOver / (TwoWayGridView.this.mNumColumns - 1)) + requestedHorizontalSpacing;
                            return;
                        case 2:
                            int spaceLeftOver2 = (availableSpace - (TwoWayGridView.this.mNumColumns * requestedColumnWidth)) - ((TwoWayGridView.this.mNumColumns - 1) * requestedHorizontalSpacing);
                            TwoWayGridView.this.mColumnWidth = (spaceLeftOver2 / TwoWayGridView.this.mNumColumns) + requestedColumnWidth;
                            TwoWayGridView.this.mHorizontalSpacing = requestedHorizontalSpacing;
                            return;
                        case 3:
                            int spaceLeftOver3 = (availableSpace - (TwoWayGridView.this.mNumColumns * requestedColumnWidth)) - ((TwoWayGridView.this.mNumColumns + 1) * requestedHorizontalSpacing);
                            TwoWayGridView.this.mColumnWidth = requestedColumnWidth;
                            if (TwoWayGridView.this.mNumColumns <= 1) {
                                TwoWayGridView.this.mHorizontalSpacing = ((requestedHorizontalSpacing * 2) + spaceLeftOver3) / 2;
                                return;
                            }
                            TwoWayGridView.this.mHorizontalSpacing = (spaceLeftOver3 / (TwoWayGridView.this.mNumColumns + 1)) + requestedHorizontalSpacing;
                            return;
                        default:
                            return;
                    }
            }
        }

        private View moveSelection(int delta, int childrenTop, int childrenBottom) {
            int rowStart;
            int oldRowStart;
            View sel;
            View referenceView;
            int fadingEdgeLength = TwoWayGridView.this.getVerticalFadingEdgeLength();
            int selectedPosition = TwoWayGridView.this.mSelectedPosition;
            int numColumns = TwoWayGridView.this.mNumColumns;
            int verticalSpacing = TwoWayGridView.this.mVerticalSpacing;
            int rowEnd = -1;
            if (!TwoWayGridView.this.mStackFromBottom) {
                oldRowStart = (selectedPosition - delta) - ((selectedPosition - delta) % numColumns);
                rowStart = selectedPosition - (selectedPosition % numColumns);
            } else {
                int invertedSelection = (TwoWayGridView.this.mItemCount - 1) - selectedPosition;
                rowEnd = (TwoWayGridView.this.mItemCount - 1) - (invertedSelection - (invertedSelection % numColumns));
                rowStart = Math.max(0, (rowEnd - numColumns) + 1);
                int invertedSelection2 = (TwoWayGridView.this.mItemCount - 1) - (selectedPosition - delta);
                int oldRowStart2 = (TwoWayGridView.this.mItemCount - 1) - (invertedSelection2 - (invertedSelection2 % numColumns));
                oldRowStart = Math.max(0, (oldRowStart2 - numColumns) + 1);
            }
            int rowDelta = rowStart - oldRowStart;
            int topSelectionPixel = getTopSelectionPixel(childrenTop, fadingEdgeLength, rowStart);
            int bottomSelectionPixel = getBottomSelectionPixel(childrenBottom, fadingEdgeLength, numColumns, rowStart);
            TwoWayGridView.this.mFirstPosition = rowStart;
            if (rowDelta > 0) {
                int oldBottom = TwoWayGridView.this.mReferenceViewInSelectedRow == null ? 0 : TwoWayGridView.this.mReferenceViewInSelectedRow.getBottom();
                sel = makeRow(TwoWayGridView.this.mStackFromBottom ? rowEnd : rowStart, oldBottom + verticalSpacing, true);
                referenceView = TwoWayGridView.this.mReferenceView;
                adjustForBottomFadingEdge(referenceView, topSelectionPixel, bottomSelectionPixel);
            } else if (rowDelta < 0) {
                int oldTop = TwoWayGridView.this.mReferenceViewInSelectedRow == null ? 0 : TwoWayGridView.this.mReferenceViewInSelectedRow.getTop();
                sel = makeRow(TwoWayGridView.this.mStackFromBottom ? rowEnd : rowStart, oldTop - verticalSpacing, false);
                referenceView = TwoWayGridView.this.mReferenceView;
                adjustForTopFadingEdge(referenceView, topSelectionPixel, bottomSelectionPixel);
            } else {
                int oldTop2 = TwoWayGridView.this.mReferenceViewInSelectedRow == null ? 0 : TwoWayGridView.this.mReferenceViewInSelectedRow.getTop();
                sel = makeRow(TwoWayGridView.this.mStackFromBottom ? rowEnd : rowStart, oldTop2, true);
                referenceView = TwoWayGridView.this.mReferenceView;
            }
            if (!TwoWayGridView.this.mStackFromBottom) {
                fillUp(rowStart - numColumns, referenceView.getTop() - verticalSpacing);
                adjustViewsUpOrDown();
                fillDown(rowStart + numColumns, referenceView.getBottom() + verticalSpacing);
            } else {
                fillDown(rowEnd + numColumns, referenceView.getBottom() + verticalSpacing);
                adjustViewsUpOrDown();
                fillUp(rowStart - 1, referenceView.getTop() - verticalSpacing);
            }
            return sel;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int widthSize;
            int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
            int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
            int widthSize2 = View.MeasureSpec.getSize(widthMeasureSpec);
            int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
            if (widthMode == 0) {
                if (TwoWayGridView.this.mColumnWidth > 0) {
                    widthSize = TwoWayGridView.this.mColumnWidth + TwoWayGridView.this.mListPadding.left + TwoWayGridView.this.mListPadding.right;
                } else {
                    widthSize = TwoWayGridView.this.mListPadding.left + TwoWayGridView.this.mListPadding.right;
                }
                widthSize2 = widthSize + TwoWayGridView.this.getVerticalScrollbarWidth();
            }
            int childWidth = (widthSize2 - TwoWayGridView.this.mListPadding.left) - TwoWayGridView.this.mListPadding.right;
            determineColumns(childWidth);
            int childHeight = 0;
            TwoWayGridView.this.mItemCount = TwoWayGridView.this.mAdapter == null ? 0 : TwoWayGridView.this.mAdapter.getCount();
            int count = TwoWayGridView.this.mItemCount;
            if (count > 0) {
                View child = TwoWayGridView.this.obtainView(0, TwoWayGridView.this.mIsScrap);
                TwoWayAbsListView.LayoutParams p = (TwoWayAbsListView.LayoutParams) child.getLayoutParams();
                if (p == null) {
                    p = new TwoWayAbsListView.LayoutParams(-1, -2, 0);
                    child.setLayoutParams(p);
                }
                p.viewType = TwoWayGridView.this.mAdapter.getItemViewType(0);
                p.forceAdd = true;
                int childHeightSpec = ViewGroup.getChildMeasureSpec(View.MeasureSpec.makeMeasureSpec(0, 0), 0, p.height);
                int childWidthSpec = ViewGroup.getChildMeasureSpec(View.MeasureSpec.makeMeasureSpec(TwoWayGridView.this.mColumnWidth, 1073741824), 0, p.width);
                child.measure(childWidthSpec, childHeightSpec);
                childHeight = child.getMeasuredHeight();
                if (TwoWayGridView.this.mRecycler.shouldRecycleViewType(p.viewType)) {
                    TwoWayGridView.this.mRecycler.addScrapView(child);
                }
            }
            if (heightMode == 0) {
                heightSize = TwoWayGridView.this.mListPadding.top + TwoWayGridView.this.mListPadding.bottom + childHeight + (TwoWayGridView.this.getVerticalFadingEdgeLength() * 2);
            }
            if (heightMode == Integer.MIN_VALUE) {
                int ourSize = TwoWayGridView.this.mListPadding.top + TwoWayGridView.this.mListPadding.bottom;
                int numColumns = TwoWayGridView.this.mNumColumns;
                int i = 0;
                while (true) {
                    if (i >= count) {
                        break;
                    }
                    ourSize += childHeight;
                    if (i + numColumns < count) {
                        ourSize += TwoWayGridView.this.mVerticalSpacing;
                    }
                    if (ourSize < heightSize) {
                        i += numColumns;
                    } else {
                        ourSize = heightSize;
                        break;
                    }
                }
                heightSize = ourSize;
            }
            TwoWayGridView.this.setMeasuredDimension(widthSize2, heightSize);
            TwoWayGridView.this.mWidthMeasureSpec = widthMeasureSpec;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected void layoutChildren() {
            View sel;
            int childrenTop = TwoWayGridView.this.mListPadding.top;
            int childrenBottom = (TwoWayGridView.this.getBottom() - TwoWayGridView.this.getTop()) - TwoWayGridView.this.mListPadding.bottom;
            int childCount = TwoWayGridView.this.getChildCount();
            int delta = 0;
            View oldSel = null;
            View oldFirst = null;
            View newSel = null;
            switch (TwoWayGridView.this.mLayoutMode) {
                case 1:
                case 3:
                case 4:
                case 5:
                    break;
                case 2:
                    int index = TwoWayGridView.this.mNextSelectedPosition - TwoWayGridView.this.mFirstPosition;
                    if (index >= 0 && index < childCount) {
                        newSel = TwoWayGridView.this.getChildAt(index);
                        break;
                    }
                    break;
                case 6:
                    if (TwoWayGridView.this.mNextSelectedPosition >= 0) {
                        delta = TwoWayGridView.this.mNextSelectedPosition - TwoWayGridView.this.mSelectedPosition;
                        break;
                    }
                    break;
                default:
                    int index2 = TwoWayGridView.this.mSelectedPosition - TwoWayGridView.this.mFirstPosition;
                    if (index2 >= 0 && index2 < childCount) {
                        oldSel = TwoWayGridView.this.getChildAt(index2);
                    }
                    oldFirst = TwoWayGridView.this.getChildAt(0);
                    break;
            }
            boolean dataChanged = TwoWayGridView.this.mDataChanged;
            if (dataChanged) {
                TwoWayGridView.this.handleDataChanged();
            }
            if (TwoWayGridView.this.mItemCount == 0) {
                TwoWayGridView.this.resetList();
                TwoWayGridView.this.invokeOnItemScrollListener();
                return;
            }
            TwoWayGridView.this.setSelectedPositionInt(TwoWayGridView.this.mNextSelectedPosition);
            int firstPosition = TwoWayGridView.this.mFirstPosition;
            TwoWayAbsListView.RecycleBin recycleBin = TwoWayGridView.this.mRecycler;
            if (dataChanged) {
                for (int i = 0; i < childCount; i++) {
                    recycleBin.addScrapView(TwoWayGridView.this.getChildAt(i));
                }
            } else {
                recycleBin.fillActiveViews(childCount, firstPosition);
            }
            TwoWayGridView.this.detachAllViewsFromParent();
            switch (TwoWayGridView.this.mLayoutMode) {
                case 1:
                    TwoWayGridView.this.mFirstPosition = 0;
                    sel = fillFromTop(childrenTop);
                    adjustViewsUpOrDown();
                    break;
                case 2:
                    if (newSel != null) {
                        sel = fillFromSelection(newSel.getTop(), childrenTop, childrenBottom);
                        break;
                    } else {
                        sel = fillSelection(childrenTop, childrenBottom);
                        break;
                    }
                case 3:
                    sel = fillUp(TwoWayGridView.this.mItemCount - 1, childrenBottom);
                    adjustViewsUpOrDown();
                    break;
                case 4:
                    sel = fillSpecific(TwoWayGridView.this.mSelectedPosition, TwoWayGridView.this.mSpecificTop);
                    break;
                case 5:
                    sel = fillSpecific(TwoWayGridView.this.mSyncPosition, TwoWayGridView.this.mSpecificTop);
                    break;
                case 6:
                    sel = moveSelection(delta, childrenTop, childrenBottom);
                    break;
                default:
                    if (childCount == 0) {
                        if (!TwoWayGridView.this.mStackFromBottom) {
                            TwoWayGridView.this.setSelectedPositionInt((TwoWayGridView.this.mAdapter == null || TwoWayGridView.this.isInTouchMode()) ? -1 : 0);
                            sel = fillFromTop(childrenTop);
                            break;
                        } else {
                            int last = TwoWayGridView.this.mItemCount - 1;
                            TwoWayGridView.this.setSelectedPositionInt((TwoWayGridView.this.mAdapter == null || TwoWayGridView.this.isInTouchMode()) ? -1 : last);
                            sel = fillFromBottom(last, childrenBottom);
                            break;
                        }
                    } else if (TwoWayGridView.this.mSelectedPosition >= 0 && TwoWayGridView.this.mSelectedPosition < TwoWayGridView.this.mItemCount) {
                        int i2 = TwoWayGridView.this.mSelectedPosition;
                        if (oldSel != null) {
                            childrenTop = oldSel.getTop();
                        }
                        sel = fillSpecific(i2, childrenTop);
                        break;
                    } else if (TwoWayGridView.this.mFirstPosition < TwoWayGridView.this.mItemCount) {
                        int i3 = TwoWayGridView.this.mFirstPosition;
                        if (oldFirst != null) {
                            childrenTop = oldFirst.getTop();
                        }
                        sel = fillSpecific(i3, childrenTop);
                        break;
                    } else {
                        sel = fillSpecific(0, childrenTop);
                        break;
                    }
                    break;
            }
            recycleBin.scrapActiveViews();
            if (sel != null) {
                TwoWayGridView.this.positionSelector(sel);
                TwoWayGridView.this.mSelectedTop = sel.getTop();
            } else if (TwoWayGridView.this.mTouchMode > 0 && TwoWayGridView.this.mTouchMode < 3) {
                View child = TwoWayGridView.this.getChildAt(TwoWayGridView.this.mMotionPosition - TwoWayGridView.this.mFirstPosition);
                if (child != null) {
                    TwoWayGridView.this.positionSelector(child);
                }
            } else {
                TwoWayGridView.this.mSelectedTop = 0;
                TwoWayGridView.this.mSelectorRect.setEmpty();
            }
            TwoWayGridView.this.mLayoutMode = 0;
            TwoWayGridView.this.mDataChanged = false;
            TwoWayGridView.this.mNeedSync = false;
            TwoWayGridView.this.setNextSelectedPositionInt(TwoWayGridView.this.mSelectedPosition);
            TwoWayGridView.this.updateScrollIndicators();
            if (TwoWayGridView.this.mItemCount > 0) {
                TwoWayGridView.this.checkSelectionChanged();
            }
            TwoWayGridView.this.invokeOnItemScrollListener();
        }

        private void adjustViewsUpOrDown() {
            int delta;
            int childCount = TwoWayGridView.this.getChildCount();
            if (childCount > 0) {
                if (!TwoWayGridView.this.mStackFromBottom) {
                    View child = TwoWayGridView.this.getChildAt(0);
                    delta = child.getTop() - TwoWayGridView.this.mListPadding.top;
                    if (TwoWayGridView.this.mFirstPosition != 0) {
                        delta -= TwoWayGridView.this.mVerticalSpacing;
                    }
                    if (delta < 0) {
                        delta = 0;
                    }
                } else {
                    View child2 = TwoWayGridView.this.getChildAt(childCount - 1);
                    delta = child2.getBottom() - (TwoWayGridView.this.getHeight() - TwoWayGridView.this.mListPadding.bottom);
                    if (TwoWayGridView.this.mFirstPosition + childCount < TwoWayGridView.this.mItemCount) {
                        delta += TwoWayGridView.this.mVerticalSpacing;
                    }
                    if (delta > 0) {
                        delta = 0;
                    }
                }
                if (delta != 0) {
                    TwoWayGridView.this.offsetChildrenTopAndBottom(-delta);
                }
            }
        }

        private void setupChild(View child, int position, int y, boolean flow, int childrenLeft, boolean selected, boolean recycled, int where) {
            int childLeft;
            boolean isSelected = selected && TwoWayGridView.this.shouldShowSelector();
            boolean updateChildSelected = isSelected != child.isSelected();
            int mode = TwoWayGridView.this.mTouchMode;
            boolean isPressed = mode > 0 && mode < 3 && TwoWayGridView.this.mMotionPosition == position;
            boolean updateChildPressed = isPressed != child.isPressed();
            boolean needToMeasure = !recycled || updateChildSelected || child.isLayoutRequested();
            TwoWayAbsListView.LayoutParams p = (TwoWayAbsListView.LayoutParams) child.getLayoutParams();
            if (p == null) {
                p = new TwoWayAbsListView.LayoutParams(-1, -2, 0);
            }
            p.viewType = TwoWayGridView.this.mAdapter.getItemViewType(position);
            if (recycled && !p.forceAdd) {
                TwoWayGridView.this.attachViewToParent(child, where, p);
            } else {
                p.forceAdd = false;
                TwoWayGridView.this.addViewInLayout(child, where, p, true);
            }
            if (updateChildSelected) {
                child.setSelected(isSelected);
                if (isSelected) {
                    TwoWayGridView.this.requestFocus();
                }
            }
            if (updateChildPressed) {
                child.setPressed(isPressed);
            }
            if (!needToMeasure) {
                TwoWayGridView.this.cleanupLayoutState(child);
            } else {
                int childHeightSpec = ViewGroup.getChildMeasureSpec(View.MeasureSpec.makeMeasureSpec(0, 0), 0, p.height);
                int childWidthSpec = ViewGroup.getChildMeasureSpec(View.MeasureSpec.makeMeasureSpec(TwoWayGridView.this.mColumnWidth, 1073741824), 0, p.width);
                child.measure(childWidthSpec, childHeightSpec);
            }
            int w = child.getMeasuredWidth();
            int h = child.getMeasuredHeight();
            int childTop = flow ? y : y - h;
            switch (TwoWayGridView.this.mGravity & 7) {
                case 1:
                    childLeft = childrenLeft + ((TwoWayGridView.this.mColumnWidth - w) / 2);
                    break;
                case 2:
                case 4:
                default:
                    childLeft = childrenLeft;
                    break;
                case 3:
                    childLeft = childrenLeft;
                    break;
                case 5:
                    childLeft = (TwoWayGridView.this.mColumnWidth + childrenLeft) - w;
                    break;
            }
            if (needToMeasure) {
                int childRight = childLeft + w;
                int childBottom = childTop + h;
                child.layout(childLeft, childTop, childRight, childBottom);
            } else {
                child.offsetLeftAndRight(childLeft - child.getLeft());
                child.offsetTopAndBottom(childTop - child.getTop());
            }
            if (TwoWayGridView.this.mCachingStarted) {
                child.setDrawingCacheEnabled(true);
            }
        }

        private void pinToTop(int childrenTop) {
            if (TwoWayGridView.this.mFirstPosition == 0) {
                int top = TwoWayGridView.this.getChildAt(0).getTop();
                int offset = childrenTop - top;
                if (offset < 0) {
                    TwoWayGridView.this.offsetChildrenTopAndBottom(offset);
                }
            }
        }

        private void pinToBottom(int childrenBottom) {
            int count = TwoWayGridView.this.getChildCount();
            if (TwoWayGridView.this.mFirstPosition + count == TwoWayGridView.this.mItemCount) {
                int bottom = TwoWayGridView.this.getChildAt(count - 1).getBottom();
                int offset = childrenBottom - bottom;
                if (offset > 0) {
                    TwoWayGridView.this.offsetChildrenTopAndBottom(offset);
                }
            }
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected void setSelectionInt(int position) {
            int previousSelectedPosition = TwoWayGridView.this.mNextSelectedPosition;
            TwoWayGridView.this.setNextSelectedPositionInt(position);
            TwoWayGridView.this.layoutChildren();
            int next = TwoWayGridView.this.mStackFromBottom ? (TwoWayGridView.this.mItemCount - 1) - TwoWayGridView.this.mNextSelectedPosition : TwoWayGridView.this.mNextSelectedPosition;
            int previous = TwoWayGridView.this.mStackFromBottom ? (TwoWayGridView.this.mItemCount - 1) - previousSelectedPosition : previousSelectedPosition;
            int nextRow = next / TwoWayGridView.this.mNumColumns;
            int previousRow = previous / TwoWayGridView.this.mNumColumns;
            if (nextRow != previousRow) {
            }
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected boolean arrowScroll(int direction) {
            int endOfRowPos;
            int startOfRowPos;
            int selectedPosition = TwoWayGridView.this.mSelectedPosition;
            int numColumns = TwoWayGridView.this.mNumColumns;
            boolean moved = false;
            if (!TwoWayGridView.this.mStackFromBottom) {
                startOfRowPos = (selectedPosition / numColumns) * numColumns;
                endOfRowPos = Math.min((startOfRowPos + numColumns) - 1, TwoWayGridView.this.mItemCount - 1);
            } else {
                int invertedSelection = (TwoWayGridView.this.mItemCount - 1) - selectedPosition;
                endOfRowPos = (TwoWayGridView.this.mItemCount - 1) - ((invertedSelection / numColumns) * numColumns);
                startOfRowPos = Math.max(0, (endOfRowPos - numColumns) + 1);
            }
            switch (direction) {
                case 17:
                    if (selectedPosition > startOfRowPos) {
                        TwoWayGridView.this.mLayoutMode = 6;
                        setSelectionInt(Math.max(0, selectedPosition - 1));
                        moved = true;
                        break;
                    }
                    break;
                case 33:
                    if (startOfRowPos > 0) {
                        TwoWayGridView.this.mLayoutMode = 6;
                        setSelectionInt(Math.max(0, selectedPosition - numColumns));
                        moved = true;
                        break;
                    }
                    break;
                case 66:
                    if (selectedPosition < endOfRowPos) {
                        TwoWayGridView.this.mLayoutMode = 6;
                        setSelectionInt(Math.min(selectedPosition + 1, TwoWayGridView.this.mItemCount - 1));
                        moved = true;
                        break;
                    }
                    break;
                case 130:
                    if (endOfRowPos < TwoWayGridView.this.mItemCount - 1) {
                        TwoWayGridView.this.mLayoutMode = 6;
                        setSelectionInt(Math.min(selectedPosition + numColumns, TwoWayGridView.this.mItemCount - 1));
                        moved = true;
                        break;
                    }
                    break;
            }
            if (moved) {
                TwoWayGridView.this.playSoundEffect(SoundEffectConstants.getContantForFocusDirection(direction));
                TwoWayGridView.this.invokeOnItemScrollListener();
            }
            if (moved) {
            }
            return moved;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected boolean isCandidateSelection(int childIndex, int direction) {
            int rowEnd;
            int rowStart;
            int count = TwoWayGridView.this.getChildCount();
            int invertedIndex = (count - 1) - childIndex;
            if (!TwoWayGridView.this.mStackFromBottom) {
                rowStart = childIndex - (childIndex % TwoWayGridView.this.mNumColumns);
                rowEnd = Math.max((TwoWayGridView.this.mNumColumns + rowStart) - 1, count);
            } else {
                rowEnd = (count - 1) - (invertedIndex - (invertedIndex % TwoWayGridView.this.mNumColumns));
                rowStart = Math.max(0, (rowEnd - TwoWayGridView.this.mNumColumns) + 1);
            }
            switch (direction) {
                case 1:
                    return childIndex == rowEnd && rowEnd == count + (-1);
                case 2:
                    return childIndex == rowStart && rowStart == 0;
                case 17:
                    return childIndex == rowEnd;
                case 33:
                    return rowEnd == count + (-1);
                case 66:
                    return childIndex == rowStart;
                case 130:
                    return rowStart == 0;
                default:
                    throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT, FOCUS_FORWARD, FOCUS_BACKWARD}");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class HorizontalGridBuilder extends GridBuilder {
        private HorizontalGridBuilder() {
            super();
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected View makeAndAddView(int position, int x, boolean flow, int childrenTop, boolean selected, int where) {
            View child;
            if (!TwoWayGridView.this.mDataChanged && (child = TwoWayGridView.this.mRecycler.getActiveView(position)) != null) {
                setupChild(child, position, x, flow, childrenTop, selected, true, where);
                return child;
            }
            View child2 = TwoWayGridView.this.obtainView(position, TwoWayGridView.this.mIsScrap);
            setupChild(child2, position, x, flow, childrenTop, selected, TwoWayGridView.this.mIsScrap[0], where);
            return child2;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected void fillGap(boolean right) {
            int position;
            int numRows = TwoWayGridView.this.mNumRows;
            int horizontalSpacing = TwoWayGridView.this.mHorizontalSpacing;
            int count = TwoWayGridView.this.getChildCount();
            if (right) {
                int startOffset = count > 0 ? TwoWayGridView.this.getChildAt(count - 1).getRight() + horizontalSpacing : TwoWayGridView.this.getListPaddingLeft();
                int position2 = TwoWayGridView.this.mFirstPosition + count;
                if (TwoWayGridView.this.mStackFromBottom) {
                    position2 += numRows - 1;
                }
                fillRight(position2, startOffset);
                correctTooLeft(numRows, horizontalSpacing, TwoWayGridView.this.getChildCount());
                return;
            }
            int startOffset2 = count > 0 ? TwoWayGridView.this.getChildAt(0).getLeft() - horizontalSpacing : TwoWayGridView.this.getWidth() - TwoWayGridView.this.getListPaddingRight();
            int position3 = TwoWayGridView.this.mFirstPosition;
            if (!TwoWayGridView.this.mStackFromBottom) {
                position = position3 - numRows;
            } else {
                position = position3 - 1;
            }
            fillLeft(position, startOffset2);
            correctTooRight(numRows, horizontalSpacing, TwoWayGridView.this.getChildCount());
        }

        private View fillRight(int pos, int nextLeft) {
            View selectedView = null;
            int end = (TwoWayGridView.this.getRight() - TwoWayGridView.this.getLeft()) - TwoWayGridView.this.mListPadding.right;
            while (nextLeft < end && pos < TwoWayGridView.this.mItemCount) {
                View temp = makeColumn(pos, nextLeft, true);
                if (temp != null) {
                    selectedView = temp;
                }
                nextLeft = TwoWayGridView.this.mReferenceView.getRight() + TwoWayGridView.this.mHorizontalSpacing;
                pos += TwoWayGridView.this.mNumRows;
            }
            return selectedView;
        }

        private View makeColumn(int startPos, int x, boolean flow) {
            int last;
            int rowHeight = TwoWayGridView.this.mRowHeight;
            int verticalSpacing = TwoWayGridView.this.mVerticalSpacing;
            int nextTop = TwoWayGridView.this.mListPadding.top + (TwoWayGridView.this.mStretchMode == 3 ? verticalSpacing : 0);
            if (!TwoWayGridView.this.mStackFromBottom) {
                last = Math.min(TwoWayGridView.this.mNumRows + startPos, TwoWayGridView.this.mItemCount);
            } else {
                last = startPos + 1;
                startPos = Math.max(0, (startPos - TwoWayGridView.this.mNumRows) + 1);
                if (last - startPos < TwoWayGridView.this.mNumRows) {
                    nextTop += (TwoWayGridView.this.mNumRows - (last - startPos)) * (rowHeight + verticalSpacing);
                }
            }
            View selectedView = null;
            boolean hasFocus = TwoWayGridView.this.shouldShowSelector();
            boolean inClick = TwoWayGridView.this.touchModeDrawsInPressedState();
            int selectedPosition = TwoWayGridView.this.mSelectedPosition;
            View child = null;
            int pos = startPos;
            while (pos < last) {
                boolean selected = pos == selectedPosition;
                int where = flow ? -1 : pos - startPos;
                child = makeAndAddView(pos, x, flow, nextTop, selected, where);
                nextTop += rowHeight;
                if (pos < last - 1) {
                    nextTop += verticalSpacing;
                }
                if (selected && (hasFocus || inClick)) {
                    selectedView = child;
                }
                pos++;
            }
            TwoWayGridView.this.mReferenceView = child;
            if (selectedView != null) {
                TwoWayGridView.this.mReferenceViewInSelectedRow = TwoWayGridView.this.mReferenceView;
            }
            return selectedView;
        }

        private View fillLeft(int pos, int nextRight) {
            View selectedView = null;
            int end = TwoWayGridView.this.mListPadding.left;
            while (nextRight > end && pos >= 0) {
                View temp = makeColumn(pos, nextRight, false);
                if (temp != null) {
                    selectedView = temp;
                }
                nextRight = TwoWayGridView.this.mReferenceView.getLeft() - TwoWayGridView.this.mHorizontalSpacing;
                TwoWayGridView.this.mFirstPosition = pos;
                pos -= TwoWayGridView.this.mNumRows;
            }
            if (TwoWayGridView.this.mStackFromBottom) {
                TwoWayGridView.this.mFirstPosition = Math.max(0, pos + 1);
            }
            return selectedView;
        }

        private View fillFromTop(int nextLeft) {
            TwoWayGridView.this.mFirstPosition = Math.min(TwoWayGridView.this.mFirstPosition, TwoWayGridView.this.mSelectedPosition);
            TwoWayGridView.this.mFirstPosition = Math.min(TwoWayGridView.this.mFirstPosition, TwoWayGridView.this.mItemCount - 1);
            if (TwoWayGridView.this.mFirstPosition < 0) {
                TwoWayGridView.this.mFirstPosition = 0;
            }
            TwoWayGridView.this.mFirstPosition -= TwoWayGridView.this.mFirstPosition % TwoWayGridView.this.mNumRows;
            return fillRight(TwoWayGridView.this.mFirstPosition, nextLeft);
        }

        private View fillFromBottom(int lastPosition, int nextRight) {
            int invertedPosition = (TwoWayGridView.this.mItemCount - 1) - Math.min(Math.max(lastPosition, TwoWayGridView.this.mSelectedPosition), TwoWayGridView.this.mItemCount - 1);
            int lastPosition2 = (TwoWayGridView.this.mItemCount - 1) - (invertedPosition - (invertedPosition % TwoWayGridView.this.mNumRows));
            return fillLeft(lastPosition2, nextRight);
        }

        private View fillSelection(int childrenLeft, int childrenRight) {
            int columnStart;
            int selectedPosition = TwoWayGridView.this.reconcileSelectedPosition();
            int numRows = TwoWayGridView.this.mNumRows;
            int horizontalSpacing = TwoWayGridView.this.mHorizontalSpacing;
            int columnEnd = -1;
            if (!TwoWayGridView.this.mStackFromBottom) {
                columnStart = selectedPosition - (selectedPosition % numRows);
            } else {
                int invertedSelection = (TwoWayGridView.this.mItemCount - 1) - selectedPosition;
                columnEnd = (TwoWayGridView.this.mItemCount - 1) - (invertedSelection - (invertedSelection % numRows));
                columnStart = Math.max(0, (columnEnd - numRows) + 1);
            }
            int fadingEdgeLength = TwoWayGridView.this.getHorizontalFadingEdgeLength();
            int leftSelectionPixel = getLeftSelectionPixel(childrenLeft, fadingEdgeLength, columnStart);
            View sel = makeColumn(TwoWayGridView.this.mStackFromBottom ? columnEnd : columnStart, leftSelectionPixel, true);
            TwoWayGridView.this.mFirstPosition = columnStart;
            View referenceView = TwoWayGridView.this.mReferenceView;
            if (!TwoWayGridView.this.mStackFromBottom) {
                fillRight(columnStart + numRows, referenceView.getRight() + horizontalSpacing);
                pinToRight(childrenRight);
                fillLeft(columnStart - numRows, referenceView.getLeft() - horizontalSpacing);
                adjustViewsLeftOrRight();
            } else {
                int rightSelectionPixel = getRightSelectionPixel(childrenRight, fadingEdgeLength, numRows, columnStart);
                int offset = rightSelectionPixel - referenceView.getRight();
                TwoWayGridView.this.offsetChildrenLeftAndRight(offset);
                fillLeft(columnStart - 1, referenceView.getLeft() - horizontalSpacing);
                pinToLeft(childrenLeft);
                fillRight(columnEnd + numRows, referenceView.getRight() + horizontalSpacing);
                adjustViewsLeftOrRight();
            }
            return sel;
        }

        private View fillSpecific(int position, int left) {
            int motionColumnStart;
            View rightOf;
            View leftOf;
            int numRows = TwoWayGridView.this.mNumRows;
            int motionColumnEnd = -1;
            if (!TwoWayGridView.this.mStackFromBottom) {
                motionColumnStart = position - (position % numRows);
            } else {
                int invertedSelection = (TwoWayGridView.this.mItemCount - 1) - position;
                motionColumnEnd = (TwoWayGridView.this.mItemCount - 1) - (invertedSelection - (invertedSelection % numRows));
                motionColumnStart = Math.max(0, (motionColumnEnd - numRows) + 1);
            }
            View temp = makeColumn(TwoWayGridView.this.mStackFromBottom ? motionColumnEnd : motionColumnStart, left, true);
            TwoWayGridView.this.mFirstPosition = motionColumnStart;
            View referenceView = TwoWayGridView.this.mReferenceView;
            if (referenceView != null) {
                int horizontalSpacing = TwoWayGridView.this.mHorizontalSpacing;
                if (!TwoWayGridView.this.mStackFromBottom) {
                    leftOf = fillLeft(motionColumnStart - numRows, referenceView.getLeft() - horizontalSpacing);
                    adjustViewsLeftOrRight();
                    rightOf = fillRight(motionColumnStart + numRows, referenceView.getRight() + horizontalSpacing);
                    int childCount = TwoWayGridView.this.getChildCount();
                    if (childCount > 0) {
                        correctTooLeft(numRows, horizontalSpacing, childCount);
                    }
                } else {
                    rightOf = fillRight(motionColumnEnd + numRows, referenceView.getRight() + horizontalSpacing);
                    adjustViewsLeftOrRight();
                    leftOf = fillLeft(motionColumnStart - 1, referenceView.getLeft() - horizontalSpacing);
                    int childCount2 = TwoWayGridView.this.getChildCount();
                    if (childCount2 > 0) {
                        correctTooRight(numRows, horizontalSpacing, childCount2);
                    }
                }
                if (temp != null) {
                    return temp;
                }
                return leftOf != null ? leftOf : rightOf;
            }
            return null;
        }

        private void correctTooLeft(int numRows, int horizontalSpacing, int childCount) {
            int lastPosition = (TwoWayGridView.this.mFirstPosition + childCount) - 1;
            if (lastPosition == TwoWayGridView.this.mItemCount - 1 && childCount > 0) {
                View lastChild = TwoWayGridView.this.getChildAt(childCount - 1);
                int lastRight = lastChild.getRight();
                int end = (TwoWayGridView.this.getRight() - TwoWayGridView.this.getLeft()) - TwoWayGridView.this.mListPadding.right;
                int rightOffset = end - lastRight;
                View firstChild = TwoWayGridView.this.getChildAt(0);
                int firstLeft = firstChild.getLeft();
                if (rightOffset <= 0) {
                    return;
                }
                if (TwoWayGridView.this.mFirstPosition > 0 || firstLeft < TwoWayGridView.this.mListPadding.left) {
                    if (TwoWayGridView.this.mFirstPosition == 0) {
                        rightOffset = Math.min(rightOffset, TwoWayGridView.this.mListPadding.left - firstLeft);
                    }
                    TwoWayGridView.this.offsetChildrenLeftAndRight(rightOffset);
                    if (TwoWayGridView.this.mFirstPosition > 0) {
                        int i = TwoWayGridView.this.mFirstPosition;
                        if (TwoWayGridView.this.mStackFromBottom) {
                            numRows = 1;
                        }
                        fillLeft(i - numRows, firstChild.getLeft() - horizontalSpacing);
                        adjustViewsLeftOrRight();
                    }
                }
            }
        }

        private void correctTooRight(int numRows, int horizontalSpacing, int childCount) {
            if (TwoWayGridView.this.mFirstPosition == 0 && childCount > 0) {
                View firstChild = TwoWayGridView.this.getChildAt(0);
                int firstLeft = firstChild.getLeft();
                int start = TwoWayGridView.this.mListPadding.left;
                int end = (TwoWayGridView.this.getRight() - TwoWayGridView.this.getLeft()) - TwoWayGridView.this.mListPadding.right;
                int leftOffset = firstLeft - start;
                View lastChild = TwoWayGridView.this.getChildAt(childCount - 1);
                int lastRight = lastChild.getRight();
                int lastPosition = (TwoWayGridView.this.mFirstPosition + childCount) - 1;
                if (leftOffset <= 0) {
                    return;
                }
                if (lastPosition < TwoWayGridView.this.mItemCount - 1 || lastRight > end) {
                    if (lastPosition == TwoWayGridView.this.mItemCount - 1) {
                        leftOffset = Math.min(leftOffset, lastRight - end);
                    }
                    TwoWayGridView.this.offsetChildrenLeftAndRight(-leftOffset);
                    if (lastPosition < TwoWayGridView.this.mItemCount - 1) {
                        if (!TwoWayGridView.this.mStackFromBottom) {
                            numRows = 1;
                        }
                        fillRight(lastPosition + numRows, lastChild.getRight() + horizontalSpacing);
                        adjustViewsLeftOrRight();
                    }
                }
            }
        }

        private View moveSelection(int delta, int childrenLeft, int childrenRight) {
            int columnStart;
            int oldColumnStart;
            View sel;
            View referenceView;
            int fadingEdgeLength = TwoWayGridView.this.getHorizontalFadingEdgeLength();
            int selectedPosition = TwoWayGridView.this.mSelectedPosition;
            int numRows = TwoWayGridView.this.mNumRows;
            int horizontalSpacing = TwoWayGridView.this.mHorizontalSpacing;
            int columnEnd = -1;
            if (!TwoWayGridView.this.mStackFromBottom) {
                oldColumnStart = (selectedPosition - delta) - ((selectedPosition - delta) % numRows);
                columnStart = selectedPosition - (selectedPosition % numRows);
            } else {
                int invertedSelection = (TwoWayGridView.this.mItemCount - 1) - selectedPosition;
                columnEnd = (TwoWayGridView.this.mItemCount - 1) - (invertedSelection - (invertedSelection % numRows));
                columnStart = Math.max(0, (columnEnd - numRows) + 1);
                int invertedSelection2 = (TwoWayGridView.this.mItemCount - 1) - (selectedPosition - delta);
                int oldColumnStart2 = (TwoWayGridView.this.mItemCount - 1) - (invertedSelection2 - (invertedSelection2 % numRows));
                oldColumnStart = Math.max(0, (oldColumnStart2 - numRows) + 1);
            }
            int rowDelta = columnStart - oldColumnStart;
            int leftSelectionPixel = getLeftSelectionPixel(childrenLeft, fadingEdgeLength, columnStart);
            int rightSelectionPixel = getRightSelectionPixel(childrenRight, fadingEdgeLength, numRows, columnStart);
            TwoWayGridView.this.mFirstPosition = columnStart;
            if (rowDelta > 0) {
                int oldRight = TwoWayGridView.this.mReferenceViewInSelectedRow == null ? 0 : TwoWayGridView.this.mReferenceViewInSelectedRow.getRight();
                if (!TwoWayGridView.this.mStackFromBottom) {
                    columnEnd = columnStart;
                }
                sel = makeColumn(columnEnd, oldRight + horizontalSpacing, true);
                referenceView = TwoWayGridView.this.mReferenceView;
                adjustForRightFadingEdge(referenceView, leftSelectionPixel, rightSelectionPixel);
            } else if (rowDelta < 0) {
                int oldTop = TwoWayGridView.this.mReferenceViewInSelectedRow == null ? 0 : TwoWayGridView.this.mReferenceViewInSelectedRow.getLeft();
                if (!TwoWayGridView.this.mStackFromBottom) {
                    columnEnd = columnStart;
                }
                sel = makeColumn(columnEnd, oldTop - horizontalSpacing, false);
                referenceView = TwoWayGridView.this.mReferenceView;
                adjustForLeftFadingEdge(referenceView, leftSelectionPixel, rightSelectionPixel);
            } else {
                int oldTop2 = TwoWayGridView.this.mReferenceViewInSelectedRow == null ? 0 : TwoWayGridView.this.mReferenceViewInSelectedRow.getLeft();
                if (!TwoWayGridView.this.mStackFromBottom) {
                    columnEnd = columnStart;
                }
                sel = makeColumn(columnEnd, oldTop2, true);
                referenceView = TwoWayGridView.this.mReferenceView;
            }
            if (!TwoWayGridView.this.mStackFromBottom) {
                fillLeft(columnStart - numRows, referenceView.getLeft() - horizontalSpacing);
                adjustViewsLeftOrRight();
                fillRight(columnStart + numRows, referenceView.getRight() + horizontalSpacing);
            } else {
                fillRight(columnStart + numRows, referenceView.getRight() + horizontalSpacing);
                adjustViewsLeftOrRight();
                fillLeft(columnStart - 1, referenceView.getLeft() - horizontalSpacing);
            }
            return sel;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected void layoutChildren() {
            View sel;
            int childrenLeft = TwoWayGridView.this.mListPadding.left;
            int childrenRight = (TwoWayGridView.this.getRight() - TwoWayGridView.this.getLeft()) - TwoWayGridView.this.mListPadding.right;
            int childCount = TwoWayGridView.this.getChildCount();
            int delta = 0;
            View oldSel = null;
            View oldFirst = null;
            View newSel = null;
            switch (TwoWayGridView.this.mLayoutMode) {
                case 1:
                case 3:
                case 4:
                case 5:
                    break;
                case 2:
                    int index = TwoWayGridView.this.mNextSelectedPosition - TwoWayGridView.this.mFirstPosition;
                    if (index >= 0 && index < childCount) {
                        newSel = TwoWayGridView.this.getChildAt(index);
                        break;
                    }
                    break;
                case 6:
                    if (TwoWayGridView.this.mNextSelectedPosition >= 0) {
                        delta = TwoWayGridView.this.mNextSelectedPosition - TwoWayGridView.this.mSelectedPosition;
                        break;
                    }
                    break;
                default:
                    int index2 = TwoWayGridView.this.mSelectedPosition - TwoWayGridView.this.mFirstPosition;
                    if (index2 >= 0 && index2 < childCount) {
                        oldSel = TwoWayGridView.this.getChildAt(index2);
                    }
                    oldFirst = TwoWayGridView.this.getChildAt(0);
                    break;
            }
            boolean dataChanged = TwoWayGridView.this.mDataChanged;
            if (dataChanged) {
                TwoWayGridView.this.handleDataChanged();
            }
            if (TwoWayGridView.this.mItemCount == 0) {
                TwoWayGridView.this.resetList();
                TwoWayGridView.this.invokeOnItemScrollListener();
                return;
            }
            TwoWayGridView.this.setSelectedPositionInt(TwoWayGridView.this.mNextSelectedPosition);
            int firstPosition = TwoWayGridView.this.mFirstPosition;
            TwoWayAbsListView.RecycleBin recycleBin = TwoWayGridView.this.mRecycler;
            if (dataChanged) {
                for (int i = 0; i < childCount; i++) {
                    recycleBin.addScrapView(TwoWayGridView.this.getChildAt(i));
                }
            } else {
                recycleBin.fillActiveViews(childCount, firstPosition);
            }
            TwoWayGridView.this.detachAllViewsFromParent();
            switch (TwoWayGridView.this.mLayoutMode) {
                case 1:
                    TwoWayGridView.this.mFirstPosition = 0;
                    sel = fillFromTop(childrenLeft);
                    adjustViewsLeftOrRight();
                    break;
                case 2:
                    if (newSel != null) {
                        sel = fillFromSelection(newSel.getLeft(), childrenLeft, childrenRight);
                        break;
                    } else {
                        sel = fillSelection(childrenLeft, childrenRight);
                        break;
                    }
                case 3:
                    sel = fillRight(TwoWayGridView.this.mItemCount - 1, childrenRight);
                    adjustViewsLeftOrRight();
                    break;
                case 4:
                    sel = fillSpecific(TwoWayGridView.this.mSelectedPosition, TwoWayGridView.this.mSpecificTop);
                    break;
                case 5:
                    sel = fillSpecific(TwoWayGridView.this.mSyncPosition, TwoWayGridView.this.mSpecificTop);
                    break;
                case 6:
                    sel = moveSelection(delta, childrenLeft, childrenRight);
                    break;
                default:
                    if (childCount == 0) {
                        if (!TwoWayGridView.this.mStackFromBottom) {
                            TwoWayGridView.this.setSelectedPositionInt((TwoWayGridView.this.mAdapter == null || TwoWayGridView.this.isInTouchMode()) ? -1 : 0);
                            sel = fillFromTop(childrenLeft);
                            break;
                        } else {
                            int last = TwoWayGridView.this.mItemCount - 1;
                            TwoWayGridView.this.setSelectedPositionInt((TwoWayGridView.this.mAdapter == null || TwoWayGridView.this.isInTouchMode()) ? -1 : last);
                            sel = fillFromBottom(last, childrenRight);
                            break;
                        }
                    } else if (TwoWayGridView.this.mSelectedPosition >= 0 && TwoWayGridView.this.mSelectedPosition < TwoWayGridView.this.mItemCount) {
                        int i2 = TwoWayGridView.this.mSelectedPosition;
                        if (oldSel != null) {
                            childrenLeft = oldSel.getLeft();
                        }
                        sel = fillSpecific(i2, childrenLeft);
                        break;
                    } else if (TwoWayGridView.this.mFirstPosition < TwoWayGridView.this.mItemCount) {
                        int i3 = TwoWayGridView.this.mFirstPosition;
                        if (oldFirst != null) {
                            childrenLeft = oldFirst.getLeft();
                        }
                        sel = fillSpecific(i3, childrenLeft);
                        break;
                    } else {
                        sel = fillSpecific(0, childrenLeft);
                        break;
                    }
                    break;
            }
            recycleBin.scrapActiveViews();
            if (sel != null) {
                TwoWayGridView.this.positionSelector(sel);
                TwoWayGridView.this.mSelectedTop = sel.getLeft();
            } else if (TwoWayGridView.this.mTouchMode > 0 && TwoWayGridView.this.mTouchMode < 3) {
                View child = TwoWayGridView.this.getChildAt(TwoWayGridView.this.mMotionPosition - TwoWayGridView.this.mFirstPosition);
                if (child != null) {
                    TwoWayGridView.this.positionSelector(child);
                }
            } else {
                TwoWayGridView.this.mSelectedTop = 0;
                TwoWayGridView.this.mSelectorRect.setEmpty();
            }
            TwoWayGridView.this.mLayoutMode = 0;
            TwoWayGridView.this.mDataChanged = false;
            TwoWayGridView.this.mNeedSync = false;
            TwoWayGridView.this.setNextSelectedPositionInt(TwoWayGridView.this.mSelectedPosition);
            TwoWayGridView.this.updateScrollIndicators();
            if (TwoWayGridView.this.mItemCount > 0) {
                TwoWayGridView.this.checkSelectionChanged();
            }
            TwoWayGridView.this.invokeOnItemScrollListener();
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int heightSize;
            int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
            int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
            int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
            int heightSize2 = View.MeasureSpec.getSize(heightMeasureSpec);
            if (heightMode == 0) {
                if (TwoWayGridView.this.mRowHeight > 0) {
                    heightSize = TwoWayGridView.this.mRowHeight + TwoWayGridView.this.mListPadding.top + TwoWayGridView.this.mListPadding.bottom;
                } else {
                    heightSize = TwoWayGridView.this.mListPadding.top + TwoWayGridView.this.mListPadding.bottom;
                }
                heightSize2 = heightSize + TwoWayGridView.this.getHorizontalScrollbarHeight();
            }
            int childHeight = (heightSize2 - TwoWayGridView.this.mListPadding.top) - TwoWayGridView.this.mListPadding.bottom;
            determineRows(childHeight);
            int childWidth = 0;
            TwoWayGridView.this.mItemCount = TwoWayGridView.this.mAdapter == null ? 0 : TwoWayGridView.this.mAdapter.getCount();
            int count = TwoWayGridView.this.mItemCount;
            if (count > 0) {
                View child = TwoWayGridView.this.obtainView(0, TwoWayGridView.this.mIsScrap);
                TwoWayAbsListView.LayoutParams p = (TwoWayAbsListView.LayoutParams) child.getLayoutParams();
                if (p == null) {
                    p = new TwoWayAbsListView.LayoutParams(-2, -1, 0);
                    child.setLayoutParams(p);
                }
                p.viewType = TwoWayGridView.this.mAdapter.getItemViewType(0);
                p.forceAdd = true;
                int childHeightSpec = ViewGroup.getChildMeasureSpec(View.MeasureSpec.makeMeasureSpec(TwoWayGridView.this.mRowHeight, 0), 0, p.height);
                int childWidthSpec = ViewGroup.getChildMeasureSpec(View.MeasureSpec.makeMeasureSpec(0, 1073741824), 0, p.width);
                child.measure(childWidthSpec, childHeightSpec);
                childWidth = child.getMeasuredWidth();
                if (TwoWayGridView.this.mRecycler.shouldRecycleViewType(p.viewType)) {
                    TwoWayGridView.this.mRecycler.addScrapView(child);
                }
            }
            if (widthMode == 0) {
                widthSize = TwoWayGridView.this.mListPadding.left + TwoWayGridView.this.mListPadding.right + childWidth + (TwoWayGridView.this.getHorizontalFadingEdgeLength() * 2);
            }
            if (widthMode == Integer.MIN_VALUE) {
                int ourSize = TwoWayGridView.this.mListPadding.left + TwoWayGridView.this.mListPadding.right;
                int numRows = TwoWayGridView.this.mNumRows;
                int i = 0;
                while (true) {
                    if (i >= count) {
                        break;
                    }
                    ourSize += childWidth;
                    if (i + numRows < count) {
                        ourSize += TwoWayGridView.this.mHorizontalSpacing;
                    }
                    if (ourSize < widthSize) {
                        i += numRows;
                    } else {
                        ourSize = widthSize;
                        break;
                    }
                }
                widthSize = ourSize;
            }
            TwoWayGridView.this.setMeasuredDimension(widthSize, heightSize2);
            TwoWayGridView.this.mWidthMeasureSpec = widthMeasureSpec;
        }

        private void determineRows(int availableSpace) {
            int requestedVerticalSpacing = TwoWayGridView.this.mRequestedVerticalSpacing;
            int stretchMode = TwoWayGridView.this.mStretchMode;
            int requestedRowHeight = TwoWayGridView.this.mRequestedRowHeight;
            TwoWayGridView.this.mHorizontalSpacing = TwoWayGridView.this.mRequestedHorizontalSpacing;
            if (TwoWayGridView.this.mRequestedNumRows == -1) {
                if (requestedRowHeight <= 0) {
                    TwoWayGridView.this.mNumRows = 2;
                } else {
                    TwoWayGridView.this.mNumRows = (TwoWayGridView.this.mRequestedVerticalSpacing + availableSpace) / (TwoWayGridView.this.mRequestedVerticalSpacing + requestedRowHeight);
                }
            } else {
                TwoWayGridView.this.mNumRows = TwoWayGridView.this.mRequestedNumRows;
            }
            if (TwoWayGridView.this.mNumRows <= 0) {
                TwoWayGridView.this.mNumRows = 1;
            }
            switch (stretchMode) {
                case 0:
                    TwoWayGridView.this.mRowHeight = TwoWayGridView.this.mRequestedRowHeight;
                    TwoWayGridView.this.mVerticalSpacing = TwoWayGridView.this.mRequestedVerticalSpacing;
                    return;
                default:
                    switch (stretchMode) {
                        case 1:
                            int spaceLeftOver = (availableSpace - (TwoWayGridView.this.mNumRows * requestedRowHeight)) - ((TwoWayGridView.this.mNumRows - 1) * requestedVerticalSpacing);
                            TwoWayGridView.this.mRowHeight = requestedRowHeight;
                            if (TwoWayGridView.this.mNumRows <= 1) {
                                TwoWayGridView.this.mVerticalSpacing = requestedVerticalSpacing + spaceLeftOver;
                                return;
                            }
                            TwoWayGridView.this.mVerticalSpacing = (spaceLeftOver / (TwoWayGridView.this.mNumRows - 1)) + requestedVerticalSpacing;
                            return;
                        case 2:
                            int spaceLeftOver2 = (availableSpace - (TwoWayGridView.this.mNumRows * requestedRowHeight)) - ((TwoWayGridView.this.mNumRows - 1) * requestedVerticalSpacing);
                            TwoWayGridView.this.mRowHeight = (spaceLeftOver2 / TwoWayGridView.this.mNumRows) + requestedRowHeight;
                            TwoWayGridView.this.mVerticalSpacing = requestedVerticalSpacing;
                            return;
                        case 3:
                            int spaceLeftOver3 = (availableSpace - (TwoWayGridView.this.mNumRows * requestedRowHeight)) - ((TwoWayGridView.this.mNumRows + 1) * requestedVerticalSpacing);
                            TwoWayGridView.this.mRowHeight = requestedRowHeight;
                            if (TwoWayGridView.this.mNumRows <= 1) {
                                TwoWayGridView.this.mVerticalSpacing = ((requestedVerticalSpacing * 2) + spaceLeftOver3) / 2;
                                return;
                            }
                            TwoWayGridView.this.mVerticalSpacing = (spaceLeftOver3 / (TwoWayGridView.this.mNumRows + 1)) + requestedVerticalSpacing;
                            return;
                        default:
                            return;
                    }
            }
        }

        private View fillFromSelection(int selectedLeft, int childrenLeft, int childrenRight) {
            int columnStart;
            int fadingEdgeLength = TwoWayGridView.this.getHorizontalFadingEdgeLength();
            int selectedPosition = TwoWayGridView.this.mSelectedPosition;
            int numRows = TwoWayGridView.this.mNumRows;
            int horizontalSpacing = TwoWayGridView.this.mHorizontalSpacing;
            int columnEnd = -1;
            if (!TwoWayGridView.this.mStackFromBottom) {
                columnStart = selectedPosition - (selectedPosition % numRows);
            } else {
                int invertedSelection = (TwoWayGridView.this.mItemCount - 1) - selectedPosition;
                columnEnd = (TwoWayGridView.this.mItemCount - 1) - (invertedSelection - (invertedSelection % numRows));
                columnStart = Math.max(0, (columnEnd - numRows) + 1);
            }
            int leftSelectionPixel = getLeftSelectionPixel(childrenLeft, fadingEdgeLength, columnStart);
            int rightSelectionPixel = getRightSelectionPixel(childrenRight, fadingEdgeLength, numRows, columnStart);
            View sel = makeColumn(TwoWayGridView.this.mStackFromBottom ? columnEnd : columnStart, selectedLeft, true);
            TwoWayGridView.this.mFirstPosition = columnStart;
            View referenceView = TwoWayGridView.this.mReferenceView;
            adjustForLeftFadingEdge(referenceView, leftSelectionPixel, rightSelectionPixel);
            adjustForRightFadingEdge(referenceView, leftSelectionPixel, rightSelectionPixel);
            if (!TwoWayGridView.this.mStackFromBottom) {
                fillLeft(columnStart - numRows, referenceView.getLeft() - horizontalSpacing);
                adjustViewsLeftOrRight();
                fillRight(columnStart + numRows, referenceView.getRight() + horizontalSpacing);
            } else {
                fillRight(columnEnd + numRows, referenceView.getRight() + horizontalSpacing);
                adjustViewsLeftOrRight();
                fillLeft(columnStart - 1, referenceView.getLeft() - horizontalSpacing);
            }
            return sel;
        }

        private int getRightSelectionPixel(int childrenRight, int fadingEdgeLength, int numColumns, int rowStart) {
            if ((rowStart + numColumns) - 1 >= TwoWayGridView.this.mItemCount - 1) {
                return childrenRight;
            }
            int rightSelectionPixel = childrenRight - fadingEdgeLength;
            return rightSelectionPixel;
        }

        private int getLeftSelectionPixel(int childrenLeft, int fadingEdgeLength, int rowStart) {
            if (rowStart <= 0) {
                return childrenLeft;
            }
            int leftSelectionPixel = childrenLeft + fadingEdgeLength;
            return leftSelectionPixel;
        }

        private void adjustForRightFadingEdge(View childInSelectedRow, int leftSelectionPixel, int rightSelectionPixel) {
            if (childInSelectedRow.getRight() > rightSelectionPixel) {
                int spaceToLeft = childInSelectedRow.getLeft() - leftSelectionPixel;
                int spaceToRight = childInSelectedRow.getRight() - rightSelectionPixel;
                int offset = Math.min(spaceToLeft, spaceToRight);
                TwoWayGridView.this.offsetChildrenLeftAndRight(-offset);
            }
        }

        private void adjustForLeftFadingEdge(View childInSelectedRow, int leftSelectionPixel, int rightSelectionPixel) {
            if (childInSelectedRow.getLeft() < leftSelectionPixel) {
                int spaceToLeft = leftSelectionPixel - childInSelectedRow.getLeft();
                int spaceToRight = rightSelectionPixel - childInSelectedRow.getRight();
                int offset = Math.min(spaceToLeft, spaceToRight);
                TwoWayGridView.this.offsetChildrenLeftAndRight(offset);
            }
        }

        private void adjustViewsLeftOrRight() {
            int delta;
            int childCount = TwoWayGridView.this.getChildCount();
            if (childCount > 0) {
                if (!TwoWayGridView.this.mStackFromBottom) {
                    View child = TwoWayGridView.this.getChildAt(0);
                    delta = child.getLeft() - TwoWayGridView.this.mListPadding.left;
                    if (TwoWayGridView.this.mFirstPosition != 0) {
                        delta -= TwoWayGridView.this.mHorizontalSpacing;
                    }
                    if (delta < 0) {
                        delta = 0;
                    }
                } else {
                    View child2 = TwoWayGridView.this.getChildAt(childCount - 1);
                    delta = child2.getRight() - (TwoWayGridView.this.getWidth() - TwoWayGridView.this.mListPadding.right);
                    if (TwoWayGridView.this.mFirstPosition + childCount < TwoWayGridView.this.mItemCount) {
                        delta += TwoWayGridView.this.mHorizontalSpacing;
                    }
                    if (delta > 0) {
                        delta = 0;
                    }
                }
                if (delta != 0) {
                    TwoWayGridView.this.offsetChildrenLeftAndRight(-delta);
                }
            }
        }

        private void setupChild(View child, int position, int x, boolean flow, int childrenTop, boolean selected, boolean recycled, int where) {
            int childTop;
            boolean isSelected = selected && TwoWayGridView.this.shouldShowSelector();
            boolean updateChildSelected = isSelected != child.isSelected();
            int mode = TwoWayGridView.this.mTouchMode;
            boolean isPressed = mode > 0 && mode < 3 && TwoWayGridView.this.mMotionPosition == position;
            boolean updateChildPressed = isPressed != child.isPressed();
            boolean needToMeasure = !recycled || updateChildSelected || child.isLayoutRequested();
            TwoWayAbsListView.LayoutParams p = (TwoWayAbsListView.LayoutParams) child.getLayoutParams();
            if (p == null) {
                p = new TwoWayAbsListView.LayoutParams(-2, -1, 0);
            }
            p.viewType = TwoWayGridView.this.mAdapter.getItemViewType(position);
            if (recycled && !p.forceAdd) {
                TwoWayGridView.this.attachViewToParent(child, where, p);
            } else {
                p.forceAdd = false;
                TwoWayGridView.this.addViewInLayout(child, where, p, true);
            }
            if (updateChildSelected) {
                child.setSelected(isSelected);
                if (isSelected) {
                    TwoWayGridView.this.requestFocus();
                }
            }
            if (updateChildPressed) {
                child.setPressed(isPressed);
            }
            if (!needToMeasure) {
                TwoWayGridView.this.cleanupLayoutState(child);
            } else {
                int childWidthSpec = ViewGroup.getChildMeasureSpec(View.MeasureSpec.makeMeasureSpec(0, 0), 0, p.width);
                int childHeightSpec = ViewGroup.getChildMeasureSpec(View.MeasureSpec.makeMeasureSpec(TwoWayGridView.this.mRowHeight, 1073741824), 0, p.height);
                child.measure(childWidthSpec, childHeightSpec);
            }
            int w = child.getMeasuredWidth();
            int h = child.getMeasuredHeight();
            int childLeft = flow ? x : x - w;
            switch (TwoWayGridView.this.mGravity & 112) {
                case 1:
                    childTop = childrenTop + ((TwoWayGridView.this.mRowHeight - h) / 2);
                    break;
                case 5:
                    childTop = (TwoWayGridView.this.mRowHeight + childrenTop) - h;
                    break;
                case 48:
                    childTop = childrenTop;
                    break;
                default:
                    childTop = childrenTop;
                    break;
            }
            if (needToMeasure) {
                int childRight = childLeft + w;
                int childBottom = childTop + h;
                child.layout(childLeft, childTop, childRight, childBottom);
            } else {
                child.offsetLeftAndRight(childLeft - child.getLeft());
                child.offsetTopAndBottom(childTop - child.getTop());
            }
            if (TwoWayGridView.this.mCachingStarted) {
                child.setDrawingCacheEnabled(true);
            }
        }

        private void pinToLeft(int childrenLeft) {
            if (TwoWayGridView.this.mFirstPosition == 0) {
                int left = TwoWayGridView.this.getChildAt(0).getLeft();
                int offset = childrenLeft - left;
                if (offset < 0) {
                    TwoWayGridView.this.offsetChildrenLeftAndRight(offset);
                }
            }
        }

        private void pinToRight(int childrenRight) {
            int count = TwoWayGridView.this.getChildCount();
            if (TwoWayGridView.this.mFirstPosition + count == TwoWayGridView.this.mItemCount) {
                int right = TwoWayGridView.this.getChildAt(count - 1).getRight();
                int offset = childrenRight - right;
                if (offset > 0) {
                    TwoWayGridView.this.offsetChildrenLeftAndRight(offset);
                }
            }
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected void setSelectionInt(int position) {
            int previousSelectedPosition = TwoWayGridView.this.mNextSelectedPosition;
            TwoWayGridView.this.setNextSelectedPositionInt(position);
            TwoWayGridView.this.layoutChildren();
            int next = TwoWayGridView.this.mStackFromBottom ? (TwoWayGridView.this.mItemCount - 1) - TwoWayGridView.this.mNextSelectedPosition : TwoWayGridView.this.mNextSelectedPosition;
            int previous = TwoWayGridView.this.mStackFromBottom ? (TwoWayGridView.this.mItemCount - 1) - previousSelectedPosition : previousSelectedPosition;
            int nextColumn = next / TwoWayGridView.this.mNumRows;
            int previousColumn = previous / TwoWayGridView.this.mNumRows;
            if (nextColumn != previousColumn) {
            }
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected boolean arrowScroll(int direction) {
            int endOfColumnPos;
            int startOfColumnPos;
            int selectedPosition = TwoWayGridView.this.mSelectedPosition;
            int numRows = TwoWayGridView.this.mNumRows;
            boolean moved = false;
            if (!TwoWayGridView.this.mStackFromBottom) {
                startOfColumnPos = (selectedPosition / numRows) * numRows;
                endOfColumnPos = Math.min((startOfColumnPos + numRows) - 1, TwoWayGridView.this.mItemCount - 1);
            } else {
                int invertedSelection = (TwoWayGridView.this.mItemCount - 1) - selectedPosition;
                endOfColumnPos = (TwoWayGridView.this.mItemCount - 1) - ((invertedSelection / numRows) * numRows);
                startOfColumnPos = Math.max(0, (endOfColumnPos - numRows) + 1);
            }
            switch (direction) {
                case 17:
                    if (startOfColumnPos > 0) {
                        TwoWayGridView.this.mLayoutMode = 6;
                        setSelectionInt(Math.max(0, selectedPosition - numRows));
                        moved = true;
                        break;
                    }
                    break;
                case 33:
                    if (selectedPosition > startOfColumnPos) {
                        TwoWayGridView.this.mLayoutMode = 6;
                        setSelectionInt(Math.max(0, selectedPosition - 1));
                        moved = true;
                        break;
                    }
                    break;
                case 66:
                    if (startOfColumnPos < TwoWayGridView.this.mItemCount - 1) {
                        TwoWayGridView.this.mLayoutMode = 6;
                        setSelectionInt(Math.min(selectedPosition + numRows, TwoWayGridView.this.mItemCount - 1));
                        moved = true;
                        break;
                    }
                    break;
                case 130:
                    if (selectedPosition < endOfColumnPos) {
                        TwoWayGridView.this.mLayoutMode = 6;
                        setSelectionInt(Math.min(selectedPosition + 1, TwoWayGridView.this.mItemCount - 1));
                        moved = true;
                        break;
                    }
                    break;
            }
            if (moved) {
                TwoWayGridView.this.playSoundEffect(SoundEffectConstants.getContantForFocusDirection(direction));
                TwoWayGridView.this.invokeOnItemScrollListener();
            }
            if (moved) {
            }
            return moved;
        }

        @Override // com.vkontakte.android.ui.twowaysgridview.TwoWayGridView.GridBuilder
        protected boolean isCandidateSelection(int childIndex, int direction) {
            int columnEnd;
            int columnStart;
            int count = TwoWayGridView.this.getChildCount();
            int invertedIndex = (count - 1) - childIndex;
            int numRows = TwoWayGridView.this.mNumRows;
            if (!TwoWayGridView.this.mStackFromBottom) {
                columnStart = childIndex - (childIndex % numRows);
                columnEnd = Math.max((columnStart + numRows) - 1, count);
            } else {
                columnEnd = (count - 1) - (invertedIndex - (invertedIndex % numRows));
                columnStart = Math.max(0, (columnEnd - numRows) + 1);
            }
            switch (direction) {
                case 1:
                    return childIndex == columnEnd && columnEnd == count + (-1);
                case 2:
                    return childIndex == columnStart && columnStart == 0;
                case 17:
                    return childIndex == columnStart;
                case 33:
                    return columnStart == count + (-1);
                case 66:
                    return childIndex == columnStart;
                case 130:
                    return columnStart == 0;
                default:
                    throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT, FOCUS_FORWARD, FOCUS_BACKWARD}.");
            }
        }
    }
}
