package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.ResultTransform;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.TransformedResult;
import com.google.android.gms.internal.zzsg;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public abstract class zzqq<R extends Result> extends PendingResult<R> {
    static final ThreadLocal<Boolean> yG = new ThreadLocal<Boolean>() { // from class: com.google.android.gms.internal.zzqq.1
        /* JADX INFO: Access modifiers changed from: protected */
        @Override // java.lang.ThreadLocal
        /* renamed from: zzarw */
        public Boolean initialValue() {
            return false;
        }
    };
    private R xV;
    private final Object yH;
    protected final zza<R> yI;
    protected final WeakReference<GoogleApiClient> yJ;
    private final ArrayList<PendingResult.zza> yK;
    private ResultCallback<? super R> yL;
    private final AtomicReference<zzsg.zzb> yM;
    private zzb yN;
    private volatile boolean yO;
    private boolean yP;
    private com.google.android.gms.common.internal.zzq yQ;
    private volatile zzsf<R> yR;
    private boolean yS;
    private boolean zzak;
    private final CountDownLatch zzank;

    /* loaded from: classes2.dex */
    public static class zza<R extends Result> extends Handler {
        public zza() {
            this(Looper.getMainLooper());
        }

        public zza(Looper looper) {
            super(looper);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    Pair pair = (Pair) message.obj;
                    zzb((ResultCallback) pair.first, (Result) pair.second);
                    return;
                case 2:
                    ((zzqq) message.obj).zzab(Status.yc);
                    return;
                default:
                    Log.wtf("BasePendingResult", new StringBuilder(45).append("Don't know how to handle message: ").append(message.what).toString(), new Exception());
                    return;
            }
        }

        public void zza(ResultCallback<? super R> resultCallback, R r) {
            sendMessage(obtainMessage(1, new Pair(resultCallback, r)));
        }

        public void zza(zzqq<R> zzqqVar, long j) {
            sendMessageDelayed(obtainMessage(2, zzqqVar), j);
        }

        public void zzarx() {
            removeMessages(2);
        }

        protected void zzb(ResultCallback<? super R> resultCallback, R r) {
            try {
                resultCallback.onResult(r);
            } catch (RuntimeException e) {
                zzqq.zze(r);
                throw e;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class zzb {
        private zzb() {
        }

        protected void finalize() throws Throwable {
            zzqq.zze(zzqq.this.xV);
            super.finalize();
        }
    }

    @Deprecated
    zzqq() {
        this.yH = new Object();
        this.zzank = new CountDownLatch(1);
        this.yK = new ArrayList<>();
        this.yM = new AtomicReference<>();
        this.yS = false;
        this.yI = new zza<>(Looper.getMainLooper());
        this.yJ = new WeakReference<>(null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Deprecated
    public zzqq(Looper looper) {
        this.yH = new Object();
        this.zzank = new CountDownLatch(1);
        this.yK = new ArrayList<>();
        this.yM = new AtomicReference<>();
        this.yS = false;
        this.yI = new zza<>(looper);
        this.yJ = new WeakReference<>(null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzqq(GoogleApiClient googleApiClient) {
        this.yH = new Object();
        this.zzank = new CountDownLatch(1);
        this.yK = new ArrayList<>();
        this.yM = new AtomicReference<>();
        this.yS = false;
        this.yI = new zza<>(googleApiClient != null ? googleApiClient.getLooper() : Looper.getMainLooper());
        this.yJ = new WeakReference<>(googleApiClient);
    }

    private R get() {
        R r;
        boolean z = true;
        synchronized (this.yH) {
            if (this.yO) {
                z = false;
            }
            com.google.android.gms.common.internal.zzaa.zza(z, "Result has already been consumed.");
            com.google.android.gms.common.internal.zzaa.zza(isReady(), "Result is not ready.");
            r = this.xV;
            this.xV = null;
            this.yL = null;
            this.yO = true;
        }
        zzart();
        return r;
    }

    private void zzart() {
        zzsg.zzb andSet = this.yM.getAndSet(null);
        if (andSet != null) {
            andSet.zzc(this);
        }
    }

    private void zzd(R r) {
        this.xV = r;
        this.yQ = null;
        this.zzank.countDown();
        Status status = this.xV.getStatus();
        if (this.zzak) {
            this.yL = null;
        } else if (this.yL != null) {
            this.yI.zzarx();
            this.yI.zza((ResultCallback<? super ResultCallback<? super R>>) this.yL, (ResultCallback<? super R>) get());
        } else if (this.xV instanceof Releasable) {
            this.yN = new zzb();
        }
        Iterator<PendingResult.zza> it = this.yK.iterator();
        while (it.hasNext()) {
            it.next().zzx(status);
        }
        this.yK.clear();
    }

    public static void zze(Result result) {
        if (result instanceof Releasable) {
            try {
                ((Releasable) result).release();
            } catch (RuntimeException e) {
                String valueOf = String.valueOf(result);
                Log.w("BasePendingResult", new StringBuilder(String.valueOf(valueOf).length() + 18).append("Unable to release ").append(valueOf).toString(), e);
            }
        }
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public final R await() {
        boolean z = true;
        com.google.android.gms.common.internal.zzaa.zza(Looper.myLooper() != Looper.getMainLooper(), "await must not be called on the UI thread");
        com.google.android.gms.common.internal.zzaa.zza(!this.yO, "Result has already been consumed");
        if (this.yR != null) {
            z = false;
        }
        com.google.android.gms.common.internal.zzaa.zza(z, "Cannot await if then() has been called.");
        try {
            this.zzank.await();
        } catch (InterruptedException e) {
            zzab(Status.ya);
        }
        com.google.android.gms.common.internal.zzaa.zza(isReady(), "Result is not ready.");
        return get();
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public final R await(long j, TimeUnit timeUnit) {
        boolean z = true;
        com.google.android.gms.common.internal.zzaa.zza(j <= 0 || Looper.myLooper() != Looper.getMainLooper(), "await must not be called on the UI thread when time is greater than zero.");
        com.google.android.gms.common.internal.zzaa.zza(!this.yO, "Result has already been consumed.");
        if (this.yR != null) {
            z = false;
        }
        com.google.android.gms.common.internal.zzaa.zza(z, "Cannot await if then() has been called.");
        try {
            if (!this.zzank.await(j, timeUnit)) {
                zzab(Status.yc);
            }
        } catch (InterruptedException e) {
            zzab(Status.ya);
        }
        com.google.android.gms.common.internal.zzaa.zza(isReady(), "Result is not ready.");
        return get();
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public void cancel() {
        synchronized (this.yH) {
            if (this.zzak || this.yO) {
                return;
            }
            if (this.yQ != null) {
                try {
                    this.yQ.cancel();
                } catch (RemoteException e) {
                }
            }
            zze(this.xV);
            this.zzak = true;
            zzd(zzc(Status.yd));
        }
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public boolean isCanceled() {
        boolean z;
        synchronized (this.yH) {
            z = this.zzak;
        }
        return z;
    }

    public final boolean isReady() {
        return this.zzank.getCount() == 0;
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public final void setResultCallback(ResultCallback<? super R> resultCallback) {
        boolean z = true;
        synchronized (this.yH) {
            if (resultCallback == null) {
                this.yL = null;
                return;
            }
            com.google.android.gms.common.internal.zzaa.zza(!this.yO, "Result has already been consumed.");
            if (this.yR != null) {
                z = false;
            }
            com.google.android.gms.common.internal.zzaa.zza(z, "Cannot set callbacks if then() has been called.");
            if (isCanceled()) {
                return;
            }
            if (isReady()) {
                this.yI.zza((ResultCallback<? super ResultCallback<? super R>>) resultCallback, (ResultCallback<? super R>) get());
            } else {
                this.yL = resultCallback;
            }
        }
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public final void setResultCallback(ResultCallback<? super R> resultCallback, long j, TimeUnit timeUnit) {
        boolean z = true;
        synchronized (this.yH) {
            if (resultCallback == null) {
                this.yL = null;
                return;
            }
            com.google.android.gms.common.internal.zzaa.zza(!this.yO, "Result has already been consumed.");
            if (this.yR != null) {
                z = false;
            }
            com.google.android.gms.common.internal.zzaa.zza(z, "Cannot set callbacks if then() has been called.");
            if (isCanceled()) {
                return;
            }
            if (isReady()) {
                this.yI.zza((ResultCallback<? super ResultCallback<? super R>>) resultCallback, (ResultCallback<? super R>) get());
            } else {
                this.yL = resultCallback;
                this.yI.zza(this, timeUnit.toMillis(j));
            }
        }
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public <S extends Result> TransformedResult<S> then(ResultTransform<? super R, ? extends S> resultTransform) {
        TransformedResult<S> then;
        boolean z = true;
        com.google.android.gms.common.internal.zzaa.zza(!this.yO, "Result has already been consumed.");
        synchronized (this.yH) {
            com.google.android.gms.common.internal.zzaa.zza(this.yR == null, "Cannot call then() twice.");
            if (this.yL != null) {
                z = false;
            }
            com.google.android.gms.common.internal.zzaa.zza(z, "Cannot call then() if callbacks are set.");
            this.yS = true;
            this.yR = new zzsf<>(this.yJ);
            then = this.yR.then(resultTransform);
            if (isReady()) {
                this.yI.zza(this.yR, (zzsf<R>) get());
            } else {
                this.yL = this.yR;
            }
        }
        return then;
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public final void zza(PendingResult.zza zzaVar) {
        boolean z = true;
        com.google.android.gms.common.internal.zzaa.zza(!this.yO, "Result has already been consumed.");
        if (zzaVar == null) {
            z = false;
        }
        com.google.android.gms.common.internal.zzaa.zzb(z, "Callback cannot be null.");
        synchronized (this.yH) {
            if (isReady()) {
                zzaVar.zzx(this.xV.getStatus());
            } else {
                this.yK.add(zzaVar);
            }
        }
    }

    protected final void zza(com.google.android.gms.common.internal.zzq zzqVar) {
        synchronized (this.yH) {
            this.yQ = zzqVar;
        }
    }

    public void zza(zzsg.zzb zzbVar) {
        this.yM.set(zzbVar);
    }

    public final void zzab(Status status) {
        synchronized (this.yH) {
            if (!isReady()) {
                zzc((zzqq<R>) zzc(status));
                this.yP = true;
            }
        }
    }

    @Override // com.google.android.gms.common.api.PendingResult
    public Integer zzarh() {
        return null;
    }

    public boolean zzars() {
        boolean isCanceled;
        synchronized (this.yH) {
            if (this.yJ.get() == null || !this.yS) {
                cancel();
            }
            isCanceled = isCanceled();
        }
        return isCanceled;
    }

    public void zzaru() {
        setResultCallback(null);
    }

    public void zzarv() {
        this.yS = this.yS || yG.get().booleanValue();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract R zzc(Status status);

    public final void zzc(R r) {
        boolean z = true;
        synchronized (this.yH) {
            if (this.yP || this.zzak) {
                zze(r);
                return;
            }
            if (isReady()) {
            }
            com.google.android.gms.common.internal.zzaa.zza(!isReady(), "Results have already been set");
            if (this.yO) {
                z = false;
            }
            com.google.android.gms.common.internal.zzaa.zza(z, "Result has already been consumed");
            zzd(r);
        }
    }
}
