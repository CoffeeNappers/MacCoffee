package com.google.android.gms.internal;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.internal.zzqo;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public interface zzrm {

    /* loaded from: classes2.dex */
    public interface zza {
        void zzc(int i, boolean z);

        void zzc(ConnectionResult connectionResult);

        void zzn(Bundle bundle);
    }

    ConnectionResult blockingConnect();

    ConnectionResult blockingConnect(long j, TimeUnit timeUnit);

    void connect();

    void disconnect();

    void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr);

    @Nullable
    ConnectionResult getConnectionResult(@NonNull Api<?> api);

    boolean isConnected();

    boolean isConnecting();

    <A extends Api.zzb, R extends Result, T extends zzqo.zza<R, A>> T zza(@NonNull T t);

    boolean zza(zzsa zzsaVar);

    void zzard();

    void zzarz();

    <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T zzb(@NonNull T t);
}
