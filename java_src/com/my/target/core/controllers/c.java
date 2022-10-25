package com.my.target.core.controllers;

import android.content.Context;
import android.content.DialogInterface;
import android.media.AudioManager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.google.android.exoplayer2.util.MimeTypes;
import com.my.target.Tracer;
import com.my.target.core.models.banners.h;
import com.my.target.core.models.i;
import com.my.target.core.models.k;
import com.my.target.core.ui.b;
import com.my.target.core.ui.views.video.VideoTextureView;
import com.my.target.nativeads.models.VideoData;
import com.my.target.nativeads.views.MediaAdView;
import java.util.HashSet;
import java.util.Iterator;
/* compiled from: NativeAdVideoController.java */
/* loaded from: classes2.dex */
public final class c implements VideoTextureView.a {
    private final h a;
    private final VideoData b;
    private final View.OnClickListener c = new View.OnClickListener() { // from class: com.my.target.core.controllers.c.1
        @Override // android.view.View.OnClickListener
        public final void onClick(View view) {
            if (c.this.p != null) {
                if (c.this.p.f()) {
                    c.this.p.h();
                    if (c.this.r != null) {
                        c.this.r.g();
                    }
                    c.this.q = false;
                    return;
                }
                c.this.p.g();
                if (c.this.r != null) {
                    c.this.r.f();
                }
                c.this.q = true;
            }
        }
    };
    private final AudioManager.OnAudioFocusChangeListener d = new AudioManager.OnAudioFocusChangeListener() { // from class: com.my.target.core.controllers.c.2
        @Override // android.media.AudioManager.OnAudioFocusChangeListener
        public final void onAudioFocusChange(int i) {
            switch (i) {
                case -3:
                    c.f(c.this);
                    return;
                case -2:
                case -1:
                    c.this.a(true);
                    Tracer.d("Audiofocus loss, pausing");
                    return;
                case 0:
                case 3:
                default:
                    return;
                case 1:
                case 2:
                case 4:
                    if (c.this.k) {
                        Tracer.d("Audiofocus gain, unmuting");
                        c.this.l();
                        return;
                    }
                    return;
            }
        }
    };
    private final DialogInterface.OnDismissListener e = new DialogInterface.OnDismissListener() { // from class: com.my.target.core.controllers.c.3
        @Override // android.content.DialogInterface.OnDismissListener
        public final void onDismiss(DialogInterface dialogInterface) {
            Tracer.d("Dismiss dialog");
            if (c.this.n != null) {
                c.this.a(c.this.n.getContext());
            }
            c.this.k = false;
            c.this.k();
            if (c.this.p != null) {
                ViewGroup viewGroup = (ViewGroup) c.this.p.getParent();
                if (viewGroup != null && viewGroup != c.this.g) {
                    viewGroup.removeView(c.this.p);
                    c.this.g.addView(c.this.p, 0, new FrameLayout.LayoutParams(-1, -1));
                }
                if (c.this.h != 1) {
                    if (c.this.h == 3) {
                        c.this.j = false;
                        c.this.e();
                        c.this.p.a();
                    } else {
                        c.this.j = false;
                    }
                } else {
                    c.this.f();
                    if (c.this.a.a().i()) {
                        c.this.j = true;
                    }
                    c.this.p.setWaitingState();
                }
            }
            if (c.this.r != null) {
                c.this.r.c();
            }
            c.this.n = null;
        }
    };
    private final b.a f = new b.a() { // from class: com.my.target.core.controllers.c.4
        @Override // com.my.target.core.ui.b.a
        public final void a() {
            if (c.this.g != null) {
                c.this.h = 1;
                if (c.this.p == null) {
                    c.this.p = VideoTextureView.a(c.this, c.this.g.getContext());
                }
                c.this.b(c.this.g.getContext());
                c.this.p.a(c.this.b, true);
                c.this.i();
                if (c.this.r != null) {
                    c.this.r.e();
                }
            }
        }

        @Override // com.my.target.core.ui.b.a
        public final void b() {
            a();
            c.this.n.f();
        }

        @Override // com.my.target.core.ui.b.a
        public final void a(View view) {
            if (c.this.h == 1) {
                c.this.a(true);
            }
            if (c.this.m != null) {
                c.this.m.onClick(view);
            }
        }

        @Override // com.my.target.core.ui.b.a
        public final void c() {
            c.this.a(true);
            c.this.h = 2;
            if (c.this.r != null) {
                c.this.r.d();
            }
        }
    };
    private MediaAdView g;
    private int h;
    private boolean i;
    private boolean j;
    private boolean k;
    private boolean l;
    private View.OnClickListener m;
    private com.my.target.core.ui.b n;
    private HashSet<i> o;
    private VideoTextureView p;
    private boolean q;
    private a r;

    /* compiled from: NativeAdVideoController.java */
    /* loaded from: classes2.dex */
    public interface a {
        void a();

        void a(float f, HashSet<i> hashSet);

        void b();

        void c();

        void d();

        void e();

        void f();

        void g();
    }

    public final void a(View.OnClickListener onClickListener) {
        this.m = onClickListener;
    }

    public final <T> void a(a aVar) {
        this.r = aVar;
    }

    public c(h hVar, VideoData videoData) {
        this.a = hVar;
        this.b = videoData;
        this.j = hVar.a().i();
        this.q = hVar.a().e();
    }

    public final void a() {
        if (this.g != null && this.g.getWindowVisibility() != 0) {
            if (this.k) {
                a(false);
                return;
            }
            this.j = false;
            d();
        } else if (!this.j || this.k) {
        } else {
            if ((this.h == 0 || this.h == 2 || this.h == 4) && this.g != null) {
                Tracer.d("Handle visible, state = " + this.h + " url = " + this.b.getUrl());
                if (this.p == null) {
                    this.l = false;
                    this.p = VideoTextureView.a(this, this.g.getContext());
                    this.p.setVideoListener(this);
                    this.g.addView(this.p, 0, new FrameLayout.LayoutParams(-1, -1));
                }
                k();
                this.p.a(this.b, false);
                this.h = 1;
            }
        }
    }

    public final void a(MediaAdView mediaAdView) {
        b();
        this.g = mediaAdView;
        if (!this.k) {
            if (this.j) {
                i();
            } else {
                e();
            }
        }
        if (this.m != null) {
            mediaAdView.setOnClickListener(new View.OnClickListener() { // from class: com.my.target.core.controllers.c.5
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    c.p(c.this);
                }
            });
        }
    }

    public final void b() {
        Tracer.d("unregister from " + this);
        if (!this.k && this.g != null) {
            d();
            if (this.p != null) {
                c();
            }
            this.g.setOnClickListener(null);
            this.g = null;
        }
    }

    public final void c() {
        Tracer.d("Call release texture view on " + this);
        if (this.p != null) {
            this.p.setVideoListener(null);
            if (this.p.getParent() != null) {
                ((ViewGroup) this.p.getParent()).removeView(this.p);
            }
        }
        e();
        this.l = false;
        this.p = null;
        VideoTextureView.a(this);
    }

    public final void d() {
        if (!this.k) {
            if (this.h == 1) {
                if (this.j) {
                    Tracer.d("Handle invisible, state = " + this.h + " obj = " + this);
                    this.h = 2;
                    if (this.p != null) {
                        this.p.i();
                        this.h = 4;
                        return;
                    }
                    return;
                }
                e();
                this.h = 3;
                if (this.p != null) {
                    this.p.a();
                }
            } else if (this.h != 4) {
                e();
            }
        }
    }

    @Override // com.my.target.core.ui.views.video.VideoTextureView.a
    public final void e() {
        Context context = null;
        this.l = false;
        if (this.g != null) {
            if (this.a.getImage() != null) {
                this.g.getImageView().setImageBitmap(this.a.getImage().getBitmap());
            }
            this.g.getImageView().setVisibility(0);
            this.g.getPlayButtonView().setVisibility(0);
            this.g.getProgressBarView().setVisibility(8);
            context = this.g.getContext();
        }
        if (this.k && this.n != null) {
            this.n.b();
            if (context == null) {
                context = this.n.getContext();
            }
        }
        if (context != null) {
            a(context);
        }
    }

    @Override // com.my.target.core.ui.views.video.VideoTextureView.a
    public final void a(float f) {
        if (this.n != null) {
            if (f > 0.0f) {
                this.n.a(false);
            } else {
                this.n.a(true);
            }
        }
    }

    @Override // com.my.target.core.ui.views.video.VideoTextureView.a
    public final void f() {
        this.g.getImageView().setVisibility(4);
        this.g.getProgressBarView().setVisibility(8);
        this.g.getPlayButtonView().setVisibility(8);
        if (this.k && this.n != null) {
            this.n.c();
        }
    }

    @Override // com.my.target.core.ui.views.video.VideoTextureView.a
    public final void g() {
    }

    @Override // com.my.target.core.ui.views.video.VideoTextureView.a
    public final void h() {
        Context context = null;
        if (this.g != null) {
            if (this.p != null && this.p.b() != null) {
                this.g.getImageView().setImageBitmap(this.p.b());
            } else if (this.a.getImage() != null) {
                this.g.getImageView().setImageBitmap(this.a.getImage().getBitmap());
            }
            this.g.getImageView().setVisibility(0);
            this.g.getPlayButtonView().setVisibility(0);
            this.g.getProgressBarView().setVisibility(8);
            context = this.g.getContext();
        }
        if (this.k && this.n != null) {
            this.n.e();
            if (context == null) {
                context = this.n.getContext();
            }
        }
        if (context != null) {
            a(context);
        }
    }

    @Override // com.my.target.core.ui.views.video.VideoTextureView.a
    public final void i() {
        this.g.getProgressBarView().setVisibility(0);
        this.g.getPlayButtonView().setVisibility(8);
        if (this.k && this.n != null) {
            this.n.d();
        }
    }

    @Override // com.my.target.core.ui.views.video.VideoTextureView.a
    public final void a(float f, float f2) {
        while (true) {
            f();
            if (!this.l && this.r != null) {
                this.r.a();
                if (this.o == null) {
                    this.o = new HashSet<>();
                } else {
                    this.o.clear();
                }
                Iterator<k> it = this.a.a().getStats().iterator();
                while (it.hasNext()) {
                    k next = it.next();
                    if ("playheadReachedValue".equals(next.c()) && (next instanceof i)) {
                        this.o.add((i) next);
                    }
                }
                b(0.0f);
                this.l = true;
            }
            if (this.i && f != f2) {
                this.i = false;
            }
            if (this.a.a() != null) {
                f2 = this.a.a().f();
                if (this.n != null) {
                    this.n.a(f, f2);
                }
            } else {
                f2 = 0.0f;
            }
            if (f <= f2) {
                break;
            }
            f = f2;
        }
        if (f != 0.0f) {
            b(f);
        }
        if (f == f2) {
            e();
            this.h = 3;
            this.j = false;
            if (this.p != null) {
                this.p.a();
            }
        }
    }

    @Override // com.my.target.core.ui.views.video.VideoTextureView.a
    public final void a(String str) {
        this.h = 3;
        e();
    }

    @Override // com.my.target.core.ui.views.video.VideoTextureView.a
    public final void j() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void k() {
        if (this.p != null) {
            this.p.g();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(boolean z) {
        if (this.k && this.n != null) {
            this.h = 2;
            if (this.p != null) {
                this.p.a(z);
            }
            h();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(Context context) {
        ((AudioManager) context.getSystemService(MimeTypes.BASE_TYPE_AUDIO)).abandonAudioFocus(this.d);
    }

    private void b(float f) {
        if (!this.o.isEmpty() && this.r != null) {
            this.r.a(f, this.o);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void l() {
        if (this.p != null) {
            this.p.h();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(Context context) {
        ((AudioManager) context.getSystemService(MimeTypes.BASE_TYPE_AUDIO)).requestAudioFocus(this.d, 3, 2);
    }

    static /* synthetic */ void f(c cVar) {
        if (cVar.p == null) {
            return;
        }
        Tracer.d("Audiofocus loss can duck, set volume to 0.3");
        if (cVar.q) {
            return;
        }
        cVar.p.j();
    }

    static /* synthetic */ void p(c cVar) {
        if (cVar.g != null) {
            if (cVar.b == null && cVar.m != null) {
                cVar.m.onClick(cVar.g);
                return;
            }
            cVar.k = true;
            Context context = cVar.g.getContext();
            com.my.target.core.ui.b bVar = new com.my.target.core.ui.b(context);
            bVar.a(cVar.a, cVar.b);
            bVar.a(cVar.f);
            bVar.setOnDismissListener(cVar.e);
            if (cVar.p == null) {
                cVar.p = VideoTextureView.a(cVar, context);
            }
            cVar.p.setVideoListener(cVar);
            cVar.b(context);
            if (cVar.h == 1) {
                cVar.h = 4;
                cVar.p.i();
            }
            ViewGroup viewGroup = (ViewGroup) cVar.p.getParent();
            if (viewGroup != null) {
                viewGroup.removeView(cVar.p);
            }
            bVar.a(cVar.p);
            cVar.n = bVar;
            cVar.n.a().setOnClickListener(cVar.c);
            if (cVar.q) {
                cVar.k();
            } else {
                cVar.l();
            }
            cVar.n.show();
            if (cVar.r != null) {
                cVar.r.b();
            }
            if (cVar.p == null) {
                return;
            }
            cVar.p.a(cVar.b, true);
            cVar.h = 1;
        }
    }
}
