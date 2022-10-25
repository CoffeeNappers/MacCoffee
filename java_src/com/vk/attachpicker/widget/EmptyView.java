package com.vk.attachpicker.widget;

import android.content.Context;
import android.view.View;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class EmptyView extends View {
    int cellHeight;

    public EmptyView(Context context) {
        this(context, Screen.width());
    }

    public EmptyView(Context context, int height) {
        super(context);
        this.cellHeight = height;
    }

    public void setRealHeight(int height) {
        this.cellHeight = height;
        requestLayout();
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, View.MeasureSpec.makeMeasureSpec(this.cellHeight, 1073741824));
    }
}
