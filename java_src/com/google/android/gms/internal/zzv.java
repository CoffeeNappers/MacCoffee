package com.google.android.gms.internal;

import android.os.SystemClock;
import com.google.android.gms.internal.zzb;
import java.io.BufferedInputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzv implements com.google.android.gms.internal.zzb {
    private final Map<String, zza> zzbw;
    private long zzbx;
    private final File zzby;
    private final int zzbz;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zza {
        public String zza;
        public long zzb;
        public long zzc;
        public long zzca;
        public String zzcb;
        public long zzd;
        public long zze;
        public Map<String, String> zzf;

        private zza() {
        }

        public zza(String str, zzb.zza zzaVar) {
            this.zzcb = str;
            this.zzca = zzaVar.data.length;
            this.zza = zzaVar.zza;
            this.zzb = zzaVar.zzb;
            this.zzc = zzaVar.zzc;
            this.zzd = zzaVar.zzd;
            this.zze = zzaVar.zze;
            this.zzf = zzaVar.zzf;
        }

        public static zza zzf(InputStream inputStream) throws IOException {
            zza zzaVar = new zza();
            if (zzv.zzb(inputStream) != 538247942) {
                throw new IOException();
            }
            zzaVar.zzcb = zzv.zzd(inputStream);
            zzaVar.zza = zzv.zzd(inputStream);
            if (zzaVar.zza.equals("")) {
                zzaVar.zza = null;
            }
            zzaVar.zzb = zzv.zzc(inputStream);
            zzaVar.zzc = zzv.zzc(inputStream);
            zzaVar.zzd = zzv.zzc(inputStream);
            zzaVar.zze = zzv.zzc(inputStream);
            zzaVar.zzf = zzv.zze(inputStream);
            return zzaVar;
        }

        public boolean zza(OutputStream outputStream) {
            try {
                zzv.zza(outputStream, 538247942);
                zzv.zza(outputStream, this.zzcb);
                zzv.zza(outputStream, this.zza == null ? "" : this.zza);
                zzv.zza(outputStream, this.zzb);
                zzv.zza(outputStream, this.zzc);
                zzv.zza(outputStream, this.zzd);
                zzv.zza(outputStream, this.zze);
                zzv.zza(this.zzf, outputStream);
                outputStream.flush();
                return true;
            } catch (IOException e) {
                zzs.zzb("%s", e.toString());
                return false;
            }
        }

        public zzb.zza zzb(byte[] bArr) {
            zzb.zza zzaVar = new zzb.zza();
            zzaVar.data = bArr;
            zzaVar.zza = this.zza;
            zzaVar.zzb = this.zzb;
            zzaVar.zzc = this.zzc;
            zzaVar.zzd = this.zzd;
            zzaVar.zze = this.zze;
            zzaVar.zzf = this.zzf;
            return zzaVar;
        }
    }

    /* loaded from: classes2.dex */
    private static class zzb extends FilterInputStream {
        private int zzcc;

        private zzb(InputStream inputStream) {
            super(inputStream);
            this.zzcc = 0;
        }

        @Override // java.io.FilterInputStream, java.io.InputStream
        public int read() throws IOException {
            int read = super.read();
            if (read != -1) {
                this.zzcc++;
            }
            return read;
        }

        @Override // java.io.FilterInputStream, java.io.InputStream
        public int read(byte[] bArr, int i, int i2) throws IOException {
            int read = super.read(bArr, i, i2);
            if (read != -1) {
                this.zzcc += read;
            }
            return read;
        }
    }

    public zzv(File file) {
        this(file, 5242880);
    }

    public zzv(File file, int i) {
        this.zzbw = new LinkedHashMap(16, 0.75f, true);
        this.zzbx = 0L;
        this.zzby = file;
        this.zzbz = i;
    }

    private void removeEntry(String str) {
        zza zzaVar = this.zzbw.get(str);
        if (zzaVar != null) {
            this.zzbx -= zzaVar.zzca;
            this.zzbw.remove(str);
        }
    }

    private static int zza(InputStream inputStream) throws IOException {
        int read = inputStream.read();
        if (read == -1) {
            throw new EOFException();
        }
        return read;
    }

    static void zza(OutputStream outputStream, int i) throws IOException {
        outputStream.write((i >> 0) & 255);
        outputStream.write((i >> 8) & 255);
        outputStream.write((i >> 16) & 255);
        outputStream.write((i >> 24) & 255);
    }

    static void zza(OutputStream outputStream, long j) throws IOException {
        outputStream.write((byte) (j >>> 0));
        outputStream.write((byte) (j >>> 8));
        outputStream.write((byte) (j >>> 16));
        outputStream.write((byte) (j >>> 24));
        outputStream.write((byte) (j >>> 32));
        outputStream.write((byte) (j >>> 40));
        outputStream.write((byte) (j >>> 48));
        outputStream.write((byte) (j >>> 56));
    }

    static void zza(OutputStream outputStream, String str) throws IOException {
        byte[] bytes = str.getBytes("UTF-8");
        zza(outputStream, bytes.length);
        outputStream.write(bytes, 0, bytes.length);
    }

    private void zza(String str, zza zzaVar) {
        if (!this.zzbw.containsKey(str)) {
            this.zzbx += zzaVar.zzca;
        } else {
            this.zzbx = (zzaVar.zzca - this.zzbw.get(str).zzca) + this.zzbx;
        }
        this.zzbw.put(str, zzaVar);
    }

    static void zza(Map<String, String> map, OutputStream outputStream) throws IOException {
        if (map == null) {
            zza(outputStream, 0);
            return;
        }
        zza(outputStream, map.size());
        for (Map.Entry<String, String> entry : map.entrySet()) {
            zza(outputStream, entry.getKey());
            zza(outputStream, entry.getValue());
        }
    }

    private static byte[] zza(InputStream inputStream, int i) throws IOException {
        byte[] bArr = new byte[i];
        int i2 = 0;
        while (i2 < i) {
            int read = inputStream.read(bArr, i2, i - i2);
            if (read == -1) {
                break;
            }
            i2 += read;
        }
        if (i2 != i) {
            throw new IOException(new StringBuilder(50).append("Expected ").append(i).append(" bytes, read ").append(i2).append(" bytes").toString());
        }
        return bArr;
    }

    static int zzb(InputStream inputStream) throws IOException {
        return (zza(inputStream) << 0) | 0 | (zza(inputStream) << 8) | (zza(inputStream) << 16) | (zza(inputStream) << 24);
    }

    static long zzc(InputStream inputStream) throws IOException {
        return 0 | ((zza(inputStream) & 255) << 0) | ((zza(inputStream) & 255) << 8) | ((zza(inputStream) & 255) << 16) | ((zza(inputStream) & 255) << 24) | ((zza(inputStream) & 255) << 32) | ((zza(inputStream) & 255) << 40) | ((zza(inputStream) & 255) << 48) | ((zza(inputStream) & 255) << 56);
    }

    private void zzc(int i) {
        int i2;
        if (this.zzbx + i < this.zzbz) {
            return;
        }
        if (zzs.DEBUG) {
            zzs.zza("Pruning old cache entries.", new Object[0]);
        }
        long j = this.zzbx;
        long elapsedRealtime = SystemClock.elapsedRealtime();
        Iterator<Map.Entry<String, zza>> it = this.zzbw.entrySet().iterator();
        int i3 = 0;
        while (true) {
            if (!it.hasNext()) {
                i2 = i3;
                break;
            }
            zza value = it.next().getValue();
            if (zzf(value.zzcb).delete()) {
                this.zzbx -= value.zzca;
            } else {
                zzs.zzb("Could not delete cache entry for key=%s, filename=%s", value.zzcb, zze(value.zzcb));
            }
            it.remove();
            i2 = i3 + 1;
            if (((float) (this.zzbx + i)) < this.zzbz * 0.9f) {
                break;
            }
            i3 = i2;
        }
        if (!zzs.DEBUG) {
            return;
        }
        zzs.zza("pruned %d files, %d bytes, %d ms", Integer.valueOf(i2), Long.valueOf(this.zzbx - j), Long.valueOf(SystemClock.elapsedRealtime() - elapsedRealtime));
    }

    static String zzd(InputStream inputStream) throws IOException {
        return new String(zza(inputStream, (int) zzc(inputStream)), "UTF-8");
    }

    private String zze(String str) {
        int length = str.length() / 2;
        String valueOf = String.valueOf(String.valueOf(str.substring(0, length).hashCode()));
        String valueOf2 = String.valueOf(String.valueOf(str.substring(length).hashCode()));
        return valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
    }

    static Map<String, String> zze(InputStream inputStream) throws IOException {
        int zzb2 = zzb(inputStream);
        Map<String, String> emptyMap = zzb2 == 0 ? Collections.emptyMap() : new HashMap<>(zzb2);
        for (int i = 0; i < zzb2; i++) {
            emptyMap.put(zzd(inputStream).intern(), zzd(inputStream).intern());
        }
        return emptyMap;
    }

    @Override // com.google.android.gms.internal.zzb
    public synchronized void initialize() {
        BufferedInputStream bufferedInputStream;
        if (this.zzby.exists()) {
            File[] listFiles = this.zzby.listFiles();
            if (listFiles != null) {
                for (File file : listFiles) {
                    BufferedInputStream bufferedInputStream2 = null;
                    try {
                        bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
                        try {
                            try {
                                zza zzf = zza.zzf(bufferedInputStream);
                                zzf.zzca = file.length();
                                zza(zzf.zzcb, zzf);
                                if (bufferedInputStream != null) {
                                    try {
                                        bufferedInputStream.close();
                                    } catch (IOException e) {
                                    }
                                }
                            } catch (IOException e2) {
                                if (file != null) {
                                    file.delete();
                                }
                                if (bufferedInputStream != null) {
                                    try {
                                        bufferedInputStream.close();
                                    } catch (IOException e3) {
                                    }
                                }
                            }
                        } catch (Throwable th) {
                            bufferedInputStream2 = bufferedInputStream;
                            th = th;
                            if (bufferedInputStream2 != null) {
                                try {
                                    bufferedInputStream2.close();
                                } catch (IOException e4) {
                                }
                            }
                            throw th;
                        }
                    } catch (IOException e5) {
                        bufferedInputStream = null;
                    } catch (Throwable th2) {
                        th = th2;
                    }
                }
            }
        } else if (!this.zzby.mkdirs()) {
            zzs.zzc("Unable to create cache dir %s", this.zzby.getAbsolutePath());
        }
    }

    public synchronized void remove(String str) {
        boolean delete = zzf(str).delete();
        removeEntry(str);
        if (!delete) {
            zzs.zzb("Could not delete cache entry for key=%s, filename=%s", str, zze(str));
        }
    }

    @Override // com.google.android.gms.internal.zzb
    public synchronized zzb.zza zza(String str) {
        zzb zzbVar;
        zzb.zza zzaVar;
        File zzf;
        zza zzaVar2 = this.zzbw.get(str);
        if (zzaVar2 == null) {
            zzaVar = null;
        } else {
            try {
                zzf = zzf(str);
            } catch (Throwable th) {
                th = th;
            }
            try {
                zzbVar = new zzb(new FileInputStream(zzf));
                try {
                    zza.zzf(zzbVar);
                    zzaVar = zzaVar2.zzb(zza(zzbVar, (int) (zzf.length() - zzbVar.zzcc)));
                    if (zzbVar != null) {
                        try {
                            zzbVar.close();
                        } catch (IOException e) {
                            zzaVar = null;
                        }
                    }
                } catch (IOException e2) {
                    e = e2;
                    zzs.zzb("%s: %s", zzf.getAbsolutePath(), e.toString());
                    remove(str);
                    if (zzbVar != null) {
                        try {
                            zzbVar.close();
                        } catch (IOException e3) {
                            zzaVar = null;
                        }
                    }
                    zzaVar = null;
                    return zzaVar;
                }
            } catch (IOException e4) {
                e = e4;
                zzbVar = null;
            } catch (Throwable th2) {
                th = th2;
                zzbVar = null;
                if (zzbVar != null) {
                    try {
                        zzbVar.close();
                    } catch (IOException e5) {
                        zzaVar = null;
                    }
                }
                throw th;
            }
        }
        return zzaVar;
    }

    @Override // com.google.android.gms.internal.zzb
    public synchronized void zza(String str, zzb.zza zzaVar) {
        FileOutputStream fileOutputStream;
        zza zzaVar2;
        zzc(zzaVar.data.length);
        File zzf = zzf(str);
        try {
            fileOutputStream = new FileOutputStream(zzf);
            zzaVar2 = new zza(str, zzaVar);
        } catch (IOException e) {
            if (!zzf.delete()) {
                zzs.zzb("Could not clean up file %s", zzf.getAbsolutePath());
            }
        }
        if (!zzaVar2.zza(fileOutputStream)) {
            fileOutputStream.close();
            zzs.zzb("Failed to write header for %s", zzf.getAbsolutePath());
            throw new IOException();
        }
        fileOutputStream.write(zzaVar.data);
        fileOutputStream.close();
        zza(str, zzaVar2);
    }

    public File zzf(String str) {
        return new File(this.zzby, zze(str));
    }
}
