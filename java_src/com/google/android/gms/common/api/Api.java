package com.google.android.gms.common.api;

import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.support.annotation.Nullable;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.common.internal.zzp;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import java.util.Set;
/* loaded from: classes2.dex */
public final class Api<O extends ApiOptions> {
    private final String mName;
    private final zza<?, O> xk;
    private final zzh<?, O> xl;
    private final zzf<?> xm;
    private final zzi<?> xn;

    /* loaded from: classes2.dex */
    public interface ApiOptions {

        /* loaded from: classes2.dex */
        public interface HasOptions extends ApiOptions {
        }

        /* loaded from: classes2.dex */
        public static final class NoOptions implements NotRequiredOptions {
            private NoOptions() {
            }
        }

        /* loaded from: classes2.dex */
        public interface NotRequiredOptions extends ApiOptions {
        }

        /* loaded from: classes2.dex */
        public interface Optional extends HasOptions, NotRequiredOptions {
        }
    }

    /* loaded from: classes2.dex */
    public static abstract class zza<T extends zze, O> extends zzd<T, O> {
        public abstract T zza(Context context, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, O o, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener);
    }

    /* loaded from: classes2.dex */
    public interface zzb {
    }

    /* loaded from: classes2.dex */
    public static class zzc<C extends zzb> {
    }

    /* loaded from: classes2.dex */
    public static abstract class zzd<T extends zzb, O> {
        public int getPriority() {
            return Integer.MAX_VALUE;
        }

        public List<Scope> zzp(O o) {
            return Collections.emptyList();
        }
    }

    /* loaded from: classes2.dex */
    public interface zze extends zzb {
        void disconnect();

        void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr);

        boolean isConnected();

        boolean isConnecting();

        void zza(zze.zzf zzfVar);

        void zza(zzp zzpVar, Set<Scope> set);

        boolean zzain();

        boolean zzajc();

        Intent zzajd();

        boolean zzaqx();

        @Nullable
        IBinder zzaqy();
    }

    /* loaded from: classes2.dex */
    public static final class zzf<C extends zze> extends zzc<C> {
    }

    /* loaded from: classes2.dex */
    public interface zzg<T extends IInterface> extends zzb {
        void zza(int i, T t);

        T zzh(IBinder iBinder);

        String zzjx();

        String zzjy();
    }

    /* loaded from: classes2.dex */
    public static abstract class zzh<T extends zzg, O> extends zzd<T, O> {
        public abstract int zzaqz();

        public abstract T zzr(O o);
    }

    /* loaded from: classes2.dex */
    public static final class zzi<C extends zzg> extends zzc<C> {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <C extends zze> Api(String str, zza<C, O> zzaVar, zzf<C> zzfVar) {
        zzaa.zzb(zzaVar, "Cannot construct an Api with a null ClientBuilder");
        zzaa.zzb(zzfVar, "Cannot construct an Api with a null ClientKey");
        this.mName = str;
        this.xk = zzaVar;
        this.xl = null;
        this.xm = zzfVar;
        this.xn = null;
    }

    public String getName() {
        return this.mName;
    }

    public zzd<?, O> zzaqs() {
        if (zzaqw()) {
            return null;
        }
        return this.xk;
    }

    public zza<?, O> zzaqt() {
        zzaa.zza(this.xk != null, "This API was constructed with a SimpleClientBuilder. Use getSimpleClientBuilder");
        return this.xk;
    }

    public zzh<?, O> zzaqu() {
        zzaa.zza(false, (Object) "This API was constructed with a ClientBuilder. Use getClientBuilder");
        return null;
    }

    public zzc<?> zzaqv() {
        if (this.xm != null) {
            return this.xm;
        }
        throw new IllegalStateException("This API was constructed with null client keys. This should not be possible.");
    }

    public boolean zzaqw() {
        return false;
    }
}
