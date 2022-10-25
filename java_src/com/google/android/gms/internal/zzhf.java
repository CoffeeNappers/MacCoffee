package com.google.android.gms.internal;

import android.location.Location;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import java.util.Date;
import java.util.Set;
@zzji
/* loaded from: classes.dex */
public final class zzhf implements MediationAdRequest {
    private final int zzazc;
    private final boolean zzazo;
    private final int zzbxg;
    private final Date zzgr;
    private final Set<String> zzgt;
    private final boolean zzgu;
    private final Location zzgv;

    public zzhf(@Nullable Date date, int i, @Nullable Set<String> set, @Nullable Location location, boolean z, int i2, boolean z2) {
        this.zzgr = date;
        this.zzazc = i;
        this.zzgt = set;
        this.zzgv = location;
        this.zzgu = z;
        this.zzbxg = i2;
        this.zzazo = z2;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public Date getBirthday() {
        return this.zzgr;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public int getGender() {
        return this.zzazc;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public Set<String> getKeywords() {
        return this.zzgt;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public Location getLocation() {
        return this.zzgv;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public boolean isDesignedForFamilies() {
        return this.zzazo;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public boolean isTesting() {
        return this.zzgu;
    }

    @Override // com.google.android.gms.ads.mediation.MediationAdRequest
    public int taggedForChildDirectedTreatment() {
        return this.zzbxg;
    }
}
