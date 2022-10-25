package me.grishka.appkit.utils;

import android.view.View;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class Preloader<T> {
    private Callback<T> callback;
    private View footerError;
    private View footerProgress;
    private int itemsPerPage;
    protected boolean moreAvailable;
    protected boolean preloadOnReady;
    protected boolean preloading;
    protected ArrayList<T> data = new ArrayList<>();
    protected ArrayList<T> preloadedData = new ArrayList<>();
    private boolean footerVisible = true;

    /* loaded from: classes3.dex */
    public interface Callback<T> {
        boolean isDataLoading();

        boolean isRefreshing();

        void loadData(int i, int i2);

        void onAppendItems(List<T> list);

        void onClearItems();

        void updateList();
    }

    public Preloader(Callback<T> callback, int itemsPerPage) {
        this.callback = callback;
        this.itemsPerPage = itemsPerPage;
    }

    public ArrayList<T> getData() {
        return this.data;
    }

    public ArrayList<T> getPreloadedData() {
        return this.preloadedData;
    }

    public void setMoreAvailable(boolean a) {
        this.moreAvailable = a;
    }

    public boolean isMoreAvailable() {
        return this.moreAvailable;
    }

    public void setFooterViews(View progress, View error) {
        this.footerProgress = progress;
        this.footerError = error;
        if (this.footerProgress != null && this.footerError != null) {
            this.footerProgress.setVisibility(this.moreAvailable ? 0 : 8);
            if (this.footerVisible != this.moreAvailable) {
                this.footerVisible = this.moreAvailable;
            }
        }
    }

    public void onScrolledToLastItem() {
        if (!this.callback.isDataLoading() || this.preloading) {
            if (this.preloading) {
                this.preloading = false;
                this.preloadOnReady = true;
            } else if (this.preloadedData.size() > 0) {
                this.data.addAll(this.preloadedData);
                this.callback.onAppendItems(this.preloadedData);
                this.callback.updateList();
                this.preloadedData.clear();
                if (this.moreAvailable) {
                    this.preloading = true;
                    this.callback.loadData(this.data.size(), this.itemsPerPage);
                }
            } else if (this.moreAvailable) {
                this.callback.loadData(this.data.size(), this.itemsPerPage * 2);
            }
        }
    }

    public boolean isFooterVisible() {
        return this.footerVisible;
    }

    public void onDataLoaded(List<T> d, boolean more) {
        int i = 0;
        if (this.callback.isRefreshing()) {
            this.data.clear();
            this.preloadedData.clear();
            this.callback.onClearItems();
        }
        if (this.preloading) {
            this.preloadedData.addAll(d);
        } else if (d.size() > this.itemsPerPage && more) {
            this.data.addAll(d.subList(0, this.itemsPerPage));
            this.callback.onAppendItems(d.subList(0, this.itemsPerPage));
            this.preloadedData.addAll(d.subList(this.itemsPerPage, d.size()));
        } else {
            this.data.addAll(d);
            this.callback.onAppendItems(d);
        }
        this.preloading = false;
        if (this.preloadOnReady) {
            this.preloading = true;
            this.preloadOnReady = false;
            this.callback.loadData(this.data.size(), this.itemsPerPage * 2);
        }
        this.callback.updateList();
        this.moreAvailable = more;
        if (this.footerProgress != null) {
            View view = this.footerProgress;
            if (!this.moreAvailable) {
                i = 8;
            }
            view.setVisibility(i);
            if (this.footerVisible != this.moreAvailable) {
                this.footerVisible = this.moreAvailable;
            }
        }
    }
}
