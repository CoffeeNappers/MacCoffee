package com.my.target.core.ui.views.fspromo;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.core.models.banners.g;
import com.my.target.core.ui.views.CacheImageView;
import com.my.target.core.ui.views.TextViewWithAgeView;
import com.my.target.core.utils.l;
import com.my.target.nativeads.views.StarsRatingView;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public class FSPromoPanelView extends RelativeLayout {
    private static final int a = l.a();
    private static final int b = l.a();
    private static final int c = l.a();
    private static final int d = l.a();
    private static final int e = l.a();
    private final RelativeLayout f;
    private final TextView g;
    private final TextViewWithAgeView h;
    private final TextView i;
    private final LinearLayout j;
    private final StarsRatingView k;
    private final TextView l;
    private final TextView m;
    private final Button n;
    private final CacheImageView o;
    private final l p;
    private final a q;
    private RelativeLayout.LayoutParams r;
    private RelativeLayout.LayoutParams s;
    private boolean t;

    public FSPromoPanelView(Context context, l lVar) {
        super(context);
        this.p = lVar;
        this.n = new Button(context);
        this.o = new CacheImageView(context);
        this.h = new TextViewWithAgeView(context);
        this.g = new TextView(context);
        this.f = new RelativeLayout(context);
        this.i = new TextView(context);
        this.j = new LinearLayout(context);
        this.k = new StarsRatingView(context);
        this.l = new TextView(context);
        this.m = new TextView(context);
        this.q = new a(this.o, this.n, this.g, this.i, this.j, this, this.f, this.m);
    }

    public final void a(int i, int i2) {
        if (i + i2 < 1280) {
            this.q.a();
        } else {
            this.q.a(this.p.a(4));
        }
        setBackgroundColor(1711276032);
        this.f.setPadding(this.p.a(16), 0, this.p.a(16), 0);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        if (l.c(18)) {
            layoutParams.addRule(17, a);
            layoutParams.addRule(16, c);
        } else {
            layoutParams.addRule(1, a);
            layoutParams.addRule(0, c);
        }
        this.f.setLayoutParams(layoutParams);
        this.h.setId(e);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.gravity = 16;
        this.h.setLayoutParams(layoutParams2);
        this.g.setId(d);
        this.g.setTextColor(-2236963);
        this.g.setEllipsize(TextUtils.TruncateAt.END);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams3.addRule(3, e);
        this.g.setLayoutParams(layoutParams3);
        this.m.setTextColor(-6710887);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-2, -2);
        this.m.setVisibility(4);
        layoutParams4.addRule(3, e);
        this.m.setLayoutParams(layoutParams4);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(0);
        gradientDrawable.setStroke(1, -3355444);
        RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams5.addRule(3, d);
        this.i.setPadding(this.p.a(4), this.p.a(4), this.p.a(4), this.p.a(4));
        this.i.setBackgroundDrawable(gradientDrawable);
        this.i.setTextSize(2, 12.0f);
        this.i.setTextColor(-3355444);
        this.i.setVisibility(8);
        this.i.setLayoutParams(layoutParams5);
        this.s = new RelativeLayout.LayoutParams(-2, this.p.a(52));
        this.s.rightMargin = this.p.a(16);
        this.s.topMargin = this.p.a(4);
        if (l.c(18)) {
            this.s.addRule(21, -1);
        } else {
            this.s.addRule(11, -1);
        }
        this.n.setLayoutParams(this.s);
        this.n.setContentDescription("fspc");
        this.j.setOrientation(0);
        RelativeLayout.LayoutParams layoutParams6 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams6.addRule(3, e);
        this.j.setLayoutParams(layoutParams6);
        this.j.setVisibility(4);
        LinearLayout.LayoutParams layoutParams7 = new LinearLayout.LayoutParams(this.p.a(73), this.p.a(12));
        layoutParams7.topMargin = this.p.a(4);
        layoutParams7.gravity = 48;
        this.k.setLayoutParams(layoutParams7);
        LinearLayout.LayoutParams layoutParams8 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams8.gravity = 16;
        this.l.setTextColor(-6710887);
        this.l.setGravity(15);
        this.l.setTextSize(2, 14.0f);
        this.l.setLayoutParams(layoutParams8);
        this.o.setId(a);
        this.o.setContentDescription("fspi");
        this.r = new RelativeLayout.LayoutParams(-2, -2);
        this.r.leftMargin = this.p.a(16);
        this.n.setId(c);
        this.n.setPadding(this.p.a(15), 0, this.p.a(15), 0);
        this.n.setMinimumWidth(this.p.a(100));
        this.n.setTransformationMethod(null);
        this.n.setTextSize(2, 22.0f);
        this.n.setMaxWidth(this.p.a(200));
        this.n.setSingleLine();
        this.n.setEllipsize(TextUtils.TruncateAt.END);
        this.h.b().setId(b);
        this.h.b().setBorder(1, -7829368);
        this.h.b().setPadding(this.p.a(2), 0, 0, 0);
        this.h.b().setTextColor(-1118482);
        this.h.b().setBorder(1, -1118482, this.p.a(3));
        this.h.b().setBackgroundColor(1711276032);
        this.j.addView(this.k);
        this.j.addView(this.l);
        this.j.setVisibility(8);
        this.m.setVisibility(8);
        this.f.addView(this.h);
        this.f.addView(this.j);
        this.f.addView(this.m);
        this.f.addView(this.g);
        this.f.addView(this.i);
        addView(this.f);
        addView(this.o);
        addView(this.n);
    }

    public void setBanner(g gVar) {
        int i;
        int i2;
        this.t = gVar.j();
        this.k.setRating(gVar.getRating());
        this.l.setText(String.valueOf(gVar.getVotes()));
        this.h.a().setText(gVar.getTitle());
        this.g.setText(gVar.getDescription());
        String disclaimer = gVar.getDisclaimer();
        if (!TextUtils.isEmpty(disclaimer)) {
            this.i.setVisibility(0);
            this.i.setText(disclaimer);
        }
        if (gVar.getIcon() != null) {
            this.o.setImageBitmap(gVar.getIcon().getData());
        }
        this.n.setText(gVar.getCtaText());
        if (gVar.getIcon() != null) {
            i2 = gVar.getIcon().getWidth();
            i = gVar.getIcon().getHeight();
        } else {
            i = 0;
            i2 = 0;
        }
        if (i2 != 0 && i != 0) {
            this.r.width = this.p.a(64);
            this.r.height = (int) ((i / i2) * this.p.a(64));
        }
        this.r.topMargin = this.p.a(4);
        if (l.c(18)) {
            this.r.addRule(20);
        } else {
            this.r.addRule(9);
        }
        this.o.setLayoutParams(this.r);
        if (gVar.getAgeRestrictions() != null && !gVar.getAgeRestrictions().equals("")) {
            this.h.b().setText(gVar.getAgeRestrictions());
        } else {
            this.h.b().setVisibility(8);
        }
        int f = gVar.f();
        int g = gVar.g();
        int h = gVar.h();
        l.a(this.n, f, g, this.p.a(2));
        this.n.setTextColor(h);
        if ("store".equals(gVar.getNavigationType())) {
            if (gVar.getVotes() != 0 && gVar.getRating() > 0.0f) {
                this.j.setVisibility(0);
            } else {
                this.j.setVisibility(8);
                this.q.b();
            }
        } else {
            this.j.setVisibility(8);
            this.m.setText(gVar.getDomain());
            this.j.setVisibility(8);
        }
        if (gVar.a() == null || !gVar.a().i()) {
            this.j.setVisibility(8);
            this.m.setVisibility(8);
        }
        post(new Runnable() { // from class: com.my.target.core.ui.views.fspromo.FSPromoPanelView.1
            @Override // java.lang.Runnable
            public final void run() {
                if (FSPromoPanelView.this.getResources().getConfiguration().orientation == 2 && FSPromoPanelView.this.h.a().getLayout() != null) {
                    int ellipsisStart = FSPromoPanelView.this.h.a().getLayout().getEllipsisStart(0);
                    int length = FSPromoPanelView.this.h.a().getText().length();
                    FSPromoPanelView.this.h.a().getTextSize();
                    if (ellipsisStart != 0 && ellipsisStart < length) {
                        float textSize = (ellipsisStart / length) * FSPromoPanelView.this.h.a().getTextSize();
                        if (FSPromoPanelView.this.p.b(16) >= textSize) {
                            FSPromoPanelView.this.s.rightMargin = FSPromoPanelView.this.p.a(2);
                            FSPromoPanelView.this.s.topMargin = FSPromoPanelView.this.p.a(4);
                            FSPromoPanelView.this.n.setLayoutParams(FSPromoPanelView.this.s);
                            FSPromoPanelView.this.r.leftMargin = FSPromoPanelView.this.p.a(2);
                            FSPromoPanelView.this.o.setLayoutParams(FSPromoPanelView.this.r);
                            FSPromoPanelView.this.f.setPadding(FSPromoPanelView.this.p.a(2), 0, FSPromoPanelView.this.p.a(2), 0);
                            FSPromoPanelView.this.h.a().setTextSize(2, 16.0f);
                            FSPromoPanelView.this.g.setTextSize(2, 14.0f);
                            return;
                        }
                        FSPromoPanelView.this.h.a().setTextSize(0, textSize);
                    }
                }
            }
        });
    }

    public final void a(View... viewArr) {
        if (getVisibility() == 0) {
            this.q.c(viewArr);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void b(View... viewArr) {
        if (getVisibility() == 0) {
            this.q.a(viewArr);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void c(View... viewArr) {
        this.q.b(viewArr);
    }

    public void setOnCTAClickListener(View.OnClickListener onClickListener) {
        this.n.setOnClickListener(onClickListener);
        if (this.t) {
            setOnClickListener(onClickListener);
        } else {
            setOnClickListener(null);
        }
    }
}
