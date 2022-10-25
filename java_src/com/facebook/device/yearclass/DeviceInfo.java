package com.facebook.device.yearclass;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.content.Context;
import android.os.Build;
import android.support.v4.media.session.PlaybackStateCompat;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
/* loaded from: classes.dex */
public class DeviceInfo {
    private static final FileFilter CPU_FILTER = new FileFilter() { // from class: com.facebook.device.yearclass.DeviceInfo.1
        @Override // java.io.FileFilter
        public boolean accept(File pathname) {
            String path = pathname.getName();
            if (path.startsWith("cpu")) {
                for (int i = 3; i < path.length(); i++) {
                    if (!Character.isDigit(path.charAt(i))) {
                        return false;
                    }
                }
                return true;
            }
            return false;
        }
    };
    public static final int DEVICEINFO_UNKNOWN = -1;

    public static int getNumberOfCPUCores() {
        if (Build.VERSION.SDK_INT <= 10) {
            return 1;
        }
        try {
            int cores = getCoresFromFileInfo("/sys/devices/system/cpu/possible");
            if (cores == -1) {
                cores = getCoresFromFileInfo("/sys/devices/system/cpu/present");
            }
            if (cores == -1) {
                return getCoresFromCPUFileList();
            }
            return cores;
        } catch (NullPointerException e) {
            return -1;
        } catch (SecurityException e2) {
            return -1;
        }
    }

    private static int getCoresFromFileInfo(String fileLocation) {
        try {
            InputStream is = new FileInputStream(fileLocation);
            BufferedReader buf = new BufferedReader(new InputStreamReader(is));
            String fileContents = buf.readLine();
            buf.close();
            return getCoresFromFileString(fileContents);
        } catch (IOException e) {
            return -1;
        }
    }

    static int getCoresFromFileString(String str) {
        if (str == null || !str.matches("0-[\\d]+$")) {
            return -1;
        }
        return Integer.valueOf(str.substring(2)).intValue() + 1;
    }

    private static int getCoresFromCPUFileList() {
        return new File("/sys/devices/system/cpu/").listFiles(CPU_FILTER).length;
    }

    public static int getCPUMaxFreqKHz() {
        int maxFreq = -1;
        for (int i = 0; i < getNumberOfCPUCores(); i++) {
            try {
                String filename = "/sys/devices/system/cpu/cpu" + i + "/cpufreq/cpuinfo_max_freq";
                File cpuInfoMaxFreqFile = new File(filename);
                if (cpuInfoMaxFreqFile.exists()) {
                    byte[] buffer = new byte[128];
                    FileInputStream stream = new FileInputStream(cpuInfoMaxFreqFile);
                    try {
                        stream.read(buffer);
                        int endIndex = 0;
                        while (Character.isDigit(buffer[endIndex]) && endIndex < buffer.length) {
                            endIndex++;
                        }
                        String str = new String(buffer, 0, endIndex);
                        Integer freqBound = Integer.valueOf(Integer.parseInt(str));
                        if (freqBound.intValue() > maxFreq) {
                            maxFreq = freqBound.intValue();
                        }
                        stream.close();
                    } catch (NumberFormatException e) {
                        stream.close();
                    } catch (Throwable th) {
                        stream.close();
                        throw th;
                    }
                }
            } catch (IOException e2) {
                return -1;
            }
        }
        if (maxFreq == -1) {
            FileInputStream stream2 = new FileInputStream("/proc/cpuinfo");
            int freqBound2 = parseFileForValue("cpu MHz", stream2) * 1000;
            if (freqBound2 > maxFreq) {
                maxFreq = freqBound2;
            }
            stream2.close();
            return maxFreq;
        }
        return maxFreq;
    }

    @TargetApi(16)
    public static long getTotalMemory(Context c) {
        if (Build.VERSION.SDK_INT >= 16) {
            ActivityManager.MemoryInfo memInfo = new ActivityManager.MemoryInfo();
            ActivityManager am = (ActivityManager) c.getSystemService("activity");
            am.getMemoryInfo(memInfo);
            if (memInfo != null) {
                return memInfo.totalMem;
            }
            return -1L;
        }
        long totalMem = -1;
        try {
            FileInputStream stream = new FileInputStream("/proc/meminfo");
            long totalMem2 = parseFileForValue("MemTotal", stream);
            totalMem = totalMem2 * PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID;
            stream.close();
            return totalMem;
        } catch (IOException e) {
            return totalMem;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x0026, code lost:
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int parseFileForValue(java.lang.String r8, java.io.FileInputStream r9) {
        /*
            r7 = 10
            r5 = 1024(0x400, float:1.435E-42)
            byte[] r0 = new byte[r5]
            int r3 = r9.read(r0)     // Catch: java.lang.NumberFormatException -> L39 java.io.IOException -> L3c
            r1 = 0
        Lb:
            if (r1 >= r3) goto L3a
            r5 = r0[r1]     // Catch: java.lang.NumberFormatException -> L39 java.io.IOException -> L3c
            if (r5 == r7) goto L13
            if (r1 != 0) goto L26
        L13:
            r5 = r0[r1]     // Catch: java.lang.NumberFormatException -> L39 java.io.IOException -> L3c
            if (r5 != r7) goto L19
            int r1 = r1 + 1
        L19:
            r2 = r1
        L1a:
            if (r2 >= r3) goto L26
            int r4 = r2 - r1
            r5 = r0[r2]     // Catch: java.lang.NumberFormatException -> L39 java.io.IOException -> L3c
            char r6 = r8.charAt(r4)     // Catch: java.lang.NumberFormatException -> L39 java.io.IOException -> L3c
            if (r5 == r6) goto L29
        L26:
            int r1 = r1 + 1
            goto Lb
        L29:
            int r5 = r8.length()     // Catch: java.lang.NumberFormatException -> L39 java.io.IOException -> L3c
            int r5 = r5 + (-1)
            if (r4 != r5) goto L36
            int r5 = extractValue(r0, r2)     // Catch: java.lang.NumberFormatException -> L39 java.io.IOException -> L3c
        L35:
            return r5
        L36:
            int r2 = r2 + 1
            goto L1a
        L39:
            r5 = move-exception
        L3a:
            r5 = -1
            goto L35
        L3c:
            r5 = move-exception
            goto L3a
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.device.yearclass.DeviceInfo.parseFileForValue(java.lang.String, java.io.FileInputStream):int");
    }

    private static int extractValue(byte[] buffer, int index) {
        while (index < buffer.length && buffer[index] != 10) {
            if (Character.isDigit(buffer[index])) {
                int start = index;
                while (true) {
                    index++;
                    if (index >= buffer.length || !Character.isDigit(buffer[index])) {
                        break;
                    }
                }
                String str = new String(buffer, 0, start, index - start);
                return Integer.parseInt(str);
            }
            index++;
        }
        return -1;
    }
}
