package com.my.target.core.engines;

import android.content.Context;
import android.graphics.Bitmap;
import android.view.ViewGroup;
import android.webkit.ConsoleMessage;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.RelativeLayout;
import com.my.target.Tracer;
import com.my.target.ads.MyTargetView;
import com.my.target.core.engines.b;
import com.my.target.core.facades.h;
import com.my.target.core.ui.views.AdView;
import com.my.target.core.ui.views.controls.AdInfoButton;
import org.json.JSONObject;
/* compiled from: StandardAdEngine.java */
/* loaded from: classes2.dex */
public final class i extends com.my.target.core.engines.a {
    private com.my.target.core.facades.h c;
    private com.my.target.core.facades.h d;
    private MyTargetView e;
    private AdView f;
    private WebView g;
    private AdInfoButton h;
    private boolean i;
    private boolean j;
    private com.my.target.core.communication.js.c k;
    private a l;
    private WebChromeClient m;
    private WebViewClient n;
    private com.my.target.core.communication.js.b o;
    private com.my.target.core.communication.js.b p;
    private com.my.target.core.communication.js.b q;
    private com.my.target.core.communication.js.b r;
    private com.my.target.core.communication.js.b s;
    private com.my.target.core.communication.js.b t;
    private com.my.target.core.communication.js.b u;
    private com.my.target.core.communication.js.b v;
    private h.a w;

    public i(MyTargetView myTargetView, String str, Context context) {
        super(myTargetView, context);
        RelativeLayout.LayoutParams layoutParams;
        this.k = new com.my.target.core.communication.js.c();
        this.l = new a();
        this.m = new WebChromeClient() { // from class: com.my.target.core.engines.i.1
            @Override // android.webkit.WebChromeClient
            public final boolean onConsoleMessage(ConsoleMessage consoleMessage) {
                String message = consoleMessage.message();
                Tracer.d("js console message: " + message + " at line: " + consoleMessage.lineNumber());
                com.my.target.core.communication.js.events.f a2 = com.my.target.core.communication.js.a.a(consoleMessage);
                if (a2 != null) {
                    i.this.k.a(a2);
                    return true;
                }
                return false;
            }
        };
        this.n = new WebViewClient() { // from class: com.my.target.core.engines.i.4
            @Override // android.webkit.WebViewClient
            public final void onReceivedError(WebView webView, int i, String str2, String str3) {
                Tracer.d("load failed. error: " + i + " description: " + str2 + " url: " + str3);
                super.onReceivedError(webView, i, str2, str3);
                if (i.this.e.getListener() != null) {
                    i.this.e.getListener().onNoAd(str2, i.this.e);
                }
            }

            @Override // android.webkit.WebViewClient
            public final void onPageStarted(WebView webView, String str2, Bitmap bitmap) {
                Tracer.d("load page started");
                super.onPageStarted(webView, str2, bitmap);
            }

            @Override // android.webkit.WebViewClient
            public final void onPageFinished(WebView webView, String str2) {
                JSONObject d;
                if (!i.this.i) {
                    i.this.i = true;
                    Tracer.d("page loaded");
                    super.onPageFinished(webView, str2);
                    if (i.this.c != null && (d = i.this.c.d()) != null) {
                        i.this.a(new com.my.target.core.communication.js.calls.d(d));
                    }
                }
            }

            @Override // android.webkit.WebViewClient
            public final void onScaleChanged(WebView webView, float f, float f2) {
                super.onScaleChanged(webView, f, f2);
                Tracer.d("scale new: " + f2 + " old: " + f);
            }
        };
        this.o = new com.my.target.core.communication.js.b() { // from class: com.my.target.core.engines.i.5
            @Override // com.my.target.core.communication.js.b
            public final void a(com.my.target.core.communication.js.events.f fVar) {
                i.this.l.d();
                if (i.this.e.getListener() != null) {
                    i.this.e.getListener().onLoad(i.this.e);
                }
            }
        };
        this.p = new com.my.target.core.communication.js.b() { // from class: com.my.target.core.engines.i.6
            @Override // com.my.target.core.communication.js.b
            public final void a(com.my.target.core.communication.js.events.f fVar) {
                com.my.target.core.communication.js.events.e eVar = (com.my.target.core.communication.js.events.e) fVar;
                String str2 = (eVar == null || eVar.b() == null) ? "JS error" : "JS error: " + eVar.b();
                String str3 = "";
                if (i.this.c != null) {
                    str3 = i.this.c.g();
                }
                if (fVar.a().equals("onError")) {
                    com.my.target.core.async.a.a(str2, getClass().getName(), 40, "JSError", str3, i.this.b);
                    if (i.this.e.getListener() != null) {
                        if (i.this.l.c()) {
                            i.this.e.getListener().onNoAd("JS error", i.this.e);
                            return;
                        } else {
                            i.this.e.getListener().onNoAd("JS init error", i.this.e);
                            return;
                        }
                    }
                    return;
                }
                com.my.target.core.async.a.a(str2, getClass().getName(), 30, "JSError", str3, i.this.b);
            }
        };
        this.q = new com.my.target.core.communication.js.b() { // from class: com.my.target.core.engines.i.7
            @Override // com.my.target.core.communication.js.b
            public final void a(com.my.target.core.communication.js.events.f fVar) {
                i.this.f.setVisibility(4);
                i.this.l.a(false);
                i.this.l.b(false);
                if (i.this.e.getListener() != null) {
                    i.this.e.getListener().onNoAd("Ad completed", i.this.e);
                }
            }
        };
        this.r = new com.my.target.core.communication.js.b() { // from class: com.my.target.core.engines.i.8
            @Override // com.my.target.core.communication.js.b
            public final void a(com.my.target.core.communication.js.events.f fVar) {
                if (i.this.l.c()) {
                    i.this.l.a(false);
                    if (i.this.e.getListener() != null) {
                        i.this.e.getListener().onNoAd("No ad", i.this.e);
                        return;
                    }
                    return;
                }
                i.this.l.e();
                if (i.this.e.getListener() != null) {
                    i.this.e.getListener().onNoAd("JS init error", i.this.e);
                }
            }
        };
        this.s = new com.my.target.core.communication.js.b() { // from class: com.my.target.core.engines.i.9
            @Override // com.my.target.core.communication.js.b
            public final void a(com.my.target.core.communication.js.events.f fVar) {
                com.my.target.core.facades.h hVar = i.this.c;
                for (String str2 : ((com.my.target.core.communication.js.events.d) fVar).b()) {
                    hVar.b(str2);
                }
            }
        };
        this.t = new com.my.target.core.communication.js.b() { // from class: com.my.target.core.engines.i.10
            @Override // com.my.target.core.communication.js.b
            public final void a(com.my.target.core.communication.js.events.f fVar) {
                i.this.c.a(((com.my.target.core.communication.js.events.c) fVar).b());
                if (i.this.e.getListener() != null) {
                    i.this.e.getListener().onClick(i.this.e);
                }
            }
        };
        this.u = new com.my.target.core.communication.js.b() { // from class: com.my.target.core.engines.i.11
            @Override // com.my.target.core.communication.js.b
            public final void a(com.my.target.core.communication.js.events.f fVar) {
                com.my.target.core.async.a.a(((com.my.target.core.communication.js.events.i) fVar).b(), i.this.b);
            }
        };
        this.v = new com.my.target.core.communication.js.b() { // from class: com.my.target.core.engines.i.2
            @Override // com.my.target.core.communication.js.b
            public final void a(com.my.target.core.communication.js.events.f fVar) {
                if (i.this.c != null && i.this.c.b() && i.this.d == null) {
                    i.this.d = i.this.c.i();
                    i.this.d.a(i.this.w);
                    i.this.d.load();
                }
            }
        };
        this.w = new h.a() { // from class: com.my.target.core.engines.i.3
            @Override // com.my.target.core.facades.h.a
            public final void onLoad(com.my.target.core.facades.h hVar) {
                if (hVar == i.this.d) {
                    i.this.d.a((h.a) null);
                    i.this.d = null;
                    i.b(i.this, hVar);
                }
            }

            @Override // com.my.target.core.facades.h.a
            public final void onNoAd(String str2, com.my.target.core.facades.h hVar) {
                if (i.this.d == hVar) {
                    hVar.a((h.a) null);
                    i.this.d = null;
                }
            }
        };
        this.e = myTargetView;
        this.g = new WebView(this.b);
        this.g.setHorizontalScrollBarEnabled(false);
        this.g.setVerticalScrollBarEnabled(false);
        this.g.getSettings().setJavaScriptEnabled(true);
        this.g.getSettings().setSupportZoom(false);
        this.g.setWebViewClient(this.n);
        this.g.setWebChromeClient(this.m);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
        float f = this.b.getResources().getDisplayMetrics().density;
        this.f = new AdView(this.b);
        this.f.addView(this.g, layoutParams2);
        this.f.setVisibility(4);
        if ("standard_300x250".equals(str)) {
            layoutParams = new RelativeLayout.LayoutParams((int) (300.0f * f), (int) (f * 250.0f));
        } else {
            this.f.setMaxWidth((int) (640.0f * f));
            layoutParams = new RelativeLayout.LayoutParams(-1, (int) (f * 50.0f));
        }
        layoutParams.addRule(13);
        this.f.setLayoutParams(layoutParams);
        this.a.addView(this.f);
        this.k.a("onReady", this.o);
        this.k.a("onError", this.p);
        this.k.a("onAdError", this.p);
        this.k.a("onComplete", this.q);
        this.k.a("onNoAd", this.r);
        this.k.a("onAdStart", this.s);
        this.k.a("onStat", this.u);
        this.k.a("onAdClick", this.t);
        this.k.a("onRequestNewAds", this.v);
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void a(com.my.target.core.facades.g gVar) {
        if (gVar instanceof com.my.target.core.facades.h) {
            this.l.e();
            this.c = (com.my.target.core.facades.h) gVar;
            this.g.stopLoading();
            this.i = false;
            if (this.c.c() != null) {
                a(this.c.e());
                Tracer.d("load page");
                this.g.loadData(this.c.c(), "text/html", "utf-8");
                return;
            } else if (this.e.getListener() != null) {
                this.e.getListener().onNoAd("No ad", this.e);
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

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void d() {
        super.d();
        if (this.l.c()) {
            if (!this.l.a()) {
                this.l.a(true);
                this.f.setDesiredSize(0, 0);
                this.f.setVisibility(0);
                a(new com.my.target.core.communication.js.calls.e(this.c.a(), this.f.getContext().getResources().getConfiguration().orientation));
                return;
            }
            Tracer.d("already started");
            return;
        }
        Tracer.d("not ready");
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void a() {
        super.a();
        if (this.l.a()) {
            if (!this.l.b()) {
                this.l.b(true);
                a(new com.my.target.core.communication.js.calls.b("pause"));
                return;
            }
            Tracer.d("already paused");
            return;
        }
        Tracer.d("not started");
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void b() {
        super.b();
        if (this.l.a()) {
            if (this.l.b()) {
                this.l.b(false);
                a(new com.my.target.core.communication.js.calls.b("resume"));
                return;
            }
            Tracer.d("already started");
            return;
        }
        Tracer.d("not started");
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void c() {
        super.c();
        if (this.l.a()) {
            this.l.b(false);
            this.l.a(false);
            this.f.setVisibility(4);
            if (this.d != null) {
                this.d.a((h.a) null);
                this.d = null;
            }
            a(new com.my.target.core.communication.js.calls.b("stop"));
            return;
        }
        Tracer.d("not started");
    }

    @Override // com.my.target.core.engines.a, com.my.target.core.engines.b
    public final void f() {
        super.f();
        if (!this.j) {
            this.j = true;
            this.k.a();
            this.k = null;
            if (this.f.getParent() != null) {
                ((ViewGroup) this.f.getParent()).removeView(this.f);
            }
            this.f.removeAllViews();
            this.f = null;
            this.g.setWebChromeClient(null);
            this.g.setWebViewClient(null);
            this.g.destroy();
            this.g = null;
            this.c = null;
            this.e = null;
            this.l = null;
            if (this.d != null) {
                this.d.a((h.a) null);
                this.d = null;
            }
        }
    }

    @Override // com.my.target.core.engines.b
    public final void a(b.a aVar) {
    }

    private void a(String str) {
        if (str != null) {
            if (this.h == null) {
                this.h = new AdInfoButton(this.b);
                this.f.addView(this.h, -2, -2);
            }
            this.h.setUrl(str);
        } else if (this.h != null) {
            ViewGroup viewGroup = (ViewGroup) this.h.getParent();
            if (viewGroup != null) {
                viewGroup.removeView(this.h);
            }
            this.h = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(com.my.target.core.communication.js.calls.c cVar) {
        if (this.g != null) {
            try {
                String str = "javascript:AdmanJS.execute(" + cVar.b().toString() + ")";
                Tracer.d(str);
                this.g.loadUrl(str);
            } catch (Throwable th) {
                Tracer.d("fail to execute js call: " + th.getMessage());
                com.my.target.core.async.a.a("Internal error: fail to execute JSCall " + cVar.a(), getClass().getName(), th, "", this.b);
            }
        }
    }

    /* compiled from: StandardAdEngine.java */
    /* loaded from: classes2.dex */
    private static class a {
        private boolean a;
        private boolean b;
        private boolean c;

        public final boolean a() {
            return this.a;
        }

        public final void a(boolean z) {
            this.a = z;
        }

        public final boolean b() {
            return this.b;
        }

        public final void b(boolean z) {
            this.b = z;
        }

        public final boolean c() {
            return this.c;
        }

        public final void d() {
            this.c = true;
        }

        public final void e() {
            this.c = false;
            this.b = false;
            this.a = false;
        }
    }

    static /* synthetic */ void b(i iVar, com.my.target.core.facades.h hVar) {
        iVar.c = hVar;
        iVar.a(hVar.e());
        JSONObject d = hVar.d();
        if (d == null) {
            return;
        }
        iVar.a(new com.my.target.core.communication.js.calls.f(d));
    }
}
