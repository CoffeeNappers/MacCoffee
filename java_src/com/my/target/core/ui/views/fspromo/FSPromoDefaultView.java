package com.my.target.core.ui.views.fspromo;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.WindowManager;
import android.widget.RelativeLayout;
import com.my.target.core.models.banners.g;
import com.my.target.core.ui.views.CacheImageView;
import com.my.target.core.ui.views.controls.IconButton;
import com.my.target.core.ui.views.fspromo.FSPromoView;
import com.my.target.core.ui.views.video.VideoProgressWheel;
import com.my.target.core.ui.views.video.VideoTextureView;
import com.my.target.core.utils.l;
/* loaded from: classes2.dex */
public class FSPromoDefaultView extends FSPromoView {
    private static final int c = l.a();
    private static final int d = l.a();
    private static final int e = l.a();
    private final CacheImageView f;
    private final FSPromoVerticalView g;
    private final FSPromoMediaView h;
    private final FSPromoPanelView i;
    private final IconButton j;
    private final VideoProgressWheel k;
    private final l l;
    private final boolean m;
    private final IconButton n;

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setBanner(g gVar) {
        int i;
        int i2;
        boolean z = false;
        super.setBanner(gVar);
        this.k.setVisibility(8);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(this.l.a(28), this.l.a(28));
        layoutParams.addRule(9);
        layoutParams.topMargin = this.l.a(10);
        layoutParams.leftMargin = this.l.a(10);
        this.k.setLayoutParams(layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(11);
        if (gVar.a() != null) {
            this.j.setVisibility(8);
        } else {
            this.n.setVisibility(8);
        }
        this.j.setLayoutParams(layoutParams2);
        if (this.j.getParent() == null) {
            addView(this.j);
        }
        if (this.k.getParent() == null) {
            addView(this.k);
        }
        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((WindowManager) getContext().getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
        this.i.a(displayMetrics.widthPixels, displayMetrics.heightPixels);
        this.i.setBanner(gVar);
        this.g.a(displayMetrics.widthPixels, displayMetrics.heightPixels);
        this.g.setBanner(gVar);
        this.h.a();
        this.h.a(gVar);
        if (gVar.b() != null && gVar.b().getData() != null) {
            this.j.setBitmap(gVar.b().getData(), true);
        } else {
            this.j.setBitmap(com.my.target.core.resources.a.a(this.l.a(28)), false);
        }
        if (gVar.getIcon() != null) {
            i2 = gVar.getIcon().getWidth();
            i = gVar.getIcon().getHeight();
        } else {
            i = 0;
            i2 = 0;
        }
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams3.bottomMargin = this.l.a(4);
        if (i2 != 0 && i != 0) {
            float f = i / i2;
            int a = (int) (f * this.l.a(64));
            layoutParams3.width = this.l.a(64);
            layoutParams3.height = a;
            if (displayMetrics.widthPixels + displayMetrics.heightPixels < 1280) {
                z = true;
            }
            if (!z) {
                layoutParams3.bottomMargin = (-a) / 2;
            }
        }
        layoutParams3.addRule(8, c);
        if (l.c(18)) {
            layoutParams3.setMarginStart(this.l.a(20));
        } else {
            layoutParams3.leftMargin = this.l.a(20);
        }
        this.f.setLayoutParams(layoutParams3);
        this.f.setImageBitmap(gVar.getIcon().getData());
        if (gVar.a() != null && gVar.a().i()) {
            this.h.b();
            post(new Runnable() { // from class: com.my.target.core.ui.views.fspromo.FSPromoDefaultView.1
                @Override // java.lang.Runnable
                public final void run() {
                    FSPromoDefaultView.this.i.a(FSPromoDefaultView.this.n);
                }
            });
        }
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final boolean a() {
        return this.h.d();
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final IconButton b() {
        return this.n;
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void c() {
        this.i.b(this.n);
        this.h.b();
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void d() {
        this.i.b(this.n);
        this.h.e();
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void e() {
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void a(boolean z) {
        this.k.setVisibility(8);
        this.i.c(this.n);
        this.h.a(z);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setOnCTAClickListener(View.OnClickListener onClickListener) {
        this.g.setOnCTAClickListener(onClickListener);
        this.i.setOnCTAClickListener(onClickListener);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setOnVideoClickListener(FSPromoView.a aVar) {
        this.h.setOnMediaClickListener(aVar);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setCloseListener(View.OnClickListener onClickListener) {
        this.j.setOnClickListener(onClickListener);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void f() {
        this.j.setVisibility(0);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setTimeChanged(float f) {
        this.k.setVisibility(0);
        if (this.b > 0.0f) {
            this.k.setProgress(f / this.b);
        }
        this.k.setDigit((int) ((this.b - f) + 1.0f));
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final boolean g() {
        return this.h.c();
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void h() {
        this.i.c(this.n);
        this.h.f();
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void a(int i) {
        this.h.a(i);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void b(int i) {
        super.b(i);
        if (i == 1) {
            this.g.setVisibility(0);
            this.i.setVisibility(8);
            this.f.setVisibility(0);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(2, d);
            if (l.c(17)) {
                layoutParams.addRule(21, -1);
            } else {
                layoutParams.addRule(11, -1);
            }
            this.n.setLayoutParams(layoutParams);
            this.i.c(this.n);
            return;
        }
        this.g.setVisibility(8);
        this.i.setVisibility(0);
        this.f.setVisibility(8);
        if (this.h.c()) {
            post(new Runnable() { // from class: com.my.target.core.ui.views.fspromo.FSPromoDefaultView.2
                @Override // java.lang.Runnable
                public final void run() {
                    FSPromoDefaultView.this.i.a(FSPromoDefaultView.this.n);
                }
            });
        }
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(2, e);
        if (l.c(17)) {
            layoutParams2.addRule(21, -1);
        } else {
            layoutParams2.addRule(11, -1);
        }
        this.n.setLayoutParams(layoutParams2);
    }

    public FSPromoDefaultView(Context context) {
        super(context);
        this.m = (getContext().getResources().getConfiguration().screenLayout & 15) >= 3;
        this.l = new l(context);
        this.f = new CacheImageView(context);
        this.f.setContentDescription("fsic");
        this.g = new FSPromoVerticalView(context, this.l, this.m);
        this.g.setId(d);
        this.h = new FSPromoMediaView(context, this.l, this.m);
        this.h.setId(c);
        this.j = new IconButton(context);
        this.j.setContentDescription("fscl");
        this.k = new VideoProgressWheel(context);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(3, c);
        this.i = new FSPromoPanelView(context, this.l);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(12, -1);
        this.i.setLayoutParams(layoutParams2);
        this.i.setId(e);
        this.n = new IconButton(context);
        this.n.setId(a);
        addView(this.i, 0);
        addView(this.f, 0);
        addView(this.g, 0, layoutParams);
        addView(this.h, 0, new RelativeLayout.LayoutParams(-1, -1));
        addView(this.n);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setVideoListener(VideoTextureView.a aVar) {
        this.h.setVideoListener(aVar);
    }
}
