package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import com.google.android.exoplayer2.extractor.ts.TsExtractor;
import com.vkontakte.android.data.UserNotification;
/* loaded from: classes.dex */
public class zzap extends zzd {
    protected boolean aK;
    protected String bN;
    protected String bO;
    protected int ee;
    protected boolean fX;
    protected boolean fY;
    protected int fg;

    public zzap(zzf zzfVar) {
        super(zzfVar);
    }

    private static int zzfo(String str) {
        String lowerCase = str.toLowerCase();
        if ("verbose".equals(lowerCase)) {
            return 0;
        }
        if (UserNotification.LAYOUT_NEWSFEED_INFO.equals(lowerCase)) {
            return 1;
        }
        if ("warning".equals(lowerCase)) {
            return 2;
        }
        return "error".equals(lowerCase) ? 3 : -1;
    }

    public int getLogLevel() {
        zzacj();
        return this.ee;
    }

    void zza(zzaa zzaaVar) {
        int zzfo;
        zzes("Loading global XML config values");
        if (zzaaVar.zzafq()) {
            String zzaae = zzaaVar.zzaae();
            this.bN = zzaae;
            zzb("XML config - app name", zzaae);
        }
        if (zzaaVar.zzafr()) {
            String zzaaf = zzaaVar.zzaaf();
            this.bO = zzaaf;
            zzb("XML config - app version", zzaaf);
        }
        if (zzaaVar.zzafs() && (zzfo = zzfo(zzaaVar.zzaft())) >= 0) {
            this.ee = zzfo;
            zza("XML config - log level", Integer.valueOf(zzfo));
        }
        if (zzaaVar.zzafu()) {
            int zzafv = zzaaVar.zzafv();
            this.fg = zzafv;
            this.fX = true;
            zzb("XML config - dispatch period (sec)", Integer.valueOf(zzafv));
        }
        if (zzaaVar.zzafw()) {
            boolean zzafx = zzaaVar.zzafx();
            this.aK = zzafx;
            this.fY = true;
            zzb("XML config - dry run", Boolean.valueOf(zzafx));
        }
    }

    public String zzaae() {
        zzacj();
        return this.bN;
    }

    public String zzaaf() {
        zzacj();
        return this.bO;
    }

    public boolean zzafs() {
        zzacj();
        return false;
    }

    public boolean zzafu() {
        zzacj();
        return this.fX;
    }

    public boolean zzafw() {
        zzacj();
        return this.fY;
    }

    public boolean zzafx() {
        zzacj();
        return this.aK;
    }

    public int zzahl() {
        zzacj();
        return this.fg;
    }

    protected void zzahm() {
        ApplicationInfo applicationInfo;
        int i;
        zzaa zzcg;
        Context context = getContext();
        try {
            applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), TsExtractor.TS_STREAM_TYPE_AC3);
        } catch (PackageManager.NameNotFoundException e) {
            zzd("PackageManager doesn't know about the app package", e);
            applicationInfo = null;
        }
        if (applicationInfo == null) {
            zzev("Couldn't get ApplicationInfo to load global config");
            return;
        }
        Bundle bundle = applicationInfo.metaData;
        if (bundle == null || (i = bundle.getInt("com.google.android.gms.analytics.globalConfigResource")) <= 0 || (zzcg = new zzz(zzabx()).zzcg(i)) == null) {
            return;
        }
        zza(zzcg);
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
        zzahm();
    }
}
