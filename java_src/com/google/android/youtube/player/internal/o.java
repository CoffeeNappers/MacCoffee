package com.google.android.youtube.player.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.youtube.player.internal.l;
import com.google.android.youtube.player.internal.r;
import com.google.android.youtube.player.internal.t;
/* loaded from: classes2.dex */
public final class o extends r<l> implements b {
    private final String b;
    private final String c;
    private final String d;
    private boolean e;

    public o(Context context, String str, String str2, String str3, t.a aVar, t.b bVar) {
        super(context, aVar, bVar);
        this.b = (String) ab.a(str);
        this.c = ab.a(str2, (Object) "callingPackage cannot be null or empty");
        this.d = ab.a(str3, (Object) "callingAppVersion cannot be null or empty");
    }

    private final void k() {
        i();
        if (this.e) {
            throw new IllegalStateException("Connection client has been released");
        }
    }

    @Override // com.google.android.youtube.player.internal.b
    public final IBinder a() {
        k();
        try {
            return j().a();
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    @Override // com.google.android.youtube.player.internal.r
    protected final /* synthetic */ l a(IBinder iBinder) {
        return l.a.a(iBinder);
    }

    @Override // com.google.android.youtube.player.internal.b
    public final k a(j jVar) {
        k();
        try {
            return j().a(jVar);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    @Override // com.google.android.youtube.player.internal.r
    protected final void a(i iVar, r.d dVar) throws RemoteException {
        iVar.a(dVar, 1202, this.c, this.d, this.b, null);
    }

    @Override // com.google.android.youtube.player.internal.b
    public final void a(boolean z) {
        if (f()) {
            try {
                j().a(z);
            } catch (RemoteException e) {
            }
            this.e = true;
        }
    }

    @Override // com.google.android.youtube.player.internal.r
    protected final String b() {
        return "com.google.android.youtube.player.internal.IYouTubeService";
    }

    @Override // com.google.android.youtube.player.internal.r
    protected final String c() {
        return "com.google.android.youtube.api.service.START";
    }

    @Override // com.google.android.youtube.player.internal.r, com.google.android.youtube.player.internal.t
    public final void d() {
        if (!this.e) {
            a(true);
        }
        super.d();
    }
}
