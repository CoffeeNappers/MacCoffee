package com.google.android.youtube.player.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.exoplayer2.extractor.ts.TsExtractor;
import com.google.android.youtube.player.YouTubeApiServiceUtil;
import com.google.android.youtube.player.YouTubeInitializationResult;
import com.google.android.youtube.player.internal.c;
import com.google.android.youtube.player.internal.i;
import com.google.android.youtube.player.internal.t;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public abstract class r<T extends IInterface> implements t {
    final Handler a;
    private final Context b;
    private T c;
    private ArrayList<t.a> d;
    private ArrayList<t.b> g;
    private ServiceConnection j;
    private final ArrayList<t.a> e = new ArrayList<>();
    private boolean f = false;
    private boolean h = false;
    private final ArrayList<b<?>> i = new ArrayList<>();
    private boolean k = false;

    /* loaded from: classes2.dex */
    final class a extends Handler {
        a() {
        }

        @Override // android.os.Handler
        public final void handleMessage(Message message) {
            if (message.what == 3) {
                r.this.a((YouTubeInitializationResult) message.obj);
            } else if (message.what == 4) {
                synchronized (r.this.d) {
                    if (r.this.k && r.this.f() && r.this.d.contains(message.obj)) {
                        ((t.a) message.obj).a();
                    }
                }
            } else if (message.what == 2 && !r.this.f()) {
            } else {
                if (message.what != 2 && message.what != 1) {
                    return;
                }
                ((b) message.obj).a();
            }
        }
    }

    /* loaded from: classes2.dex */
    protected abstract class b<TListener> {
        private TListener b;

        public b(TListener tlistener) {
            this.b = tlistener;
            synchronized (r.this.i) {
                r.this.i.add(this);
            }
        }

        public final void a() {
            TListener tlistener;
            synchronized (this) {
                tlistener = this.b;
            }
            a(tlistener);
        }

        protected abstract void a(TListener tlistener);

        public final void b() {
            synchronized (this) {
                this.b = null;
            }
        }
    }

    /* loaded from: classes2.dex */
    protected final class c extends b<Boolean> {
        public final YouTubeInitializationResult b;
        public final IBinder c;

        public c(String str, IBinder iBinder) {
            super(true);
            this.b = r.b(str);
            this.c = iBinder;
        }

        @Override // com.google.android.youtube.player.internal.r.b
        protected final /* synthetic */ void a(Boolean bool) {
            if (bool != null) {
                switch (this.b) {
                    case SUCCESS:
                        try {
                            if (r.this.b().equals(this.c.getInterfaceDescriptor())) {
                                r.this.c = r.this.a(this.c);
                                if (r.this.c != null) {
                                    r.this.g();
                                    return;
                                }
                            }
                        } catch (RemoteException e) {
                        }
                        r.this.a();
                        r.this.a(YouTubeInitializationResult.INTERNAL_ERROR);
                        return;
                    default:
                        r.this.a(this.b);
                        return;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public final class d extends c.a {
        protected d() {
        }

        @Override // com.google.android.youtube.player.internal.c
        public final void a(String str, IBinder iBinder) {
            r.this.a.sendMessage(r.this.a.obtainMessage(1, new c(str, iBinder)));
        }
    }

    /* loaded from: classes2.dex */
    final class e implements ServiceConnection {
        e() {
        }

        @Override // android.content.ServiceConnection
        public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            r.this.b(iBinder);
        }

        @Override // android.content.ServiceConnection
        public final void onServiceDisconnected(ComponentName componentName) {
            r.this.c = null;
            r.this.h();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Multi-variable type inference failed */
    public r(Context context, t.a aVar, t.b bVar) {
        if (Looper.getMainLooper().getThread() != Thread.currentThread()) {
            throw new IllegalStateException("Clients must be created on the UI thread.");
        }
        this.b = (Context) ab.a(context);
        this.d = new ArrayList<>();
        this.d.add(ab.a(aVar));
        this.g = new ArrayList<>();
        this.g.add(ab.a(bVar));
        this.a = new a();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a() {
        if (this.j != null) {
            try {
                this.b.unbindService(this.j);
            } catch (IllegalArgumentException e2) {
                Log.w("YouTubeClient", "Unexpected error from unbindService()", e2);
            }
        }
        this.c = null;
        this.j = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static YouTubeInitializationResult b(String str) {
        try {
            return YouTubeInitializationResult.valueOf(str);
        } catch (IllegalArgumentException e2) {
            return YouTubeInitializationResult.UNKNOWN_ERROR;
        } catch (NullPointerException e3) {
            return YouTubeInitializationResult.UNKNOWN_ERROR;
        }
    }

    protected abstract T a(IBinder iBinder);

    protected final void a(YouTubeInitializationResult youTubeInitializationResult) {
        this.a.removeMessages(4);
        synchronized (this.g) {
            this.h = true;
            ArrayList<t.b> arrayList = this.g;
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                if (!this.k) {
                    return;
                }
                if (this.g.contains(arrayList.get(i))) {
                    arrayList.get(i).a(youTubeInitializationResult);
                }
            }
            this.h = false;
        }
    }

    protected abstract void a(i iVar, d dVar) throws RemoteException;

    protected abstract String b();

    protected final void b(IBinder iBinder) {
        try {
            a(i.a.a(iBinder), new d());
        } catch (RemoteException e2) {
            Log.w("YouTubeClient", "service died");
        }
    }

    protected abstract String c();

    @Override // com.google.android.youtube.player.internal.t
    public void d() {
        h();
        this.k = false;
        synchronized (this.i) {
            int size = this.i.size();
            for (int i = 0; i < size; i++) {
                this.i.get(i).b();
            }
            this.i.clear();
        }
        a();
    }

    @Override // com.google.android.youtube.player.internal.t
    public final void e() {
        this.k = true;
        YouTubeInitializationResult isYouTubeApiServiceAvailable = YouTubeApiServiceUtil.isYouTubeApiServiceAvailable(this.b);
        if (isYouTubeApiServiceAvailable != YouTubeInitializationResult.SUCCESS) {
            this.a.sendMessage(this.a.obtainMessage(3, isYouTubeApiServiceAvailable));
            return;
        }
        Intent intent = new Intent(c()).setPackage(z.a(this.b));
        if (this.j != null) {
            Log.e("YouTubeClient", "Calling connect() while still connected, missing disconnect().");
            a();
        }
        this.j = new e();
        if (this.b.bindService(intent, this.j, TsExtractor.TS_STREAM_TYPE_AC3)) {
            return;
        }
        this.a.sendMessage(this.a.obtainMessage(3, YouTubeInitializationResult.ERROR_CONNECTING_TO_SERVICE));
    }

    public final boolean f() {
        return this.c != null;
    }

    protected final void g() {
        boolean z = true;
        synchronized (this.d) {
            ab.a(!this.f);
            this.a.removeMessages(4);
            this.f = true;
            if (this.e.size() != 0) {
                z = false;
            }
            ab.a(z);
            ArrayList<t.a> arrayList = this.d;
            int size = arrayList.size();
            for (int i = 0; i < size && this.k && f(); i++) {
                if (!this.e.contains(arrayList.get(i))) {
                    arrayList.get(i).a();
                }
            }
            this.e.clear();
            this.f = false;
        }
    }

    protected final void h() {
        this.a.removeMessages(4);
        synchronized (this.d) {
            this.f = true;
            ArrayList<t.a> arrayList = this.d;
            int size = arrayList.size();
            for (int i = 0; i < size && this.k; i++) {
                if (this.d.contains(arrayList.get(i))) {
                    arrayList.get(i).b();
                }
            }
            this.f = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void i() {
        if (!f()) {
            throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final T j() {
        i();
        return this.c;
    }
}
