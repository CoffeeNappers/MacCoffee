package com.my.target.core.models.banners;

import android.support.annotation.Nullable;
import com.my.target.ads.instream.InstreamAudioAd;
import com.my.target.ads.instream.models.InstreamAdCompanionBanner;
import java.util.ArrayList;
import java.util.List;
/* compiled from: AudioBanner.java */
/* loaded from: classes2.dex */
public class c extends a implements InstreamAudioAd.InstreamAudioAdBanner {
    private float a;
    private float b;
    private float c;
    private boolean d;
    private boolean e;
    private boolean f;
    private String g;
    @Nullable
    private com.my.target.core.models.e h;
    @Nullable
    private ArrayList<e> i;

    @Nullable
    public final com.my.target.core.models.e a() {
        return this.h;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdBanner
    @Nullable
    public List<InstreamAdCompanionBanner> getInstreamAdCompanionBanners() {
        if (this.i != null) {
            return this.i;
        }
        return null;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdBanner
    public float getDuration() {
        return this.a;
    }

    public final float b() {
        return this.b;
    }

    public final float c() {
        return this.c;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdBanner
    public String getAdText() {
        return this.g;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdBanner
    public boolean isAllowSeek() {
        return this.d;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdBanner
    public boolean isAllowSkip() {
        return this.e;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdBanner
    public boolean isAllowTrackChange() {
        return this.f;
    }

    public final void a(String str) {
        this.g = str;
    }

    public final void a(boolean z) {
        this.d = z;
    }

    public final void b(boolean z) {
        this.e = z;
    }

    public final void c(boolean z) {
        this.f = z;
    }

    public final void a(@Nullable com.my.target.core.models.e eVar) {
        this.h = eVar;
    }

    public final void a(@Nullable ArrayList<e> arrayList) {
        this.i = arrayList;
    }

    public final void a(float f) {
        this.a = f;
    }

    public final void b(float f) {
        this.b = f;
    }

    public final void c(float f) {
        this.c = f;
    }

    public c(String str, String str2) {
        super(str, str2);
        this.d = true;
        this.e = false;
        this.f = true;
    }

    public final void b(ArrayList<e> arrayList) {
        if (this.i != null) {
            this.i.addAll(arrayList);
        } else {
            this.i = arrayList;
        }
    }

    @Override // com.my.target.core.models.banners.a
    public synchronized boolean addStat(com.my.target.core.models.k kVar) {
        boolean addStat;
        if (kVar.c().equals("playheadReachedValue")) {
            com.my.target.core.models.i iVar = (com.my.target.core.models.i) kVar;
            if (iVar.b() != 0.0f) {
                iVar.a((iVar.b() * this.a) / 100.0f);
            }
            addStat = super.addStat(iVar);
        } else {
            addStat = super.addStat(kVar);
        }
        return addStat;
    }
}
