package com.my.target.core.engines;

import android.content.Context;
import android.view.View;
import android.widget.RelativeLayout;
import com.my.target.Tracer;
import com.my.target.ads.MyTargetView;
import com.my.target.core.engines.b;
import com.my.target.core.models.banners.j;
import com.my.target.core.net.b;
import com.my.target.core.ui.views.StandardNative300x250View;
import com.my.target.core.utils.l;
import com.vkontakte.android.data.UserNotification;
import java.util.ArrayList;
/* compiled from: Native300x250Engine.java */
/* loaded from: classes2.dex */
public final class g extends a implements View.OnClickListener {
    private final MyTargetView c;
    private com.my.target.core.facades.h d;
    private b.a e;
    private final StandardNative300x250View f;
    private j g;
    private boolean h;

    @Override // com.my.target.core.engines.b
    public final void a(b.a aVar) {
    }

    public g(MyTargetView myTargetView, Context context) {
        super(myTargetView, context);
        this.e = new b.a() { // from class: com.my.target.core.engines.g.1
            @Override // com.my.target.core.net.b.a
            public final void onLoad() {
                if (!UserNotification.LAYOUT_NEWSFEED_BANNER.equals(g.this.g.getType()) || (g.this.g.f() != null && g.this.g.f().getBitmap() != null)) {
                    if (g.this.c.getListener() != null) {
                        g.this.c.getListener().onLoad(g.this.c);
                    }
                    g.this.h();
                    return;
                }
                Tracer.d("StandardAdEngine: unable to load picture in banner");
                if (g.this.c.getListener() != null) {
                    g.this.c.getListener().onNoAd("Unable to load banner picture", g.this.c);
                }
            }
        };
        this.c = myTargetView;
        this.f = new StandardNative300x250View(context);
        l lVar = new l(this.b);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(lVar.a(300), lVar.a(250));
        layoutParams.addRule(13);
        this.f.setLayoutParams(layoutParams);
        this.a.addView(this.f);
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        if (this.g != null) {
            Tracer.d("StandardAdEngine: banner clicked " + this.g.getId());
            if (this.d != null) {
                this.d.a(this.g.getId());
            }
            if (this.c.getListener() != null) {
                this.c.getListener().onClick(this.c);
            }
        }
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void a(com.my.target.core.facades.g gVar) {
        if (gVar instanceof com.my.target.core.facades.h) {
            this.d = (com.my.target.core.facades.h) gVar;
            com.my.target.core.models.j j = this.d.j();
            if (this.d.f() != null && !this.d.f().isEmpty()) {
                this.g = this.d.f().get(0);
                if (this.g == null) {
                    if (this.c.getListener() != null) {
                        this.c.getListener().onNoAd("No ad", this.c);
                        return;
                    }
                    return;
                }
                this.h = this.d.h().j();
                this.f.setViewSettings(j, this.g.getType());
                j jVar = this.g;
                ArrayList arrayList = new ArrayList();
                if (jVar.f() != null) {
                    arrayList.add(jVar.f());
                }
                if (jVar.a() != null) {
                    arrayList.add(jVar.a());
                }
                String type = this.g.getType();
                if (!arrayList.isEmpty()) {
                    Tracer.d("StandardAdEngine: load native");
                    com.my.target.core.net.b.a().a(arrayList, this.b, this.e);
                    this.f.setViewSettings(j, type);
                    return;
                } else if (this.c.getListener() != null) {
                    if (type.equals(UserNotification.LAYOUT_NEWSFEED_BANNER)) {
                        this.c.getListener().onNoAd("No banner picture", this.c);
                        return;
                    }
                    Tracer.d("StandardAdEngine: there are no pictures in teaser");
                    h();
                    return;
                } else {
                    return;
                }
            } else if (this.c.getListener() != null) {
                this.c.getListener().onNoAd("No ad", this.c);
                return;
            } else {
                return;
            }
        }
        Tracer.d("StandardAdEngine: incorrect ad type");
    }

    @Override // com.my.target.core.engines.b
    public final void g() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void h() {
        this.f.setBanner(this.g);
        this.f.setOnClickListener(this, this.h);
        this.c.getListener().onLoad(this.c);
        this.d.b(this.g.getId());
    }
}
