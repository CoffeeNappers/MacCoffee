package com.my.target.core.ui.views.fspromo;

import android.annotation.SuppressLint;
import android.content.Context;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.my.target.core.models.banners.g;
import com.my.target.core.utils.l;
import com.my.target.nativeads.views.StarsRatingView;
@SuppressLint({"ViewConstructor"})
/* loaded from: classes2.dex */
public class FSPromoBodyView extends LinearLayout {
    protected final TextView a;
    protected final TextView b;
    protected final TextView c;
    protected final LinearLayout d;
    protected final TextView e;
    protected final StarsRatingView f;
    protected final TextView g;
    protected LinearLayout.LayoutParams h;
    protected LinearLayout.LayoutParams i;
    protected LinearLayout.LayoutParams j;
    protected LinearLayout.LayoutParams k;
    protected LinearLayout.LayoutParams l;
    protected LinearLayout.LayoutParams m;
    private final l n;
    private final boolean o;

    public FSPromoBodyView(Context context, l lVar, boolean z) {
        super(context);
        this.a = new TextView(context);
        this.b = new TextView(context);
        this.c = new TextView(context);
        this.d = new LinearLayout(context);
        this.e = new TextView(context);
        this.f = new StarsRatingView(context);
        this.g = new TextView(context);
        this.n = lVar;
        this.o = z;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(boolean z) {
        this.a.setGravity(1);
        this.a.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        this.h = new LinearLayout.LayoutParams(-2, -2);
        this.h.gravity = 1;
        this.h.leftMargin = this.n.a(8);
        this.h.rightMargin = this.n.a(8);
        if (z) {
            this.h.topMargin = this.n.a(4);
        } else {
            this.h.topMargin = this.n.a(32);
        }
        this.a.setLayoutParams(this.h);
        this.i = new LinearLayout.LayoutParams(-2, -2);
        this.i.gravity = 1;
        this.b.setLayoutParams(this.i);
        this.c.setGravity(1);
        this.c.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        this.j = new LinearLayout.LayoutParams(-2, -2);
        if (z) {
            this.j.topMargin = this.n.a(4);
        } else {
            this.j.topMargin = this.n.a(8);
        }
        this.j.gravity = 1;
        if (z) {
            this.j.leftMargin = this.n.a(4);
            this.j.rightMargin = this.n.a(4);
        } else {
            this.j.leftMargin = this.n.a(16);
            this.j.rightMargin = this.n.a(16);
        }
        this.c.setLayoutParams(this.j);
        this.d.setOrientation(0);
        this.l = new LinearLayout.LayoutParams(-2, -2);
        this.l.gravity = 1;
        this.d.setLayoutParams(this.l);
        this.k = new LinearLayout.LayoutParams(this.n.a(73), this.n.a(12));
        this.k.topMargin = this.n.a(4);
        this.f.setLayoutParams(this.k);
        this.g.setTextColor(-6710887);
        this.g.setTextSize(2, 14.0f);
        this.e.setTextColor(-6710887);
        this.e.setGravity(1);
        this.m = new LinearLayout.LayoutParams(-2, -2);
        this.m.gravity = 1;
        if (z) {
            this.m.leftMargin = this.n.a(4);
            this.m.rightMargin = this.n.a(4);
        } else {
            this.m.leftMargin = this.n.a(16);
            this.m.rightMargin = this.n.a(16);
        }
        this.m.gravity = 1;
        this.e.setLayoutParams(this.m);
        addView(this.a);
        addView(this.b);
        addView(this.d);
        addView(this.c);
        addView(this.e);
        this.d.addView(this.f);
        this.d.addView(this.g);
    }

    public void setBanner(g gVar) {
        this.a.setText(gVar.getTitle());
        this.c.setText(gVar.getDescription());
        this.f.setRating(gVar.getRating());
        this.g.setText(String.valueOf(gVar.getVotes()));
        if ("store".equals(gVar.getNavigationType())) {
            String category = gVar.getCategory();
            String subcategory = gVar.getSubcategory();
            String str = "";
            if (!TextUtils.isEmpty(category)) {
                str = str + category;
            }
            if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(subcategory)) {
                str = str + ", ";
            }
            if (!TextUtils.isEmpty(subcategory)) {
                str = str + subcategory;
            }
            if (!TextUtils.isEmpty(str)) {
                this.b.setText(str);
                this.b.setVisibility(0);
            } else {
                this.b.setVisibility(8);
            }
            this.d.setVisibility(0);
            if (gVar.getVotes() != 0 && gVar.getRating() > 0.0f) {
                this.d.setVisibility(0);
            } else {
                this.d.setVisibility(8);
            }
            this.b.setTextColor(-3355444);
        } else {
            this.d.setVisibility(8);
            this.b.setText(gVar.getDomain());
            this.d.setVisibility(8);
            this.b.setTextColor(-16733198);
        }
        if (TextUtils.isEmpty(gVar.getDisclaimer())) {
            this.e.setVisibility(8);
        } else {
            this.e.setVisibility(0);
            this.e.setText(gVar.getDisclaimer());
        }
        if (this.o) {
            this.a.setTextSize(2, 32.0f);
            this.c.setTextSize(2, 24.0f);
            this.e.setTextSize(2, 18.0f);
            this.b.setTextSize(2, 18.0f);
            return;
        }
        this.a.setTextSize(2, 20.0f);
        this.c.setTextSize(2, 16.0f);
        this.e.setTextSize(2, 14.0f);
        this.b.setTextSize(2, 16.0f);
    }
}
