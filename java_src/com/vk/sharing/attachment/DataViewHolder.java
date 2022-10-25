package com.vk.sharing.attachment;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
/* compiled from: AttachmentViewHolder.java */
/* loaded from: classes2.dex */
abstract class DataViewHolder implements AttachmentViewHolder {
    @Nullable
    private final Bundle data;

    @NonNull
    abstract View createView(@NonNull Context context, @NonNull ViewGroup viewGroup);

    /* JADX INFO: Access modifiers changed from: package-private */
    public DataViewHolder(@Nullable Bundle data) {
        this.data = data;
    }

    @Nullable
    Bundle getData() {
        return this.data;
    }

    @Override // com.vk.sharing.attachment.AttachmentViewHolder
    @NonNull
    public final View create(@NonNull Context context, @NonNull ViewGroup parent) {
        View view = createView(context, parent);
        Bundle data = getData();
        if (data != null) {
            bind(data);
        }
        return view;
    }
}
