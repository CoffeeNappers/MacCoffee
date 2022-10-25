package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.WorkerThread;
import android.util.Log;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.ResultCallbacks;
import com.google.android.gms.common.api.ResultTransform;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.TransformedResult;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
public class zzsf<R extends Result> extends TransformedResult<R> implements ResultCallback<R> {
    private final zza BA;
    private final WeakReference<GoogleApiClient> yJ;
    private ResultTransform<? super R, ? extends Result> Bv = null;
    private zzsf<? extends Result> Bw = null;
    private volatile ResultCallbacks<? super R> Bx = null;
    private PendingResult<R> By = null;
    private final Object yH = new Object();
    private Status Bz = null;
    private boolean BB = false;

    /* loaded from: classes2.dex */
    private final class zza extends Handler {
        public zza(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            switch (message.what) {
                case 0:
                    PendingResult<?> pendingResult = (PendingResult) message.obj;
                    synchronized (zzsf.this.yH) {
                        if (pendingResult == null) {
                            zzsf.this.Bw.zzad(new Status(13, "Transform returned null"));
                        } else if (pendingResult instanceof zzrz) {
                            zzsf.this.Bw.zzad(((zzrz) pendingResult).getStatus());
                        } else {
                            zzsf.this.Bw.zza(pendingResult);
                        }
                    }
                    return;
                case 1:
                    RuntimeException runtimeException = (RuntimeException) message.obj;
                    String valueOf = String.valueOf(runtimeException.getMessage());
                    Log.e("TransformedResultImpl", valueOf.length() != 0 ? "Runtime exception on the transformation worker thread: ".concat(valueOf) : new String("Runtime exception on the transformation worker thread: "));
                    throw runtimeException;
                default:
                    Log.e("TransformedResultImpl", new StringBuilder(70).append("TransformationResultHandler received unknown message type: ").append(message.what).toString());
                    return;
            }
        }
    }

    public zzsf(WeakReference<GoogleApiClient> weakReference) {
        com.google.android.gms.common.internal.zzaa.zzb(weakReference, "GoogleApiClient reference must not be null");
        this.yJ = weakReference;
        GoogleApiClient googleApiClient = this.yJ.get();
        this.BA = new zza(googleApiClient != null ? googleApiClient.getLooper() : Looper.getMainLooper());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzad(Status status) {
        synchronized (this.yH) {
            this.Bz = status;
            zzae(this.Bz);
        }
    }

    private void zzae(Status status) {
        synchronized (this.yH) {
            if (this.Bv != null) {
                Status onFailure = this.Bv.onFailure(status);
                com.google.android.gms.common.internal.zzaa.zzb(onFailure, "onFailure must not return null");
                this.Bw.zzad(onFailure);
            } else if (zzaue()) {
                this.Bx.onFailure(status);
            }
        }
    }

    private void zzauc() {
        if (this.Bv == null && this.Bx == null) {
            return;
        }
        GoogleApiClient googleApiClient = this.yJ.get();
        if (!this.BB && this.Bv != null && googleApiClient != null) {
            googleApiClient.zza(this);
            this.BB = true;
        }
        if (this.Bz != null) {
            zzae(this.Bz);
        } else if (this.By == null) {
        } else {
            this.By.setResultCallback(this);
        }
    }

    private boolean zzaue() {
        return (this.Bx == null || this.yJ.get() == null) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zze(Result result) {
        if (result instanceof Releasable) {
            try {
                ((Releasable) result).release();
            } catch (RuntimeException e) {
                String valueOf = String.valueOf(result);
                Log.w("TransformedResultImpl", new StringBuilder(String.valueOf(valueOf).length() + 18).append("Unable to release ").append(valueOf).toString(), e);
            }
        }
    }

    @Override // com.google.android.gms.common.api.TransformedResult
    public void andFinally(@NonNull ResultCallbacks<? super R> resultCallbacks) {
        boolean z = true;
        synchronized (this.yH) {
            com.google.android.gms.common.internal.zzaa.zza(this.Bx == null, "Cannot call andFinally() twice.");
            if (this.Bv != null) {
                z = false;
            }
            com.google.android.gms.common.internal.zzaa.zza(z, "Cannot call then() and andFinally() on the same TransformedResult.");
            this.Bx = resultCallbacks;
            zzauc();
        }
    }

    @Override // com.google.android.gms.common.api.ResultCallback
    public void onResult(final R r) {
        synchronized (this.yH) {
            if (!r.getStatus().isSuccess()) {
                zzad(r.getStatus());
                zze(r);
            } else if (this.Bv != null) {
                zzry.zzatf().submit(new Runnable() { // from class: com.google.android.gms.internal.zzsf.1
                    /* JADX WARN: Multi-variable type inference failed */
                    @Override // java.lang.Runnable
                    @WorkerThread
                    public void run() {
                        try {
                            try {
                                zzqq.yG.set(true);
                                zzsf.this.BA.sendMessage(zzsf.this.BA.obtainMessage(0, zzsf.this.Bv.onSuccess(r)));
                                zzqq.yG.set(false);
                                zzsf.this.zze(r);
                                GoogleApiClient googleApiClient = (GoogleApiClient) zzsf.this.yJ.get();
                                if (googleApiClient == null) {
                                    return;
                                }
                                googleApiClient.zzb(zzsf.this);
                            } catch (RuntimeException e) {
                                zzsf.this.BA.sendMessage(zzsf.this.BA.obtainMessage(1, e));
                                zzqq.yG.set(false);
                                zzsf.this.zze(r);
                                GoogleApiClient googleApiClient2 = (GoogleApiClient) zzsf.this.yJ.get();
                                if (googleApiClient2 == null) {
                                    return;
                                }
                                googleApiClient2.zzb(zzsf.this);
                            }
                        } catch (Throwable th) {
                            zzqq.yG.set(false);
                            zzsf.this.zze(r);
                            GoogleApiClient googleApiClient3 = (GoogleApiClient) zzsf.this.yJ.get();
                            if (googleApiClient3 != null) {
                                googleApiClient3.zzb(zzsf.this);
                            }
                            throw th;
                        }
                    }
                });
            } else if (zzaue()) {
                this.Bx.onSuccess(r);
            }
        }
    }

    @Override // com.google.android.gms.common.api.TransformedResult
    @NonNull
    public <S extends Result> TransformedResult<S> then(@NonNull ResultTransform<? super R, ? extends S> resultTransform) {
        zzsf<? extends Result> zzsfVar;
        boolean z = true;
        synchronized (this.yH) {
            com.google.android.gms.common.internal.zzaa.zza(this.Bv == null, "Cannot call then() twice.");
            if (this.Bx != null) {
                z = false;
            }
            com.google.android.gms.common.internal.zzaa.zza(z, "Cannot call then() and andFinally() on the same TransformedResult.");
            this.Bv = resultTransform;
            zzsfVar = new zzsf<>(this.yJ);
            this.Bw = zzsfVar;
            zzauc();
        }
        return zzsfVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void zza(PendingResult<?> pendingResult) {
        synchronized (this.yH) {
            this.By = pendingResult;
            zzauc();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzaud() {
        this.Bx = null;
    }
}
