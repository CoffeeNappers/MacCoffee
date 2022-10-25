package com.vkontakte.android.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
/* loaded from: classes3.dex */
public abstract class RenderView<T> extends View {
    protected T mData;
    private boolean mLayoutRequired;
    private int mWidth;

    protected abstract void bind(T t);

    protected abstract void layout(int i);

    public RenderView(Context context) {
        super(context);
    }

    public RenderView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public RenderView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @TargetApi(21)
    public RenderView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        int width = right - left;
        if (width != this.mWidth && changed) {
            this.mWidth = width;
            this.mLayoutRequired = true;
        }
        if (this.mLayoutRequired && this.mData != null) {
            layout(this.mWidth);
            this.mLayoutRequired = false;
        }
    }

    public View set(T data) {
        this.mData = data;
        bind(this.mData);
        if (this.mWidth != 0) {
            layout(this.mWidth);
            this.mLayoutRequired = false;
        } else {
            this.mLayoutRequired = true;
        }
        invalidate();
        return this;
    }
}
