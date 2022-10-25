package com.google.android.gms.ads.internal.request;

import android.content.Context;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.internal.zzav;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzkw;
import java.util.concurrent.Future;
@zzji
/* loaded from: classes.dex */
public class zza {

    /* renamed from: com.google.android.gms.ads.internal.request.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes.dex */
    public interface InterfaceC0022zza {
        void zza(zzko.zza zzaVar);
    }

    public zzkw zza(Context context, AdRequestInfoParcel.zza zzaVar, zzav zzavVar, InterfaceC0022zza interfaceC0022zza) {
        zzkw zznVar = zzaVar.zzcju.extras.getBundle("sdk_less_server_data") != null ? new zzn(context, zzaVar, interfaceC0022zza) : new zzb(context, zzaVar, zzavVar, interfaceC0022zza);
        Future future = (Future) zznVar.zzrz();
        return zznVar;
    }
}
