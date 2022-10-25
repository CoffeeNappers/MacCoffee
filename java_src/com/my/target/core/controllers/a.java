package com.my.target.core.controllers;

import android.net.Uri;
import android.os.Handler;
import android.text.TextUtils;
import com.my.target.Tracer;
import com.my.target.ads.instream.InstreamAudioAd;
import com.my.target.ads.instream.InstreamAudioAdPlayer;
import com.my.target.ads.instream.models.InstreamAdCompanionBanner;
import com.my.target.core.models.banners.d;
import com.my.target.core.models.e;
import com.my.target.core.models.i;
import com.my.target.core.models.k;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
/* compiled from: InstreamAdAudioController.java */
/* loaded from: classes2.dex */
public final class a {
    private static Handler a;
    private final InstreamAudioAd b;
    private com.my.target.core.models.c e;
    private int f;
    private String g;
    private boolean h;
    private boolean i;
    private AtomicInteger j;
    private ArrayList<com.my.target.core.models.banners.c> k;
    private InstreamAudioAdPlayer l;
    private com.my.target.core.models.banners.c m;
    private int n;
    private InstreamAudioAd.InstreamAudioAdListener o;
    private com.my.target.core.models.sections.c p;
    private HashSet<i> q;
    private boolean r;
    private boolean s;
    private float t;
    private InterfaceC0233a u;
    private int v;
    private final Runnable c = new Runnable() { // from class: com.my.target.core.controllers.a.1
        /* JADX WARN: Removed duplicated region for block: B:36:0x0109  */
        /* JADX WARN: Removed duplicated region for block: B:47:0x0173  */
        @Override // java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final void run() {
            /*
                Method dump skipped, instructions count: 397
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.my.target.core.controllers.a.AnonymousClass1.run():void");
        }
    };
    private final InstreamAudioAdPlayer.AdPlayerListener d = new InstreamAudioAdPlayer.AdPlayerListener() { // from class: com.my.target.core.controllers.a.2
        @Override // com.my.target.ads.instream.InstreamAudioAdPlayer.AdPlayerListener
        public final void onAdAudioStarted() {
            Tracer.d("сontroller: onAdAudioStarted");
            if (a.this.o != null) {
                a.this.o.onBannerStart(a.this.b, a.this.m);
            }
            a.this.s = true;
            a.this.l();
            a.this.r = true;
        }

        @Override // com.my.target.ads.instream.InstreamAudioAdPlayer.AdPlayerListener
        public final void onAdAudioPaused() {
            Tracer.d("сontroller: onAdAudioPaused");
            if (a.this.j()) {
                a.this.k();
                a.this.r = false;
                com.my.target.core.models.c.a(a.this.m, "playbackPaused", a.this.l.getCurrentContext());
            }
        }

        @Override // com.my.target.ads.instream.InstreamAudioAdPlayer.AdPlayerListener
        public final void onAdAudioResumed() {
            Tracer.d("сontroller: onAdAudioResumed");
            if (a.this.j()) {
                a.this.l();
                a.this.r = true;
                com.my.target.core.models.c.a(a.this.m, "playbackResumed", a.this.l.getCurrentContext());
            }
        }

        @Override // com.my.target.ads.instream.InstreamAudioAdPlayer.AdPlayerListener
        public final void onAdAudioStopped() {
            Tracer.d("сontroller: onAdAudioStopped");
            if (a.this.j()) {
                a.this.k();
                a.this.r = false;
            }
        }

        @Override // com.my.target.ads.instream.InstreamAudioAdPlayer.AdPlayerListener
        public final void onAdAudioError(String str) {
            Tracer.d("сontroller: onAdAudioError");
            if (a.this.o != null) {
                a.this.o.onError(str, a.this.b);
            }
            a.this.a(false, false);
        }

        @Override // com.my.target.ads.instream.InstreamAudioAdPlayer.AdPlayerListener
        public final void onAdAudioCompleted() {
            Tracer.d("сontroller: onAdAudioCompleted");
            a.this.k();
            a.a(a.this, a.this.m.getDuration());
            if (a.this.o != null) {
                a.this.o.onBannerTimeLeftChange(0.0f, a.this.m.getDuration(), a.this.b);
            }
            a.this.a(false, false);
        }

        @Override // com.my.target.ads.instream.InstreamAudioAdPlayer.AdPlayerListener
        public final void onVolumeChanged(float f) {
            if (Float.compare(f, 0.0f) >= 0 && Float.compare(f, 1.0f) <= 0) {
                if (a.this.j() && Float.compare(a.this.x, f) != 0) {
                    if (Float.compare(f, 0.0f) > 0) {
                        com.my.target.core.models.c.a(a.this.m, "volumeOn", a.this.l.getCurrentContext());
                    } else {
                        com.my.target.core.models.c.a(a.this.m, "volumeOff", a.this.l.getCurrentContext());
                    }
                    a.this.x = f;
                    return;
                }
                return;
            }
            Tracer.d("wrong volume got from onVolumeChanged: " + f + ", volume must be in range [0..1]");
        }
    };
    private float w = 1.0f;
    private float x = 1.0f;

    /* compiled from: InstreamAdAudioController.java */
    /* renamed from: com.my.target.core.controllers.a$a  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public interface InterfaceC0233a {
        void sectionCompleted(String str);
    }

    static /* synthetic */ int o(a aVar) {
        int i = aVar.n;
        aVar.n = i + 1;
        return i;
    }

    public final InstreamAudioAdPlayer a() {
        return this.l;
    }

    public final boolean a(String str) {
        return str.equals(this.g) && this.j != null && this.j.get() <= 0;
    }

    public final void a(com.my.target.core.models.c cVar) {
        this.e = cVar;
    }

    public final void a(InterfaceC0233a interfaceC0233a) {
        this.u = interfaceC0233a;
    }

    public final void a(InstreamAudioAdPlayer instreamAudioAdPlayer) {
        this.l = instreamAudioAdPlayer;
        instreamAudioAdPlayer.setAdPlayerListener(this.d);
    }

    public final void a(InstreamAudioAd.InstreamAudioAdListener instreamAudioAdListener) {
        this.o = instreamAudioAdListener;
    }

    public final void a(float f) {
        if (this.l != null && Float.compare(f, this.w) != 0) {
            this.l.setVolume(f);
        }
        this.w = f;
    }

    public a(InstreamAudioAd instreamAudioAd) {
        this.b = instreamAudioAd;
    }

    public final void a(com.my.target.core.models.sections.c cVar, List<com.my.target.core.models.banners.c> list) {
        int b = cVar.k().b();
        if (!cVar.e().equals(this.g) && b > 0) {
            this.j = new AtomicInteger(b);
        }
        this.g = cVar.e();
        b(cVar, list);
    }

    public final void b(com.my.target.core.models.sections.c cVar, List<com.my.target.core.models.banners.c> list) {
        if (!cVar.e().equals(this.g)) {
            Tracer.d("try to continue wrong section");
            return;
        }
        this.k = new ArrayList<>(list);
        this.f = 0;
        this.h = false;
        this.p = cVar;
        this.v = cVar.k().a();
        if (list.isEmpty()) {
            if (this.u != null) {
                this.u.sectionCompleted(this.g);
            } else if (this.o != null) {
                Tracer.d("Banners list is empty");
                this.o.onComplete(this.g, this.b);
            }
        } else if (this.j == null || this.j.get() > 0) {
            this.s = false;
            this.n = 0;
            l();
            a(0);
        } else {
            Tracer.d("Reached maximum of ad banners for current section");
            this.o.onComplete(this.g, this.b);
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
            this.l.pauseAdAudio();
        }
        k();
    }

    public final void e() {
        if (j()) {
            if (this.r) {
                l();
            }
            this.l.resumeAdAudio();
        }
    }

    public final void f() {
        if (j()) {
            this.l.stopAdAudio();
            a(false, true);
            com.my.target.core.models.c.a(this.m, "playbackStopped", this.l.getCurrentContext());
        }
        k();
        this.r = false;
    }

    public final void g() {
        if (j()) {
            this.l.destroy();
        }
        k();
        this.r = false;
    }

    public final void h() {
        if (j()) {
            this.e.a(this.m, this.l.getCurrentContext());
        }
    }

    public final void a(InstreamAdCompanionBanner instreamAdCompanionBanner) {
        if (this.e != null && this.l != null && this.l.getCurrentContext() != null) {
            this.e.a((d) instreamAdCompanionBanner, this.l.getCurrentContext());
        }
    }

    public final void b(InstreamAdCompanionBanner instreamAdCompanionBanner) {
        if (this.e != null && this.l != null && this.l.getCurrentContext() != null) {
            com.my.target.core.models.c.c((d) instreamAdCompanionBanner, this.l.getCurrentContext());
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
        if (!z || this.l.getCurrentContext() != null) {
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

    private void a(int i) {
        while (true) {
            this.i = false;
            this.m = this.k.get(i);
            if (this.j != null) {
                this.j.decrementAndGet();
            }
            if ("statistics".equals(this.m.getType())) {
                if (this.e != null) {
                    com.my.target.core.models.c.a(this.m, "playbackStarted", this.l.getCurrentContext());
                }
                int i2 = this.f + 1;
                this.f = i2;
                if (i2 < this.k.size()) {
                    i = this.f;
                } else {
                    a(false, false);
                    return;
                }
            } else {
                e a2 = this.m.a();
                ArrayList<k> stats = this.m.getStats();
                this.q = new HashSet<>();
                Iterator<k> it = stats.iterator();
                while (it.hasNext()) {
                    k next = it.next();
                    if (next.c().equals("playheadReachedValue") && (next instanceof i)) {
                        this.q.add((i) next);
                    }
                }
                if (a2 != null && !TextUtils.isEmpty(a2.a())) {
                    Uri parse = Uri.parse(a2.a());
                    this.l.setVolume(this.w);
                    this.l.playAdAudio(parse);
                    this.n = 0;
                    return;
                } else if (this.o != null) {
                    this.o.onError("Missing audiodata params", this.b);
                    return;
                } else {
                    return;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(boolean z, boolean z2) {
        k();
        this.r = false;
        if (j()) {
            if (z && j()) {
                com.my.target.core.models.c.a(this.m, "closedByUser", this.l.getCurrentContext());
            }
            if (this.o != null) {
                this.o.onBannerComplete(this.b, this.m);
            }
            this.l.stopAdAudio();
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
                    a(this.f);
                    return;
                }
                Tracer.d("Reached maximum of ad banners for current section");
            }
        }
        m();
    }

    private void m() {
        if (this.u != null) {
            this.u.sectionCompleted(this.g);
        } else if (this.o != null) {
            this.o.onComplete(this.g, this.b);
        }
    }

    static /* synthetic */ void a(a aVar, float f) {
        if (aVar.q.isEmpty() || !aVar.j()) {
            return;
        }
        com.my.target.core.models.c.a(aVar.q, f, aVar.l.getCurrentContext());
    }
}
