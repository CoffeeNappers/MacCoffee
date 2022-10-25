package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.widget.FrameLayout;
import com.google.android.gms.dynamic.zzg;
import com.google.android.gms.internal.zzei;
import com.google.android.gms.internal.zzej;
@zzji
/* loaded from: classes.dex */
public class zzeu extends com.google.android.gms.dynamic.zzg<zzej> {
    public zzeu() {
        super("com.google.android.gms.ads.NativeAdViewDelegateCreatorImpl");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.dynamic.zzg
    /* renamed from: zzal */
    public zzej zzc(IBinder iBinder) {
        return zzej.zza.zzad(iBinder);
    }

    public zzei zzb(Context context, FrameLayout frameLayout, FrameLayout frameLayout2) {
        try {
            return zzei.zza.zzac(zzcr(context).zza(com.google.android.gms.dynamic.zze.zzac(context), com.google.android.gms.dynamic.zze.zzac(frameLayout), com.google.android.gms.dynamic.zze.zzac(frameLayout2), 9877000));
        } catch (RemoteException | zzg.zza e) {
            com.google.android.gms.ads.internal.util.client.zzb.zzc("Could not create remote NativeAdViewDelegate.", e);
            return null;
        }
    }
}
