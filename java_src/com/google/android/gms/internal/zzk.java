package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzm;
import com.google.android.gms.internal.zzs;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class zzk<T> implements Comparable<zzk<T>> {
    private final zzs.zza zzac;
    private final int zzad;
    private final String zzae;
    private final int zzaf;
    private final zzm.zza zzag;
    private Integer zzah;
    private zzl zzai;
    private boolean zzaj;
    private boolean zzak;
    private boolean zzal;
    private long zzam;
    private zzo zzan;
    private zzb.zza zzao;

    /* loaded from: classes2.dex */
    public enum zza {
        LOW,
        NORMAL,
        HIGH,
        IMMEDIATE
    }

    public zzk(int i, String str, zzm.zza zzaVar) {
        this.zzac = zzs.zza.zzbj ? new zzs.zza() : null;
        this.zzaj = true;
        this.zzak = false;
        this.zzal = false;
        this.zzam = 0L;
        this.zzao = null;
        this.zzad = i;
        this.zzae = str;
        this.zzag = zzaVar;
        zza((zzo) new zzd());
        this.zzaf = zzb(str);
    }

    private byte[] zza(Map<String, String> map, String str) {
        StringBuilder sb = new StringBuilder();
        try {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                sb.append(URLEncoder.encode(entry.getKey(), str));
                sb.append('=');
                sb.append(URLEncoder.encode(entry.getValue(), str));
                sb.append('&');
            }
            return sb.toString().getBytes(str);
        } catch (UnsupportedEncodingException e) {
            String valueOf = String.valueOf(str);
            throw new RuntimeException(valueOf.length() != 0 ? "Encoding not supported: ".concat(valueOf) : new String("Encoding not supported: "), e);
        }
    }

    private static int zzb(String str) {
        Uri parse;
        String host;
        if (TextUtils.isEmpty(str) || (parse = Uri.parse(str)) == null || (host = parse.getHost()) == null) {
            return 0;
        }
        return host.hashCode();
    }

    public Map<String, String> getHeaders() throws com.google.android.gms.internal.zza {
        return Collections.emptyMap();
    }

    public int getMethod() {
        return this.zzad;
    }

    public String getUrl() {
        return this.zzae;
    }

    public boolean isCanceled() {
        return false;
    }

    public String toString() {
        String valueOf = String.valueOf(Integer.toHexString(zzf()));
        String concat = valueOf.length() != 0 ? "0x".concat(valueOf) : new String("0x");
        String valueOf2 = String.valueOf(getUrl());
        String valueOf3 = String.valueOf(zzq());
        String valueOf4 = String.valueOf(this.zzah);
        return new StringBuilder(String.valueOf("[ ] ").length() + 3 + String.valueOf(valueOf2).length() + String.valueOf(concat).length() + String.valueOf(valueOf3).length() + String.valueOf(valueOf4).length()).append("[ ] ").append(valueOf2).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(concat).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf3).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf4).toString();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final zzk<?> zza(int i) {
        this.zzah = Integer.valueOf(i);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public zzk<?> zza(zzb.zza zzaVar) {
        this.zzao = zzaVar;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public zzk<?> zza(zzl zzlVar) {
        this.zzai = zzlVar;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public zzk<?> zza(zzo zzoVar) {
        this.zzan = zzoVar;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract zzm<T> zza(zzi zziVar);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract void zza(T t);

    /* JADX INFO: Access modifiers changed from: protected */
    public zzr zzb(zzr zzrVar) {
        return zzrVar;
    }

    @Override // java.lang.Comparable
    /* renamed from: zzc */
    public int compareTo(zzk<T> zzkVar) {
        zza zzq = zzq();
        zza zzq2 = zzkVar.zzq();
        return zzq == zzq2 ? this.zzah.intValue() - zzkVar.zzah.intValue() : zzq2.ordinal() - zzq.ordinal();
    }

    public void zzc(zzr zzrVar) {
        if (this.zzag != null) {
            this.zzag.zze(zzrVar);
        }
    }

    public void zzc(String str) {
        if (zzs.zza.zzbj) {
            this.zzac.zza(str, Thread.currentThread().getId());
        } else if (this.zzam != 0) {
        } else {
            this.zzam = SystemClock.elapsedRealtime();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzd(final String str) {
        if (this.zzai != null) {
            this.zzai.zzf(this);
        }
        if (!zzs.zza.zzbj) {
            long elapsedRealtime = SystemClock.elapsedRealtime() - this.zzam;
            if (elapsedRealtime < 3000) {
                return;
            }
            zzs.zzb("%d ms: %s", Long.valueOf(elapsedRealtime), toString());
            return;
        }
        final long id = Thread.currentThread().getId();
        if (Looper.myLooper() != Looper.getMainLooper()) {
            new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.google.android.gms.internal.zzk.1
                @Override // java.lang.Runnable
                public void run() {
                    zzk.this.zzac.zza(str, id);
                    zzk.this.zzac.zzd(toString());
                }
            });
            return;
        }
        this.zzac.zza(str, id);
        this.zzac.zzd(toString());
    }

    public int zzf() {
        return this.zzaf;
    }

    public String zzg() {
        return getUrl();
    }

    public zzb.zza zzh() {
        return this.zzao;
    }

    @Deprecated
    protected Map<String, String> zzi() throws com.google.android.gms.internal.zza {
        return null;
    }

    @Deprecated
    protected String zzj() {
        return zzm();
    }

    @Deprecated
    public String zzk() {
        return zzn();
    }

    @Deprecated
    public byte[] zzl() throws com.google.android.gms.internal.zza {
        Map<String, String> zzi = zzi();
        if (zzi == null || zzi.size() <= 0) {
            return null;
        }
        return zza(zzi, zzj());
    }

    protected String zzm() {
        return "UTF-8";
    }

    public String zzn() {
        String valueOf = String.valueOf(zzm());
        return valueOf.length() != 0 ? "application/x-www-form-urlencoded; charset=".concat(valueOf) : new String("application/x-www-form-urlencoded; charset=");
    }

    public byte[] zzo() throws com.google.android.gms.internal.zza {
        return null;
    }

    public final boolean zzp() {
        return this.zzaj;
    }

    public zza zzq() {
        return zza.NORMAL;
    }

    public final int zzr() {
        return this.zzan.zzc();
    }

    public zzo zzs() {
        return this.zzan;
    }

    public void zzt() {
        this.zzal = true;
    }

    public boolean zzu() {
        return this.zzal;
    }
}
