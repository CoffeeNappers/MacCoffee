package com.google.android.gms.ads.internal.formats;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.View;
import com.google.android.gms.ads.internal.client.zzab;
import com.google.android.gms.ads.internal.formats.zzi;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzek;
import com.google.android.gms.internal.zzji;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzd extends zzek.zza implements zzi.zza {
    private Bundle mExtras;
    private Object zzako = new Object();
    private String zzbmy;
    private List<zzc> zzbmz;
    private String zzbna;
    private zzeg zzbnb;
    private String zzbnc;
    private double zzbnd;
    private String zzbne;
    private String zzbnf;
    @Nullable
    private zza zzbng;
    @Nullable
    private zzab zzbnh;
    @Nullable
    private View zzbni;
    private zzi zzbnj;

    public zzd(String str, List list, String str2, zzeg zzegVar, String str3, double d, String str4, String str5, @Nullable zza zzaVar, Bundle bundle, zzab zzabVar, View view) {
        this.zzbmy = str;
        this.zzbmz = list;
        this.zzbna = str2;
        this.zzbnb = zzegVar;
        this.zzbnc = str3;
        this.zzbnd = d;
        this.zzbne = str4;
        this.zzbnf = str5;
        this.zzbng = zzaVar;
        this.mExtras = bundle;
        this.zzbnh = zzabVar;
        this.zzbni = view;
    }

    @Override // com.google.android.gms.internal.zzek
    public void destroy() {
        this.zzbmy = null;
        this.zzbmz = null;
        this.zzbna = null;
        this.zzbnb = null;
        this.zzbnc = null;
        this.zzbnd = 0.0d;
        this.zzbne = null;
        this.zzbnf = null;
        this.zzbng = null;
        this.mExtras = null;
        this.zzako = null;
        this.zzbnj = null;
        this.zzbnh = null;
        this.zzbni = null;
    }

    @Override // com.google.android.gms.internal.zzek
    public String getBody() {
        return this.zzbna;
    }

    @Override // com.google.android.gms.internal.zzek
    public String getCallToAction() {
        return this.zzbnc;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public String getCustomTemplateId() {
        return "";
    }

    @Override // com.google.android.gms.internal.zzek
    public Bundle getExtras() {
        return this.mExtras;
    }

    @Override // com.google.android.gms.internal.zzek
    public String getHeadline() {
        return this.zzbmy;
    }

    @Override // com.google.android.gms.internal.zzek
    public List getImages() {
        return this.zzbmz;
    }

    @Override // com.google.android.gms.internal.zzek
    public String getPrice() {
        return this.zzbnf;
    }

    @Override // com.google.android.gms.internal.zzek
    public double getStarRating() {
        return this.zzbnd;
    }

    @Override // com.google.android.gms.internal.zzek
    public String getStore() {
        return this.zzbne;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public void zzb(zzi zziVar) {
        synchronized (this.zzako) {
            this.zzbnj = zziVar;
        }
    }

    @Override // com.google.android.gms.internal.zzek
    public zzab zzej() {
        return this.zzbnh;
    }

    @Override // com.google.android.gms.internal.zzek
    public zzeg zzmo() {
        return this.zzbnb;
    }

    @Override // com.google.android.gms.internal.zzek
    public com.google.android.gms.dynamic.zzd zzmp() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzbnj);
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public String zzmq() {
        return "2";
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public zza zzmr() {
        return this.zzbng;
    }

    public View zzms() {
        return this.zzbni;
    }
}
