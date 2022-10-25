package com.my.target.core.engines;

import android.content.Context;
import android.os.Handler;
import android.view.ViewGroup;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.widget.RelativeLayout;
import android.widget.ViewFlipper;
import com.my.target.Tracer;
import com.my.target.ads.MyTargetView;
import com.my.target.core.engines.b;
import com.my.target.core.facades.h;
import com.my.target.core.models.j;
import com.my.target.core.net.b;
import com.my.target.core.ui.views.AdView;
import com.my.target.core.ui.views.StandardNative320x50View;
import com.my.target.core.ui.views.controls.AdInfoButton;
import com.vkontakte.android.data.UserNotification;
import java.util.ArrayList;
import java.util.Iterator;
/* compiled from: Native320x50Engine.java */
/* loaded from: classes2.dex */
public final class h extends com.my.target.core.engines.a implements StandardNative320x50View.a {
    private static Handler c;
    private int A;
    private final AdView d;
    private final MyTargetView e;
    private final ViewFlipper[] f;
    private final ViewFlipper g;
    private final com.my.target.core.facades.h[] h;
    private final a i;
    private final b.a j;
    private final Animation.AnimationListener k;
    private final Runnable l;
    private final b.a m;
    private final h.a n;
    private int o;
    private long p;
    private long q;
    private int r;
    private j s;
    private AdInfoButton t;
    private ArrayList<com.my.target.core.models.banners.j> u;
    private ArrayList<com.my.target.core.models.banners.j> v;
    private com.my.target.core.models.banners.j w;
    private boolean x;
    private boolean y;
    private boolean z;

    private static ArrayList<com.my.target.core.models.h> a(ArrayList<com.my.target.core.models.banners.j> arrayList) {
        ArrayList<com.my.target.core.models.h> arrayList2 = new ArrayList<>();
        Iterator<com.my.target.core.models.banners.j> it = arrayList.iterator();
        while (it.hasNext()) {
            com.my.target.core.models.banners.j next = it.next();
            if (next.f() != null) {
                arrayList2.add(next.f());
            }
        }
        return arrayList2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public com.my.target.core.facades.h i() {
        return this.h[this.o];
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ViewFlipper j() {
        return this.f[this.o];
    }

    /* JADX INFO: Access modifiers changed from: private */
    public com.my.target.core.facades.h k() {
        return this.h[this.o ^ 1];
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ViewFlipper l() {
        return this.f[this.o ^ 1];
    }

    @Override // com.my.target.core.ui.views.StandardNative320x50View.a
    public final void h() {
        if (this.y) {
            m();
        }
    }

    @Override // com.my.target.core.ui.views.StandardNative320x50View.a
    public final void a(int i) {
        this.A = i;
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void a(com.my.target.core.facades.g gVar) {
        if (!(gVar instanceof com.my.target.core.facades.h)) {
            Tracer.d("StandardAdEngine: incorrect ad type");
            return;
        }
        this.h[this.o] = (com.my.target.core.facades.h) gVar;
        this.s = ((com.my.target.core.facades.h) gVar).j();
        a(((com.my.target.core.facades.h) gVar).h());
        this.v = ((com.my.target.core.facades.h) gVar).f();
        if (!this.v.isEmpty()) {
            ArrayList<com.my.target.core.models.h> a2 = a(this.v);
            if (!a2.isEmpty()) {
                com.my.target.core.net.b.a().a(a2, this.b, this.j);
            } else {
                this.i.e();
                if (this.e.getListener() != null) {
                    this.e.getListener().onLoad(this.e);
                }
            }
            if (i() != null) {
                b(i().e());
            }
            Tracer.d("load native");
        } else if (this.e.getListener() != null) {
            this.e.getListener().onNoAd("No ad", this.e);
        }
    }

    @Override // com.my.target.core.engines.b
    public final void g() {
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void a() {
        super.a();
        if (this.i.a()) {
            Tracer.d("Pause native banner");
            if (!this.z && this.w != null) {
                this.q = (this.w.getTimeout() * 1000) - (System.currentTimeMillis() - this.p);
            }
            if (c != null) {
                c.removeCallbacks(this.l);
                c = null;
            }
            p();
            this.i.f();
            return;
        }
        Tracer.d("Cannot pause native banner");
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void b() {
        super.b();
        if (this.i.c()) {
            Tracer.d("Resume native banner");
            this.d.setVisibility(0);
            o();
            a(false);
            this.i.g();
            return;
        }
        Tracer.d("Cannot resume native banner");
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void c() {
        super.c();
        if (this.i.b()) {
            Tracer.d("Stop native banner");
            this.d.setVisibility(4);
            if (c != null) {
                c.removeCallbacks(this.l);
                c = null;
            }
            p();
            j().removeAllViews();
            l().removeAllViews();
            this.y = false;
            this.x = false;
            q();
            this.i.i();
            return;
        }
        Tracer.d("Cannot stop native banner: Not started");
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void d() {
        super.d();
        if (this.i.d()) {
            Tracer.d("Start native banner");
            this.d.setVisibility(0);
            n();
            this.i.h();
            return;
        }
        Tracer.d("Cannot start native banner");
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void f() {
        super.f();
        c();
        Tracer.d("Destroy native banner");
        this.h[0] = null;
        this.h[1] = null;
        this.i.j();
    }

    @Override // com.my.target.core.engines.b
    public final void a(b.a aVar) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(String str) {
        if (str != null) {
            if (this.t == null) {
                this.t = new AdInfoButton(this.b);
                this.d.addView(this.t, -2, -2);
            }
            this.t.setUrl(str);
        } else if (this.t != null) {
            ViewGroup viewGroup = (ViewGroup) this.t.getParent();
            if (viewGroup != null) {
                viewGroup.removeView(this.t);
            }
            this.t = null;
        }
    }

    public h(MyTargetView myTargetView, Context context) {
        super(myTargetView, context);
        this.i = new a((byte) 0);
        this.j = new b.a() { // from class: com.my.target.core.engines.h.1
            @Override // com.my.target.core.net.b.a
            public final void onLoad() {
                h.this.i.e();
                if (h.this.e.getListener() != null) {
                    h.this.e.getListener().onLoad(h.this.e);
                }
            }
        };
        this.k = new Animation.AnimationListener() { // from class: com.my.target.core.engines.h.2
            @Override // android.view.animation.Animation.AnimationListener
            public final void onAnimationStart(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public final void onAnimationEnd(Animation animation) {
                h.this.z = false;
                h.this.p = System.currentTimeMillis();
                if (h.this.u.size() <= h.this.j().getDisplayedChild()) {
                    if (h.this.w == null) {
                        Tracer.d("list of banners count doesn't match views count, restarting");
                        h.this.n();
                    }
                } else {
                    h.this.w = (com.my.target.core.models.banners.j) h.this.u.get(h.this.j().getDisplayedChild());
                }
                if (h.this.i() != null) {
                    h.this.b(h.this.i().e());
                    h.this.i().b(h.this.w.getId());
                    h.this.q = h.this.w.getTimeout() * 1000;
                    h.this.a(true);
                    h.this.o();
                }
            }

            @Override // android.view.animation.Animation.AnimationListener
            public final void onAnimationRepeat(Animation animation) {
            }
        };
        this.l = new Runnable() { // from class: com.my.target.core.engines.h.3
            @Override // java.lang.Runnable
            public final void run() {
                if (h.this.u != null && !h.this.u.isEmpty() && h.this.w != null) {
                    if (UserNotification.LAYOUT_NEWSFEED_BANNER.equals(h.this.w.getType())) {
                        h.this.m();
                    } else {
                        h.this.y = true;
                    }
                }
            }
        };
        this.m = new b.a() { // from class: com.my.target.core.engines.h.4
            @Override // com.my.target.core.net.b.a
            public final void onLoad() {
                h.this.a(h.this.l());
                h.this.x = true;
                if (UserNotification.LAYOUT_NEWSFEED_BANNER.equals(h.this.w.getType()) && h.this.w.getTimeout() * 1000 <= System.currentTimeMillis() - h.this.p) {
                    h.this.m();
                }
            }
        };
        this.n = new h.a() { // from class: com.my.target.core.engines.h.5
            @Override // com.my.target.core.facades.h.a
            public final void onLoad(com.my.target.core.facades.h hVar) {
                if (hVar == h.this.k()) {
                    h.this.k().a((h.a) null);
                    h.a(h.this, h.this.k());
                }
            }

            @Override // com.my.target.core.facades.h.a
            public final void onNoAd(String str, com.my.target.core.facades.h hVar) {
                h.this.q();
            }
        };
        this.e = myTargetView;
        this.u = new ArrayList<>();
        this.d = new AdView(context);
        this.g = new ViewFlipper(context);
        this.f = new ViewFlipper[2];
        this.f[0] = new ViewFlipper(context);
        this.f[1] = new ViewFlipper(context);
        this.h = new com.my.target.core.facades.h[2];
        float f = this.b.getResources().getDisplayMetrics().density;
        this.r = (int) (50.0f * f);
        this.g.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        this.d.setMaxWidth((int) (f * 640.0f));
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, this.r);
        layoutParams2.addRule(13);
        this.d.setLayoutParams(layoutParams2);
        this.g.addView(this.f[0]);
        this.g.addView(this.f[1]);
        this.d.addView(this.g, layoutParams);
        this.a.addView(this.d);
    }

    public final void a(String str) {
        Tracer.d("Banner clicked " + str);
        if (i() != null) {
            i().a(str);
        }
        if (this.e.getListener() != null) {
            this.e.getListener().onClick(this.e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void m() {
        if (!this.x) {
            if (j().getDisplayedChild() < j().getChildCount() - 1) {
                p();
                this.z = true;
                this.y = false;
                j().showNext();
                return;
            } else if (i() != null && i().h() != null) {
                if (i().h().l() && i() != null && i().b() && k() == null) {
                    this.h[this.o ^ 1] = i().i();
                    k().a(this.n);
                    k().load();
                }
                if (j().getChildCount() > 1 && i().h().m()) {
                    this.z = true;
                    this.y = false;
                    j().setDisplayedChild(0);
                    return;
                }
                return;
            } else {
                return;
            }
        }
        this.o ^= 1;
        this.g.setDisplayedChild(this.o);
        this.h[this.o ^ 1].a((h.a) null);
        this.h[this.o ^ 1] = null;
        a(false);
        this.w = this.u.get(0);
        if (i() != null) {
            i().b(this.w.getId());
            a(i().h());
            this.q = this.w.getTimeout() * 1000;
            o();
        }
        this.y = false;
        this.x = false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void n() {
        a(j());
        if (this.u != null && !this.u.isEmpty()) {
            this.w = this.u.get(0);
            if (i() != null) {
                i().b(this.w.getId());
                this.p = System.currentTimeMillis();
                Handler handler = new Handler();
                c = handler;
                handler.postDelayed(this.l, this.w.getTimeout() * 1000);
                a(false);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void o() {
        if (c != null) {
            c.removeCallbacks(this.l);
        }
        if (this.u != null && !this.u.isEmpty() && this.q > 0) {
            if (c == null) {
                c = new Handler();
            }
            c.postDelayed(this.l, this.q);
        }
    }

    private void a(com.my.target.core.models.sections.j jVar) {
        int i;
        AlphaAnimation a2;
        Animation b;
        ViewFlipper[] viewFlipperArr;
        if (jVar == null) {
            i = 0;
        } else {
            i = jVar.n();
        }
        if (i != 0) {
            if (i != 2) {
                a2 = com.my.target.core.utils.b.a();
            } else {
                TranslateAnimation translateAnimation = new TranslateAnimation(2, 1.0f, 2, 0.0f, 2, 0.0f, 2, 0.0f);
                translateAnimation.setDuration(400L);
                translateAnimation.setInterpolator(new AccelerateDecelerateInterpolator());
                a2 = translateAnimation;
            }
        } else {
            AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
            alphaAnimation.setDuration(10L);
            a2 = alphaAnimation;
        }
        if (i != 0) {
            if (i != 2) {
                b = com.my.target.core.utils.b.b();
            } else {
                b = new TranslateAnimation(2, 0.0f, 2, -1.0f, 2, 0.0f, 2, 0.0f);
                b.setDuration(400L);
                b.setInterpolator(new AccelerateDecelerateInterpolator());
            }
        } else {
            b = new AlphaAnimation(1.0f, 0.0f);
            b.setStartOffset(10L);
            b.setDuration(10L);
        }
        a2.setAnimationListener(this.k);
        this.g.setInAnimation(a2);
        this.g.setOutAnimation(b);
        for (ViewFlipper viewFlipper : this.f) {
            viewFlipper.setInAnimation(a2);
            viewFlipper.setOutAnimation(b);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(ViewFlipper viewFlipper) {
        l().removeAllViews();
        Iterator<com.my.target.core.models.banners.j> it = this.v.iterator();
        while (it.hasNext()) {
            com.my.target.core.models.banners.j next = it.next();
            StandardNative320x50View standardNative320x50View = new StandardNative320x50View(this.b, this.r);
            standardNative320x50View.setViewSettings(this.s, UserNotification.LAYOUT_NEWSFEED_BANNER.equals(next.getType()));
            standardNative320x50View.setMyTargetClickListener(this);
            standardNative320x50View.setEngineListener(this);
            viewFlipper.addView(standardNative320x50View);
            standardNative320x50View.setBanner(next, this.A);
        }
        this.u = this.v;
    }

    private void p() {
        if (j() != null && j().getCurrentView() != null) {
            ((StandardNative320x50View) j().getCurrentView()).a();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(boolean z) {
        if (j() != null && j().getCurrentView() != null) {
            ((StandardNative320x50View) j().getCurrentView()).a(z);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void q() {
        if (this.h[this.o ^ 1] != null) {
            this.h[this.o ^ 1].a((h.a) null);
            this.h[this.o ^ 1] = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: Native320x50Engine.java */
    /* loaded from: classes2.dex */
    public static class a {
        private boolean a;
        private boolean b;
        private boolean c;

        private a() {
        }

        /* synthetic */ a(byte b) {
            this();
        }

        public final boolean a() {
            return this.b && !this.c;
        }

        public final boolean b() {
            return this.b;
        }

        public final boolean c() {
            return this.b && this.c;
        }

        public final boolean d() {
            return this.a;
        }

        public final void e() {
            this.a = true;
        }

        public final void f() {
            this.c = true;
        }

        public final void g() {
            this.c = false;
        }

        public final void h() {
            this.b = true;
        }

        public final void i() {
            this.b = false;
            this.c = false;
        }

        public final void j() {
            this.b = false;
            this.c = false;
            this.a = false;
        }
    }

    static /* synthetic */ void a(h hVar, com.my.target.core.facades.h hVar2) {
        hVar.v = hVar2.f();
        ArrayList<com.my.target.core.models.h> a2 = a(hVar.v);
        if (a2.isEmpty()) {
            hVar.a(hVar.l());
            hVar.x = true;
            if (!UserNotification.LAYOUT_NEWSFEED_BANNER.equals(hVar.w.getType()) || hVar.w.getTimeout() * 1000 > System.currentTimeMillis() - hVar.p) {
                return;
            }
            hVar.m();
        } else if (a2.size() <= 0) {
        } else {
            com.my.target.core.net.b.a().a(a2, hVar.b, hVar.m);
        }
    }
}
