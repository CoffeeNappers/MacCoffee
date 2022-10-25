package com.my.target.core.ui.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.my.target.core.resources.a;
import com.my.target.core.utils.l;
/* loaded from: classes2.dex */
public class PageDotsView extends LinearLayout {
    private Bitmap a;
    private Bitmap b;
    private ImageView[] c;
    private int d;

    public PageDotsView(Context context) {
        super(context);
    }

    public final void a(int i, int i2, int i3) {
        l lVar = new l(getContext());
        this.a = a.a(lVar.a(12), i3);
        this.b = a.a(lVar.a(12), i2);
        this.c = new ImageView[i];
        for (int i4 = 0; i4 < i; i4++) {
            this.c[i4] = new ImageView(getContext());
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
            layoutParams.setMargins(lVar.a(5), lVar.a(5), lVar.a(5), lVar.a(5));
            this.c[i4].setLayoutParams(layoutParams);
            this.c[i4].setImageBitmap(this.b);
            addView(this.c[i4]);
        }
    }

    public final void a(int i) {
        if (i >= 0 && i < this.c.length && this.d < this.c.length) {
            this.c[this.d].setImageBitmap(this.b);
            this.c[i].setImageBitmap(this.a);
            this.d = i;
        }
    }
}
