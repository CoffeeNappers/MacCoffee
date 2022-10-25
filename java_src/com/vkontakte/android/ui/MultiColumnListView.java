package com.vkontakte.android.ui;

import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import java.util.ArrayList;
import java.util.HashMap;
/* loaded from: classes3.dex */
public class MultiColumnListView extends FixedScrollListView {
    private int columnCount;
    private int currentScrollState;
    private boolean drawSelOnTop;
    private GestureDetector gestureDetector;
    private GestureDetector.SimpleOnGestureListener gestureListener;
    private Drawable highlight;
    private AdapterView.OnItemClickListener itemClickListener;
    private DataSetObserver observer;
    private OnResizeListener resizeListener;
    private HashMap<Integer, ArrayList<View>> reusableViews;
    private ArrayList<RowInfo> rows;
    private MultiColumnAdapterWrapper rowsAdapter;
    private AbsListView.OnScrollListener scrollListener;
    private int selPosition;
    private Rect selRect;
    private ListAdapter wrappedAdapter;

    /* loaded from: classes3.dex */
    public interface OnResizeListener {
        void onResize(int i, int i2);
    }

    public MultiColumnListView(Context context) {
        super(context);
        this.rows = new ArrayList<>();
        this.columnCount = 1;
        this.observer = new DataSetObserver() { // from class: com.vkontakte.android.ui.MultiColumnListView.1
            @Override // android.database.DataSetObserver
            public void onChanged() {
                MultiColumnListView.this.updateRows();
            }

            @Override // android.database.DataSetObserver
            public void onInvalidated() {
                onChanged();
            }
        };
        this.reusableViews = new HashMap<>();
        this.drawSelOnTop = false;
        this.selPosition = -1;
        this.currentScrollState = 0;
        this.gestureListener = new GestureDetector.SimpleOnGestureListener() { // from class: com.vkontakte.android.ui.MultiColumnListView.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent ev) {
                int pos = MultiColumnListView.this.positionFromPoint((int) ev.getX(), (int) ev.getY());
                if (pos == -1 || ((!MultiColumnListView.this.wrappedAdapter.areAllItemsEnabled() && !MultiColumnListView.this.wrappedAdapter.isEnabled(pos)) || MultiColumnListView.this.itemClickListener == null)) {
                    return false;
                }
                MultiColumnListView.this.itemClickListener.onItemClick(MultiColumnListView.this, MultiColumnListView.this.getItemView(pos), pos, MultiColumnListView.this.wrappedAdapter.getItemId(pos));
                if (MultiColumnListView.this.selPosition != pos) {
                    MultiColumnListView.this.selPosition = pos;
                    if (MultiColumnListView.this.highlight != null && MultiColumnListView.this.highlight.isStateful()) {
                        MultiColumnListView.this.highlight.setState(new int[]{16842919, 16842910});
                    }
                    MultiColumnListView.this.invalidate();
                }
                MultiColumnListView.this.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.MultiColumnListView.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (MultiColumnListView.this.selPosition != -1) {
                            if (MultiColumnListView.this.highlight != null && MultiColumnListView.this.highlight.isStateful()) {
                                MultiColumnListView.this.highlight.setState(new int[0]);
                            }
                            MultiColumnListView.this.postInvalidate();
                        }
                    }
                }, 100L);
                return true;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent ev) {
                int pos = MultiColumnListView.this.positionFromPoint((int) ev.getX(), (int) ev.getY());
                return pos != -1 && (MultiColumnListView.this.wrappedAdapter.areAllItemsEnabled() || MultiColumnListView.this.wrappedAdapter.isEnabled(pos)) && MultiColumnListView.this.itemClickListener != null;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public void onShowPress(MotionEvent ev) {
                int pos = MultiColumnListView.this.positionFromPoint((int) ev.getX(), (int) ev.getY());
                if (pos != -1) {
                    if ((MultiColumnListView.this.wrappedAdapter.areAllItemsEnabled() || MultiColumnListView.this.wrappedAdapter.isEnabled(pos)) && MultiColumnListView.this.itemClickListener != null) {
                        MultiColumnListView.this.selPosition = pos;
                        if (MultiColumnListView.this.highlight != null && MultiColumnListView.this.highlight.isStateful()) {
                            MultiColumnListView.this.highlight.setState(new int[]{16842919, 16842910});
                        }
                        if (Build.VERSION.SDK_INT >= 21) {
                            MultiColumnListView.this.highlight.setHotspot(ev.getX(), ev.getY());
                        }
                        MultiColumnListView.this.postInvalidate();
                    }
                }
            }
        };
        init();
    }

    public MultiColumnListView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.rows = new ArrayList<>();
        this.columnCount = 1;
        this.observer = new DataSetObserver() { // from class: com.vkontakte.android.ui.MultiColumnListView.1
            @Override // android.database.DataSetObserver
            public void onChanged() {
                MultiColumnListView.this.updateRows();
            }

            @Override // android.database.DataSetObserver
            public void onInvalidated() {
                onChanged();
            }
        };
        this.reusableViews = new HashMap<>();
        this.drawSelOnTop = false;
        this.selPosition = -1;
        this.currentScrollState = 0;
        this.gestureListener = new GestureDetector.SimpleOnGestureListener() { // from class: com.vkontakte.android.ui.MultiColumnListView.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent ev) {
                int pos = MultiColumnListView.this.positionFromPoint((int) ev.getX(), (int) ev.getY());
                if (pos == -1 || ((!MultiColumnListView.this.wrappedAdapter.areAllItemsEnabled() && !MultiColumnListView.this.wrappedAdapter.isEnabled(pos)) || MultiColumnListView.this.itemClickListener == null)) {
                    return false;
                }
                MultiColumnListView.this.itemClickListener.onItemClick(MultiColumnListView.this, MultiColumnListView.this.getItemView(pos), pos, MultiColumnListView.this.wrappedAdapter.getItemId(pos));
                if (MultiColumnListView.this.selPosition != pos) {
                    MultiColumnListView.this.selPosition = pos;
                    if (MultiColumnListView.this.highlight != null && MultiColumnListView.this.highlight.isStateful()) {
                        MultiColumnListView.this.highlight.setState(new int[]{16842919, 16842910});
                    }
                    MultiColumnListView.this.invalidate();
                }
                MultiColumnListView.this.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.MultiColumnListView.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (MultiColumnListView.this.selPosition != -1) {
                            if (MultiColumnListView.this.highlight != null && MultiColumnListView.this.highlight.isStateful()) {
                                MultiColumnListView.this.highlight.setState(new int[0]);
                            }
                            MultiColumnListView.this.postInvalidate();
                        }
                    }
                }, 100L);
                return true;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent ev) {
                int pos = MultiColumnListView.this.positionFromPoint((int) ev.getX(), (int) ev.getY());
                return pos != -1 && (MultiColumnListView.this.wrappedAdapter.areAllItemsEnabled() || MultiColumnListView.this.wrappedAdapter.isEnabled(pos)) && MultiColumnListView.this.itemClickListener != null;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public void onShowPress(MotionEvent ev) {
                int pos = MultiColumnListView.this.positionFromPoint((int) ev.getX(), (int) ev.getY());
                if (pos != -1) {
                    if ((MultiColumnListView.this.wrappedAdapter.areAllItemsEnabled() || MultiColumnListView.this.wrappedAdapter.isEnabled(pos)) && MultiColumnListView.this.itemClickListener != null) {
                        MultiColumnListView.this.selPosition = pos;
                        if (MultiColumnListView.this.highlight != null && MultiColumnListView.this.highlight.isStateful()) {
                            MultiColumnListView.this.highlight.setState(new int[]{16842919, 16842910});
                        }
                        if (Build.VERSION.SDK_INT >= 21) {
                            MultiColumnListView.this.highlight.setHotspot(ev.getX(), ev.getY());
                        }
                        MultiColumnListView.this.postInvalidate();
                    }
                }
            }
        };
        init();
    }

    public MultiColumnListView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.rows = new ArrayList<>();
        this.columnCount = 1;
        this.observer = new DataSetObserver() { // from class: com.vkontakte.android.ui.MultiColumnListView.1
            @Override // android.database.DataSetObserver
            public void onChanged() {
                MultiColumnListView.this.updateRows();
            }

            @Override // android.database.DataSetObserver
            public void onInvalidated() {
                onChanged();
            }
        };
        this.reusableViews = new HashMap<>();
        this.drawSelOnTop = false;
        this.selPosition = -1;
        this.currentScrollState = 0;
        this.gestureListener = new GestureDetector.SimpleOnGestureListener() { // from class: com.vkontakte.android.ui.MultiColumnListView.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent ev) {
                int pos = MultiColumnListView.this.positionFromPoint((int) ev.getX(), (int) ev.getY());
                if (pos == -1 || ((!MultiColumnListView.this.wrappedAdapter.areAllItemsEnabled() && !MultiColumnListView.this.wrappedAdapter.isEnabled(pos)) || MultiColumnListView.this.itemClickListener == null)) {
                    return false;
                }
                MultiColumnListView.this.itemClickListener.onItemClick(MultiColumnListView.this, MultiColumnListView.this.getItemView(pos), pos, MultiColumnListView.this.wrappedAdapter.getItemId(pos));
                if (MultiColumnListView.this.selPosition != pos) {
                    MultiColumnListView.this.selPosition = pos;
                    if (MultiColumnListView.this.highlight != null && MultiColumnListView.this.highlight.isStateful()) {
                        MultiColumnListView.this.highlight.setState(new int[]{16842919, 16842910});
                    }
                    MultiColumnListView.this.invalidate();
                }
                MultiColumnListView.this.postDelayed(new Runnable() { // from class: com.vkontakte.android.ui.MultiColumnListView.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (MultiColumnListView.this.selPosition != -1) {
                            if (MultiColumnListView.this.highlight != null && MultiColumnListView.this.highlight.isStateful()) {
                                MultiColumnListView.this.highlight.setState(new int[0]);
                            }
                            MultiColumnListView.this.postInvalidate();
                        }
                    }
                }, 100L);
                return true;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent ev) {
                int pos = MultiColumnListView.this.positionFromPoint((int) ev.getX(), (int) ev.getY());
                return pos != -1 && (MultiColumnListView.this.wrappedAdapter.areAllItemsEnabled() || MultiColumnListView.this.wrappedAdapter.isEnabled(pos)) && MultiColumnListView.this.itemClickListener != null;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public void onShowPress(MotionEvent ev) {
                int pos = MultiColumnListView.this.positionFromPoint((int) ev.getX(), (int) ev.getY());
                if (pos != -1) {
                    if ((MultiColumnListView.this.wrappedAdapter.areAllItemsEnabled() || MultiColumnListView.this.wrappedAdapter.isEnabled(pos)) && MultiColumnListView.this.itemClickListener != null) {
                        MultiColumnListView.this.selPosition = pos;
                        if (MultiColumnListView.this.highlight != null && MultiColumnListView.this.highlight.isStateful()) {
                            MultiColumnListView.this.highlight.setState(new int[]{16842919, 16842910});
                        }
                        if (Build.VERSION.SDK_INT >= 21) {
                            MultiColumnListView.this.highlight.setHotspot(ev.getX(), ev.getY());
                        }
                        MultiColumnListView.this.postInvalidate();
                    }
                }
            }
        };
        init();
    }

    private void init() {
        super.setOnScrollListener(new AbsListView.OnScrollListener() { // from class: com.vkontakte.android.ui.MultiColumnListView.3
            @Override // android.widget.AbsListView.OnScrollListener
            public void onScrollStateChanged(AbsListView view, int scrollState) {
                if (MultiColumnListView.this.scrollListener != null) {
                    MultiColumnListView.this.scrollListener.onScrollStateChanged(view, scrollState);
                }
                MultiColumnListView.this.currentScrollState = scrollState;
                if (scrollState != 0 && MultiColumnListView.this.selPosition != -1) {
                    if (MultiColumnListView.this.highlight == null || !MultiColumnListView.this.highlight.isStateful()) {
                        MultiColumnListView.this.selPosition = -1;
                    } else {
                        MultiColumnListView.this.highlight.setState(new int[0]);
                    }
                    MultiColumnListView.this.invalidate();
                }
            }

            @Override // android.widget.AbsListView.OnScrollListener
            public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
                int first;
                int first2;
                if (MultiColumnListView.this.scrollListener != null) {
                    if (firstVisibleItem - MultiColumnListView.this.getHeaderViewsCount() >= 0 && firstVisibleItem - MultiColumnListView.this.getHeaderViewsCount() < MultiColumnListView.this.rows.size()) {
                        first = ((RowInfo) MultiColumnListView.this.rows.get(firstVisibleItem - MultiColumnListView.this.getHeaderViewsCount())).start;
                    } else {
                        first = 0;
                    }
                    int count = 0;
                    int i = 0;
                    while (true) {
                        if (i >= visibleItemCount) {
                            break;
                        } else if ((i + firstVisibleItem) - MultiColumnListView.this.getHeaderViewsCount() >= MultiColumnListView.this.rows.size()) {
                            count += visibleItemCount - i;
                            break;
                        } else {
                            if ((i + firstVisibleItem) - MultiColumnListView.this.getHeaderViewsCount() >= 0) {
                                count += ((RowInfo) MultiColumnListView.this.rows.get((i + firstVisibleItem) - MultiColumnListView.this.getHeaderViewsCount())).count;
                            }
                            i++;
                        }
                    }
                    if (firstVisibleItem < MultiColumnListView.this.getHeaderViewsCount()) {
                        first2 = firstVisibleItem;
                        count += MultiColumnListView.this.getHeaderViewsCount() - first2;
                    } else {
                        first2 = first - MultiColumnListView.this.getHeaderViewsCount();
                    }
                    MultiColumnListView.this.scrollListener.onScroll(view, first2, count, MultiColumnListView.this.getCount() + MultiColumnListView.this.getHeaderViewsCount());
                }
            }
        });
        this.gestureDetector = new GestureDetector(getContext(), this.gestureListener);
        this.highlight = getResources().getDrawable(R.drawable.highlight);
        setWillNotDraw(false);
        super.setSelector(new ColorDrawable(0));
    }

    @Override // android.widget.AbsListView
    public void setSelector(Drawable s) {
        if (this.highlight != null) {
            this.highlight.setCallback(null);
        }
        this.highlight = s;
        if (s != null) {
            s.setCallback(this);
        }
    }

    @Override // android.widget.AbsListView
    public void setSelector(int res) {
        setSelector(getResources().getDrawable(res));
    }

    @Override // android.widget.AbsListView
    public void setDrawSelectorOnTop(boolean draw) {
        this.drawSelOnTop = draw;
    }

    @Override // android.widget.AbsListView, android.view.View
    public boolean verifyDrawable(Drawable d) {
        return super.verifyDrawable(d) || d == this.highlight;
    }

    @Override // android.widget.AdapterView
    public void setAdapter(ListAdapter adapter) {
        if (this.wrappedAdapter != null) {
            this.wrappedAdapter.unregisterDataSetObserver(this.observer);
        }
        this.reusableViews.clear();
        MultiColumnAdapterWrapper multiColumnAdapterWrapper = new MultiColumnAdapterWrapper(adapter);
        this.rowsAdapter = multiColumnAdapterWrapper;
        super.setAdapter((ListAdapter) multiColumnAdapterWrapper);
        this.wrappedAdapter = adapter;
        updateRows();
    }

    public void setColumnCount(int cnt) {
        this.columnCount = Math.max(cnt, 1);
        updateRows();
    }

    public int getColumnCount() {
        return this.columnCount;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateRows() {
        this.rows.clear();
        this.reusableViews.clear();
        if (this.wrappedAdapter != null) {
            int count = this.wrappedAdapter.getCount();
            boolean isMultiSection = this.wrappedAdapter instanceof MultiSectionAdapter;
            int offset = 0;
            RowInfo current = new RowInfo();
            current.size = this.columnCount;
            current.count = -1;
            int i = 0;
            while (i - offset < count) {
                current.count++;
                boolean isHeader = isMultiSection && ((MultiSectionAdapter) this.wrappedAdapter).isSectionHeader(i);
                if (current.count == this.columnCount || isHeader) {
                    this.rows.add(current);
                    if (isHeader) {
                        current.size = this.columnCount;
                        if (current.count <= 0) {
                            this.rows.remove(current);
                        }
                        RowInfo current2 = new RowInfo();
                        current2.start = i;
                        current2.count = 1;
                        current2.size = 1;
                        this.rows.add(current2);
                        i++;
                        offset++;
                    }
                    current = new RowInfo();
                    current.size = this.columnCount;
                    current.start = i;
                }
                i++;
            }
            if (current.count == 0 && current.start == count - 1 && this.columnCount == 1) {
                current.count = 1;
            }
            if (current.start + current.count < count) {
                current.count = Math.min(current.size, count - current.start);
            }
            if (current.count > 0) {
                this.rows.add(current);
            }
            this.rowsAdapter.notifyDataSetChanged();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int positionFromPoint(int x, int y) {
        int firstRow = super.getFirstVisiblePosition() - getHeaderViewsCount();
        for (int i = 0; i < getChildCount(); i++) {
            View r = getChildAt(i);
            if (r.getTop() <= y && r.getBottom() >= y) {
                if (firstRow + i < 0 || firstRow + i >= this.rows.size()) {
                    return -1;
                }
                RowInfo row = this.rows.get(firstRow + i);
                for (int j = 0; j < row.count; j++) {
                    View item = ((ViewGroup) r).getChildAt(j);
                    if (item != null && item.getLeft() <= x && item.getRight() >= x) {
                        return row.start + j;
                    }
                }
                continue;
            }
        }
        return -1;
    }

    @Override // com.vkontakte.android.ui.FixedScrollListView, android.widget.AbsListView
    public void setOnScrollListener(AbsListView.OnScrollListener l) {
        this.scrollListener = l;
    }

    @Override // android.widget.AdapterView
    public int getFirstVisiblePosition() {
        int pos = super.getFirstVisiblePosition();
        if (pos >= this.rows.size() || pos < 0) {
            return 0;
        }
        return this.rows.get(pos).start;
    }

    @Override // android.widget.AdapterView
    public int getLastVisiblePosition() {
        if (this.rows.size() == 0) {
            return 0;
        }
        int pos = super.getLastVisiblePosition();
        if (pos >= getHeaderViewsCount()) {
            if (pos - getHeaderViewsCount() >= this.rows.size()) {
                return ((this.rows.get(this.rows.size() - 1).count + this.rows.get(this.rows.size() - 1).start) - 1) + getHeaderViewsCount();
            }
            return ((this.rows.get(pos - getHeaderViewsCount()).count + this.rows.get(pos - getHeaderViewsCount()).start) - 1) + getHeaderViewsCount();
        }
        return pos;
    }

    @Override // android.widget.AdapterView
    public int getCount() {
        return this.wrappedAdapter.getCount();
    }

    @Override // android.widget.AbsListView, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (this.currentScrollState != 0 || !this.gestureDetector.onTouchEvent(ev)) {
            return super.onTouchEvent(ev);
        }
        return true;
    }

    public View getItemView(int pos) {
        for (int i = 0; i < this.rows.size(); i++) {
            RowInfo row = this.rows.get(i);
            if (row.start <= pos && row.start + row.count > pos) {
                if (getHeaderViewsCount() + i >= super.getFirstVisiblePosition() && getHeaderViewsCount() + i <= super.getLastVisiblePosition()) {
                    View res = ((ViewGroup) getChildAt((i - super.getFirstVisiblePosition()) + getHeaderViewsCount())).getChildAt(pos - row.start);
                    return res;
                } else {
                    return null;
                }
            }
        }
        return null;
    }

    @Override // android.widget.AdapterView
    public void setOnItemClickListener(AdapterView.OnItemClickListener l) {
        this.itemClickListener = l;
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.ViewGroup, android.view.View
    public void dispatchDraw(Canvas c) {
        if (this.selPosition != -1) {
            View view = getItemView(this.selPosition);
            if (view == null) {
                this.selPosition = -1;
            } else {
                int y = ViewUtils.getViewOffset(view, this).y;
                this.selRect = new Rect(view.getLeft(), y, view.getRight(), view.getHeight() + y);
                this.highlight.setBounds(this.selRect);
            }
        }
        if (!this.drawSelOnTop && this.selPosition != -1) {
            this.highlight.draw(c);
        }
        super.dispatchDraw(c);
        if (this.drawSelOnTop && this.selPosition != -1) {
            this.highlight.draw(c);
        }
    }

    public void setOnResizeListener(OnResizeListener l) {
        this.resizeListener = l;
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.View
    public void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (this.resizeListener != null) {
            this.resizeListener.onResize(w, h);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class MultiColumnAdapterWrapper extends BaseAdapter {
        ListAdapter wrapped;

        public MultiColumnAdapterWrapper(ListAdapter la) {
            this.wrapped = la;
            la.registerDataSetObserver(MultiColumnListView.this.observer);
        }

        ListAdapter getWrappedAdapter() {
            return this.wrapped;
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return MultiColumnListView.this.rows.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            return null;
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return 0L;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            RowLayout view;
            RowInfo row = (RowInfo) MultiColumnListView.this.rows.get(position);
            if (convertView == null || !(convertView instanceof LinearLayout)) {
                view = new RowLayout();
            } else {
                view = (RowLayout) convertView;
            }
            if (view != null && view.getTag() != null) {
                RowInfo old = (RowInfo) view.getTag();
                for (int i = 0; i < old.count; i++) {
                    int type = this.wrapped.getItemViewType(old.start + i);
                    if (!MultiColumnListView.this.reusableViews.containsKey(Integer.valueOf(type))) {
                        MultiColumnListView.this.reusableViews.put(Integer.valueOf(type), new ArrayList());
                    }
                    ((ArrayList) MultiColumnListView.this.reusableViews.get(Integer.valueOf(type))).add(view.getChildAt(i));
                }
            }
            view.removeAllViews();
            view.setTag(row);
            view.cols = row.size;
            for (int i2 = 0; i2 < row.count; i2++) {
                int type2 = this.wrapped.getItemViewType(row.start + i2);
                View reuse = null;
                if (MultiColumnListView.this.reusableViews.containsKey(Integer.valueOf(type2)) && ((ArrayList) MultiColumnListView.this.reusableViews.get(Integer.valueOf(type2))).size() > 0) {
                    reuse = (View) ((ArrayList) MultiColumnListView.this.reusableViews.get(Integer.valueOf(type2))).remove(0);
                }
                View item = this.wrapped.getView(row.start + i2, reuse, MultiColumnListView.this);
                if (item.getParent() != null) {
                    ((ViewGroup) item.getParent()).removeView(item);
                }
                view.addView(item);
            }
            return view;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class RowInfo {
        int count;
        int size;
        int start;

        private RowInfo() {
        }

        public String toString() {
            return "Row {" + this.start + ", " + this.count + "}";
        }
    }

    /* loaded from: classes3.dex */
    private class RowLayout extends ViewGroup {
        int cols;

        public RowLayout() {
            super(MultiColumnListView.this.getContext());
            this.cols = 0;
        }

        @Override // android.view.View
        protected void onMeasure(int wms, int hms) {
            int w = View.MeasureSpec.getSize(wms);
            int colW = w / this.cols;
            int maxH = 0;
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                int chms = -2146483649;
                if (child.getLayoutParams() != null) {
                    chms = child.getLayoutParams().height | 1073741824;
                }
                child.measure(colW | 1073741824, chms);
                maxH = Math.max(child.getMeasuredHeight(), maxH);
            }
            setMeasuredDimension(w, maxH);
        }

        @Override // android.view.ViewGroup, android.view.View
        protected void onLayout(boolean changed, int l, int t, int r, int b) {
            float colW = r / this.cols;
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                child.layout(Math.round(i * colW), 0, Math.round((i * colW) + colW), child.getMeasuredHeight());
            }
        }
    }
}
