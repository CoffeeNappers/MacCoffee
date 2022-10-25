package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzcn extends zzdh {
    private static final String ID = com.google.android.gms.internal.zzag.REGEX.toString();
    private static final String aGx = com.google.android.gms.internal.zzah.IGNORE_CASE.toString();

    public zzcn() {
        super(ID);
    }

    @Override // com.google.android.gms.tagmanager.zzdh
    protected boolean zza(String str, String str2, Map<String, zzaj.zza> map) {
        try {
            return Pattern.compile(str2, zzdm.zzk(map.get(aGx)).booleanValue() ? 66 : 64).matcher(str).find();
        } catch (PatternSyntaxException e) {
            return false;
        }
    }
}
