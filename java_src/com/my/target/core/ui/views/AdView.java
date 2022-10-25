package com.my.target.core.ui.views;

import android.content.Context;
import android.view.View;
import android.widget.RelativeLayout;
/* loaded from: classes2.dex */
public class AdView extends RelativeLayout {
    private int a;
    private int b;
    private int c;
    private float d;

    public AdView(Context context) {
        super(context);
        this.a = 0;
        this.b = 0;
        this.c = 0;
        this.d = 0.0f;
    }

    public void setDesiredSize(int i, int i2) {
        this.a = i;
        this.c = i2;
        if (i <= 0 || i2 <= 0) {
            this.d = 0.0f;
        } else {
            this.d = i / i2;
        }
    }

    public void setMaxWidth(int i) {
        this.b = i;
    }

    @Override // android.widget.RelativeLayout, android.view.View
    protected void onMeasure(int i, int i2) {
        int i3;
        int size = View.MeasureSpec.getSize(i);
        int size2 = View.MeasureSpec.getSize(i2);
        if (this.d > 0.0f && size > 0 && size2 > 0) {
            float f = size / size2;
            int i4 = this.a;
            int i5 = this.c;
            if (i4 <= size && i5 <= size2) {
                i3 = i4;
            } else if (f > this.d) {
                i3 = (int) (size2 * this.d);
                i5 = size2;
            } else {
                i5 = (int) (size / this.d);
                i3 = size;
            }
            super.onMeasure(View.MeasureSpec.makeMeasureSpec(i3, 1073741824), View.MeasureSpec.makeMeasureSpec(i5, 1073741824));
        } else if (size > 0 && size2 > 0) {
            if (this.b > 0 && size > this.b) {
                size = this.b;
            }
            super.onMeasure(View.MeasureSpec.makeMeasureSpec(size, 1073741824), View.MeasureSpec.makeMeasureSpec(size2, 1073741824));
        } else {
            super.onMeasure(i, i2);
        }
    }
}
