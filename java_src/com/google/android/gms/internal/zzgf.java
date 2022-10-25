package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzge;
import java.util.concurrent.Future;
@zzji
/* loaded from: classes.dex */
public class zzgf {

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zza<JavascriptEngine> extends zzlq<JavascriptEngine> {
        JavascriptEngine zzbti;

        private zza() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r0v0, types: [com.google.android.gms.internal.zzgg, JavascriptEngine, com.google.android.gms.internal.zzge] */
    public zzge zza(Context context, VersionInfoParcel versionInfoParcel, final zza<zzge> zzaVar, zzav zzavVar, com.google.android.gms.ads.internal.zzd zzdVar) {
        ?? zzggVar = new zzgg(context, versionInfoParcel, zzavVar, zzdVar);
        zzaVar.zzbti = zzggVar;
        zzggVar.zza(new zzge.zza() { // from class: com.google.android.gms.internal.zzgf.2
            @Override // com.google.android.gms.internal.zzge.zza
            public void zznx() {
                zzaVar.zzh((zzge) zzaVar.zzbti);
            }
        });
        return zzggVar;
    }

    public Future<zzge> zza(final Context context, final VersionInfoParcel versionInfoParcel, final String str, final zzav zzavVar, final com.google.android.gms.ads.internal.zzd zzdVar) {
        final zza zzaVar = new zza();
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzgf.1
            @Override // java.lang.Runnable
            public void run() {
                zzgf.this.zza(context, versionInfoParcel, zzaVar, zzavVar, zzdVar).zzbp(str);
            }
        });
        return zzaVar;
    }
}
