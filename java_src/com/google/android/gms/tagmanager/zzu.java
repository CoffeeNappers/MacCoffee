package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.util.HashMap;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzu extends zzam {
    private final zza aEE;
    private static final String ID = com.google.android.gms.internal.zzag.FUNCTION_CALL.toString();
    private static final String aED = com.google.android.gms.internal.zzah.FUNCTION_CALL_NAME.toString();
    private static final String aDR = com.google.android.gms.internal.zzah.ADDITIONAL_PARAMS.toString();

    /* loaded from: classes2.dex */
    public interface zza {
        Object zzf(String str, Map<String, Object> map);
    }

    public zzu(zza zzaVar) {
        super(ID, aED);
        this.aEE = zzaVar;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        String zzg = zzdm.zzg(map.get(aED));
        HashMap hashMap = new HashMap();
        zzaj.zza zzaVar = map.get(aDR);
        if (zzaVar != null) {
            Object zzl = zzdm.zzl(zzaVar);
            if (!(zzl instanceof Map)) {
                zzbo.zzdi("FunctionCallMacro: expected ADDITIONAL_PARAMS to be a map.");
                return zzdm.zzchm();
            }
            for (Map.Entry entry : ((Map) zzl).entrySet()) {
                hashMap.put(entry.getKey().toString(), entry.getValue());
            }
        }
        try {
            return zzdm.zzat(this.aEE.zzf(zzg, hashMap));
        } catch (Exception e) {
            String valueOf = String.valueOf(e.getMessage());
            zzbo.zzdi(new StringBuilder(String.valueOf(zzg).length() + 34 + String.valueOf(valueOf).length()).append("Custom macro/tag ").append(zzg).append(" threw exception ").append(valueOf).toString());
            return zzdm.zzchm();
        }
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return false;
    }
}
