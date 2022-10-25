package com.my.target.core.ui.views.fspromo;

import android.annotation.SuppressLint;
import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.RelativeLayout;
import com.my.target.core.models.banners.g;
import com.my.target.core.ui.views.BorderedTextView;
import com.my.target.core.utils.l;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public class FSPromoVerticalView extends RelativeLayout {
    private static final int a = l.a();
    private static final int b = l.a();
    private static final int c = l.a();
    private static final int d = l.a();
    private final FSPromoBodyView e;
    private final Button f;
    private final BorderedTextView g;
    private final FSPromoFooterView h;
    private final l i;
    private final boolean j;
    private boolean k;

    public FSPromoVerticalView(Context context, l lVar, boolean z) {
        super(context);
        this.i = lVar;
        this.j = z;
        this.h = new FSPromoFooterView(context, lVar, z);
        this.e = new FSPromoBodyView(context, lVar, z);
        this.f = new Button(context);
        this.g = new BorderedTextView(context);
    }

    public final void a(int i, int i2) {
        boolean z = i + i2 < 1280;
        int max = Math.max(i2, i) / 8;
        this.e.a(z);
        this.h.a();
        View view = new View(getContext());
        view.setBackgroundColor(-5592406);
        view.setLayoutParams(new RelativeLayout.LayoutParams(-1, 1));
        this.h.setId(b);
        this.h.a(max, z);
        this.f.setId(c);
        this.f.setPadding(this.i.a(15), 0, this.i.a(15), 0);
        this.f.setMinimumWidth(this.i.a(100));
        this.f.setTransformationMethod(null);
        this.f.setSingleLine();
        this.f.setEllipsize(TextUtils.TruncateAt.END);
        this.g.setId(a);
        this.g.setBorder(1, -7829368);
        this.g.setPadding(this.i.a(2), 0, 0, 0);
        this.g.setTextColor(-1118482);
        this.g.setBorder(1, -1118482, this.i.a(3));
        this.g.setBackgroundColor(1711276032);
        this.e.setId(d);
        this.e.setOrientation(1);
        this.e.setGravity(14);
        if (z) {
            this.e.setPadding(this.i.a(4), this.i.a(4), this.i.a(4), this.i.a(4));
        } else {
            this.e.setPadding(this.i.a(16), this.i.a(16), this.i.a(16), this.i.a(16));
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(2, b);
        this.e.setLayoutParams(layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.setMargins(this.i.a(16), this.i.a(16), this.i.a(16), this.i.a(4));
        if (l.c(18)) {
            layoutParams2.addRule(21, -1);
        } else {
            layoutParams2.addRule(11, -1);
        }
        this.g.setLayoutParams(layoutParams2);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, this.j ? this.i.a(64) : this.i.a(52));
        layoutParams3.addRule(14, -1);
        layoutParams3.addRule(8, d);
        if (z) {
            layoutParams3.bottomMargin = (-this.i.a(52)) - this.i.a(4);
        } else {
            layoutParams3.bottomMargin = (-this.i.a(52)) / 2;
        }
        this.f.setLayoutParams(layoutParams3);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-1, max);
        layoutParams4.addRule(12, -1);
        this.h.setLayoutParams(layoutParams4);
        addView(this.e);
        addView(view);
        addView(this.g);
        addView(this.h);
        addView(this.f);
        setClickable(true);
        if (this.j) {
            this.f.setTextSize(2, 32.0f);
        } else {
            this.f.setTextSize(2, 22.0f);
        }
    }

    public void setBanner(g gVar) {
        this.e.setBanner(gVar);
        this.h.setBanner(gVar);
        this.k = gVar.j();
        this.f.setText(gVar.getCtaText());
        this.h.setBackgroundColor(gVar.d());
        if (TextUtils.isEmpty(gVar.getAgeRestrictions())) {
            this.g.setVisibility(8);
        } else {
            this.g.setText(gVar.getAgeRestrictions());
        }
        int f = gVar.f();
        int g = gVar.g();
        int h = gVar.h();
        l.a(this.f, f, g, this.i.a(2));
        this.f.setTextColor(h);
    }

    public void setOnCTAClickListener(View.OnClickListener onClickListener) {
        if (this.k) {
            setOnClickListener(onClickListener);
            l.a(this, -1, -3806472);
            setClickable(true);
        } else {
            setBackgroundColor(-1);
        }
        this.f.setOnClickListener(onClickListener);
    }
}
