package com.google.android.gms.internal;

import android.os.Parcel;
import android.util.Base64;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
/* JADX INFO: Access modifiers changed from: package-private */
@zzji
/* loaded from: classes.dex */
public class zzgd {
    final String zzant;
    final AdRequestParcel zzapj;
    final int zzbsq;

    zzgd(AdRequestParcel adRequestParcel, String str, int i) {
        this.zzapj = adRequestParcel;
        this.zzant = str;
        this.zzbsq = i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzgd(zzgb zzgbVar) {
        this(zzgbVar.zzno(), zzgbVar.getAdUnitId(), zzgbVar.getNetworkType());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static zzgd zzbn(String str) throws IOException {
        String[] split = str.split("\u0000");
        if (split.length != 3) {
            throw new IOException("Incorrect field count for QueueSeed.");
        }
        Parcel obtain = Parcel.obtain();
        try {
            String str2 = new String(Base64.decode(split[0], 0), "UTF-8");
            int parseInt = Integer.parseInt(split[1]);
            byte[] decode = Base64.decode(split[2], 0);
            obtain.unmarshall(decode, 0, decode.length);
            obtain.setDataPosition(0);
            return new zzgd(AdRequestParcel.CREATOR.createFromParcel(obtain), str2, parseInt);
        } finally {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zznv() {
        Parcel obtain = Parcel.obtain();
        try {
            try {
                String encodeToString = Base64.encodeToString(this.zzant.getBytes("UTF-8"), 0);
                String num = Integer.toString(this.zzbsq);
                this.zzapj.writeToParcel(obtain, 0);
                String encodeToString2 = Base64.encodeToString(obtain.marshall(), 0);
                String sb = new StringBuilder(String.valueOf(encodeToString).length() + 2 + String.valueOf(num).length() + String.valueOf(encodeToString2).length()).append(encodeToString).append("\u0000").append(num).append("\u0000").append(encodeToString2).toString();
                obtain.recycle();
                return sb;
            } catch (UnsupportedEncodingException e) {
                zzkx.e("QueueSeed encode failed because UTF-8 is not available.");
                obtain.recycle();
                return "";
            }
        } catch (Throwable th) {
            obtain.recycle();
            throw th;
        }
    }
}
