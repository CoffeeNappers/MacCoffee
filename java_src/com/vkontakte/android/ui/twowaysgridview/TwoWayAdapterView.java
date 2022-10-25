package com.vkontakte.android.ui.twowaysgridview;

import android.content.Context;
import android.database.DataSetObserver;
import android.os.Handler;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.ContextMenu;
import android.view.View;
import android.view.ViewDebug;
import android.view.ViewGroup;
import android.widget.Adapter;
/* loaded from: classes.dex */
public abstract class TwoWayAdapterView<T extends Adapter> extends ViewGroup {
    public static final int INVALID_POSITION = -1;
    public static final long INVALID_ROW_ID = Long.MIN_VALUE;
    public static final int ITEM_VIEW_TYPE_HEADER_OR_FOOTER = -2;
    public static final int ITEM_VIEW_TYPE_IGNORE = -1;
    static final int SYNC_FIRST_POSITION = 1;
    static final int SYNC_MAX_DURATION_MILLIS = 100;
    static final int SYNC_SELECTED_POSITION = 0;
    boolean mBlockLayoutRequests;
    protected Context mContext;
    boolean mDataChanged;
    private boolean mDesiredFocusableInTouchModeState;
    private boolean mDesiredFocusableState;
    private View mEmptyView;
    @ViewDebug.ExportedProperty
    int mFirstPosition;
    boolean mInLayout;
    protected boolean mIsVertical;
    @ViewDebug.ExportedProperty
    int mItemCount;
    private int mLayoutHeight;
    private int mLayoutWidth;
    boolean mNeedSync;
    @ViewDebug.ExportedProperty
    int mNextSelectedPosition;
    long mNextSelectedRowId;
    int mOldItemCount;
    int mOldSelectedPosition;
    long mOldSelectedRowId;
    OnItemClickListener mOnItemClickListener;
    OnItemLongClickListener mOnItemLongClickListener;
    OnItemSelectedListener mOnItemSelectedListener;
    @ViewDebug.ExportedProperty
    int mSelectedPosition;
    long mSelectedRowId;
    private TwoWayAdapterView<T>.SelectionNotifier mSelectionNotifier;
    int mSpecificTop;
    int mSyncMode;
    int mSyncPosition;
    long mSyncRowId;
    long mSyncSize;

    /* loaded from: classes3.dex */
    public interface OnItemClickListener {
        void onItemClick(TwoWayAdapterView<?> twoWayAdapterView, View view, int i, long j);
    }

    /* loaded from: classes3.dex */
    public interface OnItemLongClickListener {
        boolean onItemLongClick(TwoWayAdapterView<?> twoWayAdapterView, View view, int i, long j);
    }

    /* loaded from: classes3.dex */
    public interface OnItemSelectedListener {
        void onItemSelected(TwoWayAdapterView<?> twoWayAdapterView, View view, int i, long j);

        void onNothingSelected(TwoWayAdapterView<?> twoWayAdapterView);
    }

    public abstract T getAdapter();

    public abstract View getSelectedView();

    public abstract void setAdapter(T t);

    public abstract void setSelection(int i);

    public TwoWayAdapterView(Context context) {
        super(context);
        this.mContext = null;
        this.mIsVertical = true;
        this.mFirstPosition = 0;
        this.mSyncRowId = Long.MIN_VALUE;
        this.mNeedSync = false;
        this.mInLayout = false;
        this.mNextSelectedPosition = -1;
        this.mNextSelectedRowId = Long.MIN_VALUE;
        this.mSelectedPosition = -1;
        this.mSelectedRowId = Long.MIN_VALUE;
        this.mOldSelectedPosition = -1;
        this.mOldSelectedRowId = Long.MIN_VALUE;
        this.mBlockLayoutRequests = false;
        this.mContext = context;
    }

    public TwoWayAdapterView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mContext = null;
        this.mIsVertical = true;
        this.mFirstPosition = 0;
        this.mSyncRowId = Long.MIN_VALUE;
        this.mNeedSync = false;
        this.mInLayout = false;
        this.mNextSelectedPosition = -1;
        this.mNextSelectedRowId = Long.MIN_VALUE;
        this.mSelectedPosition = -1;
        this.mSelectedRowId = Long.MIN_VALUE;
        this.mOldSelectedPosition = -1;
        this.mOldSelectedRowId = Long.MIN_VALUE;
        this.mBlockLayoutRequests = false;
        this.mContext = context;
    }

    public TwoWayAdapterView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mContext = null;
        this.mIsVertical = true;
        this.mFirstPosition = 0;
        this.mSyncRowId = Long.MIN_VALUE;
        this.mNeedSync = false;
        this.mInLayout = false;
        this.mNextSelectedPosition = -1;
        this.mNextSelectedRowId = Long.MIN_VALUE;
        this.mSelectedPosition = -1;
        this.mSelectedRowId = Long.MIN_VALUE;
        this.mOldSelectedPosition = -1;
        this.mOldSelectedRowId = Long.MIN_VALUE;
        this.mBlockLayoutRequests = false;
        this.mContext = context;
    }

    public void setOnItemClickListener(OnItemClickListener listener) {
        this.mOnItemClickListener = listener;
    }

    public final OnItemClickListener getOnItemClickListener() {
        return this.mOnItemClickListener;
    }

    public boolean performItemClick(View view, int position, long id) {
        if (this.mOnItemClickListener != null) {
            playSoundEffect(0);
            this.mOnItemClickListener.onItemClick(this, view, position, id);
            return true;
        }
        return false;
    }

    public void setOnItemLongClickListener(OnItemLongClickListener listener) {
        if (!isLongClickable()) {
            setLongClickable(true);
        }
        this.mOnItemLongClickListener = listener;
    }

    public final OnItemLongClickListener getOnItemLongClickListener() {
        return this.mOnItemLongClickListener;
    }

    public void setOnItemSelectedListener(OnItemSelectedListener listener) {
        this.mOnItemSelectedListener = listener;
    }

    public final OnItemSelectedListener getOnItemSelectedListener() {
        return this.mOnItemSelectedListener;
    }

    /* loaded from: classes3.dex */
    public static class AdapterContextMenuInfo implements ContextMenu.ContextMenuInfo {
        public long id;
        public int position;
        public View targetView;

        public AdapterContextMenuInfo(View targetView, int position, long id) {
            this.targetView = targetView;
            this.position = position;
            this.id = id;
        }
    }

    @Override // android.view.ViewGroup
    public void addView(View child) {
        throw new UnsupportedOperationException("addView(View) is not supported in AdapterView");
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index) {
        throw new UnsupportedOperationException("addView(View, int) is not supported in AdapterView");
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void addView(View child, ViewGroup.LayoutParams params) {
        throw new UnsupportedOperationException("addView(View, LayoutParams) is not supported in AdapterView");
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        throw new UnsupportedOperationException("addView(View, int, LayoutParams) is not supported in AdapterView");
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void removeView(View child) {
        throw new UnsupportedOperationException("removeView(View) is not supported in AdapterView");
    }

    @Override // android.view.ViewGroup
    public void removeViewAt(int index) {
        throw new UnsupportedOperationException("removeViewAt(int) is not supported in AdapterView");
    }

    @Override // android.view.ViewGroup
    public void removeAllViews() {
        throw new UnsupportedOperationException("removeAllViews() is not supported in AdapterView");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        this.mLayoutHeight = getHeight();
        this.mLayoutWidth = getWidth();
    }

    @ViewDebug.CapturedViewProperty
    public int getSelectedItemPosition() {
        return this.mNextSelectedPosition;
    }

    @ViewDebug.CapturedViewProperty
    public long getSelectedItemId() {
        return this.mNextSelectedRowId;
    }

    public Object getSelectedItem() {
        T adapter = getAdapter();
        int selection = getSelectedItemPosition();
        if (adapter == null || adapter.getCount() <= 0 || selection < 0) {
            return null;
        }
        return adapter.getItem(selection);
    }

    @ViewDebug.CapturedViewProperty
    public int getCount() {
        return this.mItemCount;
    }

    public int getPositionForView(View view) {
        View listItem = view;
        while (true) {
            try {
                View v = (View) listItem.getParent();
                if (v.equals(this)) {
                    break;
                }
                listItem = v;
            } catch (ClassCastException e) {
                return -1;
            }
        }
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            if (getChildAt(i).equals(listItem)) {
                return this.mFirstPosition + i;
            }
        }
        return -1;
    }

    public int getFirstVisiblePosition() {
        return this.mFirstPosition;
    }

    public int getLastVisiblePosition() {
        return (this.mFirstPosition + getChildCount()) - 1;
    }

    public void setEmptyView(View emptyView) {
        this.mEmptyView = emptyView;
        T adapter = getAdapter();
        boolean empty = adapter == null || adapter.isEmpty();
        updateEmptyStatus(empty);
    }

    public View getEmptyView() {
        return this.mEmptyView;
    }

    boolean isInFilterMode() {
        return false;
    }

    @Override // android.view.View
    public void setFocusable(boolean focusable) {
        boolean z = true;
        T adapter = getAdapter();
        boolean empty = adapter == null || adapter.getCount() == 0;
        this.mDesiredFocusableState = focusable;
        if (!focusable) {
            this.mDesiredFocusableInTouchModeState = false;
        }
        if (!focusable || (empty && !isInFilterMode())) {
            z = false;
        }
        super.setFocusable(z);
    }

    @Override // android.view.View
    public void setFocusableInTouchMode(boolean focusable) {
        boolean z = true;
        T adapter = getAdapter();
        boolean empty = adapter == null || adapter.getCount() == 0;
        this.mDesiredFocusableInTouchModeState = focusable;
        if (focusable) {
            this.mDesiredFocusableState = true;
        }
        if (!focusable || (empty && !isInFilterMode())) {
            z = false;
        }
        super.setFocusableInTouchMode(z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void checkFocus() {
        boolean z = false;
        T adapter = getAdapter();
        boolean empty = adapter == null || adapter.getCount() == 0;
        boolean focusable = !empty || isInFilterMode();
        super.setFocusableInTouchMode(focusable && this.mDesiredFocusableInTouchModeState);
        super.setFocusable(focusable && this.mDesiredFocusableState);
        if (this.mEmptyView != null) {
            if (adapter == null || adapter.isEmpty()) {
                z = true;
            }
            updateEmptyStatus(z);
        }
    }

    private void updateEmptyStatus(boolean empty) {
        if (isInFilterMode()) {
            empty = false;
        }
        if (empty) {
            if (this.mEmptyView != null) {
                this.mEmptyView.setVisibility(0);
                setVisibility(8);
            } else {
                setVisibility(0);
            }
            if (this.mDataChanged) {
                onLayout(false, getLeft(), getTop(), getRight(), getBottom());
                return;
            }
            return;
        }
        if (this.mEmptyView != null) {
            this.mEmptyView.setVisibility(8);
        }
        setVisibility(0);
    }

    public Object getItemAtPosition(int position) {
        T adapter = getAdapter();
        if (adapter == null || position < 0) {
            return null;
        }
        return adapter.getItem(position);
    }

    public long getItemIdAtPosition(int position) {
        T adapter = getAdapter();
        if (adapter == null || position < 0) {
            return Long.MIN_VALUE;
        }
        return adapter.getItemId(position);
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener l) {
        throw new RuntimeException("Don't call setOnClickListener for an AdapterView. You probably want setOnItemClickListener instead");
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchSaveInstanceState(SparseArray<Parcelable> container) {
        dispatchFreezeSelfOnly(container);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchRestoreInstanceState(SparseArray<Parcelable> container) {
        dispatchThawSelfOnly(container);
    }

    /* loaded from: classes3.dex */
    class AdapterDataSetObserver extends DataSetObserver {
        private Parcelable mInstanceState = null;

        /* JADX INFO: Access modifiers changed from: package-private */
        public AdapterDataSetObserver() {
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            TwoWayAdapterView.this.mDataChanged = true;
            TwoWayAdapterView.this.mOldItemCount = TwoWayAdapterView.this.mItemCount;
            TwoWayAdapterView.this.mItemCount = TwoWayAdapterView.this.getAdapter().getCount();
            if (TwoWayAdapterView.this.getAdapter().hasStableIds() && this.mInstanceState != null && TwoWayAdapterView.this.mOldItemCount == 0 && TwoWayAdapterView.this.mItemCount > 0) {
                TwoWayAdapterView.this.onRestoreInstanceState(this.mInstanceState);
                this.mInstanceState = null;
            } else {
                TwoWayAdapterView.this.rememberSyncState();
            }
            TwoWayAdapterView.this.checkFocus();
            TwoWayAdapterView.this.requestLayout();
        }

        @Override // android.database.DataSetObserver
        public void onInvalidated() {
            TwoWayAdapterView.this.mDataChanged = true;
            if (TwoWayAdapterView.this.getAdapter().hasStableIds()) {
                this.mInstanceState = TwoWayAdapterView.this.onSaveInstanceState();
            }
            TwoWayAdapterView.this.mOldItemCount = TwoWayAdapterView.this.mItemCount;
            TwoWayAdapterView.this.mItemCount = 0;
            TwoWayAdapterView.this.mSelectedPosition = -1;
            TwoWayAdapterView.this.mSelectedRowId = Long.MIN_VALUE;
            TwoWayAdapterView.this.mNextSelectedPosition = -1;
            TwoWayAdapterView.this.mNextSelectedRowId = Long.MIN_VALUE;
            TwoWayAdapterView.this.mNeedSync = false;
            TwoWayAdapterView.this.checkSelectionChanged();
            TwoWayAdapterView.this.checkFocus();
            TwoWayAdapterView.this.requestLayout();
        }

        public void clearSavedState() {
            this.mInstanceState = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class SelectionNotifier extends Handler implements Runnable {
        private SelectionNotifier() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (!TwoWayAdapterView.this.mDataChanged) {
                TwoWayAdapterView.this.fireOnSelected();
            } else {
                post(this);
            }
        }
    }

    void selectionChanged() {
        if (this.mOnItemSelectedListener != null) {
            if (this.mInLayout || this.mBlockLayoutRequests) {
                if (this.mSelectionNotifier == null) {
                    this.mSelectionNotifier = new SelectionNotifier();
                }
                this.mSelectionNotifier.post(this.mSelectionNotifier);
                return;
            }
            fireOnSelected();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fireOnSelected() {
        if (this.mOnItemSelectedListener != null) {
            int selection = getSelectedItemPosition();
            if (selection >= 0) {
                View v = getSelectedView();
                this.mOnItemSelectedListener.onItemSelected(this, v, selection, getAdapter().getItemId(selection));
                return;
            }
            this.mOnItemSelectedListener.onNothingSelected(this);
        }
    }

    @Override // android.view.ViewGroup
    protected boolean canAnimate() {
        return super.canAnimate() && this.mItemCount > 0;
    }

    void handleDataChanged() {
        int count = this.mItemCount;
        boolean found = false;
        if (count > 0) {
            if (this.mNeedSync) {
                this.mNeedSync = false;
                int newPos = findSyncPosition();
                if (newPos >= 0 && lookForSelectablePosition(newPos, true) == newPos) {
                    setNextSelectedPositionInt(newPos);
                    found = true;
                }
            }
            if (!found) {
                int newPos2 = getSelectedItemPosition();
                if (newPos2 >= count) {
                    newPos2 = count - 1;
                }
                if (newPos2 < 0) {
                    newPos2 = 0;
                }
                int selectablePos = lookForSelectablePosition(newPos2, true);
                if (selectablePos < 0) {
                    selectablePos = lookForSelectablePosition(newPos2, false);
                }
                if (selectablePos >= 0) {
                    setNextSelectedPositionInt(selectablePos);
                    checkSelectionChanged();
                    found = true;
                }
            }
        }
        if (!found) {
            this.mSelectedPosition = -1;
            this.mSelectedRowId = Long.MIN_VALUE;
            this.mNextSelectedPosition = -1;
            this.mNextSelectedRowId = Long.MIN_VALUE;
            this.mNeedSync = false;
            checkSelectionChanged();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void checkSelectionChanged() {
        if (this.mSelectedPosition != this.mOldSelectedPosition || this.mSelectedRowId != this.mOldSelectedRowId) {
            selectionChanged();
            this.mOldSelectedPosition = this.mSelectedPosition;
            this.mOldSelectedRowId = this.mSelectedRowId;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int findSyncPosition() {
        int count = this.mItemCount;
        if (count == 0) {
            return -1;
        }
        long idToMatch = this.mSyncRowId;
        int seed = this.mSyncPosition;
        if (idToMatch == Long.MIN_VALUE) {
            return -1;
        }
        int seed2 = Math.min(count - 1, Math.max(0, seed));
        long endTime = SystemClock.uptimeMillis() + 100;
        int first = seed2;
        int last = seed2;
        boolean next = false;
        T adapter = getAdapter();
        if (adapter == null) {
            return -1;
        }
        while (SystemClock.uptimeMillis() <= endTime) {
            long rowId = adapter.getItemId(seed2);
            if (rowId != idToMatch) {
                boolean hitLast = last == count + (-1);
                boolean hitFirst = first == 0;
                if (hitLast && hitFirst) {
                    break;
                } else if (hitFirst || (next && !hitLast)) {
                    last++;
                    seed2 = last;
                    next = false;
                } else if (hitLast || (!next && !hitFirst)) {
                    first--;
                    seed2 = first;
                    next = true;
                }
            } else {
                return seed2;
            }
        }
        return -1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int lookForSelectablePosition(int position, boolean lookDown) {
        return position;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setSelectedPositionInt(int position) {
        this.mSelectedPosition = position;
        this.mSelectedRowId = getItemIdAtPosition(position);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setNextSelectedPositionInt(int position) {
        this.mNextSelectedPosition = position;
        this.mNextSelectedRowId = getItemIdAtPosition(position);
        if (this.mNeedSync && this.mSyncMode == 0 && position >= 0) {
            this.mSyncPosition = position;
            this.mSyncRowId = this.mNextSelectedRowId;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void rememberSyncState() {
        if (getChildCount() > 0) {
            this.mNeedSync = true;
            if (this.mIsVertical) {
                this.mSyncSize = this.mLayoutHeight;
            } else {
                this.mSyncSize = this.mLayoutWidth;
            }
            if (this.mSelectedPosition >= 0) {
                View v = getChildAt(this.mSelectedPosition - this.mFirstPosition);
                this.mSyncRowId = this.mNextSelectedRowId;
                this.mSyncPosition = this.mNextSelectedPosition;
                if (v != null) {
                    if (this.mIsVertical) {
                        this.mSpecificTop = v.getTop();
                    } else {
                        this.mSpecificTop = v.getLeft();
                    }
                }
                this.mSyncMode = 0;
                return;
            }
            View v2 = getChildAt(0);
            T adapter = getAdapter();
            if (this.mFirstPosition >= 0 && this.mFirstPosition < adapter.getCount()) {
                this.mSyncRowId = adapter.getItemId(this.mFirstPosition);
            } else {
                this.mSyncRowId = -1L;
            }
            this.mSyncPosition = this.mFirstPosition;
            if (v2 != null) {
                if (this.mIsVertical) {
                    this.mSpecificTop = v2.getTop();
                } else {
                    this.mSpecificTop = v2.getLeft();
                }
            }
            this.mSyncMode = 1;
        }
    }

    public void offsetChildrenTopAndBottom(int offset) {
        int count = getChildCount();
        for (int i = 0; i < count; i++) {
            View v = getChildAt(i);
            v.offsetTopAndBottom(offset);
        }
    }

    public void offsetChildrenLeftAndRight(int offset) {
        int count = getChildCount();
        for (int i = 0; i < count; i++) {
            View v = getChildAt(i);
            v.offsetLeftAndRight(offset);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setIsVertical(boolean vertical) {
        this.mIsVertical = vertical;
    }

    protected boolean isVertical() {
        return this.mIsVertical;
    }
}
