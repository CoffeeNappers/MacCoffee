package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public abstract class zzdw {
    @zzji
    public static final zzdw zzblq = new zzdw() { // from class: com.google.android.gms.internal.zzdw.1
        @Override // com.google.android.gms.internal.zzdw
        public String zzf(@Nullable String str, String str2) {
            return str2;
        }
    };
    @zzji
    public static final zzdw zzblr = new zzdw() { // from class: com.google.android.gms.internal.zzdw.2
        @Override // com.google.android.gms.internal.zzdw
        public String zzf(@Nullable String str, String str2) {
            return str != null ? str : str2;
        }
    };
    @zzji
    public static final zzdw zzbls = new zzdw() { // from class: com.google.android.gms.internal.zzdw.3
        @Nullable
        private String zzay(@Nullable String str) {
            if (TextUtils.isEmpty(str)) {
                return str;
            }
            int i = 0;
            int length = str.length();
            while (i < str.length() && str.charAt(i) == ',') {
                i++;
            }
            while (length > 0 && str.charAt(length - 1) == ',') {
                length--;
            }
            return (i == 0 && length == str.length()) ? str : str.substring(i, length);
        }

        @Override // com.google.android.gms.internal.zzdw
        public String zzf(@Nullable String str, String str2) {
            String zzay = zzay(str);
            String zzay2 = zzay(str2);
            return TextUtils.isEmpty(zzay) ? zzay2 : TextUtils.isEmpty(zzay2) ? zzay : new StringBuilder(String.valueOf(zzay).length() + 1 + String.valueOf(zzay2).length()).append(zzay).append(",").append(zzay2).toString();
        }
    };

    public final void zza(Map<String, String> map, String str, String str2) {
        map.put(str, zzf(map.get(str), str2));
    }

    public abstract String zzf(@Nullable String str, String str2);
}
