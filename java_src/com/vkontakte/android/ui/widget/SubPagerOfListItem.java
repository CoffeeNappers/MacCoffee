package com.vkontakte.android.ui.widget;

import android.annotation.SuppressLint;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.Global;
import java.util.HashMap;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes3.dex */
public class SubPagerOfListItem extends ViewGroup {
    private RecyclerView.AdapterDataObserver adapterDataObserver;
    private int adapterSize;
    private Drawable divider;
    private int dividerHeight;
    private boolean isShowFirstItemMode;
    private final int itemHeight;
    private SubPagerOfListAdapter listAdapter;
    boolean needInvalidated;
    private SparseArray<SparseArray<View>> recyclerBaskets;
    public final RecyclerView.OnScrollListener scroller;
    @NonNull
    private final SubPagerOfList subPagerParentView;
    private final Rect tmpRect;
    private View tmpView;
    private HashMap<View, Integer> typesMap;
    private SparseArray<View> viewsBasket;

    /* loaded from: classes3.dex */
    public static abstract class SubPagerOfListAdapter extends RecyclerView.Adapter {
        private boolean isShowFirstItemMode = false;

        public abstract String getTitle();

        public boolean isShowFirstItemMode() {
            return this.isShowFirstItemMode;
        }

        public void setIsShowFirstItemMode(boolean isShowFirstItemMode) {
            this.isShowFirstItemMode = isShowFirstItemMode;
        }

        public void onScrollStateChanged(RecyclerView view, int scrollState) {
        }

        public void onScroll(RecyclerView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        }
    }

    public SubPagerOfListItem(@NonNull SubPagerOfList subPagerParentView, int itemHeight) {
        super(subPagerParentView.getContext());
        this.typesMap = new HashMap<>();
        this.viewsBasket = new SparseArray<>();
        this.recyclerBaskets = new SparseArray<>();
        this.divider = null;
        this.dividerHeight = 0;
        this.tmpRect = new Rect();
        this.tmpView = null;
        this.adapterSize = 0;
        this.listAdapter = null;
        this.needInvalidated = false;
        this.isShowFirstItemMode = false;
        this.adapterDataObserver = new RecyclerView.AdapterDataObserver() { // from class: com.vkontakte.android.ui.widget.SubPagerOfListItem.1
            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onChanged() {
                SubPagerOfListItem.this.setAdapter(SubPagerOfListItem.this.listAdapter);
            }
        };
        this.scroller = new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.ui.widget.SubPagerOfListItem.2
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                SubPagerOfListItem.this.onScrollStateChanged(recyclerView, newState);
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                SubPagerOfListItem.this.onScrolled(recyclerView, dx, dy);
            }
        };
        this.subPagerParentView = subPagerParentView;
        this.itemHeight = itemHeight;
    }

    public void setIsShowFirstItemMode(boolean isShowFirstItemMode) {
        this.isShowFirstItemMode = isShowFirstItemMode;
        invalidateVirtualViews();
        this.needInvalidated = false;
        requestLayout();
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void removeView(View view) {
        super.removeView(view);
        this.typesMap.remove(view);
    }

    private View fillView(int key) {
        View view = this.viewsBasket.get(key);
        if (view != null) {
            if (this.isShowFirstItemMode) {
                view.layout(0, getTopForPosition(key), view.getMeasuredWidth(), getBottomForPosition(key));
                view.invalidate();
            }
            return view;
        }
        View view2 = popFromRecycle(key);
        if (view2 != null) {
            this.listAdapter.onBindViewHolder((RecyclerView.ViewHolder) view2.getTag(), key);
            view2.forceLayout();
            int measureSpecH = View.MeasureSpec.makeMeasureSpec(this.itemHeight, 1073741824);
            int measureSpecW = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824);
            view2.measure(measureSpecW, measureSpecH);
        } else {
            RecyclerView.ViewHolder viewHolder = this.listAdapter.createViewHolder(this.subPagerParentView.getParentList(), this.listAdapter.getItemViewType(key));
            view2 = viewHolder.itemView;
            view2.setTag(viewHolder);
            this.listAdapter.onBindViewHolder(viewHolder, key);
            addView(view2);
            this.typesMap.put(view2, Integer.valueOf(this.listAdapter.getItemViewType(key)));
            int measureSpecH2 = View.MeasureSpec.makeMeasureSpec(this.itemHeight, 1073741824);
            int measureSpecW2 = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824);
            view2.measure(measureSpecW2, measureSpecH2);
        }
        this.viewsBasket.append(key, view2);
        view2.layout(0, getTopForPosition(key), view2.getMeasuredWidth(), getBottomForPosition(key));
        view2.invalidate();
        return view2;
    }

    @Nullable
    private View popFromRecycle(int key) {
        int type = this.listAdapter.getItemViewType(key);
        SparseArray<View> recyclerBasket = getOrCreateRecycleBasketByType(type);
        View view = recyclerBasket.get(key);
        if (view != null) {
            recyclerBasket.remove(key);
            return view;
        } else if (recyclerBasket.size() > 0) {
            View view2 = recyclerBasket.valueAt(0);
            recyclerBasket.removeAt(0);
            return view2;
        } else {
            return null;
        }
    }

    private View clearView(int key) {
        View view = this.viewsBasket.get(key);
        if (view != null) {
            this.viewsBasket.remove(key);
            getOrCreateRecycleBasketByType(this.typesMap.get(view).intValue()).append(key, view);
        }
        return view;
    }

    @NonNull
    private SparseArray<View> getOrCreateRecycleBasketByType(int type) {
        SparseArray<View> basket = this.recyclerBaskets.get(type);
        if (basket == null) {
            SparseArray<View> basket2 = new SparseArray<>();
            this.recyclerBaskets.append(type, basket2);
            return basket2;
        }
        return basket;
    }

    private int getCurrentTop() {
        return Math.max(0, this.subPagerParentView.getEmulatedTop() * (-1));
    }

    private int getCurrentBottom(int top) {
        return Math.min(this.subPagerParentView.getEmulatedHeight(), this.subPagerParentView.getEmulatedHeight() - this.subPagerParentView.getEmulatedTop()) + top;
    }

    private int getStartIndexForTop(int top) {
        if (this.isShowFirstItemMode) {
            return 0;
        }
        return Math.max(top / (this.itemHeight + this.dividerHeight), 0);
    }

    private int getEndIndexForTopBottom(int top, int bottom) {
        return this.isShowFirstItemMode ? Math.min(((bottom - top) / (this.itemHeight + this.dividerHeight)) + 2, this.adapterSize - 1) : Math.min((bottom / (this.itemHeight + this.dividerHeight)) + 1, this.adapterSize - 1);
    }

    protected void invalidateVirtualViews() {
        if (getMeasuredWidth() == 0) {
            this.needInvalidated = true;
            return;
        }
        int top = getCurrentTop();
        int indexStart = getStartIndexForTop(top);
        int indexEnd = getEndIndexForTopBottom(top, getCurrentBottom(top));
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View view = getChildAt(i);
            int index = this.viewsBasket.indexOfValue(view);
            int key = index >= 0 ? this.viewsBasket.keyAt(index) : -1;
            if (key >= 0) {
                int type = this.typesMap.get(view).intValue();
                int neededType = this.listAdapter.getItemViewType(key);
                if (key < indexStart || key > indexEnd || type != neededType) {
                    clearView(key);
                }
            }
        }
        for (int i2 = indexStart; i2 <= indexEnd; i2++) {
            fillView(i2);
        }
        invalidate();
    }

    private int getTopForPosition(int position) {
        return this.isShowFirstItemMode ? Math.max(0, this.subPagerParentView.getEmulatedTop() * (-1)) + ((this.itemHeight + this.dividerHeight) * position) + Global.scale(8.0f) : ((this.itemHeight + this.dividerHeight) * position) + Global.scale(8.0f);
    }

    private int getBottomForPosition(int position) {
        return getTopForPosition(position) + this.itemHeight;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        if (this.needInvalidated) {
            invalidateVirtualViews();
            return;
        }
        for (int i = 0; i < this.viewsBasket.size(); i++) {
            int key = this.viewsBasket.keyAt(i);
            this.tmpView = this.viewsBasket.get(key);
            if (changed) {
                this.tmpView.forceLayout();
            }
            this.tmpView.layout(0, getTopForPosition(key), r - l, getBottomForPosition(key));
        }
        this.tmpView = null;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int measureSpecH = View.MeasureSpec.makeMeasureSpec(this.itemHeight, 1073741824);
        int measureSpec = View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(widthMeasureSpec), 1073741824);
        for (int i = getChildCount() - 1; i >= 0; i--) {
            this.tmpView = getChildAt(i);
            if (this.tmpView.getVisibility() != 8) {
                this.tmpView.measure(measureSpec, measureSpecH);
            }
        }
        this.tmpView = null;
        int heightItems = this.adapterSize * this.itemHeight;
        int heightDividers = (this.adapterSize - 1) * this.dividerHeight;
        setMeasuredDimension(View.MeasureSpec.getSize(widthMeasureSpec), heightItems + heightDividers + Global.scale(16.0f));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setMeasuredDimensionPublic(int w, int h) {
        setMeasuredDimension(w, h);
    }

    public void setAdapter(@NonNull SubPagerOfListAdapter listAdapter) {
        if (this.listAdapter != null) {
            this.listAdapter.unregisterAdapterDataObserver(this.adapterDataObserver);
        }
        this.listAdapter = listAdapter;
        this.listAdapter.registerAdapterDataObserver(this.adapterDataObserver);
        this.adapterSize = listAdapter.getItemCount();
        invalidateVirtualViews();
        clearLastValues();
        requestLayout();
        onScrolled(null, 0, 0);
    }

    public SubPagerOfListAdapter getListAdapter() {
        return this.listAdapter;
    }

    public void clearLastValues() {
        for (int i = 0; i < this.recyclerBaskets.size(); i++) {
            SparseArray<View> array = this.recyclerBaskets.valueAt(i);
            for (int j = 0; j < array.size(); j++) {
                removeView(array.valueAt(j));
            }
        }
        this.recyclerBaskets.clear();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(@NonNull Canvas canvas) {
        super.dispatchDraw(canvas);
        for (int i = 0; i < this.viewsBasket.size(); i++) {
            int key = this.viewsBasket.keyAt(i);
            this.tmpView = this.viewsBasket.get(key);
            if (key < this.adapterSize - 1) {
                this.tmpRect.top = this.tmpView.getBottom();
                this.tmpRect.left = this.tmpView.getLeft();
                this.tmpRect.right = this.tmpView.getRight();
                this.tmpRect.bottom = this.tmpRect.top + this.dividerHeight;
                if (this.divider != null) {
                    this.divider.setBounds(this.tmpRect);
                    this.divider.draw(canvas);
                }
            }
        }
        this.tmpView = null;
    }

    public void setDivider(@Nullable Drawable divider) {
        if (divider != null) {
            this.dividerHeight = divider.getIntrinsicHeight();
        } else {
            this.dividerHeight = 0;
        }
        this.divider = divider;
        requestLayout();
    }

    public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
        if (this.listAdapter != null) {
            this.listAdapter.onScrollStateChanged(recyclerView, newState);
        }
    }

    public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
        invalidateVirtualViews();
        int top = getCurrentTop();
        int indexStart = getStartIndexForTop(top);
        int indexEnd = getEndIndexForTopBottom(top, getCurrentBottom(top));
        this.listAdapter.onScroll(recyclerView, indexStart, indexEnd - indexStart, this.adapterSize);
    }
}
