package com.my.target.core.utils;

import android.content.Context;
import com.my.target.Tracer;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStreamReader;
/* compiled from: DiskFileCache.java */
/* loaded from: classes2.dex */
public final class d {
    private static d a;
    private static final FilenameFilter c = new FilenameFilter() { // from class: com.my.target.core.utils.d.1
        @Override // java.io.FilenameFilter
        public final boolean accept(File file, String str) {
            return str.startsWith("mytrgsc_");
        }
    };
    private File b;

    private d(File file) {
        this.b = file;
    }

    public static d a(Context context) {
        if (a != null) {
            return a;
        }
        File cacheDir = context.getCacheDir();
        if (cacheDir == null) {
            return null;
        }
        boolean z = cacheDir.exists() || cacheDir.mkdir();
        if (!z) {
            Tracer.i("Can't create cache dir");
            return null;
        }
        File file = new File(cacheDir, "mytargetcache");
        if (!file.exists()) {
            z = file.mkdir();
        }
        if (!z) {
            Tracer.i("Can't create myTarget cache dir");
            return null;
        }
        d dVar = new d(file);
        a = dVar;
        return dVar;
    }

    private synchronized void a(long j) {
        File[] listFiles;
        long currentTimeMillis = System.currentTimeMillis();
        try {
            if (currentTimeMillis - this.b.lastModified() > j) {
                for (File file : this.b.listFiles(c)) {
                    if (file.isFile() && currentTimeMillis - file.lastModified() > j) {
                        Tracer.d("Remove expired cache item: " + file.getPath());
                        file.delete();
                    }
                }
                this.b.setLastModified(currentTimeMillis);
            }
        } catch (Exception e) {
            Tracer.i("FileCache exception: " + e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x009f A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final synchronized boolean a(java.lang.String r8, java.lang.String r9, long r10) {
        /*
            r7 = this;
            r0 = 0
            monitor-enter(r7)
            r7.a(r10)     // Catch: java.lang.Throwable -> La3
            java.io.File r1 = r7.b     // Catch: java.lang.Throwable -> La3
            boolean r1 = r1.isDirectory()     // Catch: java.lang.Throwable -> La3
            if (r1 == 0) goto L15
            java.io.File r1 = r7.b     // Catch: java.lang.Throwable -> La3
            boolean r1 = r1.canWrite()     // Catch: java.lang.Throwable -> La3
            if (r1 != 0) goto L1d
        L15:
            java.lang.String r1 = "Unable to use cache dir"
            com.my.target.Tracer.i(r1)     // Catch: java.lang.Throwable -> La3
        L1b:
            monitor-exit(r7)
            return r0
        L1d:
            r3 = 0
            java.io.File r1 = r7.a(r8)     // Catch: java.lang.Exception -> L7e java.lang.Throwable -> L9b
            java.io.OutputStreamWriter r2 = new java.io.OutputStreamWriter     // Catch: java.lang.Exception -> L7e java.lang.Throwable -> L9b
            java.io.FileOutputStream r4 = new java.io.FileOutputStream     // Catch: java.lang.Exception -> L7e java.lang.Throwable -> L9b
            r4.<init>(r1)     // Catch: java.lang.Exception -> L7e java.lang.Throwable -> L9b
            java.lang.String r5 = "UTF-8"
            java.nio.charset.Charset r5 = java.nio.charset.Charset.forName(r5)     // Catch: java.lang.Exception -> L7e java.lang.Throwable -> L9b
            java.nio.charset.CharsetEncoder r5 = r5.newEncoder()     // Catch: java.lang.Exception -> L7e java.lang.Throwable -> L9b
            r2.<init>(r4, r5)     // Catch: java.lang.Exception -> L7e java.lang.Throwable -> L9b
            r2.write(r9)     // Catch: java.lang.Throwable -> Laa java.lang.Exception -> Lac
            long r4 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> Laa java.lang.Exception -> Lac
            boolean r1 = r1.setLastModified(r4)     // Catch: java.lang.Throwable -> Laa java.lang.Exception -> Lac
            if (r1 != 0) goto L57
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Laa java.lang.Exception -> Lac
            java.lang.String r3 = "NOTE: Cache last modified date is not updated for "
            r1.<init>(r3)     // Catch: java.lang.Throwable -> Laa java.lang.Exception -> Lac
            java.lang.StringBuilder r1 = r1.append(r8)     // Catch: java.lang.Throwable -> Laa java.lang.Exception -> Lac
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> Laa java.lang.Exception -> Lac
            com.my.target.Tracer.d(r1)     // Catch: java.lang.Throwable -> Laa java.lang.Exception -> Lac
        L57:
            r2.close()     // Catch: java.lang.Throwable -> La3 java.io.IOException -> La6
        L5a:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> La3
            java.lang.String r1 = "DiskFileCache: key: "
            r0.<init>(r1)     // Catch: java.lang.Throwable -> La3
            java.lang.StringBuilder r0 = r0.append(r8)     // Catch: java.lang.Throwable -> La3
            java.lang.String r1 = " bytes: "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch: java.lang.Throwable -> La3
            int r1 = r9.length()     // Catch: java.lang.Throwable -> La3
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch: java.lang.Throwable -> La3
            java.lang.String r0 = r0.toString()     // Catch: java.lang.Throwable -> La3
            com.my.target.Tracer.d(r0)     // Catch: java.lang.Throwable -> La3
            r0 = 1
            goto L1b
        L7e:
            r1 = move-exception
            r2 = r3
        L80:
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Laa
            java.lang.String r4 = "FileCache exception: "
            r3.<init>(r4)     // Catch: java.lang.Throwable -> Laa
            java.lang.StringBuilder r1 = r3.append(r1)     // Catch: java.lang.Throwable -> Laa
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> Laa
            com.my.target.Tracer.i(r1)     // Catch: java.lang.Throwable -> Laa
            if (r2 == 0) goto L1b
            r2.close()     // Catch: java.io.IOException -> L99 java.lang.Throwable -> La3
            goto L1b
        L99:
            r1 = move-exception
            goto L1b
        L9b:
            r0 = move-exception
            r2 = r3
        L9d:
            if (r2 == 0) goto La2
            r2.close()     // Catch: java.lang.Throwable -> La3 java.io.IOException -> La8
        La2:
            throw r0     // Catch: java.lang.Throwable -> La3
        La3:
            r0 = move-exception
            monitor-exit(r7)
            throw r0
        La6:
            r0 = move-exception
            goto L5a
        La8:
            r1 = move-exception
            goto La2
        Laa:
            r0 = move-exception
            goto L9d
        Lac:
            r1 = move-exception
            goto L80
        */
        throw new UnsupportedOperationException("Method not decompiled: com.my.target.core.utils.d.a(java.lang.String, java.lang.String, long):boolean");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [java.io.FileInputStream] */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9 */
    public final synchronized String a(String str, long j) {
        FileInputStream fileInputStream;
        String str2 = 0;
        str2 = 0;
        str2 = 0;
        str2 = 0;
        str2 = 0;
        synchronized (this) {
            try {
                a(j);
            } catch (Throwable th) {
                th = th;
            }
            try {
                File a2 = a(str);
                if (a2.exists()) {
                    Tracer.d("Get file from disk cache: " + a2.getPath());
                    fileInputStream = new FileInputStream(a2);
                    try {
                        StringBuilder sb = new StringBuilder();
                        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(fileInputStream, "UTF-8"));
                        char[] cArr = new char[1024];
                        while (true) {
                            int read = bufferedReader.read(cArr);
                            if (read == -1) {
                                break;
                            }
                            sb.append(new String(cArr, 0, read));
                        }
                        if (sb.length() == 0) {
                            Tracer.d("Error: Cache file is empty");
                        } else {
                            str2 = sb.toString();
                        }
                        try {
                            fileInputStream.close();
                        } catch (IOException e) {
                        }
                    } catch (Exception e2) {
                        e = e2;
                        Tracer.i("FileCache exception: " + e);
                        if (fileInputStream != null) {
                            try {
                                fileInputStream.close();
                            } catch (IOException e3) {
                            }
                        }
                        return str2;
                    }
                }
            } catch (Exception e4) {
                e = e4;
                fileInputStream = null;
            } catch (Throwable th2) {
                th = th2;
                if (0 != 0) {
                    try {
                        str2.close();
                    } catch (IOException e5) {
                    }
                }
                throw th;
            }
        }
        return str2;
    }

    private File a(String str) {
        return new File(this.b.getAbsolutePath() + File.separator + ("mytrgsc_" + f.a(str)));
    }
}
