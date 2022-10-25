package com.google.android.gms.internal;
@zzji
/* loaded from: classes.dex */
public class zzfq extends zzkw {
    final zzmd zzbnz;
    final zzfs zzbra;
    private final String zzbrb;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzfq(zzmd zzmdVar, zzfs zzfsVar, String str) {
        this.zzbnz = zzmdVar;
        this.zzbra = zzfsVar;
        this.zzbrb = str;
        com.google.android.gms.ads.internal.zzu.zzhj().zza(this);
    }

    @Override // com.google.android.gms.internal.zzkw
    public void onStop() {
        this.zzbra.abort();
    }

    @Override // com.google.android.gms.internal.zzkw
    public void zzfp() {
        try {
            this.zzbra.zzbg(this.zzbrb);
        } finally {
            zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzfq.1
                @Override // java.lang.Runnable
                public void run() {
                    com.google.android.gms.ads.internal.zzu.zzhj().zzb(zzfq.this);
                }
            });
        }
    }
}
