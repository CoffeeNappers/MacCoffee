package com.google.android.gms.common.internal;

import java.util.Iterator;
/* loaded from: classes2.dex */
public class zzx {
    private final String separator;

    private zzx(String str) {
        this.separator = str;
    }

    public static zzx zzia(String str) {
        return new zzx(str);
    }

    public final StringBuilder zza(StringBuilder sb, Iterable<?> iterable) {
        Iterator<?> it = iterable.iterator();
        if (it.hasNext()) {
            sb.append(zzw(it.next()));
            while (it.hasNext()) {
                sb.append(this.separator);
                sb.append(zzw(it.next()));
            }
        }
        return sb;
    }

    public final String zzb(Iterable<?> iterable) {
        return zza(new StringBuilder(), iterable).toString();
    }

    CharSequence zzw(Object obj) {
        return obj instanceof CharSequence ? (CharSequence) obj : obj.toString();
    }
}
