package com.google.android.gms.ads.internal.cache;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
import java.io.InputStream;
@zzji
/* loaded from: classes.dex */
public class CacheEntryParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<CacheEntryParcel> CREATOR = new zzb();
    public final int version;
    @Nullable
    private ParcelFileDescriptor zzayc;

    public CacheEntryParcel() {
        this(1, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CacheEntryParcel(int i, @Nullable ParcelFileDescriptor parcelFileDescriptor) {
        this.version = i;
        this.zzayc = parcelFileDescriptor;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }

    public synchronized boolean zzju() {
        return this.zzayc != null;
    }

    @Nullable
    public synchronized InputStream zzjv() {
        ParcelFileDescriptor.AutoCloseInputStream autoCloseInputStream = null;
        synchronized (this) {
            if (this.zzayc != null) {
                autoCloseInputStream = new ParcelFileDescriptor.AutoCloseInputStream(this.zzayc);
                this.zzayc = null;
            }
        }
        return autoCloseInputStream;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized ParcelFileDescriptor zzjw() {
        return this.zzayc;
    }
}
