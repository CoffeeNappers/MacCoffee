package com.google.android.gms.ads.internal.formats;

import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.RemoteException;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzc extends zzeg.zza {
    private final Uri mUri;
    private final Drawable zzbmw;
    private final double zzbmx;

    public zzc(Drawable drawable, Uri uri, double d) {
        this.zzbmw = drawable;
        this.mUri = uri;
        this.zzbmx = d;
    }

    @Override // com.google.android.gms.internal.zzeg
    public double getScale() {
        return this.zzbmx;
    }

    @Override // com.google.android.gms.internal.zzeg
    public Uri getUri() throws RemoteException {
        return this.mUri;
    }

    @Override // com.google.android.gms.internal.zzeg
    public com.google.android.gms.dynamic.zzd zzmn() throws RemoteException {
        return com.google.android.gms.dynamic.zze.zzac(this.zzbmw);
    }
}
