package com.vkontakte.android.ui.holder.commons;

import android.support.annotation.NonNull;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class LoaderHolder extends RecyclerHolder<Object> {
    public LoaderHolder(@NonNull ViewGroup parent) {
        super((int) R.layout.apps_loader, parent);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Object item) {
        this.itemView.requestLayout();
    }
}
