package com.google.android.gms.common.internal;

import android.content.Context;
import android.os.IBinder;
import android.view.View;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.dynamic.zzg;
/* loaded from: classes.dex */
public final class zzae extends com.google.android.gms.dynamic.zzg<zzw> {
    private static final zzae EN = new zzae();

    private zzae() {
        super("com.google.android.gms.common.ui.SignInButtonCreatorImpl");
    }

    public static View zzb(Context context, int i, int i2) throws zzg.zza {
        return EN.zzc(context, i, i2);
    }

    private View zzc(Context context, int i, int i2) throws zzg.zza {
        try {
            SignInButtonConfig signInButtonConfig = new SignInButtonConfig(i, i2, null);
            return (View) com.google.android.gms.dynamic.zze.zzae(zzcr(context).zza(com.google.android.gms.dynamic.zze.zzac(context), signInButtonConfig));
        } catch (Exception e) {
            throw new zzg.zza(new StringBuilder(64).append("Could not get button with size ").append(i).append(" and color ").append(i2).toString(), e);
        }
    }

    @Override // com.google.android.gms.dynamic.zzg
    /* renamed from: zzdy */
    public zzw zzc(IBinder iBinder) {
        return zzw.zza.zzdx(iBinder);
    }
}
