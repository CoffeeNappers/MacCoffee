package com.google.android.youtube.player.internal;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.youtube.player.YouTubeThumbnailView;
import com.google.android.youtube.player.internal.j;
/* loaded from: classes2.dex */
public final class p extends com.google.android.youtube.player.internal.a {
    private final Handler a;
    private b b;
    private k c;
    private boolean d;
    private boolean e;

    /* loaded from: classes2.dex */
    private final class a extends j.a {
        private a() {
        }

        /* synthetic */ a(p pVar, byte b) {
            this();
        }

        @Override // com.google.android.youtube.player.internal.j
        public final void a(final Bitmap bitmap, final String str, final boolean z, final boolean z2) {
            p.this.a.post(new Runnable() { // from class: com.google.android.youtube.player.internal.p.a.1
                @Override // java.lang.Runnable
                public final void run() {
                    p.this.d = z;
                    p.this.e = z2;
                    p.this.a(bitmap, str);
                }
            });
        }

        @Override // com.google.android.youtube.player.internal.j
        public final void a(final String str, final boolean z, final boolean z2) {
            p.this.a.post(new Runnable() { // from class: com.google.android.youtube.player.internal.p.a.2
                @Override // java.lang.Runnable
                public final void run() {
                    p.this.d = z;
                    p.this.e = z2;
                    p.this.b(str);
                }
            });
        }
    }

    public p(b bVar, YouTubeThumbnailView youTubeThumbnailView) {
        super(youTubeThumbnailView);
        this.b = (b) ab.a(bVar, "connectionClient cannot be null");
        this.c = bVar.a(new a(this, (byte) 0));
        this.a = new Handler(Looper.getMainLooper());
    }

    @Override // com.google.android.youtube.player.internal.a
    public final void a(String str) {
        try {
            this.c.a(str);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    @Override // com.google.android.youtube.player.internal.a
    public final void a(String str, int i) {
        try {
            this.c.a(str, i);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.youtube.player.internal.a
    public final boolean a() {
        return super.a() && this.c != null;
    }

    @Override // com.google.android.youtube.player.internal.a
    public final void c() {
        try {
            this.c.a();
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    @Override // com.google.android.youtube.player.internal.a
    public final void d() {
        try {
            this.c.b();
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    @Override // com.google.android.youtube.player.internal.a
    public final void e() {
        try {
            this.c.c();
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    @Override // com.google.android.youtube.player.internal.a
    public final boolean f() {
        return this.e;
    }

    @Override // com.google.android.youtube.player.internal.a
    public final boolean g() {
        return this.d;
    }

    @Override // com.google.android.youtube.player.internal.a
    public final void h() {
        try {
            this.c.d();
        } catch (RemoteException e) {
        }
        this.b.d();
        this.c = null;
        this.b = null;
    }
}
