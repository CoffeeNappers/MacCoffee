package com.vkontakte.android.ui.posts;

import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
/* loaded from: classes3.dex */
public class PostHighlightDrawable extends LayerDrawable {
    public int extendBottom;
    public int extendTop;
    private Paint paint;

    public PostHighlightDrawable(Drawable[] layers) {
        super(layers);
        this.extendTop = 0;
        this.extendBottom = 0;
    }

    @Override // android.graphics.drawable.Drawable
    public void setBounds(Rect rect) {
        Rect nrect = new Rect(rect);
        nrect.bottom += this.extendBottom;
        nrect.top -= this.extendTop;
        super.setBounds(nrect);
    }
}
