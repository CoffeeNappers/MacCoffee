package com.google.android.gms.internal;

import com.vk.media.camera.CameraUtilsEffects;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class zzaiv {
    public static String zzas(List<String> list) {
        if (list.isEmpty()) {
            return CameraUtilsEffects.FILE_DELIM;
        }
        StringBuilder sb = new StringBuilder();
        boolean z = true;
        for (String str : list) {
            if (!z) {
                sb.append(CameraUtilsEffects.FILE_DELIM);
            }
            z = false;
            sb.append(str);
        }
        return sb.toString();
    }

    public static Long zzbq(Object obj) {
        if (obj instanceof Integer) {
            return Long.valueOf(((Integer) obj).intValue());
        }
        if (!(obj instanceof Long)) {
            return null;
        }
        return (Long) obj;
    }

    public static void zzc(boolean z, String str, Object... objArr) {
        if (!z) {
            String valueOf = String.valueOf(String.format(str, objArr));
            throw new AssertionError(valueOf.length() != 0 ? "hardAssert failed: ".concat(valueOf) : new String("hardAssert failed: "));
        }
    }

    public static void zzcx(boolean z) {
        zzc(z, "", new Object[0]);
    }

    public static List<String> zzsj(String str) {
        ArrayList arrayList = new ArrayList();
        String[] split = str.split(CameraUtilsEffects.FILE_DELIM);
        for (int i = 0; i < split.length; i++) {
            if (!split[i].isEmpty()) {
                arrayList.add(split[i]);
            }
        }
        return arrayList;
    }
}
