package com.vk.music.view.adapter;

import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.functions.VoidF;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public final class ViewAdapter extends UsableRecyclerView.Adapter {
    private final VoidF binder;
    private boolean enabled;
    private final F1<View, ViewGroup> factory;
    private final int viewType;

    public ViewAdapter(@NonNull F1<View, ViewGroup> factory, @Nullable VoidF binder, int viewType) {
        this.enabled = true;
        this.factory = factory;
        this.binder = binder;
        this.viewType = viewType;
    }

    public ViewAdapter(@NonNull F1<View, ViewGroup> factory, int viewType) {
        this(factory, (VoidF) null, viewType);
    }

    public ViewAdapter(@NonNull LayoutInflater inflater, @LayoutRes int layout, int viewType) {
        this(ViewAdapter$$Lambda$1.lambdaFactory$(inflater, layout), (VoidF) null, viewType);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder */
    public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return new UsableRecyclerView.ViewHolder(this.factory.f(parent));
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        if (this.binder != null) {
            this.binder.f();
        }
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.enabled ? 1 : 0;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        return this.viewType;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        return -this.viewType;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
        notifyDataSetChanged();
    }
}
