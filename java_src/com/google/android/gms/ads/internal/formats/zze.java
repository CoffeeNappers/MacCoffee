package com.google.android.gms.ads.internal.formats;

import android.os.Bundle;
import android.support.annotation.Nullable;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.ads.internal.formats.zzi;
import com.google.android.gms.internal.zzeg;
import com.google.android.gms.internal.zzem;
import com.google.android.gms.internal.zzji;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zze extends zzem.zza implements zzi.zza {
    private Bundle mExtras;
    private Object zzako = new Object();
    private String zzbmy;
    private List<zzc> zzbmz;
    private String zzbna;
    private String zzbnc;
    @Nullable
    private zza zzbng;
    private zzi zzbnj;
    private zzeg zzbnk;
    private String zzbnl;

    public zze(String str, List list, String str2, zzeg zzegVar, String str3, String str4, @Nullable zza zzaVar, Bundle bundle) {
        this.zzbmy = str;
        this.zzbmz = list;
        this.zzbna = str2;
        this.zzbnk = zzegVar;
        this.zzbnc = str3;
        this.zzbnl = str4;
        this.zzbng = zzaVar;
        this.mExtras = bundle;
    }

    @Override // com.google.android.gms.internal.zzem
    public void destroy() {
        this.zzbmy = null;
        this.zzbmz = null;
        this.zzbna = null;
        this.zzbnk = null;
        this.zzbnc = null;
        this.zzbnl = null;
        this.zzbng = null;
        this.mExtras = null;
        this.zzako = null;
        this.zzbnj = null;
    }

    @Override // com.google.android.gms.internal.zzem
    public String getAdvertiser() {
        return this.zzbnl;
    }

    @Override // com.google.android.gms.internal.zzem
    public String getBody() {
        return this.zzbna;
    }

    @Override // com.google.android.gms.internal.zzem
    public String getCallToAction() {
        return this.zzbnc;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public String getCustomTemplateId() {
        return "";
    }

    @Override // com.google.android.gms.internal.zzem
    public Bundle getExtras() {
        return this.mExtras;
    }

    @Override // com.google.android.gms.internal.zzem
    public String getHeadline() {
        return this.zzbmy;
    }

    @Override // com.google.android.gms.internal.zzem
    public List getImages() {
        return this.zzbmz;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public void zzb(zzi zziVar) {
        synchronized (this.zzako) {
            this.zzbnj = zziVar;
        }
    }

    @Override // com.google.android.gms.internal.zzem
    public com.google.android.gms.dynamic.zzd zzmp() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzbnj);
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public String zzmq() {
        return AppEventsConstants.EVENT_PARAM_VALUE_YES;
    }

    @Override // com.google.android.gms.ads.internal.formats.zzi.zza
    public zza zzmr() {
        return this.zzbng;
    }

    @Override // com.google.android.gms.internal.zzem
    public zzeg zzmt() {
        return this.zzbnk;
    }
}
