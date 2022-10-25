package com.my.target.core.engines;

import android.content.Context;
import android.media.AudioManager;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.exoplayer2.util.MimeTypes;
import com.my.target.Tracer;
import com.my.target.core.engines.b;
import com.my.target.core.models.banners.m;
import com.my.target.core.models.k;
import com.my.target.core.ui.views.fspromo.FSPromoDefaultView;
import com.my.target.core.ui.views.fspromo.FSPromoVideoStyleView;
import com.my.target.core.ui.views.fspromo.FSPromoView;
import com.my.target.core.ui.views.video.VideoTextureView;
import com.my.target.core.utils.l;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
/* compiled from: FSPromoAdEngine.java */
/* loaded from: classes2.dex */
public final class e extends a {
    private final com.my.target.core.facades.e c;
    private FSPromoView d;
    private final Runnable e;
    private com.my.target.core.models.banners.g f;
    private b.a g;
    private final View.OnClickListener h;
    private HashSet<com.my.target.core.models.i> i;
    private m j;
    private boolean k;
    private final View.OnClickListener l;
    private final AudioManager.OnAudioFocusChangeListener m;
    private final FSPromoView.a n;
    private boolean o;
    private boolean p;
    private boolean q;
    private final View.OnClickListener r;
    private float s;
    private float t;
    private long u;
    private boolean v;
    private boolean w;
    private final VideoTextureView.a x;

    public final boolean h() {
        return this.v;
    }

    @Override // com.my.target.core.engines.b
    public final void a(b.a aVar) {
        this.g = aVar;
    }

    public e(com.my.target.core.facades.e eVar, ViewGroup viewGroup, Context context) {
        super(viewGroup, context);
        FSPromoView fSPromoDefaultView;
        this.e = new Runnable() { // from class: com.my.target.core.engines.e.1
            @Override // java.lang.Runnable
            public final void run() {
                if (e.this.d != null) {
                    Tracer.d("banner became just closeable");
                    e.this.d.f();
                }
            }
        };
        this.h = new View.OnClickListener() { // from class: com.my.target.core.engines.e.2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                e.this.c.b(e.this.f);
                if (e.this.g != null) {
                    e.this.g.onClick(e.this.f.a() == null && e.this.f.k());
                }
            }
        };
        this.l = new View.OnClickListener() { // from class: com.my.target.core.engines.e.3
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                if (!e.this.k) {
                    e.this.i();
                    e.this.c.a(e.this.j, "volumeOff");
                    e.this.k = true;
                    return;
                }
                e.this.j();
                e.this.c.a(e.this.j, "volumeOn");
                e.this.k = false;
            }
        };
        this.m = new AudioManager.OnAudioFocusChangeListener() { // from class: com.my.target.core.engines.e.4
            @Override // android.media.AudioManager.OnAudioFocusChangeListener
            public final void onAudioFocusChange(int i) {
                switch (i) {
                    case -3:
                        Tracer.d("Audiofocus loss can duck, set volume to 0.3");
                        if (!e.this.k) {
                            e.this.k();
                            return;
                        }
                        return;
                    case -2:
                    case -1:
                        e.this.a();
                        Tracer.d("Audiofocus loss, pausing");
                        return;
                    case 0:
                    case 3:
                    default:
                        return;
                    case 1:
                    case 2:
                    case 4:
                        Tracer.d("Audiofocus gain, unmuting");
                        if (!e.this.k) {
                            e.this.j();
                            return;
                        }
                        return;
                }
            }
        };
        this.n = new FSPromoView.a() { // from class: com.my.target.core.engines.e.5
            @Override // com.my.target.core.ui.views.fspromo.FSPromoView.a
            public final void a() {
                if (!e.this.k) {
                    e.this.a(e.this.b);
                }
                e.this.d.c();
            }

            @Override // com.my.target.core.ui.views.fspromo.FSPromoView.a
            public final void b() {
                e.this.b(e.this.b);
                e.this.c.a(e.this.j, "playbackPaused");
                e.this.d.h();
            }

            @Override // com.my.target.core.ui.views.fspromo.FSPromoView.a
            public final void c() {
                e.this.c.a(e.this.j, "playbackResumed");
                e.this.d.d();
                if (e.this.k) {
                    e.this.i();
                } else {
                    e.this.j();
                }
            }
        };
        this.p = true;
        this.q = false;
        this.r = new View.OnClickListener() { // from class: com.my.target.core.engines.e.6
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                if (e.this.d != null) {
                    e.this.b(e.this.b);
                    e.this.d.a(true);
                }
                if (e.this.q) {
                    e.this.c.a(e.this.j, "closedByUser");
                }
                if (e.this.g != null) {
                    e.this.g.onCloseClick();
                }
            }
        };
        this.v = true;
        this.x = new VideoTextureView.a() { // from class: com.my.target.core.engines.e.7
            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void e() {
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void a(float f) {
                e.this.d.b(f <= 0.0f);
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void f() {
                if (e.this.o && e.this.s == 0.0f) {
                    e.this.d.f();
                }
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void g() {
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void h() {
                if (e.this.w) {
                    e.this.d.h();
                }
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void i() {
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void a(float f, float f2) {
                while (true) {
                    e.this.d.setTimeChanged(f);
                    if (e.this.p) {
                        e.a(e.this, e.this.j.getStats());
                        e.this.c.a(e.this.j, "playbackStarted");
                        e.a(e.this, 0.0f);
                        e.this.p = false;
                    }
                    if (!e.this.q) {
                        e.this.q = true;
                    }
                    if (e.this.o && e.this.s <= f) {
                        e.this.d.f();
                    }
                    if (f <= e.this.t) {
                        break;
                    }
                    f = e.this.t;
                }
                if (f != 0.0f) {
                    e.a(e.this, f);
                }
                if (f == e.this.t) {
                    e.this.v = true;
                    e.p(e.this);
                    e.this.c.c();
                    e.this.d.e();
                }
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void a(String str) {
                Tracer.d("Video playing error: " + str);
                e.p(e.this);
                e.this.d.f();
            }

            @Override // com.my.target.core.ui.views.video.VideoTextureView.a
            public final void j() {
            }
        };
        this.c = eVar;
        this.f = this.c.b();
        if (this.f != null) {
            com.my.target.core.models.banners.g gVar = this.f;
            Context context2 = this.b;
            if (l.c(14) && gVar.a() != null && gVar.l() == 1) {
                fSPromoDefaultView = new FSPromoVideoStyleView(context2);
            } else {
                fSPromoDefaultView = new FSPromoDefaultView(context2);
            }
            this.d = fSPromoDefaultView;
            this.d.setCloseListener(this.r);
            this.d.setVideoListener(this.x);
            this.d.setBanner(this.f);
            this.a.addView(this.d, new ViewGroup.LayoutParams(-1, -1));
            this.j = this.f.a();
            if (this.j != null) {
                this.v = this.j.c();
                if (this.j.i()) {
                    this.u = -1L;
                }
                this.o = this.j.g();
                this.s = this.j.h();
                if (this.o && this.s == 0.0f) {
                    Tracer.d("banner is allowed to close");
                    this.d.f();
                }
                this.t = this.j.f();
                this.d.setOnVideoClickListener(this.n);
                this.k = this.j.e();
                if (this.k) {
                    this.d.a(0);
                } else {
                    if (this.j.i()) {
                        a(this.b);
                    }
                    this.d.a(2);
                }
            } else if (this.f.i() > 0.0f) {
                Tracer.d("banner will be allowed to close in " + this.f.i() + " seconds");
                a(this.f.i() * 1000.0f);
            } else {
                Tracer.d("banner is allowed to close");
                this.d.f();
            }
            this.c.a(this.f);
            this.d.setOnCTAClickListener(this.h);
        }
        if (this.d.b() == null) {
            return;
        }
        this.d.b().setOnClickListener(this.l);
    }

    private void a(long j) {
        this.d.removeCallbacks(this.e);
        this.u = System.currentTimeMillis() + j;
        this.d.postDelayed(this.e, j);
    }

    public final void i() {
        b(this.b);
        this.d.a(0);
    }

    public final void j() {
        if (this.d.g()) {
            a(this.b);
        }
        this.d.a(2);
    }

    public final void k() {
        this.d.a(1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(Context context) {
        ((AudioManager) context.getSystemService(MimeTypes.BASE_TYPE_AUDIO)).requestAudioFocus(this.m, 3, 2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(Context context) {
        if (context != null) {
            ((AudioManager) context.getSystemService(MimeTypes.BASE_TYPE_AUDIO)).abandonAudioFocus(this.m);
        }
    }

    @Override // com.my.target.core.engines.b
    public final void g() {
        this.w = true;
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void a() {
        super.a();
        b(this.b);
        if (this.d != null) {
            if (this.d.g() && !this.d.a()) {
                this.c.a(this.j, "playbackPaused");
                this.d.h();
            }
            this.d.removeCallbacks(this.e);
        }
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void b() {
        super.b();
        if (this.d != null) {
            long currentTimeMillis = System.currentTimeMillis();
            if (this.u != -1) {
                if (currentTimeMillis >= this.u) {
                    this.d.f();
                } else {
                    a(this.u - currentTimeMillis);
                }
            }
        }
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void e() {
        super.e();
        this.c.d();
    }

    static /* synthetic */ void a(e eVar, ArrayList arrayList) {
        if (eVar.i != null) {
            eVar.i.clear();
        } else {
            eVar.i = new HashSet<>();
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            k kVar = (k) it.next();
            if (kVar.c().equals("playheadReachedValue") && (kVar instanceof com.my.target.core.models.i)) {
                eVar.i.add((com.my.target.core.models.i) kVar);
            }
        }
    }

    static /* synthetic */ void a(e eVar, float f) {
        if (eVar.i.isEmpty() || eVar.j == null) {
            return;
        }
        eVar.c.a(eVar.j, eVar.i, f);
    }

    static /* synthetic */ void p(e eVar) {
        boolean z = true;
        eVar.p = true;
        eVar.d.f();
        if (eVar.j != null) {
            z = eVar.j.d();
        }
        eVar.b(eVar.b);
        eVar.d.a(z);
    }
}
