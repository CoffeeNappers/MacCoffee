package com.google.android.gms.common.util;

import android.os.Process;
import android.os.StrictMode;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
/* loaded from: classes2.dex */
public class zzt {
    private static String GE = null;
    private static final int GF = Process.myPid();

    public static String zzayz() {
        if (GE == null) {
            GE = zzhi(GF);
        }
        return GE;
    }

    static String zzhi(int i) {
        BufferedReader bufferedReader;
        Throwable th;
        String str = null;
        if (i > 0) {
            try {
                StrictMode.ThreadPolicy allowThreadDiskReads = StrictMode.allowThreadDiskReads();
                bufferedReader = new BufferedReader(new FileReader(new StringBuilder(25).append("/proc/").append(i).append("/cmdline").toString()));
                try {
                    StrictMode.setThreadPolicy(allowThreadDiskReads);
                    str = bufferedReader.readLine().trim();
                    zzo.zzb(bufferedReader);
                } catch (IOException e) {
                    zzo.zzb(bufferedReader);
                    return str;
                } catch (Throwable th2) {
                    th = th2;
                    zzo.zzb(bufferedReader);
                    throw th;
                }
            } catch (IOException e2) {
                bufferedReader = null;
            } catch (Throwable th3) {
                bufferedReader = null;
                th = th3;
            }
        }
        return str;
    }
}
