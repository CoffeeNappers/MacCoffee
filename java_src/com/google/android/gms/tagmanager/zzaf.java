package com.google.android.gms.tagmanager;

import android.util.Base64;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzaf extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.ENCODE.toString();
    private static final String aFk = com.google.android.gms.internal.zzah.ARG0.toString();
    private static final String aFl = com.google.android.gms.internal.zzah.NO_PADDING.toString();
    private static final String aFm = com.google.android.gms.internal.zzah.INPUT_FORMAT.toString();
    private static final String aFn = com.google.android.gms.internal.zzah.OUTPUT_FORMAT.toString();

    public zzaf() {
        super(ID, aFk);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        byte[] decode;
        String encodeToString;
        zzaj.zza zzaVar = map.get(aFk);
        if (zzaVar == null || zzaVar == zzdm.zzchm()) {
            return zzdm.zzchm();
        }
        String zzg = zzdm.zzg(zzaVar);
        zzaj.zza zzaVar2 = map.get(aFm);
        String zzg2 = zzaVar2 == null ? "text" : zzdm.zzg(zzaVar2);
        zzaj.zza zzaVar3 = map.get(aFn);
        String zzg3 = zzaVar3 == null ? "base16" : zzdm.zzg(zzaVar3);
        zzaj.zza zzaVar4 = map.get(aFl);
        int i = (zzaVar4 == null || !zzdm.zzk(zzaVar4).booleanValue()) ? 2 : 3;
        try {
            if ("text".equals(zzg2)) {
                decode = zzg.getBytes();
            } else if ("base16".equals(zzg2)) {
                decode = zzk.zzos(zzg);
            } else if ("base64".equals(zzg2)) {
                decode = Base64.decode(zzg, i);
            } else if (!"base64url".equals(zzg2)) {
                String valueOf = String.valueOf(zzg2);
                zzbo.e(valueOf.length() != 0 ? "Encode: unknown input format: ".concat(valueOf) : new String("Encode: unknown input format: "));
                return zzdm.zzchm();
            } else {
                decode = Base64.decode(zzg, i | 8);
            }
            if ("base16".equals(zzg3)) {
                encodeToString = zzk.zzq(decode);
            } else if ("base64".equals(zzg3)) {
                encodeToString = Base64.encodeToString(decode, i);
            } else if (!"base64url".equals(zzg3)) {
                String valueOf2 = String.valueOf(zzg3);
                zzbo.e(valueOf2.length() != 0 ? "Encode: unknown output format: ".concat(valueOf2) : new String("Encode: unknown output format: "));
                return zzdm.zzchm();
            } else {
                encodeToString = Base64.encodeToString(decode, i | 8);
            }
            return zzdm.zzat(encodeToString);
        } catch (IllegalArgumentException e) {
            zzbo.e("Encode: invalid input:");
            return zzdm.zzchm();
        }
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
