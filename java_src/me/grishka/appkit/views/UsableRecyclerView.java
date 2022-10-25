package me.grishka.appkit.views;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.AbsListView;
import java.util.ArrayList;
import me.grishka.appkit.preloading.ListPreloader;
import me.grishka.appkit.preloading.PrefetchInfoProvider;
import me.grishka.appkit.preloading.RecyclerToListViewScrollListener;
import me.grishka.appkit.utils.AutoAssignMaxRecycledViewPool;
/* loaded from: classes3.dex */
public class UsableRecyclerView extends RecyclerView {
    private int clickStartTimeout;
    private ViewHolder clickingViewHolder;
    private boolean drawHighlightOnTop;
    private View emptyView;
    private RecyclerView.AdapterDataObserver emptyViewObserver;
    private FooterRecyclerAdapter footerAdapter;
    private Drawable highlight;
    private Rect highlightBounds;
    private SelectorBoundsProvider highlightBoundsProvider;
    private View highlightedView;
    private float lastTouchX;
    private float lastTouchY;
    @Nullable
    protected Listener listener;
    private int longClickTimeout;
    private OnSizeChangeListener onSizeChangeListener;
    private Runnable postedClickStart;
    private Runnable postedLongClick;
    private ListPreloader preloader;
    private final RecyclerViewDelegate recyclerViewDelegate;
    private RecyclerToListViewScrollListener scrollListener;
    private float touchDownX;
    private float touchDownY;
    private int touchSlop;

    /* loaded from: classes3.dex */
    public interface Clickable {
        void onClick();
    }

    /* loaded from: classes3.dex */
    public interface DisableableClickable extends Clickable {
        boolean isEnabled();
    }

    /* loaded from: classes3.dex */
    public interface ExtendedListener extends Listener {
        void onScroll(int i, int i2, int i3);
    }

    /* loaded from: classes3.dex */
    public interface Listener {
        void onScrollStarted();

        void onScrolledToLastItem();
    }

    /* loaded from: classes3.dex */
    public interface LongClickable {
        boolean onLongClick();
    }

    /* loaded from: classes3.dex */
    public interface OnSizeChangeListener {
        void onSizeChange(int i, int i2, int i3, int i4);
    }

    /* loaded from: classes3.dex */
    public interface SelectorBoundsProvider {
        void getSelectorBounds(View view, Rect rect);
    }

    public UsableRecyclerView(Context context) {
        super(context);
        this.recyclerViewDelegate = new RecyclerViewDelegate(this);
        this.listener = null;
        this.highlightBounds = new Rect();
        this.emptyViewObserver = new RecyclerView.AdapterDataObserver() { // from class: me.grishka.appkit.views.UsableRecyclerView.1
            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onChanged() {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
                UsableRecyclerView.this.updateEmptyViewVisibility();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeInserted(int positionStart, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
                UsableRecyclerView.this.updateEmptyViewVisibility();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeRemoved(int positionStart, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
                UsableRecyclerView.this.updateEmptyViewVisibility();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeChanged(int positionStart, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeMoved(int fromPosition, int toPosition, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeChanged(int positionStart, int itemCount, Object payload) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
            }
        };
        this.drawHighlightOnTop = false;
        init();
    }

    public UsableRecyclerView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.recyclerViewDelegate = new RecyclerViewDelegate(this);
        this.listener = null;
        this.highlightBounds = new Rect();
        this.emptyViewObserver = new RecyclerView.AdapterDataObserver() { // from class: me.grishka.appkit.views.UsableRecyclerView.1
            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onChanged() {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
                UsableRecyclerView.this.updateEmptyViewVisibility();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeInserted(int positionStart, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
                UsableRecyclerView.this.updateEmptyViewVisibility();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeRemoved(int positionStart, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
                UsableRecyclerView.this.updateEmptyViewVisibility();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeChanged(int positionStart, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeMoved(int fromPosition, int toPosition, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeChanged(int positionStart, int itemCount, Object payload) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
            }
        };
        this.drawHighlightOnTop = false;
        init();
    }

    public UsableRecyclerView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.recyclerViewDelegate = new RecyclerViewDelegate(this);
        this.listener = null;
        this.highlightBounds = new Rect();
        this.emptyViewObserver = new RecyclerView.AdapterDataObserver() { // from class: me.grishka.appkit.views.UsableRecyclerView.1
            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onChanged() {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
                UsableRecyclerView.this.updateEmptyViewVisibility();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeInserted(int positionStart, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
                UsableRecyclerView.this.updateEmptyViewVisibility();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeRemoved(int positionStart, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
                UsableRecyclerView.this.updateEmptyViewVisibility();
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeChanged(int positionStart, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeMoved(int fromPosition, int toPosition, int itemCount) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
            }

            @Override // android.support.v7.widget.RecyclerView.AdapterDataObserver
            public void onItemRangeChanged(int positionStart, int itemCount, Object payload) {
                UsableRecyclerView.this.preloader.update(UsableRecyclerView.this.recyclerViewDelegate.getFirstVisiblePosition(), UsableRecyclerView.this.recyclerViewDelegate.getVisibleItemCount());
            }
        };
        this.drawHighlightOnTop = false;
        init();
    }

    private void init() {
        if (!isInEditMode()) {
            this.touchSlop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
            this.clickStartTimeout = ViewConfiguration.getTapTimeout();
            this.longClickTimeout = ViewConfiguration.getLongPressTimeout();
            TypedArray ta = getContext().obtainStyledAttributes(new int[]{16843534});
            setSelector(ta.getDrawable(0));
            ta.recycle();
            setRecycledViewPool(new AutoAssignMaxRecycledViewPool(25));
            this.recyclerViewDelegate.setOnScrollListener(new AbsListView.OnScrollListener() { // from class: me.grishka.appkit.views.UsableRecyclerView.2
                @Override // android.widget.AbsListView.OnScrollListener
                public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
                    if (firstVisibleItem + visibleItemCount >= totalItemCount - 1 && visibleItemCount != 0 && totalItemCount != 0 && UsableRecyclerView.this.listener != null) {
                        UsableRecyclerView.this.listener.onScrolledToLastItem();
                    }
                    if (UsableRecyclerView.this.listener != null && (UsableRecyclerView.this.listener instanceof ExtendedListener)) {
                        ((ExtendedListener) UsableRecyclerView.this.listener).onScroll(firstVisibleItem, visibleItemCount, totalItemCount);
                    }
                }

                @Override // android.widget.AbsListView.OnScrollListener
                public void onScrollStateChanged(AbsListView view, int scrollState) {
                    if (scrollState != 0 && scrollState == 1 && UsableRecyclerView.this.listener != null) {
                        UsableRecyclerView.this.listener.onScrollStarted();
                    }
                }
            });
            this.preloader = new ListPreloader(25);
            this.scrollListener = new RecyclerToListViewScrollListener(this.preloader);
            addOnScrollListener(this.scrollListener);
        }
    }

    @Override // android.support.v7.widget.RecyclerView, android.view.View
    public boolean onTouchEvent(MotionEvent e) {
        ViewHolder holder;
        if (e.getAction() == 0 && getScrollState() == 0) {
            float x = e.getX();
            this.lastTouchX = x;
            this.touchDownX = x;
            float y = e.getY();
            this.lastTouchY = y;
            this.touchDownY = y;
            this.highlightedView = null;
            View view = findChildViewUnder(e.getX(), e.getY());
            if (view != null && (holder = mo1205getChildViewHolder(view)) != null && (holder instanceof Clickable)) {
                if (((holder instanceof DisableableClickable) && ((DisableableClickable) holder).isEnabled()) || !(holder instanceof DisableableClickable)) {
                    this.clickingViewHolder = holder;
                    this.highlightedView = view;
                    if (this.postedClickStart != null) {
                        removeCallbacks(this.postedClickStart);
                    }
                    ClickStartRunnable clickStartRunnable = new ClickStartRunnable();
                    this.postedClickStart = clickStartRunnable;
                    postDelayed(clickStartRunnable, this.clickStartTimeout);
                }
                if (holder instanceof LongClickable) {
                    LongClickRunnable longClickRunnable = new LongClickRunnable();
                    this.postedLongClick = longClickRunnable;
                    postDelayed(longClickRunnable, this.longClickTimeout);
                }
            }
        }
        if (e.getAction() == 3) {
            this.clickingViewHolder = null;
            if (this.highlightedView != null) {
                this.highlightedView.setPressed(false);
                this.highlight.setState(EMPTY_STATE_SET);
                if (this.postedClickStart != null) {
                    removeCallbacks(this.postedClickStart);
                    this.postedClickStart = null;
                }
                if (this.postedLongClick != null) {
                    removeCallbacks(this.postedLongClick);
                    this.postedLongClick = null;
                }
            }
        }
        if (e.getAction() == 2 && this.clickingViewHolder != null) {
            this.lastTouchX = e.getX();
            this.lastTouchY = e.getY();
            if (Math.abs(e.getX() - this.touchDownX) > this.touchSlop || Math.abs(e.getY() - this.touchDownY) > this.touchSlop) {
                this.clickingViewHolder = null;
                if (this.highlightedView != null) {
                    this.highlightedView.setPressed(false);
                    this.highlight.setState(EMPTY_STATE_SET);
                    if (this.postedClickStart != null) {
                        removeCallbacks(this.postedClickStart);
                        this.postedClickStart = null;
                    }
                    if (this.postedLongClick != null) {
                        removeCallbacks(this.postedLongClick);
                        this.postedLongClick = null;
                    }
                }
            }
        }
        if (e.getAction() == 1) {
            this.lastTouchX = e.getX();
            this.lastTouchY = e.getY();
            if (this.postedLongClick != null) {
                removeCallbacks(this.postedLongClick);
                this.postedLongClick = null;
            }
            if (this.clickingViewHolder != null && (Math.abs(e.getX() - this.touchDownX) < this.touchSlop || Math.abs(e.getY() - this.touchDownY) < this.touchSlop)) {
                ((Clickable) this.clickingViewHolder).onClick();
                playSoundEffect(0);
                if (this.postedClickStart != null) {
                    removeCallbacks(this.postedClickStart);
                    this.postedClickStart.run();
                    this.postedClickStart = null;
                }
                this.clickingViewHolder = null;
                postDelayed(new Runnable() { // from class: me.grishka.appkit.views.UsableRecyclerView.3
                    @Override // java.lang.Runnable
                    public void run() {
                        if (UsableRecyclerView.this.highlightedView != null) {
                            UsableRecyclerView.this.highlightedView.setPressed(false);
                        }
                        UsableRecyclerView.this.highlight.setState(UsableRecyclerView.EMPTY_STATE_SET);
                    }
                }, 50L);
            }
        }
        try {
            return super.onTouchEvent(e);
        } catch (Exception error) {
            Log.e("error", "error", error);
            return false;
        }
    }

    public void setSelector(@DrawableRes int drawableRes) {
        setSelector(getResources().getDrawable(drawableRes));
    }

    public void setSelector(Drawable selector) {
        if (this.highlight != null) {
            this.highlight.setCallback(null);
        }
        this.highlight = selector;
        if (this.highlight != null) {
            this.highlight.setCallback(this);
        }
    }

    public void setDrawSelectorOnTop(boolean drawOnTop) {
        this.drawHighlightOnTop = drawOnTop;
    }

    public void setSelectorBoundsProvider(SelectorBoundsProvider provider) {
        this.highlightBoundsProvider = provider;
    }

    public OnSizeChangeListener getOnSizeChangeListener() {
        return this.onSizeChangeListener;
    }

    public void setOnSizeChangeListener(OnSizeChangeListener onSizeChangeListener) {
        this.onSizeChangeListener = onSizeChangeListener;
    }

    @Override // android.support.v7.widget.RecyclerView, android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (this.onSizeChangeListener != null) {
            this.onSizeChangeListener.onSizeChange(w, h, oldw, oldh);
        }
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return super.verifyDrawable(who) || who == this.highlight;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        if (this.drawHighlightOnTop) {
            super.dispatchDraw(canvas);
        }
        if (this.highlight != null) {
            if (this.highlightedView != null) {
                if (this.highlightBoundsProvider != null) {
                    this.highlightBoundsProvider.getSelectorBounds(this.highlightedView, this.highlightBounds);
                } else {
                    this.highlightBounds.set(this.highlightedView.getLeft(), this.highlightedView.getTop(), this.highlightedView.getRight(), this.highlightedView.getBottom());
                }
            }
            this.highlight.setBounds(this.highlightBounds);
            if (Build.VERSION.SDK_INT >= 21) {
                this.highlight.setHotspot(this.lastTouchX, this.lastTouchY);
            }
            this.highlight.draw(canvas);
        }
        if (!this.drawHighlightOnTop) {
            super.dispatchDraw(canvas);
        }
    }

    public void setEmptyView(View view) {
        this.emptyView = view;
        updateEmptyViewVisibility();
    }

    public boolean isEmpty() {
        return mo1204getAdapter() != null && mo1204getAdapter().getItemCount() == 0;
    }

    @Override // android.support.v7.widget.RecyclerView
    public void setAdapter(RecyclerView.Adapter adapter) {
        if (isInEditMode()) {
            super.setAdapter(adapter);
            return;
        }
        if (mo1204getAdapter() != null) {
            mo1204getAdapter().unregisterAdapterDataObserver(this.emptyViewObserver);
        }
        if (adapter instanceof PrefetchInfoProvider) {
            this.preloader.setProvider((PrefetchInfoProvider) adapter);
        }
        RecyclerView.Adapter adapter2 = adapter == null ? null : new RecyclerViewAdapterWrapper((Adapter) adapter);
        super.setAdapter(adapter2);
        if (adapter2 != null) {
            adapter2.registerAdapterDataObserver(this.emptyViewObserver);
        }
        updateEmptyViewVisibility();
    }

    public void addFooterView(View view) {
        view.setLayoutParams(new RecyclerView.LayoutParams(-1, -2));
        if (this.footerAdapter == null) {
            this.footerAdapter = new FooterRecyclerAdapter(mo1204getAdapter());
            this.footerAdapter.footerViews.add(view);
            super.setAdapter(this.footerAdapter);
            return;
        }
        this.footerAdapter.footerViews.add(view);
        this.footerAdapter.notifyDataSetChanged();
    }

    @Override // android.support.v7.widget.RecyclerView
    /* renamed from: getAdapter  reason: collision with other method in class */
    public Adapter mo1204getAdapter() {
        Adapter adapter = (Adapter) super.mo1204getAdapter();
        if (adapter instanceof FooterRecyclerAdapter) {
            return ((FooterRecyclerAdapter) adapter).wrapped;
        }
        if (adapter instanceof RecyclerViewAdapterWrapper) {
            return ((RecyclerViewAdapterWrapper) adapter).wrapped;
        }
        return adapter;
    }

    public int getCount() {
        Adapter adapter = mo1204getAdapter();
        if (adapter != null) {
            return adapter.getItemCount();
        }
        return 0;
    }

    public void addScrollListener(AbsListView.OnScrollListener scrollListener) {
        this.scrollListener.addScrollListener(scrollListener);
    }

    public void removeScrollListener(AbsListView.OnScrollListener scrollListener) {
        this.scrollListener.removeScrollListener(scrollListener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateEmptyViewVisibility() {
        if (this.emptyView != null) {
            this.emptyView.setVisibility(isEmpty() ? 0 : 8);
        }
    }

    @Override // android.support.v7.widget.RecyclerView
    /* renamed from: getChildViewHolder  reason: collision with other method in class */
    public ViewHolder mo1205getChildViewHolder(View child) {
        return (ViewHolder) super.mo1205getChildViewHolder(child);
    }

    @Override // android.support.v7.widget.RecyclerView
    /* renamed from: findViewHolderForAdapterPosition  reason: collision with other method in class */
    public ViewHolder mo1203findViewHolderForAdapterPosition(int position) {
        return (ViewHolder) super.mo1203findViewHolderForAdapterPosition(position);
    }

    public void setListener(@Nullable Listener listener) {
        this.listener = listener;
    }

    /* loaded from: classes3.dex */
    public static abstract class Adapter<VH extends ViewHolder> extends RecyclerView.Adapter<VH> implements PrefetchInfoProvider {
        public int getImageCountForItem(int position) {
            return 0;
        }

        public String getImageURL(int position, int image) {
            return null;
        }
    }

    /* loaded from: classes3.dex */
    public static class ViewHolder extends RecyclerView.ViewHolder {
        public ViewHolder(View itemView) {
            super(itemView);
        }
    }

    /* loaded from: classes3.dex */
    private class ClickStartRunnable implements Runnable {
        private ClickStartRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (UsableRecyclerView.this.clickingViewHolder != null) {
                UsableRecyclerView.this.postedClickStart = null;
                UsableRecyclerView.this.highlightedView.setPressed(true);
                UsableRecyclerView.this.highlight.setState(UsableRecyclerView.PRESSED_ENABLED_FOCUSED_STATE_SET);
            }
        }
    }

    /* loaded from: classes3.dex */
    private class LongClickRunnable implements Runnable {
        private LongClickRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (UsableRecyclerView.this.clickingViewHolder != null) {
                UsableRecyclerView.this.postedLongClick = null;
                UsableRecyclerView.this.highlightedView.setPressed(false);
                UsableRecyclerView.this.highlight.setState(UsableRecyclerView.EMPTY_STATE_SET);
                boolean result = ((LongClickable) UsableRecyclerView.this.clickingViewHolder).onLongClick();
                if (result) {
                    UsableRecyclerView.this.performHapticFeedback(0);
                }
                UsableRecyclerView.this.clickingViewHolder = null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class FooterRecyclerAdapter extends RecyclerViewAdapterWrapper {
        private static final int FOOTER_TYPE_FIRST = -1000;
        private ArrayList<View> footerViews;

        public FooterRecyclerAdapter(Adapter<ViewHolder> wrapped) {
            super(wrapped);
            this.footerViews = new ArrayList<>();
        }

        @Override // me.grishka.appkit.views.RecyclerViewAdapterWrapper, android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.wrapped.getItemCount() + this.footerViews.size();
        }

        @Override // me.grishka.appkit.views.RecyclerViewAdapterWrapper, android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            if (position < this.wrapped.getItemCount()) {
                return this.wrapped.getItemId(position);
            }
            return 0L;
        }

        @Override // me.grishka.appkit.views.RecyclerViewAdapterWrapper, android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return position < this.wrapped.getItemCount() ? this.wrapped.getItemViewType(position) : (position - 1000) - this.wrapped.getItemCount();
        }

        @Override // me.grishka.appkit.views.RecyclerViewAdapterWrapper, android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(ViewHolder holder, int position) {
            if (position < this.wrapped.getItemCount()) {
                super.onBindViewHolder(holder, position);
            }
        }

        @Override // me.grishka.appkit.views.RecyclerViewAdapterWrapper, android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            if (viewType < -1000 || viewType >= this.footerViews.size() - 1000) {
                return (ViewHolder) this.wrapped.mo1206onCreateViewHolder(parent, viewType);
            }
            int footerIndex = viewType + 1000;
            return new FooterViewHolder(this.footerViews.get(footerIndex));
        }

        @Override // me.grishka.appkit.views.RecyclerViewAdapterWrapper, android.support.v7.widget.RecyclerView.Adapter
        public boolean onFailedToRecycleView(ViewHolder holder) {
            return !(holder instanceof FooterViewHolder) && this.wrapped.onFailedToRecycleView(holder);
        }

        @Override // me.grishka.appkit.views.RecyclerViewAdapterWrapper, android.support.v7.widget.RecyclerView.Adapter
        public void onViewAttachedToWindow(ViewHolder holder) {
            if (!(holder instanceof FooterViewHolder)) {
                this.wrapped.onViewAttachedToWindow(holder);
            }
        }

        @Override // me.grishka.appkit.views.RecyclerViewAdapterWrapper, android.support.v7.widget.RecyclerView.Adapter
        public void onViewDetachedFromWindow(ViewHolder holder) {
            if (!(holder instanceof FooterViewHolder)) {
                this.wrapped.onViewDetachedFromWindow(holder);
            }
        }

        @Override // me.grishka.appkit.views.RecyclerViewAdapterWrapper, android.support.v7.widget.RecyclerView.Adapter
        public void onViewRecycled(ViewHolder holder) {
            if (!(holder instanceof FooterViewHolder)) {
                this.wrapped.onViewRecycled(holder);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class FooterViewHolder extends ViewHolder {
        public FooterViewHolder(View itemView) {
            super(itemView);
        }
    }
}
