package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import com.vkontakte.android.ui.widget.SubPagerOfListItem;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class SubPagerOfList extends ViewPager {
    private SubPagerOfPageAdapter adapter;
    private View decorView;
    private IScrollToPageView iScrollToPageView;
    private volatile boolean isStarted;
    private int lastCurrentPage;
    private RecyclerView parentList;
    private View parentView;
    public final RecyclerView.OnScrollListener scroller;

    /* loaded from: classes3.dex */
    public static class ArrayListWithIndex<T> extends ArrayList<T> {
        public int index = 0;
    }

    /* loaded from: classes3.dex */
    interface Decor {
    }

    /* loaded from: classes3.dex */
    public interface IScrollToPageView {
        void scrollToPageView();
    }

    public SubPagerOfList(Context context) {
        super(context);
        this.parentList = null;
        this.parentView = null;
        this.iScrollToPageView = null;
        this.lastCurrentPage = -1;
        this.adapter = null;
        this.isStarted = false;
        this.scroller = new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.ui.widget.SubPagerOfList.3
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                SubPagerOfList.this.onScrollStateChanged(recyclerView, newState);
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                SubPagerOfList.this.onScrolled(recyclerView, dx, dy);
            }
        };
        init();
    }

    public SubPagerOfList(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.parentList = null;
        this.parentView = null;
        this.iScrollToPageView = null;
        this.lastCurrentPage = -1;
        this.adapter = null;
        this.isStarted = false;
        this.scroller = new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.ui.widget.SubPagerOfList.3
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                SubPagerOfList.this.onScrollStateChanged(recyclerView, newState);
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                SubPagerOfList.this.onScrolled(recyclerView, dx, dy);
            }
        };
        init();
    }

    public void init() {
        setChildrenDrawingOrderEnabled(true);
        addOnPageChangeListener(new ViewPager.OnPageChangeListener() { // from class: com.vkontakte.android.ui.widget.SubPagerOfList.1
            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
            }

            @Override // android.support.v4.view.ViewPager.OnPageChangeListener
            public void onPageScrollStateChanged(int state) {
                switch (state) {
                    case 0:
                        SubPagerOfList.this.onTrackFinish();
                        return;
                    case 1:
                    case 2:
                        SubPagerOfList.this.onTrackStart();
                        return;
                    default:
                        return;
                }
            }
        });
    }

    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup
    protected int getChildDrawingOrder(int childCount, int i) {
        return (childCount - 1) - i;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onTrackStart() {
        if (!this.isStarted) {
            this.lastCurrentPage = getCurrentItem();
            mo1110getAdapter().setIsShowFirstItemMode(this.lastCurrentPage);
            this.isStarted = true;
            requestUpdate();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onTrackFinish() {
        if (this.isStarted) {
            mo1110getAdapter().clearIsShowFirstItemMode();
            if (this.iScrollToPageView != null && getEmulatedTop() < 0 && this.lastCurrentPage != getCurrentItem()) {
                this.iScrollToPageView.scrollToPageView();
            }
            this.isStarted = false;
            requestUpdate();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int paddingTop = getPaddingTop();
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                ViewPager.LayoutParams lp = (ViewPager.LayoutParams) child.getLayoutParams();
                if (lp.isDecor) {
                    switch (lp.gravity & 112) {
                        case 48:
                            this.decorView = child;
                            paddingTop += child.getMeasuredHeight();
                            continue;
                    }
                }
            }
        }
        int currentPageHeight = getEmulatedHeight() - paddingTop;
        View view = mo1110getAdapter().getViewByPosition(getCurrentItem());
        if (view != null) {
            currentPageHeight = Math.max(view.getMeasuredHeight(), currentPageHeight);
        } else {
            int i2 = getChildCount() - 1;
            while (true) {
                if (i2 >= 0) {
                    if (mo1110getAdapter().getItemPosition(getChildAt(i2)) != getCurrentItem()) {
                        i2--;
                    } else {
                        currentPageHeight = Math.max(getChildAt(i2).getMeasuredHeight(), currentPageHeight);
                    }
                }
            }
        }
        for (int i3 = getChildCount() - 1; i3 >= 0; i3--) {
            View child2 = getChildAt(i3);
            if (child2.getVisibility() != 8 && (child2 instanceof SubPagerOfListItem)) {
                ((SubPagerOfListItem) child2).setMeasuredDimensionPublic(child2.getMeasuredWidth(), currentPageHeight);
            }
        }
        setMeasuredDimension(getMeasuredWidth(), currentPageHeight + paddingTop);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.parentList != null) {
            this.parentList.removeOnScrollListener(this.scroller);
        }
        this.parentList = null;
        this.parentView = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.parentList = getParentList();
        this.parentView = getRootView();
        if (this.parentList != null) {
            this.parentList.addOnScrollListener(this.scroller);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public RecyclerView getParentList() {
        if (this.parentList == null) {
            fillParents();
        }
        return this.parentList;
    }

    private View getParentView() {
        if (this.parentView == null) {
            fillParents();
        }
        return this.parentView;
    }

    private void fillParents() {
        for (ViewParent viewParent = this; viewParent instanceof View; viewParent = viewParent.getParent()) {
            if (viewParent instanceof RecyclerView) {
                this.parentList = (RecyclerView) viewParent;
                return;
            }
            this.parentView = (View) viewParent;
        }
    }

    public void requestUpdate() {
        final View parentView = getParentView();
        ViewTreeObserver.OnPreDrawListener onPreDrawListener = new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.ui.widget.SubPagerOfList.2
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                SubPagerOfList.this.mo1110getAdapter().invalidateViews();
                if (SubPagerOfList.this.decorView != null) {
                    SubPagerOfList.this.decorView.setTranslationY(Math.max(-SubPagerOfList.this.getEmulatedTop(), 0));
                }
                parentView.getViewTreeObserver().removeOnPreDrawListener(this);
                return true;
            }
        };
        parentView.getViewTreeObserver().addOnPreDrawListener(onPreDrawListener);
        parentView.invalidate();
    }

    public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
        SubPagerOfPageAdapter adapter = mo1110getAdapter();
        if (adapter != null) {
            adapter.onScrolled(recyclerView, dx, dy);
        }
        if (this.decorView != null) {
            this.decorView.setTranslationY(Math.max(-getEmulatedTop(), 0));
        }
    }

    public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
        SubPagerOfPageAdapter adapter = mo1110getAdapter();
        if (adapter != null) {
            adapter.onScrollStateChanged(recyclerView, newState);
        }
    }

    @Override // android.support.v4.view.ViewPager
    public void setAdapter(PagerAdapter adapter) {
        super.setAdapter(adapter);
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View child = getChildAt(i);
            if (child instanceof PagerSlidingTabStrip) {
                ((PagerSlidingTabStrip) child).setViewPager(this);
            }
        }
    }

    public void setData(@NonNull List<SubPagerOfListItem.SubPagerOfListAdapter> data, int itemHeightRes, @Nullable Drawable divider, @Nullable IScrollToPageView iScrollToPageView) {
        this.iScrollToPageView = iScrollToPageView;
        if (this.adapter == null) {
            int itemHeight = getContext().getResources().getDimensionPixelSize(itemHeightRes);
            SubPagerOfPageAdapter subPagerOfPageAdapter = new SubPagerOfPageAdapter(data, itemHeight, divider);
            this.adapter = subPagerOfPageAdapter;
            setAdapter(subPagerOfPageAdapter);
            return;
        }
        this.adapter.setData(data);
    }

    @Override // android.support.v4.view.ViewPager
    /* renamed from: getAdapter  reason: collision with other method in class */
    public SubPagerOfPageAdapter mo1110getAdapter() {
        return (SubPagerOfPageAdapter) super.mo1110getAdapter();
    }

    /* loaded from: classes3.dex */
    public static class SubPagerOfPageAdapter extends PagerAdapter {
        @NonNull
        List<SubPagerOfListItem.SubPagerOfListAdapter> baseAdapters;
        final Drawable divider;
        final int itemHeight;
        @NonNull
        final List<RecyclerView.OnScrollListener> onScrollListeners;
        private final SparseArray<SubPagerOfListItem> views;

        private SubPagerOfPageAdapter(@NonNull List<SubPagerOfListItem.SubPagerOfListAdapter> baseAdapters, int itemHeight, @Nullable Drawable divider) {
            this.views = new SparseArray<>();
            this.onScrollListeners = new ArrayList();
            this.baseAdapters = baseAdapters;
            this.itemHeight = itemHeight;
            this.divider = divider;
        }

        public void setData(@NonNull List<SubPagerOfListItem.SubPagerOfListAdapter> baseAdapters) {
            this.baseAdapters = baseAdapters;
            notifyDataSetChanged();
        }

        public void setIsShowFirstItemMode(int position) {
            int i = 0;
            while (i < this.baseAdapters.size()) {
                this.baseAdapters.get(i).setIsShowFirstItemMode(i != position);
                i++;
            }
            invalidateViews();
        }

        public void clearIsShowFirstItemMode() {
            for (int i = 0; i < this.baseAdapters.size(); i++) {
                this.baseAdapters.get(i).setIsShowFirstItemMode(false);
            }
            invalidateViews();
        }

        public void invalidateViews() {
            for (int i = 0; i < this.views.size(); i++) {
                SubPagerOfListItem view = this.views.valueAt(i);
                view.setIsShowFirstItemMode(view.getListAdapter().isShowFirstItemMode());
            }
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return this.baseAdapters.size();
        }

        @Override // android.support.v4.view.PagerAdapter
        public CharSequence getPageTitle(int position) {
            return this.baseAdapters.get(position).getTitle();
        }

        @Override // android.support.v4.view.PagerAdapter
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }

        @Override // android.support.v4.view.PagerAdapter
        public Object instantiateItem(ViewGroup container, int position) {
            SubPagerOfList pager = (SubPagerOfList) container;
            SubPagerOfListItem view = new SubPagerOfListItem(pager, this.itemHeight);
            this.onScrollListeners.add(view.scroller);
            view.setIsShowFirstItemMode(this.baseAdapters.get(position).isShowFirstItemMode());
            view.setAdapter(this.baseAdapters.get(position));
            view.setDivider(this.divider);
            this.views.append(position, view);
            pager.addView(view);
            return view;
        }

        @Override // android.support.v4.view.PagerAdapter
        public void destroyItem(ViewGroup container, int position, Object view) {
            SubPagerOfListItem item = (SubPagerOfListItem) view;
            container.removeView(item);
            this.views.remove(position);
            this.onScrollListeners.remove(item.scroller);
        }

        @Nullable
        public SubPagerOfListItem getViewByPosition(int position) {
            return this.views.get(position);
        }

        public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
            for (RecyclerView.OnScrollListener onScrollListener : this.onScrollListeners) {
                onScrollListener.onScrollStateChanged(recyclerView, newState);
            }
        }

        public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
            for (RecyclerView.OnScrollListener onScrollListener : this.onScrollListeners) {
                onScrollListener.onScrolled(recyclerView, dx, dy);
            }
        }
    }

    public int getEmulatedHeight() {
        RecyclerView listView = getParentList();
        if (listView == null) {
            return 0;
        }
        return listView.getHeight();
    }

    public int getEmulatedTop() {
        return getTop();
    }

    @Override // android.view.ViewGroup
    protected boolean addViewInLayout(@NonNull View child, int index, ViewGroup.LayoutParams params) {
        ViewPager.LayoutParams lp = (ViewPager.LayoutParams) params;
        lp.isDecor |= child instanceof Decor;
        return super.addViewInLayout(child, index, params);
    }

    @Override // android.support.v4.view.ViewPager, android.view.ViewGroup
    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        ViewPager.LayoutParams lp = (ViewPager.LayoutParams) params;
        lp.isDecor |= child instanceof Decor;
        super.addView(child, index, params);
    }
}
