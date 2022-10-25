package com.vk.attachpicker.widget;

import android.content.Context;
import android.view.View;
/* loaded from: classes2.dex */
public abstract class ViewHolder<T> {
    public int position;
    public int type;

    public abstract void clear();

    public abstract View initialize(Context context, int i);

    public abstract void update(Context context, int i, int i2, T t);

    public View getView(Context context, View view, int pos, int viewType, T data) {
        if (view == null || this.type != viewType) {
            view = initialize(context, viewType);
            view.setTag(this);
            this.type = viewType;
        }
        this.position = pos;
        update(context, pos, viewType, data);
        return view;
    }
}
