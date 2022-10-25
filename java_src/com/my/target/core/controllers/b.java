package com.my.target.core.controllers;

import android.net.Uri;
import android.os.Handler;
import com.my.target.Tracer;
import com.my.target.ads.instream.InstreamAd;
import com.my.target.ads.instream.InstreamAdPlayer;
import com.my.target.core.models.banners.m;
import com.my.target.core.models.i;
import com.my.target.core.models.sections.k;
import com.my.target.core.utils.n;
import com.my.target.nativeads.models.VideoData;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
/* compiled from: InstreamAdVideoController.java */
/* loaded from: classes2.dex */
public final class b {
    private static Handler a;
    private final InstreamAd b;
    private com.my.target.core.models.c e;
    private int f;
    private String g;
    private boolean h;
    private boolean i;
    private AtomicInteger j;
    private ArrayList<m> k;
    private InstreamAdPlayer l;
    private m m;
    private int n;
    private int o;
    private InstreamAd.InstreamAdListener p;
    private k q;
    private HashSet<i> r;
    private InstreamAd.InstreamAdBanner s;
    private boolean t;
    private boolean u;
    private float v;
    private a w;
    private int x;
    private final Runnable c = new Runnable() { // from class: com.my.target.core.controllers.b.1
        /* JADX WARN: Removed duplicated region for block: B:36:0x010f  */
        /* JADX WARN: Removed duplicated region for block: B:47:0x0179  */
        @Override // java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final void run() {
            /*
                Method dump skipped, instructions count: 403
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.my.target.core.controllers.b.AnonymousClass1.run():void");
        }
    };
    private final InstreamAdPlayer.AdPlayerListener d = new InstreamAdPlayer.AdPlayerListener() { // from class: com.my.target.core.controllers.b.2
        @Override // com.my.target.ads.instream.InstreamAdPlayer.AdPlayerListener
        public final void onAdVideoStarted() {
            Tracer.d("сontroller: onAdVideoStarted");
            if (b.this.p != null) {
                b.this.p.onBannerStart(b.this.b, b.this.s);
            }
            b.this.u = true;
            b.this.l();
            b.this.t = true;
        }

        @Override // com.my.target.ads.instream.InstreamAdPlayer.AdPlayerListener
        public final void onAdVideoPaused() {
            Tracer.d("сontroller: onAdVideoPaused");
            if (b.this.j()) {
                b.this.k();
                b.this.t = false;
                com.my.target.core.models.c.a(b.this.m, "playbackPaused", b.this.l.getView().getContext());
            }
        }

        @Override // com.my.target.ads.instream.InstreamAdPlayer.AdPlayerListener
        public final void onAdVideoResumed() {
            Tracer.d("сontroller: onAdVideoResumed");
            if (b.this.j()) {
                b.this.l();
                b.this.t = true;
                com.my.target.core.models.c.a(b.this.m, "playbackResumed", b.this.l.getView().getContext());
            }
        }

        @Override // com.my.target.ads.instream.InstreamAdPlayer.AdPlayerListener
        public final void onAdVideoStopped() {
            Tracer.d("сontroller: onAdVideoStopped");
            if (b.this.j()) {
                b.this.k();
                b.this.t = false;
            }
        }

        @Override // com.my.target.ads.instream.InstreamAdPlayer.AdPlayerListener
        public final void onAdVideoError(String str) {
            Tracer.d("сontroller: onAdVideoError");
            if (b.this.p != null) {
                b.this.p.onError(str, b.this.b);
            }
            b.this.a(false, false);
        }

        @Override // com.my.target.ads.instream.InstreamAdPlayer.AdPlayerListener
        public final void onAdVideoCompleted() {
            Tracer.d("сontroller: onAdVideoCompleted");
            b.this.k();
            b.a(b.this, b.this.s.duration);
            if (b.this.p != null) {
                b.this.p.onBannerTimeLeftChange(0.0f, b.this.s.duration, b.this.b);
            }
            b.this.a(false, false);
        }

        @Override // com.my.target.ads.instream.InstreamAdPlayer.AdPlayerListener
        public final void onVolumeChanged(float f) {
            if (Float.compare(f, 0.0f) >= 0 && Float.compare(f, 1.0f) <= 0) {
                if (b.this.j() && Float.compare(b.this.z, f) != 0) {
                    if (Float.compare(f, 0.0f) > 0) {
                        com.my.target.core.models.c.a(b.this.m, "volumeOn", b.this.l.getView().getContext());
                    } else {
                        com.my.target.core.models.c.a(b.this.m, "volumeOff", b.this.l.getView().getContext());
                    }
                    b.this.z = f;
                    return;
                }
                return;
            }
            Tracer.d("wrong volume got from onVolumeChanged: " + f + ", volume must be in range [0..1]");
        }
    };
    private float y = 1.0f;
    private float z = 1.0f;

    /* compiled from: InstreamAdVideoController.java */
    /* loaded from: classes2.dex */
    public interface a {
        void sectionCompleted(String str);
    }

    static /* synthetic */ int p(b bVar) {
        int i = bVar.o;
        bVar.o = i + 1;
        return i;
    }

    public final InstreamAdPlayer a() {
        return this.l;
    }

    public final boolean a(String str) {
        return str.equals(this.g) && this.j != null && this.j.get() <= 0;
    }

    public final void a(com.my.target.core.models.c cVar) {
        this.e = cVar;
    }

    public final void a(a aVar) {
        this.w = aVar;
    }

    public final void a(boolean z) {
        String str;
        if (j()) {
            if (z) {
                str = "fullscreenOn";
            } else {
                str = "fullscreenOff";
            }
            com.my.target.core.models.c.a(this.m, str, this.l.getView().getContext());
        }
    }

    public final void a(InstreamAdPlayer instreamAdPlayer) {
        this.l = instreamAdPlayer;
        instreamAdPlayer.setAdPlayerListener(this.d);
    }

    public final void a(InstreamAd.InstreamAdListener instreamAdListener) {
        this.p = instreamAdListener;
    }

    public final void a(int i) {
        this.n = i;
    }

    public final void a(float f) {
        if (this.l != null && Float.compare(f, this.y) != 0) {
            this.l.setVolume(f);
        }
        this.y = f;
    }

    public b(InstreamAd instreamAd) {
        this.b = instreamAd;
    }

    public final void a(k kVar, List<m> list) {
        int d = kVar.k().d();
        if (!kVar.e().equals(this.g) && d > 0) {
            this.j = new AtomicInteger(d);
        }
        this.g = kVar.e();
        b(kVar, list);
    }

    public final void b(k kVar, List<m> list) {
        if (!kVar.e().equals(this.g)) {
            Tracer.d("try to continue wrong section");
            return;
        }
        this.k = new ArrayList<>(list);
        this.f = 0;
        this.h = false;
        this.q = kVar;
        this.x = kVar.k().c();
        if (list.isEmpty()) {
            if (this.w != null) {
                this.w.sectionCompleted(this.g);
            } else if (this.p != null) {
                Tracer.d("Banners list is empty");
                this.p.onComplete(this.g, this.b);
            }
        } else if (this.j == null || this.j.get() > 0) {
            b(0);
            this.u = false;
            this.o = 0;
            l();
        } else {
            Tracer.d("Reached maximum of ad banners for current section");
            this.p.onComplete(this.g, this.b);
        }
    }

    public final void b() {
        a(true, true);
    }

    public final void c() {
        a(true, false);
    }

    public final void d() {
        if (j()) {
            this.l.pauseAdVideo();
        }
        k();
    }

    public final void e() {
        if (j()) {
            if (this.t) {
                l();
            }
            this.l.resumeAdVideo();
        }
    }

    public final void f() {
        if (j()) {
            this.l.stopAdVideo();
            a(false, true);
            com.my.target.core.models.c.a(this.m, "playbackStopped", this.l.getView().getContext());
        }
        k();
        this.t = false;
    }

    public final void g() {
        if (j()) {
            this.l.destroy();
        }
        k();
        this.t = false;
    }

    public final void h() {
        if (j()) {
            this.e.a(this.m, this.l.getView().getContext());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean j() {
        boolean z = true;
        if (this.e == null || this.m == null) {
            Tracer.e("Unable to perform operation: not loaded yet");
            z = false;
        }
        if (this.l == null) {
            Tracer.e("Player not created");
            z = false;
        }
        if (!z || this.l.getView() != null) {
            return z;
        }
        Tracer.e("Player return null view");
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void k() {
        if (a != null) {
            a.removeCallbacks(this.c);
        }
        a = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void l() {
        if (a == null) {
            try {
                a = new Handler();
            } catch (Exception e) {
                Tracer.d("error creating timer handler " + e.getMessage());
            }
        }
        if (a != null) {
            a.removeCallbacks(this.c);
            a.postDelayed(this.c, 200L);
        }
    }

    private void b(int i) {
        while (true) {
            this.i = false;
            this.m = this.k.get(i);
            if (this.j != null) {
                this.j.decrementAndGet();
            }
            if ("statistics".equals(this.m.getType())) {
                if (this.e != null) {
                    com.my.target.core.models.c.a(this.m, "playbackStarted", this.l.getView().getContext());
                }
                int i2 = this.f + 1;
                this.f = i2;
                if (i2 < this.k.size()) {
                    i = this.f;
                } else if (this.w != null) {
                    this.w.sectionCompleted(this.g);
                    return;
                } else if (this.p != null) {
                    this.p.onComplete(this.g, this.b);
                    return;
                } else {
                    return;
                }
            } else {
                VideoData a2 = n.a(this.m.m(), this.n);
                ArrayList<com.my.target.core.models.k> stats = this.m.getStats();
                this.r = new HashSet<>();
                Iterator<com.my.target.core.models.k> it = stats.iterator();
                while (it.hasNext()) {
                    com.my.target.core.models.k next = it.next();
                    if (next.c().equals("playheadReachedValue") && (next instanceof i)) {
                        this.r.add((i) next);
                    }
                }
                boolean g = this.m.g();
                float h = this.m.h();
                float f = this.m.f();
                String ctaText = this.m.getCtaText();
                this.s = new InstreamAd.InstreamAdBanner(g, h, f, a2.getWidth(), a2.getHeight());
                this.s.ctaText = ctaText;
                Uri parse = Uri.parse(a2.getUrl());
                this.l.setVolume(this.y);
                this.l.playAdVideo(parse, a2.getWidth(), a2.getHeight());
                this.o = 0;
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(boolean z, boolean z2) {
        k();
        this.t = false;
        if (j()) {
            if (z && j()) {
                com.my.target.core.models.c.a(this.m, "closedByUser", this.l.getView().getContext());
            }
            if (this.p != null) {
                this.p.onBannerComplete(this.b, this.s);
            }
            this.l.stopAdVideo();
        }
        if (z2) {
            m();
            return;
        }
        if (this.k.size() > 1) {
            int i = this.f + 1;
            this.f = i;
            if (i < this.k.size()) {
                if (this.j == null || this.j.get() > 0) {
                    b(this.f);
                    return;
                }
                Tracer.d("Reached maximum of ad banners for current section");
            }
        }
        m();
    }

    private void m() {
        if (this.w != null) {
            this.w.sectionCompleted(this.g);
        } else if (this.p != null) {
            this.p.onComplete(this.g, this.b);
        }
    }

    static /* synthetic */ void a(b bVar, float f) {
        if (bVar.r.isEmpty() || !bVar.j()) {
            return;
        }
        com.my.target.core.models.c.a(bVar.r, f, bVar.l.getView().getContext());
    }
}
