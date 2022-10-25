package com.my.target.core.ui.views.fspromo;

import android.annotation.SuppressLint;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.my.target.ads.instream.InstreamAd;
import com.my.target.core.models.banners.g;
import com.my.target.core.ui.views.CacheImageView;
import com.my.target.core.ui.views.controls.IconButton;
import com.my.target.core.ui.views.fspromo.FSPromoView;
import com.my.target.core.ui.views.video.VideoTextureView;
import com.my.target.core.utils.l;
import com.my.target.core.utils.n;
import com.my.target.nativeads.models.ImageData;
import com.my.target.nativeads.models.VideoData;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public class FSPromoMediaView extends RelativeLayout {
    private final CacheImageView a;
    private final l b;
    private final boolean c;
    private final IconButton d;
    private VideoTextureView e;
    private float f;
    private VideoData g;
    private FSPromoView.a h;
    private final View.OnClickListener i;

    public FSPromoMediaView(Context context, l lVar, boolean z) {
        super(context);
        this.i = new View.OnClickListener() { // from class: com.my.target.core.ui.views.fspromo.FSPromoMediaView.1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                if (FSPromoMediaView.this.h != null) {
                    if (!FSPromoMediaView.this.c() && !FSPromoMediaView.this.d()) {
                        FSPromoMediaView.this.h.a();
                    } else if (!FSPromoMediaView.this.d()) {
                        FSPromoMediaView.this.h.b();
                    } else {
                        FSPromoMediaView.this.h.c();
                    }
                }
            }
        };
        this.b = lVar;
        this.c = z;
        this.a = new CacheImageView(context);
        this.d = new IconButton(context);
        if (l.c(14)) {
            this.e = new VideoTextureView(context);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(g gVar) {
        int a;
        if (l.c(14) && gVar.a() != null) {
            this.g = n.a(gVar.a().m(), InstreamAd.DEFAULT_VIDEO_QUALITY);
            float width = this.g.getWidth();
            float height = this.g.getHeight();
            if (height != 0.0f) {
                this.f = width / height;
                requestLayout();
            }
            ImageData j = gVar.a().j();
            if (j != null && j.getData() != null) {
                this.a.setImageBitmap(j.getData());
            } else {
                ImageData image = gVar.getImage();
                if (image != null && image.getData() != null) {
                    this.a.setImageBitmap(image.getData());
                }
            }
            if (gVar.l() != 1) {
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
                layoutParams.addRule(13);
                this.d.setLayoutParams(layoutParams);
                ImageData c = gVar.c();
                if (c != null && c.getData() != null) {
                    this.d.setBitmap(c.getData(), true);
                    return;
                }
                if (this.c) {
                    a = this.b.a(140);
                } else {
                    a = this.b.a(96);
                }
                this.d.setBitmap(com.my.target.core.resources.a.b(a), false);
                return;
            }
            return;
        }
        setOnClickListener(null);
        if (this.d != null && this.d.getParent() != null) {
            ((ViewGroup) this.d.getParent()).removeView(this.d);
        }
        if (gVar.getImage() != null && gVar.getImage().getData() != null) {
            float width2 = gVar.getImage().getWidth();
            float height2 = gVar.getImage().getHeight();
            if (height2 != 0.0f) {
                this.f = width2 / height2;
                requestLayout();
            }
            this.a.setImageBitmap(gVar.getImage().getData());
            this.a.setClickable(false);
        }
    }

    public final void a() {
        this.d.setContentDescription("fsmpb");
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        this.a.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        this.a.setAdjustViewBounds(true);
        this.a.setLayoutParams(layoutParams);
        if (this.e != null) {
            this.e.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
            addView(this.e);
        }
        addView(this.a);
        addView(this.d);
    }

    @Override // android.widget.RelativeLayout, android.view.View
    protected void onMeasure(int i, int i2) {
        int min;
        int size = View.MeasureSpec.getSize(i);
        int size2 = View.MeasureSpec.getSize(i2);
        if (this.f == 0.0f) {
            min = this.a.getMeasuredHeight();
            size = this.a.getMeasuredWidth();
        } else {
            min = Math.min(Math.round(size / this.f), size2);
        }
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(size, 1073741824), View.MeasureSpec.makeMeasureSpec(min, 1073741824));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(boolean z) {
        if (this.e != null) {
            this.e.a();
        }
        this.a.setVisibility(0);
        if (z) {
            this.d.setVisibility(0);
            return;
        }
        this.a.setOnClickListener(null);
        this.d.setOnClickListener(null);
        setOnClickListener(null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void b() {
        this.d.setVisibility(8);
        this.a.setVisibility(8);
        if (this.g != null && this.e != null) {
            this.e.a(this.g, true);
        }
    }

    public void setOnMediaClickListener(FSPromoView.a aVar) {
        this.h = aVar;
        this.a.setOnClickListener(this.i);
        this.d.setOnClickListener(this.i);
        setOnClickListener(this.i);
    }

    public final boolean c() {
        return this.e != null && this.e.e() == 3;
    }

    public final boolean d() {
        return this.e != null && this.e.e() == 4;
    }

    public final void e() {
        if (this.e != null) {
            this.e.a(this.g, true);
        }
        this.d.setVisibility(8);
    }

    public final void f() {
        if (this.e != null) {
            this.e.a(false);
        }
        this.d.setVisibility(0);
    }

    public void setVideoListener(VideoTextureView.a aVar) {
        if (this.e != null) {
            this.e.setVideoListener(aVar);
        }
    }

    public final void a(int i) {
        if (this.e != null) {
            if (i == 1) {
                this.e.j();
            } else if (i == 0) {
                this.e.g();
            } else {
                this.e.h();
            }
        }
    }
}
