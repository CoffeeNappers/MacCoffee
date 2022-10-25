package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.AbsListView;
import android.widget.ListView;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class FixedScrollListView extends ListView {
    private static final int SCROLLBAR_SIZE = 200;
    private AbsListView.OnScrollListener onScrollListener;
    private AbsListView.OnScrollListener onScrollListenerLogic;
    private List<AbsListView.OnScrollListener> onScrollListeners;

    public FixedScrollListView(Context context) {
        super(context);
        this.onScrollListenerLogic = null;
        this.onScrollListener = null;
        this.onScrollListeners = null;
    }

    public FixedScrollListView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.onScrollListenerLogic = null;
        this.onScrollListener = null;
        this.onScrollListeners = null;
    }

    public FixedScrollListView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.onScrollListenerLogic = null;
        this.onScrollListener = null;
        this.onScrollListeners = null;
    }

    @Override // android.widget.AbsListView, android.view.View
    public int computeVerticalScrollExtent() {
        if (super.computeVerticalScrollExtent() < super.computeVerticalScrollRange()) {
            return 200;
        }
        return super.computeVerticalScrollExtent();
    }

    @Override // android.widget.AbsListView, android.view.View
    public int computeVerticalScrollOffset() {
        int maxscroll = (super.computeVerticalScrollRange() - super.computeVerticalScrollExtent()) - 100;
        int offset = Math.max(super.computeVerticalScrollOffset(), 0);
        float scp = offset / maxscroll;
        return (int) ((super.computeVerticalScrollRange() - 200) * scp);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<AbsListView.OnScrollListener> getOnScrollListeners() {
        if (this.onScrollListeners == null) {
            this.onScrollListeners = new ArrayList();
        }
        return this.onScrollListeners;
    }

    public AbsListView.OnScrollListener getOnScrollListenerLogic() {
        if (this.onScrollListenerLogic == null) {
            this.onScrollListenerLogic = new AbsListView.OnScrollListener() { // from class: com.vkontakte.android.ui.FixedScrollListView.1
                @Override // android.widget.AbsListView.OnScrollListener
                public void onScrollStateChanged(AbsListView view, int scrollState) {
                    if (FixedScrollListView.this.onScrollListener != null) {
                        FixedScrollListView.this.onScrollListener.onScrollStateChanged(view, scrollState);
                    }
                    for (AbsListView.OnScrollListener listener : FixedScrollListView.this.getOnScrollListeners()) {
                        if (listener != null) {
                            listener.onScrollStateChanged(view, scrollState);
                        }
                    }
                }

                @Override // android.widget.AbsListView.OnScrollListener
                public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
                    if (FixedScrollListView.this.onScrollListener != null) {
                        FixedScrollListView.this.onScrollListener.onScroll(view, firstVisibleItem, visibleItemCount, totalItemCount);
                    }
                    for (AbsListView.OnScrollListener listener : FixedScrollListView.this.getOnScrollListeners()) {
                        if (listener != null) {
                            listener.onScroll(view, firstVisibleItem, visibleItemCount, totalItemCount);
                        }
                    }
                }
            };
        }
        return this.onScrollListenerLogic;
    }

    @Override // android.widget.AbsListView
    public void setOnScrollListener(AbsListView.OnScrollListener l) {
        this.onScrollListener = l;
        super.setOnScrollListener(getOnScrollListenerLogic());
    }

    public void addOnScrollListener(AbsListView.OnScrollListener l) {
        getOnScrollListeners().add(l);
        super.setOnScrollListener(getOnScrollListenerLogic());
    }

    public void removeOnScrollListener(AbsListView.OnScrollListener l) {
        getOnScrollListeners().remove(l);
    }
}
