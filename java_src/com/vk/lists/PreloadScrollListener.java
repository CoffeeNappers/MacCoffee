package com.vk.lists;

import android.support.v7.widget.RecyclerView;
import com.vk.lists.PaginateHelper;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class PreloadScrollListener extends RecyclerViewScrollDetector {
    private final PreloadCallback preloadCallback;
    private final int preloadCount;
    private final PaginateHelper.DataInfoProvider preloadInfoProvider;
    private int itemsCount = -1;
    private int firstVisible = -1;
    private int lastVisible = -1;

    public PreloadScrollListener(int preloadCount, PreloadCallback preloadCallback, PaginateHelper.DataInfoProvider preloadInfoProvider) {
        this.preloadCount = preloadCount;
        this.preloadCallback = preloadCallback;
        this.preloadInfoProvider = preloadInfoProvider;
    }

    @Override // com.vk.lists.RecyclerViewScrollDetector, android.support.v7.widget.RecyclerView.OnScrollListener
    public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
        int _firstVisible;
        int _lastVisible;
        int firstVisibleItem = PaginationUtil.getFirstVisiblePosition(recyclerView);
        int lastVisiblePosition = PaginationUtil.getLastVisiblePosition(recyclerView);
        int realItemCount = this.preloadInfoProvider.getItemsCount();
        if (firstVisibleItem < 0) {
            _firstVisible = 0;
        } else {
            _firstVisible = firstVisibleItem;
        }
        if (lastVisiblePosition < 0) {
            _lastVisible = 0;
        } else if (lastVisiblePosition < realItemCount) {
            _lastVisible = lastVisiblePosition;
        } else {
            _lastVisible = realItemCount - 1;
        }
        if (this.itemsCount != realItemCount || this.firstVisible != _firstVisible || this.lastVisible != _lastVisible) {
            this.itemsCount = realItemCount;
            this.firstVisible = _firstVisible;
            this.lastVisible = _lastVisible;
            super.onScrolled(recyclerView, dx, dy);
        }
    }

    @Override // com.vk.lists.RecyclerViewScrollDetector
    public void onScrollUp() {
        int preloadPosition;
        if (this.itemsCount != 0) {
            for (int i = 0; i < this.preloadCount && (preloadPosition = this.lastVisible + i) < this.itemsCount; i++) {
                try {
                    this.preloadCallback.preload(preloadPosition);
                } catch (Exception e) {
                }
            }
        }
    }

    @Override // com.vk.lists.RecyclerViewScrollDetector
    public void onScrollDown() {
        int preloadPosition;
        if (this.itemsCount != 0) {
            for (int i = 0; i < this.preloadCount && (preloadPosition = this.firstVisible - i) >= 0; i++) {
                try {
                    this.preloadCallback.preload(preloadPosition);
                } catch (Exception e) {
                }
            }
        }
    }
}
