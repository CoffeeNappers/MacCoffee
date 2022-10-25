package com.my.target.core.ui.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import com.my.target.nativeads.models.ImageData;
/* loaded from: classes2.dex */
public class FitBitmapImageView extends ImageView {
    private Bitmap a;
    private int b;
    private int c;

    public FitBitmapImageView(Context context) {
        super(context);
    }

    public FitBitmapImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public FitBitmapImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public void setImageData(ImageData imageData) {
        if (imageData != null) {
            setScaleType(ImageView.ScaleType.FIT_XY);
            this.a = imageData.getBitmap();
            this.b = imageData.getHeight();
            this.c = imageData.getWidth();
            setImageBitmap(this.a);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int i, int i2) {
        int i3;
        int i4;
        float f = 0.0f;
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i2);
        int i5 = mode == 0 ? Integer.MIN_VALUE : mode;
        if (mode2 == 0) {
            mode2 = Integer.MIN_VALUE;
        }
        if (this.a != null) {
            i3 = this.a.getWidth();
            i4 = this.a.getHeight();
        } else if (this.b != 0 && this.c != 0) {
            i3 = this.c;
            i4 = this.b;
        } else {
            super.onMeasure(i, i2);
            return;
        }
        float f2 = i4 != 0 ? i3 / i4 : 0.0f;
        if (size2 != 0) {
            f = size / size2;
        }
        if (i5 == 1073741824 && mode2 == 1073741824) {
            setMeasuredDimension(size, size2);
        } else if (i5 == Integer.MIN_VALUE && mode2 == Integer.MIN_VALUE) {
            if (f2 < f) {
                int min = Math.min(i4, size2);
                setMeasuredDimension(Math.round(min * f2), min);
                return;
            }
            int min2 = Math.min(i3, size2);
            setMeasuredDimension(min2, Math.round(min2 / f2));
        } else if (i5 == Integer.MIN_VALUE && mode2 == 1073741824) {
            setMeasuredDimension(Math.round(size2 * f2), size2);
        } else if (i5 == 1073741824 && mode2 == Integer.MIN_VALUE) {
            setMeasuredDimension(size, Math.round(size / f2));
        }
    }
}
