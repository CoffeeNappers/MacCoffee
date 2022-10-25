package com.google.android.gms.internal;

import android.os.RemoteException;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.client.zzq;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzfy {
    @Nullable
    com.google.android.gms.ads.internal.client.zzq zzanl;
    @Nullable
    com.google.android.gms.ads.internal.client.zzw zzbsf;
    @Nullable
    zzig zzbsg;
    @Nullable
    zzed zzbsh;
    @Nullable
    com.google.android.gms.ads.internal.client.zzp zzbsi;
    @Nullable
    com.google.android.gms.ads.internal.reward.client.zzd zzbsj;

    /* loaded from: classes2.dex */
    private static class zza extends zzq.zza {
        private final com.google.android.gms.ads.internal.client.zzq zzbsk;

        zza(com.google.android.gms.ads.internal.client.zzq zzqVar) {
            this.zzbsk = zzqVar;
        }

        @Override // com.google.android.gms.ads.internal.client.zzq
        public void onAdClosed() throws RemoteException {
            this.zzbsk.onAdClosed();
            com.google.android.gms.ads.internal.zzu.zzhb().zznm();
        }

        @Override // com.google.android.gms.ads.internal.client.zzq
        public void onAdFailedToLoad(int i) throws RemoteException {
            this.zzbsk.onAdFailedToLoad(i);
        }

        @Override // com.google.android.gms.ads.internal.client.zzq
        public void onAdLeftApplication() throws RemoteException {
            this.zzbsk.onAdLeftApplication();
        }

        @Override // com.google.android.gms.ads.internal.client.zzq
        public void onAdLoaded() throws RemoteException {
            this.zzbsk.onAdLoaded();
        }

        @Override // com.google.android.gms.ads.internal.client.zzq
        public void onAdOpened() throws RemoteException {
            this.zzbsk.onAdOpened();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzc(com.google.android.gms.ads.internal.zzl zzlVar) {
        if (this.zzanl != null) {
            zzlVar.zza(new zza(this.zzanl));
        }
        if (this.zzbsf != null) {
            zzlVar.zza(this.zzbsf);
        }
        if (this.zzbsg != null) {
            zzlVar.zza(this.zzbsg);
        }
        if (this.zzbsh != null) {
            zzlVar.zza(this.zzbsh);
        }
        if (this.zzbsi != null) {
            zzlVar.zza(this.zzbsi);
        }
        if (this.zzbsj != null) {
            zzlVar.zza(this.zzbsj);
        }
    }
}
