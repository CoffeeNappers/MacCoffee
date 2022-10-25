package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;
/* loaded from: classes2.dex */
class zzcm extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.REGEX_GROUP.toString();
    private static final String aGv = com.google.android.gms.internal.zzah.ARG0.toString();
    private static final String aGw = com.google.android.gms.internal.zzah.ARG1.toString();
    private static final String aGx = com.google.android.gms.internal.zzah.IGNORE_CASE.toString();
    private static final String aGy = com.google.android.gms.internal.zzah.GROUP.toString();

    public zzcm() {
        super(ID, aGv, aGw);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        int i;
        zzaj.zza zzaVar = map.get(aGv);
        zzaj.zza zzaVar2 = map.get(aGw);
        if (zzaVar == null || zzaVar == zzdm.zzchm() || zzaVar2 == null || zzaVar2 == zzdm.zzchm()) {
            return zzdm.zzchm();
        }
        int i2 = 64;
        if (zzdm.zzk(map.get(aGx)).booleanValue()) {
            i2 = 66;
        }
        zzaj.zza zzaVar3 = map.get(aGy);
        if (zzaVar3 != null) {
            Long zzi = zzdm.zzi(zzaVar3);
            if (zzi == zzdm.zzchh()) {
                return zzdm.zzchm();
            }
            i = zzi.intValue();
            if (i < 0) {
                return zzdm.zzchm();
            }
        } else {
            i = 1;
        }
        try {
            String zzg = zzdm.zzg(zzaVar);
            String str = null;
            Matcher matcher = Pattern.compile(zzdm.zzg(zzaVar2), i2).matcher(zzg);
            if (matcher.find() && matcher.groupCount() >= i) {
                str = matcher.group(i);
            }
            return str == null ? zzdm.zzchm() : zzdm.zzat(str);
        } catch (PatternSyntaxException e) {
            return zzdm.zzchm();
        }
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
