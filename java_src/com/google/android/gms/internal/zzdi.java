package com.google.android.gms.internal;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.internal.zzdd;
import java.io.IOException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
@zzji
/* loaded from: classes.dex */
public class zzdi {
    private final int zzaxh;
    private final zzdc zzaxj;
    private String zzaxs;
    private String zzaxt;
    private final boolean zzaxu = false;
    private final int zzaxv;
    private final int zzaxw;

    /* loaded from: classes2.dex */
    public class zza implements Comparator<zzdb> {
        public zza() {
        }

        @Override // java.util.Comparator
        /* renamed from: zza */
        public int compare(zzdb zzdbVar, zzdb zzdbVar2) {
            if (zzdbVar.zzjn() < zzdbVar2.zzjn()) {
                return -1;
            }
            if (zzdbVar.zzjn() > zzdbVar2.zzjn()) {
                return 1;
            }
            if (zzdbVar.zzjm() < zzdbVar2.zzjm()) {
                return -1;
            }
            if (zzdbVar.zzjm() > zzdbVar2.zzjm()) {
                return 1;
            }
            float zzjp = (zzdbVar.zzjp() - zzdbVar.zzjn()) * (zzdbVar.zzjo() - zzdbVar.zzjm());
            float zzjp2 = (zzdbVar2.zzjp() - zzdbVar2.zzjn()) * (zzdbVar2.zzjo() - zzdbVar2.zzjm());
            if (zzjp > zzjp2) {
                return -1;
            }
            return zzjp < zzjp2 ? 1 : 0;
        }
    }

    public zzdi(int i, int i2, int i3) {
        this.zzaxh = i;
        if (i2 > 64 || i2 < 0) {
            this.zzaxv = 64;
        } else {
            this.zzaxv = i2;
        }
        if (i3 < 1) {
            this.zzaxw = 1;
        } else {
            this.zzaxw = i3;
        }
        this.zzaxj = new zzdh(this.zzaxv);
    }

    String zza(String str, char c) {
        StringBuilder sb = new StringBuilder(str);
        boolean z = false;
        int i = 1;
        while (i + 2 <= sb.length()) {
            if (sb.charAt(i) == '\'') {
                if (sb.charAt(i - 1) == c || !((sb.charAt(i + 1) == 's' || sb.charAt(i + 1) == 'S') && (i + 2 == sb.length() || sb.charAt(i + 2) == c))) {
                    sb.setCharAt(i, c);
                } else {
                    sb.insert(i, c);
                    i += 2;
                }
                z = true;
            }
            i++;
        }
        if (z) {
            return sb.toString();
        }
        return null;
    }

    public String zza(ArrayList<String> arrayList, ArrayList<zzdb> arrayList2) {
        Collections.sort(arrayList2, new zza());
        HashSet<String> hashSet = new HashSet<>();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= arrayList2.size() || !zza(Normalizer.normalize(arrayList.get(arrayList2.get(i2).zzjq()), Normalizer.Form.NFKC).toLowerCase(Locale.US), hashSet)) {
                break;
            }
            i = i2 + 1;
        }
        zzdd.zza zzaVar = new zzdd.zza();
        this.zzaxs = "";
        Iterator<String> it = hashSet.iterator();
        while (it.hasNext()) {
            try {
                zzaVar.write(this.zzaxj.zzag(it.next()));
            } catch (IOException e) {
                zzkx.zzb("Error while writing hash to byteStream", e);
            }
        }
        return zzaVar.toString();
    }

    boolean zza(String str, HashSet<String> hashSet) {
        String str2;
        boolean z;
        String[] split = str.split("\n");
        if (split.length == 0) {
            return true;
        }
        for (String str3 : split) {
            if (str3.indexOf("'") == -1 || (str2 = zza(str3, ' ')) == null) {
                str2 = str3;
            } else {
                this.zzaxt = str2;
            }
            String[] zzd = zzde.zzd(str2, true);
            if (zzd.length >= this.zzaxw) {
                for (int i = 0; i < zzd.length; i++) {
                    String str4 = "";
                    int i2 = 0;
                    while (true) {
                        if (i2 >= this.zzaxw) {
                            z = true;
                            break;
                        } else if (i + i2 >= zzd.length) {
                            z = false;
                            break;
                        } else {
                            if (i2 > 0) {
                                str4 = String.valueOf(str4).concat(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                            }
                            String valueOf = String.valueOf(str4);
                            String valueOf2 = String.valueOf(zzd[i + i2]);
                            str4 = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
                            i2++;
                        }
                    }
                    if (!z) {
                        break;
                    }
                    hashSet.add(str4);
                    if (hashSet.size() >= this.zzaxh) {
                        return false;
                    }
                }
                if (hashSet.size() >= this.zzaxh) {
                    return false;
                }
            }
        }
        return true;
    }
}
