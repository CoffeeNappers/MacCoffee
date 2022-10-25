package com.my.target.core.engines;

import android.content.Context;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import com.my.target.core.engines.b;
import com.my.target.core.ui.views.fsslider.FSSliderAppwallAdView;
import com.my.target.core.ui.views.fsslider.FSSliderRecyclerView;
import java.util.ArrayList;
/* compiled from: FSSliderAppwallAdEngine.java */
/* loaded from: classes2.dex */
public final class f extends a {
    private final com.my.target.core.facades.f c;
    private final FSSliderAppwallAdView d;
    @Nullable
    private b.a e;
    private final ArrayList<com.my.target.core.models.banners.d> f;

    @Override // com.my.target.core.engines.b
    public final void a(@Nullable b.a aVar) {
        this.e = aVar;
    }

    public f(final com.my.target.core.facades.f fVar, ViewGroup viewGroup, Context context) {
        super(viewGroup, context);
        this.c = fVar;
        this.d = new FSSliderAppwallAdView(context);
        ArrayList<com.my.target.core.models.banners.f> b = fVar.b();
        this.f = new ArrayList<>();
        com.my.target.core.models.sections.e c = fVar.c();
        this.d.setFSSliderCardListener(new FSSliderRecyclerView.FSSliderCardListener() { // from class: com.my.target.core.engines.f.1
            @Override // com.my.target.core.ui.views.fsslider.FSSliderRecyclerView.FSSliderCardListener
            public final void onClick(View view, com.my.target.core.models.banners.f fVar2) {
                fVar.b(fVar2);
            }

            @Override // com.my.target.core.ui.views.fsslider.FSSliderRecyclerView.FSSliderCardListener
            public final void onCardChange(int i, com.my.target.core.models.banners.f fVar2) {
                if (!f.this.f.contains(fVar2)) {
                    f.this.f.add(fVar2);
                    fVar.a(fVar2);
                }
                f.this.d.a(i);
            }
        });
        this.d.a(c, b);
        this.d.setCloseClickListener(new View.OnClickListener() { // from class: com.my.target.core.engines.f.2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                if (f.this.e != null) {
                    f.this.e.onCloseClick();
                }
            }
        });
        this.a.addView(this.d, new ViewGroup.LayoutParams(-1, -1));
    }

    @Override // com.my.target.core.engines.b
    public final void g() {
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void e() {
        this.c.d();
    }
}
