package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public class zzbj extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.LANGUAGE.toString();

    public zzbj() {
        super(ID, new String[0]);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        String language;
        Locale locale = Locale.getDefault();
        if (locale != null && (language = locale.getLanguage()) != null) {
            return zzdm.zzat(language.toLowerCase());
        }
        return zzdm.zzchm();
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return false;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public /* bridge */ /* synthetic */ String zzcfg() {
        return super.zzcfg();
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public /* bridge */ /* synthetic */ Set zzcfh() {
        return super.zzcfh();
    }
}
