package com.my.target.core.ui.views.fsslider;

import android.content.Context;
import android.util.TypedValue;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.my.target.core.models.banners.f;
import com.my.target.core.models.sections.e;
import com.my.target.core.resources.a;
import com.my.target.core.ui.views.PageDotsView;
import com.my.target.core.ui.views.controls.IconButton;
import com.my.target.core.ui.views.fsslider.FSSliderRecyclerView;
import com.my.target.core.utils.l;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class FSSliderAppwallAdView extends RelativeLayout {
    private static final int a = l.a();
    private static final int b = l.a();
    private static final int c = l.a();
    private final PageDotsView d;
    private final IconButton e;
    private final FSSliderRecyclerView f;
    private final l g;
    private final FrameLayout h;

    public void setCloseClickListener(View.OnClickListener onClickListener) {
        this.e.setOnClickListener(onClickListener);
    }

    public void setFSSliderCardListener(FSSliderRecyclerView.FSSliderCardListener fSSliderCardListener) {
        this.f.setFsSliderCardListener(fSSliderCardListener);
    }

    public FSSliderAppwallAdView(Context context) {
        super(context);
        this.g = new l(context);
        this.d = new PageDotsView(context);
        this.e = new IconButton(context);
        this.h = new FrameLayout(context);
        this.f = new FSSliderRecyclerView(context);
        this.f.setId(a);
        new RelativeLayout.LayoutParams(-2, -2).setMargins(this.g.a(8), this.g.a(16), this.g.a(8), this.g.a(16));
        this.e.setId(c);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 17;
        this.f.setLayoutParams(layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(14, -1);
        layoutParams2.addRule(12, -1);
        layoutParams2.setMargins(0, this.g.a(12), 0, this.g.a(16));
        this.d.setLayoutParams(layoutParams2);
        this.d.setId(b);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams3.addRule(2, b);
        try {
            TypedValue typedValue = new TypedValue();
            if (context.getTheme().resolveAttribute(16843499, typedValue, true)) {
                layoutParams3.topMargin = TypedValue.complexToDimensionPixelSize(typedValue.data, getResources().getDisplayMetrics());
            }
        } catch (Exception e) {
        }
        this.h.setLayoutParams(layoutParams3);
        this.h.addView(this.f);
        addView(this.h);
        addView(this.d);
        addView(this.e);
    }

    public final void a(e eVar, ArrayList<f> arrayList) {
        if (eVar.k() != null && eVar.k().getBitmap() != null) {
            this.e.setBitmap(eVar.k().getBitmap(), true);
        } else {
            this.e.setBitmap(a.d(this.g.a(36)), false);
        }
        setBackgroundColor(eVar.j());
        this.d.a(arrayList.size(), eVar.l(), eVar.i());
        this.f.setBanners(arrayList, eVar.j());
    }

    public final void a(int i) {
        this.d.a(i);
    }
}
