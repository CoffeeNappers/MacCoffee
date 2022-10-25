package com.google.android.gms.internal;

import android.graphics.Canvas;
import android.net.Uri;
import android.widget.ImageView;
/* loaded from: classes2.dex */
public final class zzsk extends ImageView {
    private Uri Dc;
    private int Dd;

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
    }

    public int zzauy() {
        return this.Dd;
    }

    public void zzgi(int i) {
        this.Dd = i;
    }

    public void zzr(Uri uri) {
        this.Dc = uri;
    }
}
