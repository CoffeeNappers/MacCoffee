package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzaj;
import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzbg extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.JOINER.toString();
    private static final String aFk = com.google.android.gms.internal.zzah.ARG0.toString();
    private static final String aFC = com.google.android.gms.internal.zzah.ITEM_SEPARATOR.toString();
    private static final String aFD = com.google.android.gms.internal.zzah.KEY_VALUE_SEPARATOR.toString();
    private static final String aFE = com.google.android.gms.internal.zzah.ESCAPE.toString();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum zza {
        NONE,
        URL,
        BACKSLASH
    }

    public zzbg() {
        super(ID, aFk);
    }

    private String zza(String str, zza zzaVar, Set<Character> set) {
        switch (zzaVar) {
            case URL:
                try {
                    return zzdq.zzqe(str);
                } catch (UnsupportedEncodingException e) {
                    zzbo.zzb("Joiner: unsupported encoding", e);
                    return str;
                }
            case BACKSLASH:
                String replace = str.replace("\\", "\\\\");
                Iterator<Character> it = set.iterator();
                while (true) {
                    String str2 = replace;
                    if (!it.hasNext()) {
                        return str2;
                    }
                    String ch = it.next().toString();
                    String valueOf = String.valueOf(ch);
                    replace = str2.replace(ch, valueOf.length() != 0 ? "\\".concat(valueOf) : new String("\\"));
                }
            default:
                return str;
        }
    }

    private void zza(StringBuilder sb, String str, zza zzaVar, Set<Character> set) {
        sb.append(zza(str, zzaVar, set));
    }

    private void zza(Set<Character> set, String str) {
        for (int i = 0; i < str.length(); i++) {
            set.add(Character.valueOf(str.charAt(i)));
        }
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        HashSet hashSet;
        zza zzaVar;
        zzaj.zza zzaVar2 = map.get(aFk);
        if (zzaVar2 == null) {
            return zzdm.zzchm();
        }
        zzaj.zza zzaVar3 = map.get(aFC);
        String zzg = zzaVar3 != null ? zzdm.zzg(zzaVar3) : "";
        zzaj.zza zzaVar4 = map.get(aFD);
        String zzg2 = zzaVar4 != null ? zzdm.zzg(zzaVar4) : "=";
        zza zzaVar5 = zza.NONE;
        zzaj.zza zzaVar6 = map.get(aFE);
        if (zzaVar6 != null) {
            String zzg3 = zzdm.zzg(zzaVar6);
            if ("url".equals(zzg3)) {
                zzaVar = zza.URL;
                hashSet = null;
            } else if (!"backslash".equals(zzg3)) {
                String valueOf = String.valueOf(zzg3);
                zzbo.e(valueOf.length() != 0 ? "Joiner: unsupported escape type: ".concat(valueOf) : new String("Joiner: unsupported escape type: "));
                return zzdm.zzchm();
            } else {
                zzaVar = zza.BACKSLASH;
                hashSet = new HashSet();
                zza(hashSet, zzg);
                zza(hashSet, zzg2);
                hashSet.remove('\\');
            }
        } else {
            hashSet = null;
            zzaVar = zzaVar5;
        }
        StringBuilder sb = new StringBuilder();
        switch (zzaVar2.type) {
            case 2:
                boolean z = true;
                zzaj.zza[] zzaVarArr = zzaVar2.zzxy;
                int length = zzaVarArr.length;
                int i = 0;
                while (i < length) {
                    zzaj.zza zzaVar7 = zzaVarArr[i];
                    if (!z) {
                        sb.append(zzg);
                    }
                    zza(sb, zzdm.zzg(zzaVar7), zzaVar, hashSet);
                    i++;
                    z = false;
                }
                break;
            case 3:
                for (int i2 = 0; i2 < zzaVar2.zzxz.length; i2++) {
                    if (i2 > 0) {
                        sb.append(zzg);
                    }
                    String zzg4 = zzdm.zzg(zzaVar2.zzxz[i2]);
                    String zzg5 = zzdm.zzg(zzaVar2.zzya[i2]);
                    zza(sb, zzg4, zzaVar, hashSet);
                    sb.append(zzg2);
                    zza(sb, zzg5, zzaVar, hashSet);
                }
                break;
            default:
                zza(sb, zzdm.zzg(zzaVar2), zzaVar, hashSet);
                break;
        }
        return zzdm.zzat(sb.toString());
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
