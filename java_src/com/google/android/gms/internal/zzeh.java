package com.google.android.gms.internal;

import android.graphics.drawable.Drawable;
import android.net.Uri;
import com.google.android.gms.ads.formats.NativeAd;
@zzji
/* loaded from: classes.dex */
public class zzeh extends NativeAd.Image {
    private final Drawable mDrawable;
    private final Uri mUri;
    private final double zzbmx;
    private final zzeg zzbox;

    /* JADX WARN: Can't wrap try/catch for region: R(12:1|(2:2|3)|(9:5|6|7|8|9|10|11|12|13)|22|6|7|8|9|10|11|12|13) */
    /* JADX WARN: Can't wrap try/catch for region: R(13:1|2|3|(9:5|6|7|8|9|10|11|12|13)|22|6|7|8|9|10|11|12|13) */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0032, code lost:
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0033, code lost:
        com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get uri.", r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x003a, code lost:
        r2 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x003b, code lost:
        com.google.android.gms.ads.internal.util.client.zzb.zzb("Failed to get scale.", r2);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public zzeh(com.google.android.gms.internal.zzeg r5) {
        /*
            r4 = this;
            r1 = 0
            r4.<init>()
            r4.zzbox = r5
            com.google.android.gms.internal.zzeg r0 = r4.zzbox     // Catch: android.os.RemoteException -> L29
            com.google.android.gms.dynamic.zzd r0 = r0.zzmn()     // Catch: android.os.RemoteException -> L29
            if (r0 == 0) goto L30
            java.lang.Object r0 = com.google.android.gms.dynamic.zze.zzae(r0)     // Catch: android.os.RemoteException -> L29
            android.graphics.drawable.Drawable r0 = (android.graphics.drawable.Drawable) r0     // Catch: android.os.RemoteException -> L29
        L14:
            r4.mDrawable = r0
            com.google.android.gms.internal.zzeg r0 = r4.zzbox     // Catch: android.os.RemoteException -> L32
            android.net.Uri r1 = r0.getUri()     // Catch: android.os.RemoteException -> L32
        L1c:
            r4.mUri = r1
            r0 = 4607182418800017408(0x3ff0000000000000, double:1.0)
            com.google.android.gms.internal.zzeg r2 = r4.zzbox     // Catch: android.os.RemoteException -> L3a
            double r0 = r2.getScale()     // Catch: android.os.RemoteException -> L3a
        L26:
            r4.zzbmx = r0
            return
        L29:
            r0 = move-exception
            java.lang.String r2 = "Failed to get drawable."
            com.google.android.gms.ads.internal.util.client.zzb.zzb(r2, r0)
        L30:
            r0 = r1
            goto L14
        L32:
            r0 = move-exception
            java.lang.String r2 = "Failed to get uri."
            com.google.android.gms.ads.internal.util.client.zzb.zzb(r2, r0)
            goto L1c
        L3a:
            r2 = move-exception
            java.lang.String r3 = "Failed to get scale."
            com.google.android.gms.ads.internal.util.client.zzb.zzb(r3, r2)
            goto L26
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzeh.<init>(com.google.android.gms.internal.zzeg):void");
    }

    @Override // com.google.android.gms.ads.formats.NativeAd.Image
    public Drawable getDrawable() {
        return this.mDrawable;
    }

    @Override // com.google.android.gms.ads.formats.NativeAd.Image
    public double getScale() {
        return this.zzbmx;
    }

    @Override // com.google.android.gms.ads.formats.NativeAd.Image
    public Uri getUri() {
        return this.mUri;
    }
}
