package com.vk.music.view;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
/* loaded from: classes2.dex */
public final class LastReachedScrollListener extends RecyclerView.OnScrollListener {
    private int lastVisible;
    @NonNull
    private final LinearLayoutManager layoutManager;
    @Nullable
    private OnLastReachedListener listener;

    /* loaded from: classes2.dex */
    public interface OnLastReachedListener {
        void onLastReached();
    }

    public LastReachedScrollListener(@NonNull LinearLayoutManager layoutManager) {
        this.layoutManager = layoutManager;
    }

    public void setListener(@Nullable OnLastReachedListener listener) {
        this.listener = listener;
    }

    @Override // android.support.v7.widget.RecyclerView.OnScrollListener
    public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
        int lastVisiblePosition = this.layoutManager.findLastVisibleItemPosition();
        if (lastVisiblePosition == recyclerView.mo1204getAdapter().getItemCount() - 1) {
            if (lastVisiblePosition != this.lastVisible) {
                this.lastVisible = lastVisiblePosition;
                if (this.listener != null) {
                    this.listener.onLastReached();
                    return;
                }
                return;
            }
            return;
        }
        this.lastVisible = lastVisiblePosition;
    }
}
