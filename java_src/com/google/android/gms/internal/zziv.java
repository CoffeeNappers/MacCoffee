package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.internal.zziu;
import com.google.android.gms.internal.zzko;
import com.google.android.gms.internal.zzme;
@zzji
/* loaded from: classes.dex */
public class zziv extends zziq implements zzme.zza {
    /* JADX INFO: Access modifiers changed from: package-private */
    public zziv(Context context, zzko.zza zzaVar, zzmd zzmdVar, zziu.zza zzaVar2) {
        super(context, zzaVar, zzmdVar, zzaVar2);
    }

    @Override // com.google.android.gms.internal.zziq
    protected void zzrx() {
        if (this.zzcgg.errorCode != -2) {
            return;
        }
        this.zzbnz.zzxc().zza(this);
        zzse();
        zzkx.zzdg("Loading HTML in WebView.");
        this.zzbnz.loadDataWithBaseURL(this.zzcgg.zzcbo, this.zzcgg.body, "text/html", "UTF-8", null);
    }

    protected void zzse() {
    }
}
