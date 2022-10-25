package com.google.android.gms.internal;

import android.content.Context;
import android.os.Build;
import com.facebook.appevents.AppEventsConstants;
import java.util.LinkedHashMap;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzds {
    private Context mContext;
    private String zzasx;
    private boolean zzblg = zzdr.zzbeq.get().booleanValue();
    private String zzblh = zzdr.zzber.get();
    private Map<String, String> zzbli = new LinkedHashMap();

    public zzds(Context context, String str) {
        this.mContext = null;
        this.zzasx = null;
        this.mContext = context;
        this.zzasx = str;
        this.zzbli.put("s", "gmob_sdk");
        this.zzbli.put("v", "3");
        this.zzbli.put("os", Build.VERSION.RELEASE);
        this.zzbli.put("sdk", Build.VERSION.SDK);
        this.zzbli.put("device", com.google.android.gms.ads.internal.zzu.zzgm().zzvt());
        this.zzbli.put("app", context.getApplicationContext() != null ? context.getApplicationContext().getPackageName() : context.getPackageName());
        this.zzbli.put("is_lite_sdk", com.google.android.gms.ads.internal.zzu.zzgm().zzaj(context) ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        zzjr zzv = com.google.android.gms.ads.internal.zzu.zzgv().zzv(this.mContext);
        this.zzbli.put("network_coarse", Integer.toString(zzv.zzcqe));
        this.zzbli.put("network_fine", Integer.toString(zzv.zzcqf));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Context getContext() {
        return this.mContext;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzhz() {
        return this.zzasx;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzls() {
        return this.zzblg;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzlt() {
        return this.zzblh;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Map<String, String> zzlu() {
        return this.zzbli;
    }
}
