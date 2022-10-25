package com.google.android.gms.analytics.internal;

import android.os.Build;
import java.io.File;
/* loaded from: classes2.dex */
public class zzx {
    public static int version() {
        try {
            return Integer.parseInt(Build.VERSION.SDK);
        } catch (NumberFormatException e) {
            zzae.zzf("Invalid version number", Build.VERSION.SDK);
            return 0;
        }
    }

    public static boolean zzfd(String str) {
        if (version() < 9) {
            return false;
        }
        File file = new File(str);
        file.setReadable(false, false);
        file.setWritable(false, false);
        file.setReadable(true, true);
        file.setWritable(true, true);
        return true;
    }
}
