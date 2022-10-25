package com.my.target.core.ui.views.fsslider;

import android.content.Context;
import android.graphics.Bitmap;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.my.target.core.ui.views.BorderedTextView;
import com.my.target.core.utils.l;
/* loaded from: classes2.dex */
public class FSSliderAppwallImageView extends FrameLayout {
    private final int a;
    private final int b;
    private final l c;
    private final ImageView d;
    private final RelativeLayout e;
    private final FrameLayout.LayoutParams f;
    private BorderedTextView g;
    private int h;
    private int i;

    public void setImage(Bitmap bitmap) {
        this.d.setImageBitmap(bitmap);
        if (getResources().getConfiguration().orientation == 2) {
            setPadding(this.a, this.a, this.a, this.a);
        } else {
            setPadding(this.b, this.b, this.b, this.b);
        }
        this.h = bitmap.getWidth();
        this.i = bitmap.getHeight();
    }

    public FSSliderAppwallImageView(Context context, int i) {
        super(context);
        this.c = new l(context);
        this.e = new RelativeLayout(context);
        this.d = new ImageView(getContext());
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(13, -1);
        this.d.setLayoutParams(layoutParams);
        this.d.setScaleType(ImageView.ScaleType.FIT_XY);
        this.a = this.c.a(16);
        this.b = this.c.a(8);
        this.f = new FrameLayout.LayoutParams(-2, -2);
        this.f.gravity = 17;
        addView(this.e, this.f);
        this.e.addView(this.d);
        this.e.setBackgroundColor(i);
        setClipToPadding(false);
        if (l.c(21)) {
            this.e.setElevation(this.c.a(4));
        }
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int i, int i2) {
        int size = (View.MeasureSpec.getSize(i) - getPaddingLeft()) - getPaddingRight();
        if (this.h > 0) {
            this.i = (int) ((size * this.i) / this.h);
            this.h = size;
        }
        this.f.width = this.h;
        this.f.height = this.i;
        this.e.setLayoutParams(this.f);
        super.onMeasure(i, i2);
    }

    public void setAgeRestrictions(String str) {
        if (this.g == null) {
            this.g = new BorderedTextView(getContext());
            this.g.setBorder(1, -7829368);
            this.g.setPadding(this.c.a(2), 0, 0, 0);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.setMargins(this.c.a(8), this.c.a(20), this.c.a(8), this.c.a(20));
            this.g.setLayoutParams(layoutParams);
            this.g.setTextColor(-1118482);
            this.g.setBorder(1, -1118482, this.c.a(3));
            this.g.setBackgroundColor(1711276032);
            this.e.addView(this.g);
        }
        this.g.setText(str);
    }
}
