package com.vkontakte.android.api.models;

import android.support.annotation.Nullable;
import android.util.SparseArray;
/* loaded from: classes.dex */
public abstract class Model {
    private Object mTag;
    private SparseArray mTags;

    public final void setTag(@Nullable Object tag) {
        this.mTag = tag;
    }

    public final void setTag(int id, @Nullable Object tag) {
        if (this.mTags == null) {
            this.mTags = new SparseArray();
        }
        this.mTags.put(id, tag);
    }

    @Nullable
    public final Object getTag() {
        return this.mTag;
    }

    @Nullable
    public final Object getTag(int id) {
        if (this.mTags == null) {
            return null;
        }
        return this.mTags.get(id);
    }
}
