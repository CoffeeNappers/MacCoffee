package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.ListAdapter;
/* loaded from: classes3.dex */
public class PinnedHeaderListView extends FixedScrollListView implements AbsListView.OnScrollListener {
    private PinnedSectionedHeaderAdapter mAdapter;
    private View mCurrentHeader;
    private int mCurrentSection;
    private float mHeaderOffset;
    private boolean mShouldPin;
    private AbsListView.OnScrollListener scrollListener;

    /* loaded from: classes3.dex */
    public interface PinnedSectionedHeaderAdapter {
        int getSectionForPosition(int i);

        View getSectionHeaderView(int i, View view, ViewGroup viewGroup);

        boolean isSectionHeader(int i);
    }

    public PinnedHeaderListView(Context context) {
        super(context);
        this.mShouldPin = true;
        this.mCurrentSection = 0;
        this.scrollListener = null;
        super.setOnScrollListener(this);
    }

    public PinnedHeaderListView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mShouldPin = true;
        this.mCurrentSection = 0;
        this.scrollListener = null;
        super.setOnScrollListener(this);
    }

    public PinnedHeaderListView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mShouldPin = true;
        this.mCurrentSection = 0;
        this.scrollListener = null;
        super.setOnScrollListener(this);
    }

    public void setPinHeaders(boolean shouldPin) {
        this.mShouldPin = shouldPin;
    }

    @Override // android.widget.AdapterView
    public void setAdapter(ListAdapter adapter) {
        this.mAdapter = (PinnedSectionedHeaderAdapter) adapter;
        super.setAdapter(adapter);
    }

    @Override // android.widget.AbsListView, android.widget.AdapterView, android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        try {
            super.onLayout(changed, l, t, r, b);
            int firstVis = getFirstVisiblePosition() - getHeaderViewsCount();
            if (this.mCurrentHeader != null && firstVis >= 0) {
                this.mCurrentHeader.measure(View.MeasureSpec.makeMeasureSpec(((r - l) - getPaddingLeft()) - getPaddingRight(), 1073741824), View.MeasureSpec.makeMeasureSpec(b - t, Integer.MIN_VALUE));
            }
        } catch (Exception e) {
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        if (this.scrollListener != null) {
            this.scrollListener.onScroll(view, firstVisibleItem, visibleItemCount, totalItemCount);
        }
        int firstVisibleItem2 = firstVisibleItem - getHeaderViewsCount();
        if (firstVisibleItem2 < 0) {
            if (this.mCurrentHeader != null) {
                this.mCurrentHeader.setVisibility(0);
                requestLayout();
            }
        } else if (this.mAdapter != null && this.mShouldPin) {
            int section = this.mAdapter.getSectionForPosition(firstVisibleItem2);
            this.mCurrentHeader = getHeaderView(section, this.mCurrentHeader);
            this.mHeaderOffset = 0.0f;
            for (int i = firstVisibleItem2; i < firstVisibleItem2 + visibleItemCount; i++) {
                if (this.mAdapter.isSectionHeader(i)) {
                    View header = getChildAt(i - firstVisibleItem2);
                    float headerTop = header.getTop();
                    float pinnedHeaderHeight = 0.0f;
                    if (this.mCurrentHeader != null) {
                        pinnedHeaderHeight = this.mCurrentHeader.getMeasuredHeight();
                    }
                    header.setVisibility(0);
                    if (pinnedHeaderHeight >= headerTop && headerTop > 0.0f) {
                        this.mHeaderOffset = headerTop - header.getHeight();
                    } else if (headerTop <= 0.0f) {
                        header.setVisibility(4);
                    }
                }
            }
            invalidate();
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView view, int scrollState) {
        if (this.scrollListener != null) {
            this.scrollListener.onScrollStateChanged(view, scrollState);
        }
    }

    private View getHeaderView(int section, View oldView) {
        boolean shouldLayout = section != this.mCurrentSection || oldView == null;
        if ((this.mAdapter instanceof MultiSectionAdapter) && !((MultiSectionAdapter) this.mAdapter).isSectionHeaderVisible(section)) {
            return null;
        }
        View view = this.mAdapter.getSectionHeaderView(section, oldView, this);
        if (shouldLayout) {
            ensurePinnedHeaderLayout(view);
            this.mCurrentSection = section;
            return view;
        }
        return view;
    }

    private void ensurePinnedHeaderLayout(View header) {
        int heightSpec;
        if (header.isLayoutRequested()) {
            int widthSpec = View.MeasureSpec.makeMeasureSpec(getWidth(), 1073741824);
            ViewGroup.LayoutParams layoutParams = header.getLayoutParams();
            if (layoutParams != null && layoutParams.height > 0) {
                heightSpec = View.MeasureSpec.makeMeasureSpec(layoutParams.height, 1073741824);
            } else {
                heightSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
            }
            header.measure(widthSpec, heightSpec);
            int height = header.getMeasuredHeight();
            header.layout(0, 0, getWidth(), height);
        }
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.ViewGroup, android.view.View
    public void dispatchDraw(Canvas canvas) {
        try {
            super.dispatchDraw(canvas);
            if (getFirstVisiblePosition() < getHeaderViewsCount()) {
                if (this.mCurrentHeader != null) {
                    this.mCurrentHeader.invalidate();
                }
            } else if (this.mAdapter != null && this.mShouldPin && this.mCurrentHeader != null) {
                int saveCount = canvas.save();
                canvas.translate(getPaddingLeft(), this.mHeaderOffset);
                canvas.clipRect(0, 0, getWidth(), this.mCurrentHeader.getMeasuredHeight());
                this.mCurrentHeader.draw(canvas);
                canvas.restoreToCount(saveCount);
            }
        } catch (Exception e) {
        }
    }

    @Override // com.vkontakte.android.ui.FixedScrollListView, android.widget.AbsListView
    public void setOnScrollListener(AbsListView.OnScrollListener l) {
        this.scrollListener = l;
    }
}
