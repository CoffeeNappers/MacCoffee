package com.my.target.core.ui.views.fspromo;

import android.content.Context;
import android.graphics.Bitmap;
import android.view.View;
import android.widget.RelativeLayout;
import com.my.target.core.models.banners.g;
import com.my.target.core.ui.views.controls.IconButton;
import com.my.target.core.ui.views.video.VideoTextureView;
import com.my.target.core.utils.l;
/* loaded from: classes2.dex */
public abstract class FSPromoView extends RelativeLayout {
    static final int a = l.a();
    float b;
    private int c;
    private final Bitmap d;
    private final Bitmap e;

    /* loaded from: classes2.dex */
    public interface a {
        void a();

        void b();

        void c();
    }

    public abstract void a(int i);

    public abstract void a(boolean z);

    public abstract boolean a();

    public abstract IconButton b();

    public abstract void c();

    public abstract void d();

    public abstract void e();

    public abstract void f();

    public abstract boolean g();

    public abstract void h();

    public abstract void setCloseListener(View.OnClickListener onClickListener);

    public abstract void setOnCTAClickListener(View.OnClickListener onClickListener);

    public abstract void setOnVideoClickListener(a aVar);

    public abstract void setTimeChanged(float f);

    public abstract void setVideoListener(VideoTextureView.a aVar);

    public void setBanner(g gVar) {
        if (gVar.a() != null) {
            this.b = gVar.a().f();
        }
        if (b() != null) {
            b().setBitmap(this.d, false);
        }
    }

    public FSPromoView(Context context) {
        super(context);
        l lVar = new l(context);
        this.d = com.my.target.core.resources.a.e(lVar.a(28));
        this.e = com.my.target.core.resources.a.c(lVar.a(28));
    }

    @Override // android.widget.RelativeLayout, android.view.View
    protected void onMeasure(int i, int i2) {
        int i3;
        if (View.MeasureSpec.getSize(i) / View.MeasureSpec.getSize(i2) > 1.0f) {
            i3 = 2;
        } else {
            i3 = 1;
        }
        if (i3 != this.c) {
            b(i3);
        }
        super.onMeasure(i, i2);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void b(int i) {
        this.c = i;
    }

    public final void b(boolean z) {
        if (z) {
            b().setBitmap(this.e, false);
        } else {
            b().setBitmap(this.d, false);
        }
    }
}
