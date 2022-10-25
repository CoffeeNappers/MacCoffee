package com.my.target.core.ui.views.video;

import android.content.Context;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.core.models.banners.h;
import com.my.target.core.resources.a;
import com.my.target.core.ui.b;
import com.my.target.core.ui.views.FramedCacheImageView;
import com.my.target.core.ui.views.controls.IconButton;
import com.my.target.core.utils.l;
import com.my.target.nativeads.factories.NativeViewsFactory;
import com.my.target.nativeads.models.VideoData;
import com.my.target.nativeads.views.MediaAdView;
import com.my.target.nativeads.views.StarsRatingView;
/* loaded from: classes2.dex */
public class VideoDialogView extends RelativeLayout implements View.OnClickListener {
    private static final int a = l.a();
    private static final int b = l.a();
    private static final int c = l.a();
    private static final int d = l.a();
    private static final int e = l.a();
    private static final int f = l.a();
    private static final int g = l.a();
    private static final int h = l.a();
    private static final int i = l.a();
    private static final int j = l.a();
    private final FrameLayout A;
    private final FrameLayout B;
    private final VideoSeekBar C;
    private final TextView D;
    private final TextView E;
    private final RelativeLayout F;
    private final IconButton G;
    private final FramedCacheImageView H;
    private final FramedCacheImageView I;
    private final FramedCacheImageView J;
    private int K;
    private int L;
    private final Runnable M;
    private b.a N;
    private boolean O;
    private final View.OnClickListener P;
    private final Button k;
    private final TextView l;
    private final StarsRatingView m;
    private final Button n;
    private final TextView o;
    private final StarsRatingView p;
    private final Button q;
    private final l r;
    private final RelativeLayout s;
    private final LinearLayout t;
    private final LinearLayout u;
    private final TextView v;
    private final FrameLayout w;
    private final MediaAdView x;
    private final TextView y;
    private final TextView z;

    public final IconButton a() {
        return this.G;
    }

    public void setData(h hVar, VideoData videoData) {
        this.k.setText(hVar.getCtaText());
        this.n.setText(hVar.getCtaText());
        this.l.setText(hVar.getTitle());
        this.o.setText(hVar.getTitle());
        if ("store".equals(hVar.getNavigationType())) {
            this.y.setVisibility(8);
            this.z.setVisibility(8);
            if (hVar.getVotes() != 0 && hVar.getRating() > 0.0f) {
                this.p.setVisibility(0);
                this.m.setVisibility(0);
                this.m.setRating(hVar.getRating());
                this.p.setRating(hVar.getRating());
            } else {
                this.m.setVisibility(8);
                this.p.setVisibility(8);
            }
        } else {
            this.m.setVisibility(8);
            this.p.setVisibility(8);
            this.y.setVisibility(0);
            this.z.setVisibility(0);
            this.z.setText(hVar.getDomain());
            this.y.setText(hVar.getDomain());
        }
        this.q.setText(hVar.a().k());
        this.v.setText(hVar.a().l());
        this.J.setImageBitmap(a.c(getContext()));
        this.O = hVar.a().n();
        this.x.setPlaceHolderDimension(videoData.getWidth(), videoData.getHeight());
        if (hVar.getImage() != null) {
            this.x.getImageView().setImageBitmap(hVar.getImage().getBitmap());
        }
    }

    public void setDialogListener(b.a aVar) {
        this.N = aVar;
    }

    public void setDismissButtonListener(View.OnClickListener onClickListener) {
        this.q.setOnClickListener(onClickListener);
    }

    public VideoDialogView(Context context) {
        super(context);
        this.M = new Runnable() { // from class: com.my.target.core.ui.views.video.VideoDialogView.1
            @Override // java.lang.Runnable
            public final void run() {
                if (VideoDialogView.this.L == 2 || VideoDialogView.this.L == 0) {
                    VideoDialogView.this.c();
                }
            }
        };
        this.P = new View.OnClickListener() { // from class: com.my.target.core.ui.views.video.VideoDialogView.2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                VideoDialogView.this.removeCallbacks(VideoDialogView.this.M);
                if (VideoDialogView.this.L != 2) {
                    if (VideoDialogView.this.L == 0 || VideoDialogView.this.L == 3) {
                        VideoDialogView.this.g();
                    }
                    VideoDialogView.this.postDelayed(VideoDialogView.this.M, 4000L);
                    return;
                }
                VideoDialogView.this.c();
            }
        };
        this.x = NativeViewsFactory.getMediaAdView(context);
        this.q = new Button(context);
        this.k = new Button(context);
        this.l = new TextView(context);
        this.m = new StarsRatingView(context);
        this.n = new Button(context);
        this.o = new TextView(context);
        this.p = new StarsRatingView(context);
        this.v = new TextView(context);
        this.w = new FrameLayout(context);
        this.H = new FramedCacheImageView(context);
        this.I = new FramedCacheImageView(context);
        this.J = new FramedCacheImageView(context);
        this.y = new TextView(context);
        this.A = new FrameLayout(context);
        this.B = new FrameLayout(context);
        this.z = new TextView(context);
        this.C = new VideoSeekBar(context);
        this.D = new TextView(context);
        this.E = new TextView(context);
        this.F = new RelativeLayout(context);
        this.s = new RelativeLayout(context);
        this.t = new LinearLayout(context);
        this.u = new LinearLayout(context);
        this.r = new l(context);
        this.G = new IconButton(context);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13, -1);
        this.x.setLayoutParams(layoutParams);
        this.x.setId(h);
        this.x.setOnClickListener(this.P);
        this.x.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        this.w.setContentDescription("vdsha");
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
        this.w.setBackgroundColor(-1157627904);
        this.w.setVisibility(8);
        this.w.setLayoutParams(layoutParams2);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams3.setMargins(this.r.a(16), this.r.a(16), this.r.a(16), this.r.a(16));
        this.q.setLayoutParams(layoutParams3);
        this.q.setId(a);
        this.q.setContentDescription("vddb");
        this.q.setTextColor(-1);
        this.q.setTextSize(2, 16.0f);
        this.q.setTransformationMethod(null);
        this.l.setContentDescription("vdth");
        this.l.setSingleLine();
        this.l.setEllipsize(TextUtils.TruncateAt.END);
        this.l.setTextSize(2, 18.0f);
        this.l.setTextColor(-1);
        this.o.setContentDescription("vdtv");
        this.o.setSingleLine();
        this.o.setEllipsize(TextUtils.TruncateAt.END);
        this.o.setTextSize(2, 18.0f);
        this.o.setTextColor(-1);
        this.o.setGravity(14);
        l.a(this.k, -2013265920, -1, -1, this.r.a(1), this.r.a(4));
        l.a(this.n, -2013265920, -1, -1, this.r.a(1), this.r.a(4));
        l.a(this.q, -2013265920, -1, -1, this.r.a(1), this.r.a(4));
        this.k.setId(b);
        this.k.setTextColor(-1);
        this.k.setTransformationMethod(null);
        this.k.setTextSize(2, 16.0f);
        this.k.setOnClickListener(this);
        this.n.setId(c);
        this.n.setTextColor(-1);
        this.n.setTransformationMethod(null);
        this.n.setTextSize(2, 16.0f);
        this.n.setOnClickListener(this);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams4.addRule(1, a);
        layoutParams4.setMargins(this.r.a(16), this.r.a(16), this.r.a(16), this.r.a(16));
        this.s.setLayoutParams(layoutParams4);
        RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams5.addRule(3, h);
        this.t.setGravity(1);
        this.t.setLayoutParams(layoutParams5);
        this.t.setOrientation(1);
        RelativeLayout.LayoutParams layoutParams6 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams6.addRule(0, g);
        layoutParams6.addRule(15, -1);
        layoutParams6.setMargins(this.r.a(8), 0, this.r.a(8), 0);
        this.l.setLayoutParams(layoutParams6);
        this.l.setShadowLayer(this.r.a(1), this.r.a(1), this.r.a(1), ViewCompat.MEASURED_STATE_MASK);
        RelativeLayout.LayoutParams layoutParams7 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams7.addRule(0, b);
        layoutParams7.addRule(15, -1);
        layoutParams7.setMargins(this.r.a(4), this.r.a(3), this.r.a(8), this.r.a(4));
        this.A.setLayoutParams(layoutParams7);
        this.A.setId(g);
        this.B.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        FrameLayout.LayoutParams layoutParams8 = new FrameLayout.LayoutParams(this.r.a(73), this.r.a(12));
        this.m.setContentDescription("vdrh");
        this.m.setLayoutParams(layoutParams8);
        FrameLayout.LayoutParams layoutParams9 = new FrameLayout.LayoutParams(this.r.a(73), this.r.a(12));
        this.p.setContentDescription("vdrv");
        this.p.setLayoutParams(layoutParams9);
        this.y.setContentDescription("vddoh");
        this.y.setTextColor(-3355444);
        this.y.setShadowLayer(this.r.a(1), this.r.a(1), this.r.a(1), ViewCompat.MEASURED_STATE_MASK);
        this.z.setContentDescription("vddov");
        this.z.setTextColor(-3355444);
        this.z.setShadowLayer(this.r.a(1), this.r.a(1), this.r.a(1), ViewCompat.MEASURED_STATE_MASK);
        RelativeLayout.LayoutParams layoutParams10 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams10.addRule(11);
        this.k.setLayoutParams(layoutParams10);
        LinearLayout.LayoutParams layoutParams11 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams11.gravity = 1;
        layoutParams11.setMargins(this.r.a(8), this.r.a(8), this.r.a(8), this.r.a(8));
        this.o.setLayoutParams(layoutParams11);
        LinearLayout.LayoutParams layoutParams12 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams12.gravity = 1;
        layoutParams12.setMargins(this.r.a(8), this.r.a(16), this.r.a(8), this.r.a(8));
        this.n.setLayoutParams(layoutParams12);
        this.u.setId(d);
        this.u.setContentDescription("vdrep");
        this.u.setOnClickListener(this);
        RelativeLayout.LayoutParams layoutParams13 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams13.addRule(13, -1);
        this.u.setLayoutParams(layoutParams13);
        this.u.setGravity(17);
        this.u.setVisibility(8);
        this.u.setPadding(0, 0, this.r.a(8), 0);
        LinearLayout.LayoutParams layoutParams14 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams14.gravity = 16;
        layoutParams14.setMargins(this.r.a(8), 0, 0, 0);
        this.v.setLayoutParams(layoutParams14);
        this.v.setTypeface(this.v.getTypeface(), 1);
        this.v.setTextColor(-1);
        this.v.setTextSize(2, 16.0f);
        LinearLayout.LayoutParams layoutParams15 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams15.gravity = 16;
        this.J.setLayoutParams(layoutParams15);
        this.J.setPadding(this.r.a(16), this.r.a(16), this.r.a(16), this.r.a(16));
        this.H.setId(f);
        this.H.setContentDescription("vdpab");
        this.H.setOnClickListener(this);
        RelativeLayout.LayoutParams layoutParams16 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams16.addRule(13, -1);
        this.H.setVisibility(8);
        this.H.setPadding(this.r.a(16), this.r.a(16), this.r.a(16), this.r.a(16));
        this.I.setId(e);
        this.I.setContentDescription("vdplb");
        this.I.setOnClickListener(this);
        RelativeLayout.LayoutParams layoutParams17 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams17.addRule(13, -1);
        this.I.setVisibility(8);
        this.I.setPadding(this.r.a(16), this.r.a(16), this.r.a(16), this.r.a(16));
        new FrameLayout.LayoutParams(-2, -2).gravity = 17;
        this.I.setImageBitmap(a.a(getContext()));
        this.H.setImageBitmap(a.b(getContext()));
        l.a(this.H, -2013265920, -1, -1, this.r.a(1), this.r.a(4));
        l.a(this.I, -2013265920, -1, -1, this.r.a(1), this.r.a(4));
        l.a(this.J, -2013265920, -1, -1, this.r.a(1), this.r.a(4));
        this.D.setId(i);
        this.D.setContentDescription("vdela");
        RelativeLayout.LayoutParams layoutParams18 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams18.addRule(15, -1);
        layoutParams18.rightMargin = this.r.a(8);
        this.D.setLayoutParams(layoutParams18);
        this.D.setTextSize(2, 12.0f);
        this.D.setIncludeFontPadding(false);
        this.D.setTextColor(-1);
        this.D.setShadowLayer(this.r.a(1), this.r.a(1), this.r.a(1), ViewCompat.MEASURED_STATE_MASK);
        this.E.setId(j);
        this.E.setContentDescription("vdrem");
        RelativeLayout.LayoutParams layoutParams19 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams19.addRule(11, -1);
        layoutParams19.addRule(15, -1);
        layoutParams19.leftMargin = this.r.a(8);
        this.E.setTextSize(2, 12.0f);
        this.E.setLayoutParams(layoutParams19);
        this.E.setTextColor(-1);
        this.E.setIncludeFontPadding(false);
        this.E.setGravity(16);
        this.E.setShadowLayer(this.r.a(1), this.r.a(1), this.r.a(1), ViewCompat.MEASURED_STATE_MASK);
        RelativeLayout.LayoutParams layoutParams20 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams20.addRule(15, -1);
        layoutParams20.addRule(1, i);
        layoutParams20.addRule(0, j);
        this.C.setLayoutParams(layoutParams20);
        this.C.setHeight(this.r.a(2));
        RelativeLayout.LayoutParams layoutParams21 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams21.addRule(8, h);
        this.F.setLayoutParams(layoutParams21);
        this.F.setPadding(this.r.a(16), this.r.a(8), this.r.a(16), this.r.a(8));
        this.F.addView(this.D);
        this.F.addView(this.E);
        this.F.addView(this.C);
        this.F.setVisibility(8);
        this.x.addView(this.w);
        this.x.addView(this.G);
        addView(this.x);
        addView(this.q);
        addView(this.s);
        addView(this.t);
        addView(this.u);
        addView(this.H, layoutParams16);
        addView(this.I, layoutParams17);
        addView(this.F);
        this.s.addView(this.k);
        this.s.addView(this.A);
        this.A.addView(this.m);
        this.A.addView(this.y);
        this.s.addView(this.l);
        this.t.addView(this.o);
        this.t.addView(this.B);
        this.B.addView(this.p);
        this.B.addView(this.z);
        this.t.addView(this.n);
        this.u.addView(this.J);
        this.u.addView(this.v);
    }

    @Override // android.widget.RelativeLayout, android.view.View
    protected void onMeasure(int i2, int i3) {
        int i4 = ((float) View.MeasureSpec.getSize(i2)) / ((float) View.MeasureSpec.getSize(i3)) > 1.0f ? 2 : 1;
        if (i4 != this.K) {
            this.K = i4;
            if (i4 == 2) {
                this.t.setVisibility(8);
                this.s.setVisibility(0);
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
                layoutParams.addRule(12, -1);
                layoutParams.bottomMargin = this.r.a(40);
                layoutParams.rightMargin = this.r.a(6);
                if (l.c(17)) {
                    layoutParams.addRule(21, -1);
                } else {
                    layoutParams.addRule(11, -1);
                }
                this.G.setLayoutParams(layoutParams);
            } else {
                this.t.setVisibility(0);
                this.s.setVisibility(8);
                RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
                layoutParams2.addRule(10, -1);
                layoutParams2.rightMargin = this.r.a(6);
                if (l.c(17)) {
                    layoutParams2.addRule(21, -1);
                } else {
                    layoutParams2.addRule(11, -1);
                }
                this.G.setLayoutParams(layoutParams2);
            }
        }
        super.onMeasure(i2, i3);
    }

    public final void a(VideoTextureView videoTextureView) {
        this.x.addView(videoTextureView, 0);
    }

    public final void a(float f2, float f3) {
        this.D.setText(l.a(f2));
        this.E.setText("−" + l.a(f3 - f2));
        this.C.setMax((int) (f3 * 1000.0f));
        this.C.setProgress((int) (f2 * 1000.0f));
    }

    public final void b() {
        this.L = 4;
        this.x.getImageView().setVisibility(0);
        this.x.getProgressBarView().setVisibility(8);
        this.u.setVisibility(0);
        this.I.setVisibility(8);
        this.H.setVisibility(8);
        this.w.setVisibility(0);
        this.F.setVisibility(8);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (this.N != null) {
            int id = view.getId();
            if (id == b || id == c) {
                this.N.a(view);
            } else if (id == d) {
                this.N.b();
            } else if (id == f) {
                this.N.c();
            } else if (id == e) {
                this.N.a();
            }
        }
    }

    public final void c() {
        this.L = 0;
        this.x.getImageView().setVisibility(8);
        this.x.getProgressBarView().setVisibility(8);
        this.u.setVisibility(8);
        this.I.setVisibility(8);
        this.H.setVisibility(8);
        this.w.setVisibility(8);
        this.F.setVisibility(8);
    }

    public final void d() {
        this.L = 3;
        this.x.getImageView().setVisibility(8);
        this.x.getProgressBarView().setVisibility(0);
        this.u.setVisibility(8);
        this.I.setVisibility(8);
        this.H.setVisibility(8);
        this.w.setVisibility(8);
        this.F.setVisibility(8);
    }

    public final void e() {
        this.L = 1;
        this.x.getImageView().setVisibility(8);
        this.x.getProgressBarView().setVisibility(8);
        this.u.setVisibility(8);
        this.I.setVisibility(0);
        this.H.setVisibility(8);
        this.w.setVisibility(0);
        if (this.O) {
            this.F.setVisibility(0);
        }
    }

    public final void f() {
        this.x.getImageView().setVisibility(8);
        this.x.getProgressBarView().setVisibility(8);
        this.u.setVisibility(8);
        this.I.setVisibility(8);
        if (this.L != 2) {
            this.H.setVisibility(8);
        }
    }

    public final void g() {
        this.L = 2;
        this.x.getImageView().setVisibility(8);
        this.x.getProgressBarView().setVisibility(8);
        this.u.setVisibility(8);
        this.I.setVisibility(8);
        this.H.setVisibility(0);
        this.w.setVisibility(8);
        if (this.O) {
            this.F.setVisibility(0);
        }
    }

    public final void h() {
        this.x.getImageView().setVisibility(0);
    }
}
