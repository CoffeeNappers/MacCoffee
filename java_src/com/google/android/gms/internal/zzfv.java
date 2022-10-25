package com.google.android.gms.internal;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
@zzji
/* loaded from: classes.dex */
public class zzfv extends zzfs {
    private static final Set<String> zzbrn = Collections.synchronizedSet(new HashSet());
    private static final DecimalFormat zzbro = new DecimalFormat("#,###");
    private File zzbrp;
    private boolean zzbrq;

    public zzfv(zzmd zzmdVar) {
        super(zzmdVar);
        File cacheDir = this.mContext.getCacheDir();
        if (cacheDir == null) {
            zzkx.zzdi("Context.getCacheDir() returned null");
            return;
        }
        this.zzbrp = new File(cacheDir, "admobVideoStreams");
        if (!this.zzbrp.isDirectory() && !this.zzbrp.mkdirs()) {
            String valueOf = String.valueOf(this.zzbrp.getAbsolutePath());
            zzkx.zzdi(valueOf.length() != 0 ? "Could not create preload cache directory at ".concat(valueOf) : new String("Could not create preload cache directory at "));
            this.zzbrp = null;
        } else if (this.zzbrp.setReadable(true, false) && this.zzbrp.setExecutable(true, false)) {
        } else {
            String valueOf2 = String.valueOf(this.zzbrp.getAbsolutePath());
            zzkx.zzdi(valueOf2.length() != 0 ? "Could not set cache file permissions at ".concat(valueOf2) : new String("Could not set cache file permissions at "));
            this.zzbrp = null;
        }
    }

    private File zzb(File file) {
        return new File(this.zzbrp, String.valueOf(file.getName()).concat(".done"));
    }

    private static void zzc(File file) {
        if (file.isFile()) {
            file.setLastModified(System.currentTimeMillis());
            return;
        }
        try {
            file.createNewFile();
        } catch (IOException e) {
        }
    }

    @Override // com.google.android.gms.internal.zzfs
    public void abort() {
        this.zzbrq = true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:131:0x03d9, code lost:
        r11.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x03e1, code lost:
        if (com.google.android.gms.internal.zzkx.zzbi(3) == false) goto L155;
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x03e3, code lost:
        r2 = com.google.android.gms.internal.zzfv.zzbro.format(r5);
        com.google.android.gms.internal.zzkx.zzdg(new java.lang.StringBuilder((java.lang.String.valueOf(r2).length() + 22) + java.lang.String.valueOf(r27).length()).append("Preloaded ").append(r2).append(" bytes from ").append(r27).toString());
     */
    /* JADX WARN: Code restructure failed: missing block: B:134:0x0421, code lost:
        r12.setReadable(true, false);
        zzc(r13);
        zza(r27, r12.getAbsolutePath(), r5);
        com.google.android.gms.internal.zzfv.zzbrn.remove(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:135:0x0439, code lost:
        return true;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v27 */
    /* JADX WARN: Type inference failed for: r3v28, types: [java.lang.String] */
    @Override // com.google.android.gms.internal.zzfs
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean zzbg(java.lang.String r27) {
        /*
            Method dump skipped, instructions count: 1154
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzfv.zzbg(java.lang.String):boolean");
    }

    public int zznj() {
        int i = 0;
        if (this.zzbrp != null) {
            for (File file : this.zzbrp.listFiles()) {
                if (!file.getName().endsWith(".done")) {
                    i++;
                }
            }
        }
        return i;
    }

    public boolean zznk() {
        boolean z;
        long j;
        File file;
        if (this.zzbrp == null) {
            return false;
        }
        File file2 = null;
        long j2 = Long.MAX_VALUE;
        File[] listFiles = this.zzbrp.listFiles();
        int length = listFiles.length;
        int i = 0;
        while (i < length) {
            File file3 = listFiles[i];
            if (!file3.getName().endsWith(".done")) {
                j = file3.lastModified();
                if (j < j2) {
                    file = file3;
                    i++;
                    file2 = file;
                    j2 = j;
                }
            }
            j = j2;
            file = file2;
            i++;
            file2 = file;
            j2 = j;
        }
        if (file2 != null) {
            z = file2.delete();
            File zzb = zzb(file2);
            if (zzb.isFile()) {
                z &= zzb.delete();
            }
        } else {
            z = false;
        }
        return z;
    }
}
