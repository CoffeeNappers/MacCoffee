package com.tonicartos.superslim;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v7.widget.LinearSmoothScroller;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import com.tonicartos.superslim.LayoutState;
import com.vkontakte.android.R;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.HashMap;
/* loaded from: classes.dex */
public class LayoutManager extends RecyclerView.LayoutManager {
    public static final int INVALID_POSITON = -1;
    private static final int NO_POSITION_REQUEST = -1;
    static final int SECTION_MANAGER_CUSTOM = -1;
    static final int SECTION_MANAGER_GRID = 2;
    static final int SECTION_MANAGER_LINEAR = 1;
    static final int SECTION_MANAGER_STAGGERED_GRID = 3;
    private final SectionLayoutManager mGridSlm;
    private final SectionLayoutManager mLinearSlm;
    private Rect mRect;
    private int mRequestPosition;
    private int mRequestPositionOffset;
    private HashMap<String, SectionLayoutManager> mSlms;
    private boolean mSmoothScrollEnabled;

    /* loaded from: classes.dex */
    public enum Direction {
        START,
        END,
        NONE
    }

    public LayoutManager(Context context) {
        this.mRequestPosition = -1;
        this.mRect = new Rect();
        this.mRequestPositionOffset = 0;
        this.mSmoothScrollEnabled = true;
        this.mLinearSlm = new LinearSLM(this);
        this.mGridSlm = new GridSLM(this, context);
        this.mSlms = new HashMap<>();
    }

    LayoutManager(Builder builder) {
        this.mRequestPosition = -1;
        this.mRect = new Rect();
        this.mRequestPositionOffset = 0;
        this.mSmoothScrollEnabled = true;
        this.mLinearSlm = new LinearSLM(this);
        this.mGridSlm = new GridSLM(this, builder.context);
        this.mSlms = builder.slms;
    }

    public void addSlm(String key, SectionLayoutManager slm) {
        this.mSlms.put(key, slm);
    }

    public View findFirstCompletelyVisibleItem() {
        View header;
        int topEdge = 0;
        View firstVisibleView = null;
        SectionData sd = null;
        for (int i = 0; i < getChildCount() - 1; i++) {
            sd = new SectionData(this, getChildAt(0));
            SectionLayoutManager slm = getSlm(sd);
            firstVisibleView = slm.getFirstCompletelyVisibleView(sd.firstPosition, false);
            if (firstVisibleView != null) {
                break;
            }
        }
        if (firstVisibleView == null) {
            return null;
        }
        int firstVisiblePosition = getPosition(firstVisibleView);
        if (firstVisiblePosition != sd.firstPosition && firstVisiblePosition <= sd.firstPosition + 1 && (header = findAttachedHeaderOrFirstViewForSection(sd.firstPosition, 0, Direction.START)) != null && ((LayoutParams) header.getLayoutParams()).isHeader) {
            if (getClipToPadding()) {
                topEdge = getPaddingTop();
            }
            int bottomEdge = getClipToPadding() ? getHeight() - getPaddingBottom() : getHeight();
            int headerTop = getDecoratedTop(header);
            int headerBottom = getDecoratedBottom(header);
            return (headerTop < topEdge || bottomEdge < headerBottom || headerTop >= getDecoratedTop(firstVisibleView)) ? firstVisibleView : header;
        }
        return firstVisibleView;
    }

    public int findFirstCompletelyVisibleItemPosition() {
        View item = findFirstCompletelyVisibleItem();
        if (item == null) {
            return -1;
        }
        return getPosition(item);
    }

    public View findFirstVisibleItem() {
        View first;
        SectionData sd = new SectionData(this, getChildAt(0));
        SectionLayoutManager slm = getSlm(sd);
        View firstVisibleView = slm.getFirstVisibleView(sd.firstPosition, false);
        int position = getPosition(firstVisibleView);
        if (position <= sd.firstPosition + 1 && position != sd.firstPosition && (first = findAttachedHeaderOrFirstViewForSection(sd.firstPosition, 0, Direction.START)) != null) {
            if (getDecoratedBottom(first) <= getDecoratedTop(firstVisibleView)) {
                return first;
            }
            LayoutParams firstParams = (LayoutParams) first.getLayoutParams();
            return ((!firstParams.isHeaderInline() || firstParams.isHeaderOverlay()) && getDecoratedTop(first) == getDecoratedTop(firstVisibleView)) ? first : firstVisibleView;
        }
        return firstVisibleView;
    }

    public int findFirstVisibleItemPosition() {
        View item = findFirstVisibleItem();
        if (item == null) {
            return -1;
        }
        return getPosition(item);
    }

    public View findLastCompletelyVisibleItem() {
        SectionData sd = new SectionData(this, getChildAt(getChildCount() - 1));
        SectionLayoutManager slm = getSlm(sd);
        return slm.getLastCompletelyVisibleView(sd.firstPosition);
    }

    public int findLastCompletelyVisibleItemPosition() {
        SectionData sd = new SectionData(this, getChildAt(getChildCount() - 1));
        SectionLayoutManager slm = getSlm(sd);
        return slm.findLastCompletelyVisibleItemPosition(sd.firstPosition);
    }

    public View findLastVisibleItem() {
        SectionData sd = new SectionData(this, getChildAt(getChildCount() - 1));
        SectionLayoutManager slm = getSlm(sd);
        return slm.getLastVisibleView(sd.firstPosition);
    }

    public int findLastVisibleItemPosition() {
        SectionData sd = new SectionData(this, getChildAt(getChildCount() - 1));
        SectionLayoutManager slm = getSlm(sd);
        return slm.findLastVisibleItemPosition(sd.firstPosition);
    }

    public boolean isSmoothScrollEnabled() {
        return this.mSmoothScrollEnabled;
    }

    public void setSmoothScrollEnabled(boolean smoothScrollEnabled) {
        this.mSmoothScrollEnabled = smoothScrollEnabled;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void onLayoutChildren(RecyclerView.Recycler recycler, RecyclerView.State state) {
        int requestedPosition;
        int borderLine;
        int itemCount = state.getItemCount();
        if (itemCount == 0) {
            detachAndScrapAttachedViews(recycler);
            return;
        }
        if (this.mRequestPosition != -1) {
            requestedPosition = Math.min(this.mRequestPosition, itemCount - 1);
            this.mRequestPosition = -1;
            borderLine = this.mRequestPositionOffset;
            this.mRequestPositionOffset = 0;
        } else {
            View anchorView = getAnchorChild();
            requestedPosition = anchorView == null ? 0 : Math.min(getPosition(anchorView), itemCount - 1);
            borderLine = getBorderLine(anchorView, Direction.END);
        }
        detachAndScrapAttachedViews(recycler);
        LayoutState layoutState = new LayoutState(this, recycler, state);
        int bottomLine = layoutChildren(requestedPosition, borderLine, layoutState);
        fixOverscroll(bottomLine, layoutState);
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public RecyclerView.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-2, -2);
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    /* renamed from: generateLayoutParams  reason: collision with other method in class */
    public LayoutParams mo445generateLayoutParams(ViewGroup.LayoutParams lp) {
        LayoutParams params = LayoutParams.from(lp);
        params.width = -1;
        params.height = -1;
        return getSlm(params).generateLayoutParams(params);
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public RecyclerView.LayoutParams generateLayoutParams(Context c, AttributeSet attrs) {
        int sectionManagerKind;
        boolean isString = false;
        TypedArray a = c.obtainStyledAttributes(attrs, R.styleable.superslim_LayoutManager);
        if (Build.VERSION.SDK_INT < 21) {
            TypedValue value = new TypedValue();
            a.getValue(3, value);
            if (value.type == 3) {
                isString = true;
            }
        } else if (a.getType(3) == 3) {
            isString = true;
        }
        String sectionManager = null;
        if (isString) {
            sectionManager = a.getString(3);
            if (TextUtils.isEmpty(sectionManager)) {
                sectionManagerKind = 1;
            } else {
                sectionManagerKind = -1;
            }
        } else {
            sectionManagerKind = a.getInt(3, 1);
        }
        a.recycle();
        return getSLM(sectionManagerKind, sectionManager).generateLayoutParams(c, attrs);
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int scrollVerticallyBy(int dy, RecyclerView.Recycler recycler, RecyclerView.State state) {
        int delta;
        int numChildren = getChildCount();
        if (numChildren == 0) {
            return 0;
        }
        LayoutState layoutState = new LayoutState(this, recycler, state);
        Direction direction = dy > 0 ? Direction.END : Direction.START;
        boolean isDirectionEnd = direction == Direction.END;
        int height = getHeight();
        int leadingEdge = isDirectionEnd ? height + dy : dy;
        if (isDirectionEnd) {
            View end = getAnchorAtEnd();
            LayoutParams params = (LayoutParams) end.getLayoutParams();
            SectionLayoutManager slm = getSlm(params);
            int endEdge = slm.getLowestEdge(params.getTestedFirstPosition(), getChildCount() - 1, getDecoratedBottom(end));
            if (endEdge < height - getPaddingBottom() && getPosition(end) == state.getItemCount() - 1) {
                return 0;
            }
        }
        int fillEdge = fillUntil(leadingEdge, direction, layoutState);
        if (isDirectionEnd) {
            int fillDelta = (fillEdge - height) + getPaddingBottom();
            delta = fillDelta < dy ? fillDelta : dy;
        } else {
            int fillDelta2 = fillEdge - getPaddingTop();
            delta = fillDelta2 > dy ? fillDelta2 : dy;
        }
        if (delta != 0) {
            offsetChildrenVertical(-delta);
            trimTail(isDirectionEnd ? Direction.START : Direction.END, layoutState);
        }
        layoutState.recycleCache();
        return delta;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public boolean canScrollVertically() {
        return true;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void scrollToPosition(int position) {
        if (position < 0 || getItemCount() <= position) {
            Log.e("SuperSLiM.LayoutManager", "Ignored scroll to " + position + " as it is not within the item range 0 - " + getItemCount());
            return;
        }
        this.mRequestPosition = position;
        requestLayout();
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void smoothScrollToPosition(final RecyclerView recyclerView, RecyclerView.State state, final int position) {
        if (position < 0 || getItemCount() <= position) {
            Log.e("SuperSLiM.LayoutManager", "Ignored smooth scroll to " + position + " as it is not within the item range 0 - " + getItemCount());
            return;
        }
        requestLayout();
        recyclerView.getHandler().post(new Runnable() { // from class: com.tonicartos.superslim.LayoutManager.1
            @Override // java.lang.Runnable
            public void run() {
                LinearSmoothScroller smoothScroller = new LinearSmoothScroller(recyclerView.getContext()) { // from class: com.tonicartos.superslim.LayoutManager.1.1
                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // android.support.v7.widget.RecyclerView.SmoothScroller
                    public void onChildAttachedToWindow(View child) {
                        super.onChildAttachedToWindow(child);
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // android.support.v7.widget.LinearSmoothScroller, android.support.v7.widget.RecyclerView.SmoothScroller
                    public void onStop() {
                        super.onStop();
                        LayoutManager.this.requestLayout();
                    }

                    @Override // android.support.v7.widget.LinearSmoothScroller
                    protected int getVerticalSnapPreference() {
                        return -1;
                    }

                    @Override // android.support.v7.widget.LinearSmoothScroller
                    public int calculateDyToMakeVisible(View view, int snapPreference) {
                        int start = 0;
                        RecyclerView.LayoutManager layoutManager = getLayoutManager();
                        if (!layoutManager.canScrollVertically()) {
                            return 0;
                        }
                        RecyclerView.LayoutParams params = (RecyclerView.LayoutParams) view.getLayoutParams();
                        int top = layoutManager.getDecoratedTop(view) - params.topMargin;
                        int bottom = layoutManager.getDecoratedBottom(view) + params.bottomMargin;
                        if (LayoutManager.this.getPosition(view) == 0) {
                            start = layoutManager.getPaddingTop();
                        }
                        int end = layoutManager.getHeight() - layoutManager.getPaddingBottom();
                        int dy = calculateDtToFit(top, bottom, start, end, snapPreference);
                        if (dy == 0) {
                            dy = 1;
                        }
                        int start2 = dy;
                        return start2;
                    }

                    @Override // android.support.v7.widget.LinearSmoothScroller
                    public PointF computeScrollVectorForPosition(int targetPosition) {
                        if (getChildCount() != 0) {
                            return new PointF(0.0f, LayoutManager.this.getDirectionToPosition(targetPosition));
                        }
                        return null;
                    }
                };
                smoothScroller.setTargetPosition(position);
                LayoutManager.this.startSmoothScroll(smoothScroller);
            }
        });
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int getDecoratedMeasuredWidth(View child) {
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
        return super.getDecoratedMeasuredWidth(child) + lp.leftMargin + lp.rightMargin;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int getDecoratedMeasuredHeight(View child) {
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
        return super.getDecoratedMeasuredHeight(child) + lp.topMargin + lp.bottomMargin;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void layoutDecorated(View child, int left, int top, int right, int bottom) {
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
        super.layoutDecorated(child, left + lp.leftMargin, top + lp.topMargin, right - lp.rightMargin, bottom - lp.bottomMargin);
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int getDecoratedLeft(View child) {
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
        return super.getDecoratedLeft(child) - lp.leftMargin;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int getDecoratedTop(View child) {
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
        return super.getDecoratedTop(child) - lp.topMargin;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int getDecoratedRight(View child) {
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
        return super.getDecoratedRight(child) + lp.rightMargin;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int getDecoratedBottom(View child) {
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
        return super.getDecoratedBottom(child) + lp.bottomMargin;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void onAdapterChanged(RecyclerView.Adapter oldAdapter, RecyclerView.Adapter newAdapter) {
        removeAllViews();
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void onItemsChanged(RecyclerView recyclerView) {
        View view = getAnchorChild();
        if (view == null) {
            this.mRequestPosition = -1;
            this.mRequestPositionOffset = 0;
            return;
        }
        this.mRequestPosition = getPosition(view);
        this.mRequestPositionOffset = getDecoratedTop(view);
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void onItemsUpdated(RecyclerView recyclerView, int positionStart, int itemCount) {
        super.onItemsUpdated(recyclerView, positionStart, itemCount);
        View first = getChildAt(0);
        View last = getChildAt(getChildCount() - 1);
        if (positionStart + itemCount > getPosition(first) && positionStart <= getPosition(last)) {
            requestLayout();
        }
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int computeVerticalScrollExtent(RecyclerView.State state) {
        if (getChildCount() == 0 || state.getItemCount() == 0) {
            return 0;
        }
        if (!this.mSmoothScrollEnabled) {
            return getChildCount();
        }
        float contentInView = getChildCount();
        return (int) ((((contentInView - getFractionOfContentAbove(state, true)) - getFractionOfContentBelow(state, true)) / state.getItemCount()) * getHeight());
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int computeVerticalScrollOffset(RecyclerView.State state) {
        if (getChildCount() == 0 || state.getItemCount() == 0) {
            return 0;
        }
        View child = getChildAt(0);
        if (!this.mSmoothScrollEnabled) {
            return getPosition(child);
        }
        float contentAbove = getPosition(child);
        return (int) (((contentAbove + getFractionOfContentAbove(state, false)) / state.getItemCount()) * getHeight());
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public int computeVerticalScrollRange(RecyclerView.State state) {
        return !this.mSmoothScrollEnabled ? state.getItemCount() : getHeight();
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public Parcelable onSaveInstanceState() {
        SavedState state = new SavedState();
        View view = getAnchorChild();
        if (view == null) {
            state.anchorPosition = 0;
            state.anchorOffset = 0;
        } else {
            state.anchorPosition = getPosition(view);
            state.anchorOffset = getDecoratedTop(view);
        }
        return state;
    }

    @Override // android.support.v7.widget.RecyclerView.LayoutManager
    public void onRestoreInstanceState(Parcelable state) {
        this.mRequestPosition = ((SavedState) state).anchorPosition;
        this.mRequestPositionOffset = ((SavedState) state).anchorOffset;
        requestLayout();
    }

    int getBorderLine(View anchorView, Direction direction) {
        if (anchorView == null) {
            if (direction == Direction.START) {
                int borderline = getPaddingBottom();
                return borderline;
            }
            int borderline2 = getPaddingTop();
            return borderline2;
        } else if (direction == Direction.START) {
            int borderline3 = getDecoratedBottom(anchorView);
            return borderline3;
        } else {
            int borderline4 = getDecoratedTop(anchorView);
            return borderline4;
        }
    }

    void measureHeader(View header) {
        int unavailableWidth = 0;
        LayoutParams lp = (LayoutParams) header.getLayoutParams();
        int recyclerWidth = (getWidth() - getPaddingStart()) - getPaddingEnd();
        if (!lp.isHeaderOverlay()) {
            if (lp.isHeaderStartAligned() && !lp.headerStartMarginIsAuto) {
                unavailableWidth = recyclerWidth - lp.headerMarginStart;
            } else if (lp.isHeaderEndAligned() && !lp.headerEndMarginIsAuto) {
                unavailableWidth = recyclerWidth - lp.headerMarginEnd;
            }
        }
        measureChildWithMargins(header, unavailableWidth, 0);
    }

    private void attachHeaderForStart(View header, int leadingEdge, SectionData sd, LayoutState state) {
        if (state.getCachedView(sd.firstPosition) != null && getDecoratedBottom(header) > leadingEdge) {
            addView(header, findLastIndexForSection(sd.firstPosition) + 1);
            state.decacheView(sd.firstPosition);
        }
    }

    private int binarySearchForLastPosition(int min, int max, int sfp) {
        if (max < min) {
            return -1;
        }
        int mid = min + ((max - min) / 2);
        View candidate = getChildAt(mid);
        LayoutParams params = (LayoutParams) candidate.getLayoutParams();
        if (params.getTestedFirstPosition() < sfp) {
            return binarySearchForLastPosition(mid + 1, max, sfp);
        }
        if (params.getTestedFirstPosition() > sfp || params.isHeader) {
            return binarySearchForLastPosition(min, mid - 1, sfp);
        }
        if (mid != getChildCount() - 1) {
            View next = getChildAt(mid + 1);
            LayoutParams lp = (LayoutParams) next.getLayoutParams();
            if (lp.getTestedFirstPosition() == sfp) {
                if (lp.isHeader) {
                    if (mid + 1 != getChildCount() - 1) {
                        View next2 = getChildAt(mid + 2);
                        if (((LayoutParams) next2.getLayoutParams()).getTestedFirstPosition() != sfp) {
                            return mid;
                        }
                    } else {
                        return mid;
                    }
                }
                return binarySearchForLastPosition(mid + 1, max, sfp);
            }
            return mid;
        }
        return mid;
    }

    private int fillNextSectionToEnd(int leadingEdge, int markerLine, LayoutState state) {
        View last;
        int anchorPosition;
        if (markerLine < leadingEdge && (last = getAnchorAtEnd()) != null && (anchorPosition = getPosition(last) + 1) < state.getRecyclerState().getItemCount()) {
            LayoutState.View header = state.getView(anchorPosition);
            SectionData sd = new SectionData(this, header.view);
            if (sd.hasHeader) {
                measureHeader(header.view);
                sd = new SectionData(this, header.view);
                markerLine = layoutHeaderTowardsEnd(header.view, markerLine, sd, state);
                anchorPosition++;
            } else {
                state.cacheView(anchorPosition, header.view);
            }
            if (anchorPosition < state.getRecyclerState().getItemCount()) {
                SectionLayoutManager slm = getSlm(sd);
                markerLine = slm.fillToEnd(leadingEdge, markerLine, anchorPosition, sd, state);
            }
            if (sd.hasHeader) {
                addView(header.view);
                if (header.wasCached) {
                    state.decacheView(sd.firstPosition);
                }
                markerLine = Math.max(getDecoratedBottom(header.view), markerLine);
            }
            return fillNextSectionToEnd(leadingEdge, markerLine, state);
        }
        return markerLine;
    }

    private int fillNextSectionToStart(int leadingEdge, int markerLine, LayoutState state) {
        int anchorPosition;
        if (markerLine < leadingEdge) {
            return markerLine;
        }
        View preAnchor = getAnchorAtStart();
        LayoutParams preAnchorParams = (LayoutParams) preAnchor.getLayoutParams();
        View first = findAttachedHeaderOrFirstViewForSection(preAnchorParams.getFirstPosition(), 0, Direction.START);
        if (first != null) {
            anchorPosition = getPosition(first) - 1;
        } else {
            anchorPosition = getPosition(preAnchor) - 1;
        }
        if (anchorPosition < 0) {
            return markerLine;
        }
        LayoutState.View anchor = state.getView(anchorPosition);
        LayoutParams anchorParams = anchor.getLayoutParams();
        int sfp = anchorParams.getTestedFirstPosition();
        View header = getHeaderOrFirstViewForSection(sfp, Direction.START, state);
        SectionData sd = new SectionData(this, header);
        if (sd.hasHeader) {
            measureHeader(header);
            sd = new SectionData(this, header);
        }
        SectionLayoutManager slm = getSlm(sd);
        if (anchorPosition >= 0) {
            markerLine = slm.fillToStart(leadingEdge, markerLine, anchorPosition, sd, state);
        }
        if (sd.hasHeader) {
            int headerOffset = 0;
            if (!sd.headerParams.isHeaderInline() || sd.headerParams.isHeaderOverlay()) {
                View firstVisibleView = slm.getFirstVisibleView(sd.firstPosition, true);
                if (firstVisibleView == null) {
                    headerOffset = 0;
                } else {
                    headerOffset = slm.computeHeaderOffset(getPosition(firstVisibleView), sd, state);
                }
            }
            markerLine = layoutHeaderTowardsStart(header, leadingEdge, markerLine, headerOffset, markerLine, sd, state);
            attachHeaderForStart(header, leadingEdge, sd, state);
        }
        return fillNextSectionToStart(leadingEdge, markerLine, state);
    }

    private int fillToEnd(int leadingEdge, LayoutState state) {
        View anchor = getAnchorAtEnd();
        LayoutParams anchorParams = (LayoutParams) anchor.getLayoutParams();
        int sfp = anchorParams.getTestedFirstPosition();
        View first = getHeaderOrFirstViewForSection(sfp, Direction.END, state);
        SectionData sd = new SectionData(this, first);
        SectionLayoutManager slm = getSlm(sd);
        int markerLine = slm.finishFillToEnd(leadingEdge, anchor, sd, state);
        View header = findAttachedHeaderForSectionFromEnd(sd.firstPosition);
        int markerLine2 = updateHeaderForEnd(header, markerLine);
        if (markerLine2 <= leadingEdge) {
            return fillNextSectionToEnd(leadingEdge, markerLine2, state);
        }
        return markerLine2;
    }

    private int fillToStart(int leadingEdge, LayoutState state) {
        int markerLine;
        View anchor = getAnchorAtStart();
        LayoutParams anchorParams = (LayoutParams) anchor.getLayoutParams();
        int sfp = anchorParams.getTestedFirstPosition();
        View first = getHeaderOrFirstViewForSection(sfp, Direction.START, state);
        SectionData sd = new SectionData(this, first);
        SectionLayoutManager slm = getSlm(sd);
        int anchorPosition = getPosition(anchor);
        if (anchorPosition == sd.firstPosition) {
            markerLine = getDecoratedTop(anchor);
        } else if (anchorPosition - 1 == sd.firstPosition && sd.hasHeader) {
            markerLine = getDecoratedTop(anchor);
        } else {
            markerLine = slm.finishFillToStart(leadingEdge, anchor, sd, state);
        }
        int markerLine2 = updateHeaderForStart(first, leadingEdge, markerLine, sd, state);
        if (markerLine2 > leadingEdge) {
            return fillNextSectionToStart(leadingEdge, markerLine2, state);
        }
        return markerLine2;
    }

    private int fillUntil(int leadingEdge, Direction direction, LayoutState layoutState) {
        return direction == Direction.START ? fillToStart(leadingEdge, layoutState) : fillToEnd(leadingEdge, layoutState);
    }

    private View findAttachedHeaderForSection(int sfp, Direction from) {
        return from == Direction.END ? findAttachedHeaderForSectionFromEnd(sfp) : findAttachedHeaderForSectionFromStart(0, getChildCount() - 1, sfp);
    }

    private View findAttachedHeaderForSectionFromEnd(int sfp) {
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View child = getChildAt(i);
            LayoutParams params = (LayoutParams) child.getLayoutParams();
            if (params.getTestedFirstPosition() != sfp) {
                break;
            } else if (params.isHeader) {
                return child;
            }
        }
        return null;
    }

    private View findAttachedHeaderForSectionFromStart(int min, int max, int sfp) {
        if (max < min) {
            return null;
        }
        int mid = min + ((max - min) / 2);
        View candidate = getChildAt(mid);
        LayoutParams params = (LayoutParams) candidate.getLayoutParams();
        if (params.getTestedFirstPosition() != sfp) {
            return findAttachedHeaderForSectionFromStart(min, mid - 1, sfp);
        }
        return !params.isHeader ? findAttachedHeaderForSectionFromStart(mid + 1, max, sfp) : candidate;
    }

    private View findAttachedHeaderOrFirstViewForSection(int sfp, int startIndex, Direction from) {
        int step = from == Direction.START ? 1 : -1;
        for (int childIndex = startIndex; childIndex >= 0 && childIndex < getChildCount(); childIndex += step) {
            View child = getChildAt(childIndex);
            if (getPosition(child) != sfp) {
                LayoutParams params = (LayoutParams) child.getLayoutParams();
                if (params.getTestedFirstPosition() != sfp) {
                    break;
                }
            } else {
                return child;
            }
        }
        return null;
    }

    private int findLastIndexForSection(int sfp) {
        return binarySearchForLastPosition(0, getChildCount() - 1, sfp);
    }

    private void fixOverscroll(int bottomLine, LayoutState state) {
        if (isOverscrolled(state)) {
            int delta = (getHeight() - getPaddingBottom()) - bottomLine;
            offsetChildrenVertical(delta);
            int topLine = fillToStart(0, state);
            if (topLine > getPaddingTop()) {
                offsetChildrenVertical(getPaddingTop() - topLine);
            }
        }
    }

    private View getAnchorAtEnd() {
        if (getChildCount() == 1) {
            return getChildAt(0);
        }
        View candidate = getChildAt(getChildCount() - 1);
        if (candidate == null) {
            return null;
        }
        LayoutParams candidateParams = (LayoutParams) candidate.getLayoutParams();
        if (candidateParams.isHeader) {
            View check = getChildAt(getChildCount() - 2);
            LayoutParams checkParams = (LayoutParams) check.getLayoutParams();
            if (checkParams.getTestedFirstPosition() == candidateParams.getTestedFirstPosition()) {
                return check;
            }
            return candidate;
        }
        return candidate;
    }

    private View getAnchorAtStart() {
        View child = getChildAt(0);
        LayoutParams params = (LayoutParams) child.getLayoutParams();
        int sfp = params.getTestedFirstPosition();
        if (params.isHeader && 1 < getChildCount()) {
            View candidate = getChildAt(1);
            LayoutParams candidateParams = (LayoutParams) candidate.getLayoutParams();
            return candidateParams.getTestedFirstPosition() == sfp ? candidate : child;
        }
        return child;
    }

    private View getAnchorChild() {
        if (getChildCount() == 0) {
            return null;
        }
        View child = getChildAt(0);
        LayoutParams params = (LayoutParams) child.getLayoutParams();
        int sfp = params.getTestedFirstPosition();
        View first = findAttachedHeaderOrFirstViewForSection(sfp, 0, Direction.START);
        if (first != null) {
            LayoutParams firstParams = (LayoutParams) first.getLayoutParams();
            if (!firstParams.isHeader) {
                return child;
            }
            return (!firstParams.isHeaderInline() || firstParams.isHeaderOverlay()) ? (getDecoratedTop(child) < getDecoratedTop(first) || sfp + 1 != getPosition(child)) ? child : first : getDecoratedBottom(first) <= getDecoratedTop(child) ? first : child;
        }
        return child;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getDirectionToPosition(int targetPosition) {
        SectionData sd = new SectionData(this, getChildAt(0));
        View startSectionFirstView = getSlm(sd).getFirstVisibleView(sd.firstPosition, true);
        return targetPosition < getPosition(startSectionFirstView) ? -1 : 1;
    }

    private float getFractionOfContentAbove(RecyclerView.State state, boolean ignorePosition) {
        float fractionOffscreen;
        View child = getChildAt(0);
        int anchorPosition = getPosition(child);
        int numBeforeAnchor = 0;
        float top = getDecoratedTop(child);
        float bottom = getDecoratedBottom(child);
        if (bottom < 0.0f) {
            fractionOffscreen = 1.0f;
        } else if (0.0f <= top) {
            fractionOffscreen = 0.0f;
        } else {
            float height = getDecoratedMeasuredHeight(child);
            fractionOffscreen = (-top) / height;
        }
        SectionData sd = new SectionData(this, child);
        if (!sd.headerParams.isHeader || !sd.headerParams.isHeaderInline()) {
            int firstPosition = -1;
            SparseArray<Boolean> positionsOffscreen = new SparseArray<>();
            for (int i = 1; i < getChildCount(); i++) {
                View child2 = getChildAt(i);
                LayoutParams lp = (LayoutParams) child2.getLayoutParams();
                if (!sd.sameSectionManager(lp)) {
                    break;
                }
                int position = getPosition(child2);
                if (!ignorePosition && position < anchorPosition) {
                    numBeforeAnchor++;
                }
                float top2 = getDecoratedTop(child2);
                float bottom2 = getDecoratedBottom(child2);
                if (bottom2 < 0.0f) {
                    fractionOffscreen += 1.0f;
                } else if (0.0f > top2) {
                    float height2 = getDecoratedMeasuredHeight(child2);
                    fractionOffscreen += (-top2) / height2;
                }
                if (!lp.isHeader) {
                    if (firstPosition == -1) {
                        firstPosition = position;
                    }
                    positionsOffscreen.put(position, true);
                }
            }
            return (fractionOffscreen - numBeforeAnchor) - getSlm(sd).howManyMissingAbove(firstPosition, positionsOffscreen);
        }
        return fractionOffscreen;
    }

    private float getFractionOfContentBelow(RecyclerView.State state, boolean ignorePosition) {
        float parentHeight = getHeight();
        View child = getChildAt(getChildCount() - 1);
        int anchorPosition = getPosition(child);
        int countAfter = 0;
        SectionData sd = new SectionData(this, child);
        float fractionOffscreen = 0.0f;
        int lastPosition = -1;
        SparseArray<Boolean> positionsOffscreen = new SparseArray<>();
        for (int i = 1; i <= getChildCount(); i++) {
            View child2 = getChildAt(getChildCount() - i);
            LayoutParams lp = (LayoutParams) child2.getLayoutParams();
            if (!sd.sameSectionManager(lp)) {
                break;
            }
            int position = getPosition(child2);
            if (!lp.isHeader && !ignorePosition && position > anchorPosition) {
                countAfter++;
            }
            float bottom = getDecoratedBottom(child2);
            float top = getDecoratedTop(child2);
            if (bottom > parentHeight) {
                if (parentHeight < top) {
                    fractionOffscreen += 1.0f;
                } else {
                    float height = getDecoratedMeasuredHeight(child2);
                    fractionOffscreen += (bottom - parentHeight) / height;
                }
                if (!lp.isHeader) {
                    if (lastPosition == -1) {
                        lastPosition = position;
                    }
                    positionsOffscreen.put(position, true);
                }
            }
        }
        return (fractionOffscreen - countAfter) - getSlm(sd).howManyMissingBelow(lastPosition, positionsOffscreen);
    }

    private View getHeaderOrFirstViewForSection(int sfp, Direction direction, LayoutState state) {
        View view = findAttachedHeaderOrFirstViewForSection(sfp, direction == Direction.START ? 0 : getChildCount() - 1, direction);
        if (view == null) {
            LayoutState.View stateView = state.getView(sfp);
            view = stateView.view;
            if (stateView.getLayoutParams().isHeader) {
                measureHeader(stateView.view);
            }
            state.cacheView(sfp, view);
        }
        return view;
    }

    private SectionLayoutManager getSLM(int kind, String key) {
        if (kind == -1) {
            return this.mSlms.get(key);
        }
        if (kind == 1) {
            return this.mLinearSlm;
        }
        if (kind == 2) {
            return this.mGridSlm;
        }
        throw new NotYetImplementedSlmException(kind);
    }

    private SectionLayoutManager getSlm(LayoutParams params) {
        if (params.sectionManagerKind == -1) {
            return this.mSlms.get(params.sectionManager);
        }
        if (params.sectionManagerKind == 1) {
            return this.mLinearSlm;
        }
        if (params.sectionManagerKind == 2) {
            return this.mGridSlm;
        }
        throw new NotYetImplementedSlmException(params.sectionManagerKind);
    }

    private SectionLayoutManager getSlm(SectionData sd) {
        SectionLayoutManager slm;
        if (sd.headerParams.sectionManagerKind == -1) {
            slm = this.mSlms.get(sd.sectionManager);
            if (slm == null) {
                throw new UnknownSectionLayoutException(sd.sectionManager);
            }
        } else if (sd.headerParams.sectionManagerKind == 1) {
            slm = this.mLinearSlm;
        } else if (sd.headerParams.sectionManagerKind == 2) {
            slm = this.mGridSlm;
        } else {
            throw new NotYetImplementedSlmException(sd.headerParams.sectionManagerKind);
        }
        return slm.mo444init(sd);
    }

    private boolean isOverscrolled(LayoutState state) {
        int itemCount = state.getRecyclerState().getItemCount();
        if (getChildCount() == 0) {
            return false;
        }
        View firstVisibleView = findFirstVisibleItem();
        boolean firstVisibleIsFirstItem = getPosition(firstVisibleView) == 0;
        boolean firstVisibleAfterStart = getDecoratedTop(firstVisibleView) > getPaddingTop();
        boolean firstVisibleAtStart = getDecoratedTop(firstVisibleView) == getPaddingTop();
        if (firstVisibleIsFirstItem && firstVisibleAfterStart) {
            return true;
        }
        if (firstVisibleIsFirstItem && firstVisibleAtStart) {
            return false;
        }
        View lastVisibleView = findLastVisibleItem();
        boolean lastVisibleIsLastItem = getPosition(lastVisibleView) == itemCount + (-1);
        boolean lastVisibleBeforeEnd = getDecoratedBottom(lastVisibleView) < getHeight() - getPaddingBottom();
        return lastVisibleIsLastItem && lastVisibleBeforeEnd;
    }

    private int layoutChildren(int anchorPosition, int borderLine, LayoutState state) {
        int height = getHeight();
        LayoutState.View anchor = state.getView(anchorPosition);
        state.cacheView(anchorPosition, anchor.view);
        int sfp = anchor.getLayoutParams().getTestedFirstPosition();
        LayoutState.View first = state.getView(sfp);
        measureHeader(first.view);
        state.cacheView(sfp, first.view);
        SectionData sd = new SectionData(this, first.view);
        SectionLayoutManager slm = getSlm(sd);
        int markerLine = borderLine;
        int contentPosition = anchorPosition;
        if (sd.hasHeader && anchorPosition == sd.firstPosition) {
            markerLine = layoutHeaderTowardsEnd(first.view, borderLine, sd, state);
            contentPosition++;
        }
        int markerLine2 = slm.fillToEnd(height, markerLine, contentPosition, sd, state);
        if (sd.hasHeader && anchorPosition != sd.firstPosition) {
            int offset = slm.computeHeaderOffset(contentPosition, sd, state);
            layoutHeaderTowardsStart(first.view, 0, borderLine, offset, markerLine2, sd, state);
        } else {
            markerLine2 = Math.max(markerLine2, getDecoratedBottom(first.view));
        }
        if (sd.hasHeader && getDecoratedBottom(first.view) > 0) {
            addView(first.view);
            state.decacheView(sd.firstPosition);
        }
        return fillNextSectionToEnd(height, markerLine2, state);
    }

    private int layoutHeaderTowardsEnd(View header, int markerLine, SectionData sd, LayoutState state) {
        Rect r = setHeaderRectSides(this.mRect, sd, state);
        r.top = markerLine;
        r.bottom = r.top + sd.headerHeight;
        if (sd.headerParams.isHeaderInline() && !sd.headerParams.isHeaderOverlay()) {
            markerLine = r.bottom;
        }
        if (sd.headerParams.isHeaderSticky() && r.top < 0) {
            r.top = 0;
            r.bottom = r.top + sd.headerHeight;
        }
        layoutDecorated(header, r.left, r.top, r.right, r.bottom);
        return markerLine;
    }

    private int layoutHeaderTowardsStart(View header, int leadingEdge, int markerLine, int offset, int sectionBottom, SectionData sd, LayoutState state) {
        Rect r = setHeaderRectSides(this.mRect, sd, state);
        if (sd.headerParams.isHeaderInline() && !sd.headerParams.isHeaderOverlay()) {
            r.bottom = markerLine;
            r.top = r.bottom - sd.headerHeight;
        } else if (offset <= 0) {
            r.top = markerLine + offset;
            r.bottom = r.top + sd.headerHeight;
        } else {
            r.bottom = leadingEdge;
            r.top = r.bottom - sd.headerHeight;
        }
        if (sd.headerParams.isHeaderSticky() && r.top < leadingEdge && sd.firstPosition != state.getRecyclerState().getTargetScrollPosition()) {
            r.top = leadingEdge;
            r.bottom = r.top + sd.headerHeight;
            if (sd.headerParams.isHeaderInline() && !sd.headerParams.isHeaderOverlay()) {
                markerLine -= sd.headerHeight;
            }
        }
        if (r.bottom > sectionBottom) {
            r.bottom = sectionBottom;
            r.top = r.bottom - sd.headerHeight;
        }
        layoutDecorated(header, r.left, r.top, r.right, r.bottom);
        return Math.min(r.top, markerLine);
    }

    private Rect setHeaderRectSides(Rect r, SectionData sd, LayoutState state) {
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        if (sd.headerParams.isHeaderEndAligned()) {
            if (!sd.headerParams.isHeaderOverlay() && !sd.headerParams.headerEndMarginIsAuto && sd.marginEnd > 0) {
                if (state.isLTR) {
                    r.left = (getWidth() - sd.marginEnd) - paddingRight;
                    r.right = r.left + sd.headerWidth;
                } else {
                    r.right = sd.marginEnd + paddingLeft;
                    r.left = r.right - sd.headerWidth;
                }
            } else if (state.isLTR) {
                r.right = getWidth() - paddingRight;
                r.left = r.right - sd.headerWidth;
            } else {
                r.left = paddingLeft;
                r.right = r.left + sd.headerWidth;
            }
        } else if (sd.headerParams.isHeaderStartAligned()) {
            if (!sd.headerParams.isHeaderOverlay() && !sd.headerParams.headerStartMarginIsAuto && sd.marginStart > 0) {
                if (state.isLTR) {
                    r.right = sd.marginStart + paddingLeft;
                    r.left = r.right - sd.headerWidth;
                } else {
                    r.left = (getWidth() - sd.marginStart) - paddingRight;
                    r.right = r.left + sd.headerWidth;
                }
            } else if (state.isLTR) {
                r.left = paddingLeft;
                r.right = r.left + sd.headerWidth;
            } else {
                r.right = getWidth() - paddingRight;
                r.left = r.right - sd.headerWidth;
            }
        } else {
            r.left = paddingLeft;
            r.right = r.left + sd.headerWidth;
        }
        return r;
    }

    private void trimEnd(LayoutState state) {
        int height = getHeight();
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View child = getChildAt(i);
            if (getDecoratedTop(child) >= height) {
                removeAndRecycleView(child, state.recycler);
            } else if (!((LayoutParams) child.getLayoutParams()).isHeader) {
                return;
            }
        }
    }

    private void trimStart(LayoutState state) {
        View anchor = null;
        int anchorIndex = 0;
        int i = 0;
        while (true) {
            if (i >= getChildCount()) {
                break;
            }
            View look = getChildAt(i);
            if (getDecoratedBottom(look) <= 0) {
                i++;
            } else {
                anchor = look;
                anchorIndex = i;
                break;
            }
        }
        if (anchor == null) {
            detachAndScrapAttachedViews(state.recycler);
            return;
        }
        LayoutParams anchorParams = (LayoutParams) anchor.getLayoutParams();
        if (anchorParams.isHeader) {
            int i2 = anchorIndex - 1;
            while (true) {
                if (i2 < 0) {
                    break;
                }
                LayoutParams lookParams = (LayoutParams) getChildAt(i2).getLayoutParams();
                if (lookParams.getTestedFirstPosition() == anchorParams.getTestedFirstPosition()) {
                    anchorParams = lookParams;
                    anchorIndex = i2;
                    break;
                }
                i2--;
            }
        }
        for (int i3 = 0; i3 < anchorIndex; i3++) {
            removeAndRecycleViewAt(0, state.recycler);
        }
        int sfp = anchorParams.getTestedFirstPosition();
        View header = findAttachedHeaderForSection(sfp, Direction.START);
        if (header != null) {
            if (getDecoratedTop(header) < 0) {
                updateHeaderForTrimFromStart(header);
            }
            if (getDecoratedBottom(header) <= 0) {
                removeAndRecycleView(header, state.recycler);
            }
        }
    }

    private void trimTail(Direction direction, LayoutState state) {
        if (direction == Direction.START) {
            trimStart(state);
        } else {
            trimEnd(state);
        }
    }

    private int updateHeaderForEnd(View header, int markerLine) {
        if (header != null) {
            detachView(header);
            attachView(header, -1);
            return Math.max(markerLine, getDecoratedBottom(header));
        }
        return markerLine;
    }

    private int updateHeaderForStart(View header, int leadingEdge, int markerLine, SectionData sd, LayoutState state) {
        if (!sd.hasHeader) {
            return markerLine;
        }
        SectionLayoutManager slm = getSlm(sd);
        int sli = findLastIndexForSection(sd.firstPosition);
        int sectionBottom = getHeight();
        int i = sli == -1 ? 0 : sli;
        while (true) {
            if (i >= getChildCount()) {
                break;
            }
            View view = getChildAt(i);
            LayoutParams params = (LayoutParams) view.getLayoutParams();
            if (params.getTestedFirstPosition() == sd.firstPosition) {
                i++;
            } else {
                View first = findAttachedHeaderOrFirstViewForSection(params.getTestedFirstPosition(), i, Direction.START);
                if (first == null) {
                    sectionBottom = getDecoratedTop(view);
                } else {
                    sectionBottom = getDecoratedTop(first);
                }
            }
        }
        if (sli == -1 && sd.headerParams.isHeaderInline() && !sd.headerParams.isHeaderOverlay()) {
            markerLine = sectionBottom;
        }
        int offset = 0;
        if (!sd.headerParams.isHeaderInline() || sd.headerParams.isHeaderOverlay()) {
            View firstVisibleView = slm.getFirstVisibleView(sd.firstPosition, true);
            if (firstVisibleView == null) {
                offset = 0;
            } else {
                offset = slm.computeHeaderOffset(getPosition(firstVisibleView), sd, state);
            }
        }
        int markerLine2 = layoutHeaderTowardsStart(header, leadingEdge, markerLine, offset, sectionBottom, sd, state);
        attachHeaderForStart(header, leadingEdge, sd, state);
        return markerLine2;
    }

    private void updateHeaderForTrimFromStart(View header) {
        int slp;
        SectionData sd = new SectionData(this, header);
        if (sd.headerParams.isHeaderSticky() && (slp = findLastIndexForSection(sd.firstPosition)) != -1) {
            SectionLayoutManager slm = getSlm(sd);
            int sectionBottom = slm.getLowestEdge(sd.firstPosition, slp, getHeight());
            int sectionTop = slm.getHighestEdge(sd.firstPosition, 0, 0);
            int height = getDecoratedMeasuredHeight(header);
            if ((sd.headerParams.isHeaderInline() && !sd.headerParams.isHeaderOverlay()) || sectionBottom - sectionTop >= height) {
                int left = getDecoratedLeft(header);
                int right = getDecoratedRight(header);
                int top = 0;
                int bottom = 0 + height;
                if (bottom > sectionBottom) {
                    bottom = sectionBottom;
                    top = bottom - height;
                }
                layoutDecorated(header, left, top, right, bottom);
            }
        }
    }

    /* loaded from: classes.dex */
    public static class Builder {
        final Context context;
        HashMap<String, SectionLayoutManager> slms = new HashMap<>();

        public Builder(Context context) {
            this.context = context;
        }

        public Builder addSlm(String key, SectionLayoutManager slm) {
            this.slms.put(key, slm);
            return this;
        }

        public LayoutManager build() {
            return new LayoutManager(this);
        }
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends RecyclerView.LayoutParams {
        private static final int DEFAULT_HEADER_DISPLAY = 17;
        private static final int DEFAULT_HEADER_MARGIN = -1;
        private static final boolean DEFAULT_IS_HEADER = false;
        public static final int HEADER_ALIGN_END = 4;
        public static final int HEADER_ALIGN_START = 2;
        public static final int HEADER_INLINE = 1;
        public static final int HEADER_OVERLAY = 8;
        @Deprecated
        public static final int HEADER_STICKY = 16;
        private static final int NO_FIRST_POSITION = -1;
        public int headerDisplay;
        public boolean headerEndMarginIsAuto;
        public int headerMarginEnd;
        public int headerMarginStart;
        public boolean headerStartMarginIsAuto;
        public boolean isHeader;
        private int mFirstPosition;
        String sectionManager;
        int sectionManagerKind;

        @Retention(RetentionPolicy.SOURCE)
        /* loaded from: classes.dex */
        public @interface HeaderDisplayOptions {
        }

        public LayoutParams(int width, int height) {
            super(width, height);
            this.sectionManagerKind = 1;
            this.isHeader = false;
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        @TargetApi(21)
        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
            boolean z = true;
            this.sectionManagerKind = 1;
            TypedArray a = c.obtainStyledAttributes(attrs, R.styleable.superslim_LayoutManager);
            this.isHeader = a.getBoolean(0, false);
            this.headerDisplay = a.getInt(1, 17);
            this.mFirstPosition = a.getInt(2, -1);
            if (Build.VERSION.SDK_INT < 21) {
                TypedValue value = new TypedValue();
                a.getValue(4, value);
                loadHeaderStartMargin(a, value.type == 5);
                a.getValue(5, value);
                loadHeaderEndMargin(a, value.type == 5);
                a.getValue(3, value);
                loadSlm(a, value.type != 3 ? false : z);
            } else {
                boolean isDimension = a.getType(4) == 5;
                loadHeaderStartMargin(a, isDimension);
                boolean isDimension2 = a.getType(5) == 5;
                loadHeaderEndMargin(a, isDimension2);
                boolean isString = a.getType(3) == 3;
                loadSlm(a, isString);
            }
            a.recycle();
        }

        @Deprecated
        public LayoutParams(ViewGroup.MarginLayoutParams other) {
            super(other);
            this.sectionManagerKind = 1;
            init(other);
        }

        @Deprecated
        public LayoutParams(ViewGroup.LayoutParams other) {
            super(other);
            this.sectionManagerKind = 1;
            init(other);
        }

        public static LayoutParams from(ViewGroup.LayoutParams other) {
            if (other == null) {
                Log.w("SuperSLiM", "Null value passed in call to LayoutManager.LayoutParams.from().");
                return new LayoutParams(-2, -2);
            } else if (other instanceof ViewGroup.MarginLayoutParams) {
                return new LayoutParams((ViewGroup.MarginLayoutParams) other);
            } else {
                return new LayoutParams(other);
            }
        }

        public boolean areHeaderFlagsSet(int flags) {
            return (this.headerDisplay & flags) == flags;
        }

        public int getFirstPosition() {
            return this.mFirstPosition;
        }

        public void setFirstPosition(int firstPosition) {
            if (firstPosition < 0) {
                throw new InvalidFirstPositionException();
            }
            this.mFirstPosition = firstPosition;
        }

        public int getTestedFirstPosition() {
            if (this.mFirstPosition == -1) {
                throw new MissingFirstPositionException();
            }
            return this.mFirstPosition;
        }

        public boolean isHeaderEndAligned() {
            return (this.headerDisplay & 4) != 0;
        }

        public boolean isHeaderInline() {
            return (this.headerDisplay & 1) != 0;
        }

        public boolean isHeaderOverlay() {
            return (this.headerDisplay & 8) != 0;
        }

        public boolean isHeaderStartAligned() {
            return (this.headerDisplay & 2) != 0;
        }

        public boolean isHeaderSticky() {
            return (this.headerDisplay & 16) != 0;
        }

        public void setSlm(String key) {
            this.sectionManagerKind = -1;
            this.sectionManager = key;
        }

        public void setSlm(int id) {
            this.sectionManagerKind = id;
        }

        private void init(ViewGroup.LayoutParams other) {
            if (other instanceof LayoutParams) {
                LayoutParams lp = (LayoutParams) other;
                this.isHeader = lp.isHeader;
                this.headerDisplay = lp.headerDisplay;
                this.mFirstPosition = lp.mFirstPosition;
                this.sectionManager = lp.sectionManager;
                this.sectionManagerKind = lp.sectionManagerKind;
                this.headerMarginEnd = lp.headerMarginEnd;
                this.headerMarginStart = lp.headerMarginStart;
                this.headerEndMarginIsAuto = lp.headerEndMarginIsAuto;
                this.headerStartMarginIsAuto = lp.headerStartMarginIsAuto;
                return;
            }
            this.isHeader = false;
            this.headerDisplay = 17;
            this.headerMarginEnd = -1;
            this.headerMarginStart = -1;
            this.headerStartMarginIsAuto = true;
            this.headerEndMarginIsAuto = true;
            this.sectionManagerKind = 1;
        }

        private void loadHeaderEndMargin(TypedArray a, boolean isDimension) {
            if (isDimension) {
                this.headerEndMarginIsAuto = false;
                this.headerMarginEnd = a.getDimensionPixelSize(5, 0);
                return;
            }
            this.headerEndMarginIsAuto = true;
        }

        private void loadHeaderStartMargin(TypedArray a, boolean isDimension) {
            if (isDimension) {
                this.headerStartMarginIsAuto = false;
                this.headerMarginStart = a.getDimensionPixelSize(4, 0);
                return;
            }
            this.headerStartMarginIsAuto = true;
        }

        private void loadSlm(TypedArray a, boolean isString) {
            if (isString) {
                this.sectionManager = a.getString(3);
                if (TextUtils.isEmpty(this.sectionManager)) {
                    this.sectionManagerKind = 1;
                    return;
                } else {
                    this.sectionManagerKind = -1;
                    return;
                }
            }
            this.sectionManagerKind = a.getInt(3, 1);
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes.dex */
        public class MissingFirstPositionException extends RuntimeException {
            MissingFirstPositionException() {
                super("Missing section first position.");
            }
        }

        /* loaded from: classes.dex */
        private class InvalidFirstPositionException extends RuntimeException {
            InvalidFirstPositionException() {
                super("Invalid section first position given.");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public static class SavedState implements Parcelable {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.tonicartos.superslim.LayoutManager.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public SavedState mo446createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public SavedState[] mo447newArray(int size) {
                return new SavedState[size];
            }
        };
        public int anchorOffset;
        public int anchorPosition;

        protected SavedState() {
        }

        protected SavedState(Parcel in) {
            this.anchorPosition = in.readInt();
            this.anchorOffset = in.readInt();
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            out.writeInt(this.anchorPosition);
            out.writeInt(this.anchorOffset);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class NotYetImplementedSlmException extends RuntimeException {
        public NotYetImplementedSlmException(int id) {
            super("SLM not yet implemented " + id + ".");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class UnknownSectionLayoutException extends RuntimeException {
        public UnknownSectionLayoutException(String key) {
            super("No registered layout for id " + key + ".");
        }
    }
}
