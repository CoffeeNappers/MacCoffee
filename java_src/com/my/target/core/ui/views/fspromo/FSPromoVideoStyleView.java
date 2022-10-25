package com.my.target.core.ui.views.fspromo;

import android.content.Context;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.core.models.banners.g;
import com.my.target.core.ui.views.FramedCacheImageView;
import com.my.target.core.ui.views.controls.IconButton;
import com.my.target.core.ui.views.fspromo.FSPromoView;
import com.my.target.core.ui.views.video.VideoProgressWheel;
import com.my.target.core.ui.views.video.VideoSeekBar;
import com.my.target.core.ui.views.video.VideoTextureView;
import com.my.target.core.utils.l;
import com.my.target.nativeads.views.StarsRatingView;
/* loaded from: classes2.dex */
public class FSPromoVideoStyleView extends FSPromoView {
    private static final int c = l.a();
    private static final int d = l.a();
    private static final int e = l.a();
    private static final int f = l.a();
    private static final int g = l.a();
    private static final int h = l.a();
    private static final int i = l.a();
    private static final int j = l.a();
    private static final int k = l.a();
    private static final int l = l.a();
    private static final int m = l.a();
    private final FSPromoMediaView A;
    private final TextView B;
    private final TextView C;
    private final FrameLayout D;
    private final FrameLayout E;
    private final VideoSeekBar F;
    private final TextView G;
    private final TextView H;
    private final RelativeLayout I;
    private final VideoProgressWheel J;
    private final IconButton K;
    private final FramedCacheImageView L;
    private final FramedCacheImageView M;
    private final FramedCacheImageView N;
    private int O;
    private final Runnable P;
    private boolean Q;
    private final View.OnClickListener R;
    private final View.OnClickListener S;
    private float T;
    private boolean U;
    private FSPromoView.a V;
    private boolean W;
    private final Button n;
    private final TextView o;
    private final StarsRatingView p;
    private final Button q;
    private final TextView r;
    private final StarsRatingView s;
    private final Button t;
    private final l u;
    private final RelativeLayout v;
    private final LinearLayout w;
    private final LinearLayout x;
    private final TextView y;
    private final FrameLayout z;

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setBanner(g gVar) {
        super.setBanner(gVar);
        this.A.a(gVar);
        this.W = gVar.a().d();
        this.T = gVar.a().h();
        this.U = gVar.a().g();
        this.n.setText(gVar.getCtaText());
        this.q.setText(gVar.getCtaText());
        this.o.setText(gVar.getTitle());
        this.r.setText(gVar.getTitle());
        this.J.setMax(gVar.a().h());
        this.F.setMax((int) (this.b * 1000.0f));
        if ("store".equals(gVar.getNavigationType())) {
            this.B.setVisibility(8);
            this.C.setVisibility(8);
            if (gVar.getVotes() != 0 && gVar.getRating() > 0.0f) {
                this.s.setVisibility(0);
                this.p.setVisibility(0);
                this.p.setRating(gVar.getRating());
                this.s.setRating(gVar.getRating());
            } else {
                this.p.setVisibility(8);
                this.s.setVisibility(8);
            }
        } else {
            this.p.setVisibility(8);
            this.s.setVisibility(8);
            this.B.setVisibility(0);
            this.C.setVisibility(0);
            this.C.setText(gVar.getDomain());
            this.B.setText(gVar.getDomain());
        }
        this.t.setText(gVar.a().k());
        this.y.setText(gVar.a().l());
        this.N.setImageBitmap(com.my.target.core.resources.a.c(getContext()));
        if (gVar.a().i()) {
            this.A.b();
            l();
        } else {
            m();
        }
        this.Q = gVar.a().n();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void l() {
        this.O = 0;
        this.x.setVisibility(8);
        this.M.setVisibility(8);
        this.L.setVisibility(8);
        this.z.setVisibility(8);
        this.I.setVisibility(8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void m() {
        this.O = 1;
        this.x.setVisibility(8);
        this.M.setVisibility(0);
        this.L.setVisibility(8);
        this.z.setVisibility(0);
        if (this.Q) {
            this.I.setVisibility(0);
        }
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void f() {
        this.t.setVisibility(0);
        this.J.setVisibility(8);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final boolean g() {
        return this.A.c();
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final boolean a() {
        return this.A.d();
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final IconButton b() {
        return this.K;
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void c() {
        n();
        this.A.b();
    }

    private void n() {
        this.x.setVisibility(8);
        this.M.setVisibility(8);
        if (this.O != 2) {
            this.L.setVisibility(8);
        }
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setTimeChanged(float f2) {
        this.G.setText(l.a(f2));
        this.H.setText("−" + l.a(this.b - f2));
        this.F.setProgress((int) (1000.0f * f2));
        if (this.U && this.T != 0.0f && this.T >= f2 && this.t.getVisibility() != 0) {
            this.J.setProgress(f2 / this.T);
            this.J.setDigit((int) ((this.T - f2) + 1.0f));
            this.J.setVisibility(0);
        }
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setCloseListener(View.OnClickListener onClickListener) {
        this.t.setOnClickListener(onClickListener);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setVideoListener(VideoTextureView.a aVar) {
        this.A.setVideoListener(aVar);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void d() {
        n();
        this.A.e();
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setOnVideoClickListener(FSPromoView.a aVar) {
        this.V = aVar;
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public void setOnCTAClickListener(View.OnClickListener onClickListener) {
        this.n.setOnClickListener(onClickListener);
        this.q.setOnClickListener(onClickListener);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void a(boolean z) {
        this.A.a(true);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void h() {
        m();
        this.A.f();
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void a(int i2) {
        this.A.a(i2);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void b(int i2) {
        super.b(i2);
        if (i2 == 2) {
            this.w.setVisibility(8);
            this.v.setVisibility(0);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(12, -1);
            layoutParams.bottomMargin = this.u.a(40);
            layoutParams.rightMargin = this.u.a(6);
            if (l.c(17)) {
                layoutParams.addRule(21, -1);
            } else {
                layoutParams.addRule(11, -1);
            }
            this.K.setLayoutParams(layoutParams);
            return;
        }
        this.w.setVisibility(0);
        this.v.setVisibility(8);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(10, -1);
        if (l.c(17)) {
            layoutParams2.addRule(21, -1);
        } else {
            layoutParams2.addRule(11, -1);
        }
        this.K.setLayoutParams(layoutParams2);
    }

    public FSPromoVideoStyleView(Context context) {
        super(context);
        this.P = new Runnable() { // from class: com.my.target.core.ui.views.fspromo.FSPromoVideoStyleView.1
            @Override // java.lang.Runnable
            public final void run() {
                if (FSPromoVideoStyleView.this.O == 2 || FSPromoVideoStyleView.this.O == 0) {
                    FSPromoVideoStyleView.this.l();
                }
            }
        };
        this.R = new View.OnClickListener() { // from class: com.my.target.core.ui.views.fspromo.FSPromoVideoStyleView.2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                FSPromoVideoStyleView.this.removeCallbacks(FSPromoVideoStyleView.this.P);
                if (FSPromoVideoStyleView.this.O == 2) {
                    FSPromoVideoStyleView.this.l();
                    return;
                }
                if (FSPromoVideoStyleView.this.O == 0 || FSPromoVideoStyleView.this.O == 3) {
                    FSPromoVideoStyleView.d(FSPromoVideoStyleView.this);
                }
                FSPromoVideoStyleView.this.postDelayed(FSPromoVideoStyleView.this.P, 4000L);
            }
        };
        this.S = new View.OnClickListener() { // from class: com.my.target.core.ui.views.fspromo.FSPromoVideoStyleView.3
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                int id = view.getId();
                if (id == FSPromoVideoStyleView.f) {
                    if (FSPromoVideoStyleView.this.V != null) {
                        FSPromoVideoStyleView.this.V.a();
                    }
                    FSPromoVideoStyleView.this.l();
                } else if (id == FSPromoVideoStyleView.h) {
                    if (FSPromoVideoStyleView.this.V != null) {
                        FSPromoVideoStyleView.this.V.b();
                    }
                    FSPromoVideoStyleView.this.m();
                } else if (id == FSPromoVideoStyleView.g) {
                    if (FSPromoVideoStyleView.this.V != null) {
                        if (FSPromoVideoStyleView.this.a()) {
                            FSPromoVideoStyleView.this.V.c();
                        } else {
                            FSPromoVideoStyleView.this.V.a();
                        }
                    }
                    FSPromoVideoStyleView.this.l();
                }
            }
        };
        this.t = new Button(context);
        this.n = new Button(context);
        this.o = new TextView(context);
        this.p = new StarsRatingView(context);
        this.q = new Button(context);
        this.r = new TextView(context);
        this.s = new StarsRatingView(context);
        this.y = new TextView(context);
        this.z = new FrameLayout(context);
        this.L = new FramedCacheImageView(context);
        this.M = new FramedCacheImageView(context);
        this.N = new FramedCacheImageView(context);
        this.B = new TextView(context);
        this.D = new FrameLayout(context);
        this.E = new FrameLayout(context);
        this.C = new TextView(context);
        this.F = new VideoSeekBar(context);
        this.G = new TextView(context);
        this.H = new TextView(context);
        this.I = new RelativeLayout(context);
        this.A = new FSPromoMediaView(context, new l(context), false);
        this.J = new VideoProgressWheel(context);
        this.K = new IconButton(context);
        this.v = new RelativeLayout(context);
        this.w = new LinearLayout(context);
        this.x = new LinearLayout(context);
        this.u = new l(context);
        setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        this.K.setId(a);
        int a = this.u.a(52);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13, -1);
        this.A.setLayoutParams(layoutParams);
        this.A.setId(j);
        this.A.setOnClickListener(this.R);
        this.A.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        this.A.a();
        this.z.setContentDescription("vdsha");
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
        this.z.setBackgroundColor(-1728053248);
        this.z.setVisibility(8);
        this.z.setLayoutParams(layoutParams2);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, a);
        layoutParams3.setMargins(this.u.a(16), this.u.a(16), this.u.a(16), this.u.a(16));
        this.t.setLayoutParams(layoutParams3);
        this.t.setId(c);
        this.t.setMaxWidth(this.u.a(200));
        this.t.setContentDescription("vddb");
        this.t.setTextColor(-1);
        this.t.setTextSize(2, 16.0f);
        this.t.setTransformationMethod(null);
        this.t.setSingleLine();
        this.t.setEllipsize(TextUtils.TruncateAt.END);
        this.t.setVisibility(8);
        this.o.setContentDescription("vdth");
        this.o.setSingleLine();
        this.o.setEllipsize(TextUtils.TruncateAt.END);
        this.o.setTextSize(2, 18.0f);
        this.o.setTextColor(-1);
        this.r.setContentDescription("vdtv");
        this.r.setSingleLine();
        this.r.setEllipsize(TextUtils.TruncateAt.END);
        this.r.setTextSize(2, 18.0f);
        this.r.setTextColor(-1);
        this.r.setGravity(14);
        l.a(this.n, -2013265920, -1, -1, this.u.a(1), this.u.a(4));
        l.a(this.q, -2013265920, -1, -1, this.u.a(1), this.u.a(4));
        l.a(this.t, -2013265920, -1, -1, this.u.a(1), this.u.a(4));
        this.n.setId(d);
        this.n.setTextColor(-1);
        this.n.setTransformationMethod(null);
        this.n.setSingleLine();
        this.n.setEllipsize(TextUtils.TruncateAt.END);
        this.n.setTextSize(2, 16.0f);
        this.n.setMaxWidth(this.u.a(200));
        this.n.setMinimumWidth(this.u.a(100));
        this.n.setPadding(this.u.a(8), 0, this.u.a(8), 0);
        this.q.setId(e);
        this.q.setTextColor(-1);
        this.q.setTransformationMethod(null);
        this.q.setTextSize(2, 16.0f);
        this.q.setMinimumWidth(this.u.a(100));
        this.q.setPadding(this.u.a(8), 0, this.u.a(8), 0);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams4.addRule(1, c);
        layoutParams4.setMargins(this.u.a(16), this.u.a(16), this.u.a(16), this.u.a(16));
        this.v.setLayoutParams(layoutParams4);
        RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams5.addRule(3, j);
        this.w.setGravity(1);
        this.w.setLayoutParams(layoutParams5);
        this.w.setOrientation(1);
        RelativeLayout.LayoutParams layoutParams6 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams6.addRule(0, i);
        layoutParams6.addRule(15, -1);
        layoutParams6.setMargins(this.u.a(8), 0, this.u.a(8), 0);
        this.o.setLayoutParams(layoutParams6);
        this.o.setShadowLayer(this.u.a(1), this.u.a(1), this.u.a(1), ViewCompat.MEASURED_STATE_MASK);
        RelativeLayout.LayoutParams layoutParams7 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams7.addRule(0, d);
        layoutParams7.addRule(15, -1);
        layoutParams7.setMargins(this.u.a(4), this.u.a(3), this.u.a(8), this.u.a(4));
        this.D.setLayoutParams(layoutParams7);
        this.D.setId(i);
        this.E.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        FrameLayout.LayoutParams layoutParams8 = new FrameLayout.LayoutParams(this.u.a(73), this.u.a(12));
        this.p.setContentDescription("vdrh");
        this.p.setLayoutParams(layoutParams8);
        FrameLayout.LayoutParams layoutParams9 = new FrameLayout.LayoutParams(this.u.a(73), this.u.a(12));
        this.s.setContentDescription("vdrv");
        this.s.setLayoutParams(layoutParams9);
        this.B.setContentDescription("vddoh");
        this.B.setTextColor(-3355444);
        this.B.setShadowLayer(this.u.a(1), this.u.a(1), this.u.a(1), ViewCompat.MEASURED_STATE_MASK);
        this.C.setContentDescription("vddov");
        this.C.setTextColor(-3355444);
        this.C.setShadowLayer(this.u.a(1), this.u.a(1), this.u.a(1), ViewCompat.MEASURED_STATE_MASK);
        RelativeLayout.LayoutParams layoutParams10 = new RelativeLayout.LayoutParams(-2, a);
        layoutParams10.addRule(11);
        this.n.setLayoutParams(layoutParams10);
        LinearLayout.LayoutParams layoutParams11 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams11.gravity = 1;
        layoutParams11.setMargins(this.u.a(8), this.u.a(8), this.u.a(8), this.u.a(8));
        this.r.setLayoutParams(layoutParams11);
        LinearLayout.LayoutParams layoutParams12 = new LinearLayout.LayoutParams(-2, a);
        layoutParams12.gravity = 1;
        layoutParams12.setMargins(this.u.a(8), this.u.a(16), this.u.a(8), this.u.a(8));
        this.q.setLayoutParams(layoutParams12);
        this.x.setId(f);
        this.x.setContentDescription("vdrep");
        this.x.setOnClickListener(this.S);
        RelativeLayout.LayoutParams layoutParams13 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams13.addRule(13, -1);
        this.x.setLayoutParams(layoutParams13);
        this.x.setGravity(17);
        this.x.setVisibility(8);
        this.x.setPadding(this.u.a(8), 0, this.u.a(8), 0);
        LinearLayout.LayoutParams layoutParams14 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams14.gravity = 16;
        layoutParams14.setMargins(this.u.a(8), 0, 0, 0);
        this.y.setLayoutParams(layoutParams14);
        this.y.setSingleLine();
        this.y.setMaxWidth(this.u.a(200));
        this.y.setEllipsize(TextUtils.TruncateAt.END);
        this.y.setTypeface(this.y.getTypeface(), 1);
        this.y.setTextColor(-1);
        this.y.setTextSize(2, 16.0f);
        LinearLayout.LayoutParams layoutParams15 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams15.gravity = 16;
        this.N.setLayoutParams(layoutParams15);
        this.N.setPadding(this.u.a(16), this.u.a(16), this.u.a(16), this.u.a(16));
        this.L.setId(h);
        this.L.setContentDescription("vdpab");
        this.L.setOnClickListener(this.S);
        RelativeLayout.LayoutParams layoutParams16 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams16.addRule(13, -1);
        this.L.setVisibility(8);
        this.L.setPadding(this.u.a(16), this.u.a(16), this.u.a(16), this.u.a(16));
        this.M.setId(g);
        this.M.setContentDescription("vdplb");
        this.M.setOnClickListener(this.S);
        RelativeLayout.LayoutParams layoutParams17 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams17.addRule(13, -1);
        this.M.setVisibility(8);
        this.M.setPadding(this.u.a(16), this.u.a(16), this.u.a(16), this.u.a(16));
        new FrameLayout.LayoutParams(-2, -2).gravity = 17;
        this.M.setImageBitmap(com.my.target.core.resources.a.a(getContext()));
        this.L.setImageBitmap(com.my.target.core.resources.a.b(getContext()));
        l.a(this.L, -2013265920, -1, -1, this.u.a(1), this.u.a(4));
        l.a(this.M, -2013265920, -1, -1, this.u.a(1), this.u.a(4));
        l.a(this.N, -2013265920, -1, -1, this.u.a(1), this.u.a(4));
        this.G.setId(k);
        this.G.setContentDescription("vdela");
        RelativeLayout.LayoutParams layoutParams18 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams18.addRule(15, -1);
        layoutParams18.rightMargin = this.u.a(8);
        this.G.setLayoutParams(layoutParams18);
        this.G.setTextSize(2, 12.0f);
        this.G.setIncludeFontPadding(false);
        this.G.setTextColor(-1);
        this.G.setShadowLayer(this.u.a(1), this.u.a(1), this.u.a(1), ViewCompat.MEASURED_STATE_MASK);
        this.H.setId(l);
        this.H.setContentDescription("vdrem");
        RelativeLayout.LayoutParams layoutParams19 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams19.addRule(11, -1);
        layoutParams19.addRule(15, -1);
        layoutParams19.leftMargin = this.u.a(8);
        this.H.setTextSize(2, 12.0f);
        this.H.setLayoutParams(layoutParams19);
        this.H.setTextColor(-1);
        this.H.setIncludeFontPadding(false);
        this.H.setGravity(16);
        this.H.setShadowLayer(this.u.a(1), this.u.a(1), this.u.a(1), ViewCompat.MEASURED_STATE_MASK);
        RelativeLayout.LayoutParams layoutParams20 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams20.addRule(15, -1);
        layoutParams20.addRule(1, k);
        layoutParams20.addRule(0, l);
        this.F.setLayoutParams(layoutParams20);
        this.F.setHeight(this.u.a(2));
        RelativeLayout.LayoutParams layoutParams21 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams21.addRule(8, j);
        this.I.setId(m);
        this.I.setLayoutParams(layoutParams21);
        this.I.setPadding(this.u.a(16), this.u.a(8), this.u.a(16), this.u.a(8));
        RelativeLayout.LayoutParams layoutParams22 = new RelativeLayout.LayoutParams(this.u.a(28), this.u.a(28));
        layoutParams22.addRule(9);
        layoutParams22.topMargin = this.u.a(16);
        layoutParams22.leftMargin = this.u.a(16);
        this.J.setLayoutParams(layoutParams22);
        this.J.setVisibility(8);
        this.A.addView(this.z);
        this.A.addView(this.K);
        this.I.addView(this.G);
        this.I.addView(this.H);
        this.I.addView(this.F);
        this.I.setVisibility(8);
        addView(this.A);
        addView(this.t);
        addView(this.J);
        addView(this.v);
        addView(this.w);
        addView(this.x);
        addView(this.L, layoutParams16);
        addView(this.M, layoutParams17);
        addView(this.I);
        this.v.addView(this.n);
        this.v.addView(this.D);
        this.D.addView(this.p);
        this.D.addView(this.B);
        this.v.addView(this.o);
        this.w.addView(this.r);
        this.w.addView(this.E);
        this.E.addView(this.s);
        this.E.addView(this.C);
        this.w.addView(this.q);
        this.x.addView(this.N);
        this.x.addView(this.y);
    }

    @Override // com.my.target.core.ui.views.fspromo.FSPromoView
    public final void e() {
        this.O = 4;
        if (this.W) {
            this.x.setVisibility(0);
        }
        this.M.setVisibility(8);
        this.L.setVisibility(8);
        this.z.setVisibility(0);
        this.I.setVisibility(8);
    }

    static /* synthetic */ void d(FSPromoVideoStyleView fSPromoVideoStyleView) {
        fSPromoVideoStyleView.O = 2;
        fSPromoVideoStyleView.x.setVisibility(8);
        fSPromoVideoStyleView.M.setVisibility(8);
        fSPromoVideoStyleView.L.setVisibility(0);
        fSPromoVideoStyleView.z.setVisibility(8);
        if (!fSPromoVideoStyleView.Q) {
            return;
        }
        fSPromoVideoStyleView.I.setVisibility(0);
    }
}
