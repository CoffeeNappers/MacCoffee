package com.google.android.gms.common.api;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.support.annotation.MainThread;
import android.support.annotation.NonNull;
import android.support.annotation.WorkerThread;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzag;
import com.google.android.gms.internal.zzqk;
import com.google.android.gms.internal.zzql;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzqr;
import com.google.android.gms.internal.zzqw;
import com.google.android.gms.internal.zzrh;
import com.google.android.gms.internal.zzri;
import com.google.android.gms.internal.zzrr;
import com.google.android.gms.internal.zzrs;
import com.google.android.gms.internal.zzrw;
import com.google.android.gms.internal.zzsb;
import com.google.android.gms.internal.zzse;
import com.google.android.gms.internal.zzsh;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;
/* loaded from: classes2.dex */
public abstract class zzc<O extends Api.ApiOptions> {
    private final Context mContext;
    private final int mId;
    private final Api<O> vS;
    private final zzsb xA;
    private final Api.zze xB;
    private final zzqr xC;
    private final O xw;
    private final zzql<O> xx;
    private final zzrh xy;
    private final GoogleApiClient xz;
    private final Looper zzajy;

    @MainThread
    public zzc(@NonNull Activity activity, Api<O> api, O o, Looper looper, zzsb zzsbVar) {
        zzaa.zzb(activity, "Null activity is not permitted.");
        zzaa.zzb(api, "Api must not be null.");
        zzaa.zzb(looper, "Looper must not be null.");
        this.mContext = activity.getApplicationContext();
        this.vS = api;
        this.xw = o;
        this.zzajy = looper;
        this.xx = zzql.zza(this.vS, this.xw);
        this.xz = new zzri(this);
        this.xy = zzrh.zzbx(this.mContext);
        this.mId = this.xy.zzath();
        this.xA = zzsbVar;
        this.xB = null;
        this.xC = null;
        zzqw.zza(activity, this.xy, this.xx);
        this.xy.zza((zzc<?>) this);
    }

    public zzc(@NonNull Activity activity, Api<O> api, O o, zzsb zzsbVar) {
        this(activity, (Api) api, (Api.ApiOptions) o, activity.getMainLooper(), zzsbVar);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzc(@NonNull Context context, Api<O> api, Looper looper, Api.zze zzeVar, zzqr zzqrVar) {
        zzaa.zzb(context, "Null context is not permitted.");
        zzaa.zzb(api, "Api must not be null.");
        zzaa.zzb(looper, "Looper must not be null.");
        this.mContext = context.getApplicationContext();
        this.vS = api;
        this.xw = null;
        this.zzajy = looper;
        this.xx = zzql.zzb(api);
        this.xz = new zzri(this);
        this.xy = zzrh.zzbx(this.mContext);
        this.mId = this.xy.zzath();
        this.xA = new zzqk();
        this.xB = zzeVar;
        this.xC = zzqrVar;
        this.xy.zza((zzc<?>) this);
    }

    public zzc(@NonNull Context context, Api<O> api, O o, Looper looper, zzsb zzsbVar) {
        zzaa.zzb(context, "Null context is not permitted.");
        zzaa.zzb(api, "Api must not be null.");
        zzaa.zzb(looper, "Looper must not be null.");
        this.mContext = context.getApplicationContext();
        this.vS = api;
        this.xw = o;
        this.zzajy = looper;
        this.xx = zzql.zza(this.vS, this.xw);
        this.xz = new zzri(this);
        this.xy = zzrh.zzbx(this.mContext);
        this.mId = this.xy.zzath();
        this.xA = zzsbVar;
        this.xB = null;
        this.xC = null;
        this.xy.zza((zzc<?>) this);
    }

    public zzc(@NonNull Context context, Api<O> api, O o, zzsb zzsbVar) {
        this(context, api, o, Looper.myLooper() != null ? Looper.myLooper() : Looper.getMainLooper(), zzsbVar);
    }

    private <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T zza(int i, @NonNull T t) {
        t.zzarv();
        this.xy.zza(this, i, (zzqo.zza<? extends Result, Api.zzb>) t);
        return t;
    }

    private <TResult, A extends Api.zzb> Task<TResult> zza(int i, @NonNull zzse<A, TResult> zzseVar) {
        TaskCompletionSource<TResult> taskCompletionSource = new TaskCompletionSource<>();
        this.xy.zza(this, i, zzseVar, taskCompletionSource, this.xA);
        return taskCompletionSource.getTask();
    }

    public GoogleApiClient asGoogleApiClient() {
        return this.xz;
    }

    /* JADX WARN: Type inference failed for: r0v7, types: [com.google.android.gms.common.api.Api$zze] */
    /* JADX WARN: Type inference failed for: r7v0, types: [com.google.android.gms.common.api.Api$zzg] */
    @WorkerThread
    public Api.zze buildApiClient(Looper looper, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        zzaa.zza(this.xB == null, "Client is already built, use getClient(). getClientCallbacks() should also be provided with a helper.");
        if (this.vS.zzaqw()) {
            Api.zzh<?, O> zzaqu = this.vS.zzaqu();
            return new zzag(this.mContext, looper, zzaqu.zzaqz(), connectionCallbacks, onConnectionFailedListener, com.google.android.gms.common.internal.zzf.zzca(this.mContext), zzaqu.zzr(this.xw));
        }
        return this.vS.zzaqt().zza(this.mContext, looper, com.google.android.gms.common.internal.zzf.zzca(this.mContext), this.xw, connectionCallbacks, onConnectionFailedListener);
    }

    public <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T doBestEffortWrite(@NonNull T t) {
        return (T) zza(2, (int) t);
    }

    public <TResult, A extends Api.zzb> Task<TResult> doBestEffortWrite(zzse<A, TResult> zzseVar) {
        return zza(2, zzseVar);
    }

    public <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T doRead(@NonNull T t) {
        return (T) zza(0, (int) t);
    }

    public <TResult, A extends Api.zzb> Task<TResult> doRead(zzse<A, TResult> zzseVar) {
        return zza(0, zzseVar);
    }

    public <A extends Api.zzb, T extends zzrw<A>, U extends zzsh<A>> Task<Void> doRegisterEventListener(@NonNull T t, U u) {
        zzaa.zzy(t);
        zzaa.zzy(u);
        zzaa.zzb(t.zzatz(), "Listener has already been released.");
        zzaa.zzb(u.zzatz(), "Listener has already been released.");
        zzaa.zzb(t.zzatz().equals(u.zzatz()), "Listener registration and unregistration methods must be constructed with the same ListenerHolder.");
        return this.xy.zza(this, (zzrw<Api.zzb>) t, (zzsh<Api.zzb>) u);
    }

    public Task<Void> doUnregisterEventListener(@NonNull zzrr.zzb<?> zzbVar) {
        zzaa.zzb(zzbVar, "Listener key cannot be null.");
        return this.xy.zza(this, zzbVar);
    }

    public <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T doWrite(@NonNull T t) {
        return (T) zza(1, (int) t);
    }

    public <TResult, A extends Api.zzb> Task<TResult> doWrite(zzse<A, TResult> zzseVar) {
        return zza(1, zzseVar);
    }

    public Api<O> getApi() {
        return this.vS;
    }

    public zzql<O> getApiKey() {
        return this.xx;
    }

    public O getApiOptions() {
        return this.xw;
    }

    public Context getApplicationContext() {
        return this.mContext;
    }

    public Api.zze getClient() {
        return (Api.zze) zzaa.zzb(this.xB, "Client is null, buildApiClient() should be used.");
    }

    public zzqr getClientCallbacks() {
        return (zzqr) zzaa.zzb(this.xC, "ClientCallbacks is null.");
    }

    public int getInstanceId() {
        return this.mId;
    }

    public Looper getLooper() {
        return this.zzajy;
    }

    public boolean isConnectionlessGoogleApiClient() {
        return (this.xB == null || this.xC == null) ? false : true;
    }

    public <L> zzrr<L> registerListener(@NonNull L l, String str) {
        return zzrs.zzb(l, this.zzajy, str);
    }
}
