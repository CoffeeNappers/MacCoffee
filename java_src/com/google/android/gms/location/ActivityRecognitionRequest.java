package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.WorkSource;
import android.support.annotation.Nullable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class ActivityRecognitionRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<ActivityRecognitionRequest> CREATOR = new zza();
    @Nullable
    private int[] ajA;
    @Nullable
    private boolean ajB;
    private final long ajC;
    private long ajx;
    private boolean ajy;
    @Nullable
    private WorkSource ajz;
    @Nullable
    private String hy;
    @Nullable
    private String mTag;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ActivityRecognitionRequest(int i, long j, boolean z, @Nullable WorkSource workSource, @Nullable String str, @Nullable int[] iArr, boolean z2, @Nullable String str2, long j2) {
        this.mVersionCode = i;
        this.ajx = j;
        this.ajy = z;
        this.ajz = workSource;
        this.mTag = str;
        this.ajA = iArr;
        this.ajB = z2;
        this.hy = str2;
        this.ajC = j2;
    }

    @Nullable
    public String getAccountName() {
        return this.hy;
    }

    public long getIntervalMillis() {
        return this.ajx;
    }

    @Nullable
    public String getTag() {
        return this.mTag;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }

    public boolean zzbps() {
        return this.ajy;
    }

    @Nullable
    public WorkSource zzbpt() {
        return this.ajz;
    }

    @Nullable
    public int[] zzbpu() {
        return this.ajA;
    }

    public boolean zzbpv() {
        return this.ajB;
    }

    public long zzbpw() {
        return this.ajC;
    }
}
