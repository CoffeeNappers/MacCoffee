package com.my.target.core.ui.views;

import android.annotation.SuppressLint;
import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.my.target.core.models.j;
import com.my.target.core.utils.l;
import com.my.target.nativeads.views.StarsRatingView;
import com.vkontakte.android.data.UserNotification;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public class StandardNative300x250View extends RelativeLayout {
    private static final int a = l.a();
    private static final int b = l.a();
    private static final int c = l.a();
    private static final int d = l.a();
    private final RelativeLayout e;
    private final FitBitmapImageView f;
    private final TextView g;
    private final TextView h;
    private final Button i;
    private final FitBitmapImageView j;
    private final FrameLayout k;
    private final l l;
    private final LinearLayout m;
    private final TextView n;
    private final StarsRatingView o;
    private final FitBitmapImageView p;
    private final FrameLayout q;
    private final BorderedTextView r;

    public StandardNative300x250View(Context context) {
        this(context, null);
    }

    public StandardNative300x250View(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.e = new RelativeLayout(context);
        this.f = new FitBitmapImageView(context);
        this.g = new TextView(context);
        this.h = new TextView(context);
        this.i = new Button(context);
        this.j = new FitBitmapImageView(context);
        this.k = new FrameLayout(context);
        this.l = new l(context);
        this.m = new LinearLayout(context);
        this.n = new TextView(context);
        this.o = new StarsRatingView(context);
        this.p = new FitBitmapImageView(context);
        this.q = new FrameLayout(context);
        this.r = new BorderedTextView(context);
    }

    public void setOnClickListener(View.OnClickListener onClickListener, boolean z) {
        this.i.setOnClickListener(onClickListener);
        if (z) {
            setOnClickListener(onClickListener);
        }
    }

    public void setViewSettings(j jVar, String str) {
        this.g.setTextColor(jVar.j());
        if (jVar.b()) {
            this.g.setTypeface(null, 1);
        } else {
            this.g.setTypeface(null, 0);
        }
        this.h.setTextColor(jVar.o());
        if (jVar.d()) {
            this.h.setTypeface(null, 1);
        } else {
            this.h.setTypeface(null, 0);
        }
        this.n.setTextColor(jVar.p());
        if (jVar.e()) {
            this.n.setTypeface(null, 1);
        } else {
            this.n.setTypeface(null, 0);
        }
        this.f.setBackgroundColor(jVar.h());
        l.a(this.k, 0, l.d(jVar.i()));
        l.a(this.q, 0, l.d(jVar.i()));
        l.a(this, jVar.h(), jVar.i());
        if (UserNotification.LAYOUT_NEWSFEED_BANNER.equals(str)) {
            setBackgroundColor(0);
            this.r.setVisibility(8);
        } else {
            this.r.setTextColor(jVar.l());
            this.r.setBorder(1, jVar.m());
            this.r.setBackgroundColor(jVar.k());
            l.a(this, jVar.h(), jVar.i());
        }
        l.a(this.i, jVar.r(), jVar.s(), this.l.a(2));
        this.i.setTextColor(jVar.t());
        if (!jVar.g()) {
            this.i.setTypeface(null, 0);
        } else {
            this.i.setTypeface(null, 1);
        }
    }

    public void setBanner(com.my.target.core.models.banners.j jVar) {
        RelativeLayout relativeLayout = new RelativeLayout(getContext());
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, this.l.a(42));
        layoutParams.leftMargin = this.l.a(2);
        layoutParams.rightMargin = this.l.a(2);
        this.e.setId(a);
        this.e.setLayoutParams(layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(this.l.a(38), this.l.a(38));
        layoutParams2.rightMargin = this.l.a(2);
        this.k.setId(b);
        this.k.setLayoutParams(layoutParams2);
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(-1, -2);
        layoutParams3.gravity = 17;
        this.f.setLayoutParams(layoutParams3);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams4.addRule(1, b);
        relativeLayout.setLayoutParams(layoutParams4);
        this.g.setTextSize(18.0f);
        this.g.setMaxLines(1);
        this.g.setEllipsize(TextUtils.TruncateAt.END);
        this.g.setTransformationMethod(null);
        this.g.setIncludeFontPadding(false);
        this.g.setId(d);
        this.h.setTextSize(14.0f);
        this.h.setMaxLines(1);
        this.h.setEllipsize(TextUtils.TruncateAt.END);
        this.h.setTransformationMethod(null);
        this.h.setIncludeFontPadding(false);
        RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams5.addRule(3, d);
        this.h.setLayoutParams(layoutParams5);
        this.i.setId(c);
        this.i.setTextSize(20.0f);
        this.i.setPadding(0, 0, 0, 0);
        this.i.setTransformationMethod(null);
        RelativeLayout.LayoutParams layoutParams6 = new RelativeLayout.LayoutParams(-1, this.l.a(36));
        layoutParams6.leftMargin = this.l.a(2);
        layoutParams6.rightMargin = this.l.a(2);
        layoutParams6.bottomMargin = this.l.a(2);
        layoutParams6.addRule(12, -1);
        this.i.setLayoutParams(layoutParams6);
        if (l.c(21)) {
            this.i.setStateListAnimator(null);
        }
        RelativeLayout.LayoutParams layoutParams7 = new RelativeLayout.LayoutParams(this.l.a(296), this.l.a(168));
        layoutParams7.addRule(3, a);
        layoutParams7.addRule(2, c);
        layoutParams7.addRule(14, -1);
        layoutParams7.bottomMargin = this.l.a(2);
        this.j.setLayoutParams(layoutParams7);
        this.j.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        this.n.setTransformationMethod(null);
        this.n.setTextSize(14.0f);
        this.n.setIncludeFontPadding(false);
        RelativeLayout.LayoutParams layoutParams8 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams8.addRule(3, d);
        this.m.setLayoutParams(layoutParams8);
        LinearLayout.LayoutParams layoutParams9 = new LinearLayout.LayoutParams(this.l.a(73), this.l.a(10));
        layoutParams9.topMargin = this.l.a(2);
        layoutParams9.bottomMargin = this.l.a(2);
        layoutParams9.gravity = 48;
        this.o.setLayoutParams(layoutParams9);
        RelativeLayout.LayoutParams layoutParams10 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams10.addRule(11, -1);
        layoutParams10.rightMargin = this.l.a(2);
        this.r.setLayoutParams(layoutParams10);
        this.r.setPadding(this.l.a(2), this.l.a(4), 0, 0);
        this.r.setLines(1);
        this.r.setTextSize(2, 12.0f);
        addView(this.p, -1, -1);
        addView(this.q, -1, -1);
        this.m.addView(this.o);
        this.m.addView(this.n);
        relativeLayout.addView(this.g);
        relativeLayout.addView(this.h);
        relativeLayout.addView(this.m);
        this.k.addView(this.f);
        this.e.addView(this.k);
        this.e.addView(relativeLayout);
        addView(this.e);
        addView(this.i);
        addView(this.j);
        addView(this.r);
        String b2 = jVar.b();
        this.g.setText(b2);
        this.i.setText(jVar.getCtaText());
        if (TextUtils.isEmpty(jVar.getAgeRestrictions())) {
            this.r.setVisibility(8);
        } else {
            this.r.setVisibility(0);
            this.r.setText(jVar.getAgeRestrictions());
        }
        this.f.setImageData(jVar.f());
        this.f.setContentDescription(b2);
        this.j.setImageData(jVar.a());
        this.j.setContentDescription(b2);
        if ("teaser".equals(jVar.getType())) {
            this.p.setVisibility(8);
            this.q.setVisibility(8);
            if ("store".equals(jVar.getNavigationType())) {
                this.h.setVisibility(8);
                this.m.setVisibility(0);
                this.n.setText(String.valueOf(jVar.h()));
                this.o.setRating(jVar.g());
                return;
            }
            this.h.setVisibility(0);
            this.m.setVisibility(8);
            this.h.setText(jVar.e());
            this.h.setContentDescription(jVar.e());
            return;
        }
        this.e.setVisibility(8);
        this.i.setVisibility(8);
        this.j.setVisibility(8);
        this.q.setVisibility(0);
        this.p.setVisibility(0);
        this.p.setImageData(jVar.f());
        this.p.setContentDescription(b2);
    }
}
