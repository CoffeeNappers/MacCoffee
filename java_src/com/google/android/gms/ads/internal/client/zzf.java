package com.google.android.gms.ads.internal.client;

import android.location.Location;
import android.os.Bundle;
import android.support.annotation.Nullable;
import com.google.android.gms.internal.zzji;
import java.util.ArrayList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public final class zzf {
    private Bundle mExtras;
    private boolean zzamv;
    private long zzazb;
    private int zzazc;
    private List<String> zzazd;
    private boolean zzaze;
    private int zzazf;
    private String zzazg;
    private SearchAdRequestParcel zzazh;
    private String zzazi;
    private Bundle zzazj;
    private Bundle zzazk;
    private List<String> zzazl;
    private String zzazm;
    private String zzazn;
    private boolean zzazo;
    private Location zzgv;

    public zzf() {
        this.zzazb = -1L;
        this.mExtras = new Bundle();
        this.zzazc = -1;
        this.zzazd = new ArrayList();
        this.zzaze = false;
        this.zzazf = -1;
        this.zzamv = false;
        this.zzazg = null;
        this.zzazh = null;
        this.zzgv = null;
        this.zzazi = null;
        this.zzazj = new Bundle();
        this.zzazk = new Bundle();
        this.zzazl = new ArrayList();
        this.zzazm = null;
        this.zzazn = null;
        this.zzazo = false;
    }

    public zzf(AdRequestParcel adRequestParcel) {
        this.zzazb = adRequestParcel.zzayl;
        this.mExtras = adRequestParcel.extras;
        this.zzazc = adRequestParcel.zzaym;
        this.zzazd = adRequestParcel.zzayn;
        this.zzaze = adRequestParcel.zzayo;
        this.zzazf = adRequestParcel.zzayp;
        this.zzamv = adRequestParcel.zzayq;
        this.zzazg = adRequestParcel.zzayr;
        this.zzazh = adRequestParcel.zzays;
        this.zzgv = adRequestParcel.zzayt;
        this.zzazi = adRequestParcel.zzayu;
        this.zzazj = adRequestParcel.zzayv;
        this.zzazk = adRequestParcel.zzayw;
        this.zzazl = adRequestParcel.zzayx;
        this.zzazm = adRequestParcel.zzayy;
        this.zzazn = adRequestParcel.zzayz;
    }

    public zzf zza(@Nullable Location location) {
        this.zzgv = location;
        return this;
    }

    public AdRequestParcel zzka() {
        return new AdRequestParcel(7, this.zzazb, this.mExtras, this.zzazc, this.zzazd, this.zzaze, this.zzazf, this.zzamv, this.zzazg, this.zzazh, this.zzgv, this.zzazi, this.zzazj, this.zzazk, this.zzazl, this.zzazm, this.zzazn, false);
    }
}
