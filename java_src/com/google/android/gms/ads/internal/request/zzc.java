package com.google.android.gms.ads.internal.request;

import android.content.Context;
import com.google.android.gms.ads.internal.request.zzd;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzld;
import com.google.android.gms.internal.zzlw;
@zzji
/* loaded from: classes.dex */
public final class zzc {

    /* loaded from: classes.dex */
    public interface zza {
        void zzb(AdResponseParcel adResponseParcel);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface zzb {
        boolean zza(VersionInfoParcel versionInfoParcel);
    }

    public static zzld zza(final Context context, VersionInfoParcel versionInfoParcel, zzlw<AdRequestInfoParcel> zzlwVar, zza zzaVar) {
        return zza(context, versionInfoParcel, zzlwVar, zzaVar, new zzb() { // from class: com.google.android.gms.ads.internal.request.zzc.1
            @Override // com.google.android.gms.ads.internal.request.zzc.zzb
            public boolean zza(VersionInfoParcel versionInfoParcel2) {
                return versionInfoParcel2.zzcyc || (com.google.android.gms.common.util.zzi.zzcj(context) && !zzdr.zzbel.get().booleanValue());
            }
        });
    }

    static zzld zza(Context context, VersionInfoParcel versionInfoParcel, zzlw<AdRequestInfoParcel> zzlwVar, zza zzaVar, zzb zzbVar) {
        return zzbVar.zza(versionInfoParcel) ? zza(context, zzlwVar, zzaVar) : zzb(context, versionInfoParcel, zzlwVar, zzaVar);
    }

    private static zzld zza(Context context, zzlw<AdRequestInfoParcel> zzlwVar, zza zzaVar) {
        zzkx.zzdg("Fetching ad response from local ad request service.");
        zzd.zza zzaVar2 = new zzd.zza(context, zzlwVar, zzaVar);
        Void r0 = (Void) zzaVar2.zzrz();
        return zzaVar2;
    }

    private static zzld zzb(Context context, VersionInfoParcel versionInfoParcel, zzlw<AdRequestInfoParcel> zzlwVar, zza zzaVar) {
        zzkx.zzdg("Fetching ad response from remote ad request service.");
        if (!com.google.android.gms.ads.internal.client.zzm.zzkr().zzap(context)) {
            zzkx.zzdi("Failed to connect to remote ad request service.");
            return null;
        }
        return new zzd.zzb(context, versionInfoParcel, zzlwVar, zzaVar);
    }
}
