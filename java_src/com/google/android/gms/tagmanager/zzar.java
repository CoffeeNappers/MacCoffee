package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzar extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.HASH.toString();
    private static final String aFk = com.google.android.gms.internal.zzah.ARG0.toString();
    private static final String aFq = com.google.android.gms.internal.zzah.ALGORITHM.toString();
    private static final String aFm = com.google.android.gms.internal.zzah.INPUT_FORMAT.toString();

    public zzar() {
        super(ID, aFk);
    }

    private byte[] zzf(String str, byte[] bArr) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance(str);
        messageDigest.update(bArr);
        return messageDigest.digest();
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        byte[] zzos;
        zzaj.zza zzaVar = map.get(aFk);
        if (zzaVar == null || zzaVar == zzdm.zzchm()) {
            return zzdm.zzchm();
        }
        String zzg = zzdm.zzg(zzaVar);
        zzaj.zza zzaVar2 = map.get(aFq);
        String zzg2 = zzaVar2 == null ? CommonUtils.MD5_INSTANCE : zzdm.zzg(zzaVar2);
        zzaj.zza zzaVar3 = map.get(aFm);
        String zzg3 = zzaVar3 == null ? "text" : zzdm.zzg(zzaVar3);
        if ("text".equals(zzg3)) {
            zzos = zzg.getBytes();
        } else if (!"base16".equals(zzg3)) {
            String valueOf = String.valueOf(zzg3);
            zzbo.e(valueOf.length() != 0 ? "Hash: unknown input format: ".concat(valueOf) : new String("Hash: unknown input format: "));
            return zzdm.zzchm();
        } else {
            zzos = zzk.zzos(zzg);
        }
        try {
            return zzdm.zzat(zzk.zzq(zzf(zzg2, zzos)));
        } catch (NoSuchAlgorithmException e) {
            String valueOf2 = String.valueOf(zzg2);
            zzbo.e(valueOf2.length() != 0 ? "Hash: unknown algorithm: ".concat(valueOf2) : new String("Hash: unknown algorithm: "));
            return zzdm.zzchm();
        }
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
