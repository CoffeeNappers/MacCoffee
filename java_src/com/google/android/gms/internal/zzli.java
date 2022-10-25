package com.google.android.gms.internal;

import android.content.Context;
import android.support.annotation.Nullable;
import com.google.android.gms.internal.zzm;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzli {
    private static zzl zzcws;
    private static final Object zzcwt = new Object();
    public static final zza<Void> zzcwu = new zza<Void>() { // from class: com.google.android.gms.internal.zzli.1
        @Override // com.google.android.gms.internal.zzli.zza
        public /* bridge */ /* synthetic */ Void zzh(InputStream inputStream) {
            return null;
        }

        @Override // com.google.android.gms.internal.zzli.zza
        public /* bridge */ /* synthetic */ Void zzsw() {
            return null;
        }
    };

    /* loaded from: classes2.dex */
    public interface zza<T> {
        T zzh(InputStream inputStream);

        T zzsw();
    }

    /* loaded from: classes2.dex */
    private static class zzb<T> extends zzk<InputStream> {
        private final zzm.zzb<T> zzcg;
        private final zza<T> zzcwz;

        public zzb(String str, final zza<T> zzaVar, final zzm.zzb<T> zzbVar) {
            super(0, str, new zzm.zza() { // from class: com.google.android.gms.internal.zzli.zzb.1
                /* JADX WARN: Multi-variable type inference failed */
                @Override // com.google.android.gms.internal.zzm.zza
                public void zze(zzr zzrVar) {
                    zzm.zzb.this.zzb(zzaVar.zzsw());
                }
            });
            this.zzcwz = zzaVar;
            this.zzcg = zzbVar;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzk
        public zzm<InputStream> zza(zzi zziVar) {
            return zzm.zza(new ByteArrayInputStream(zziVar.data), zzx.zzb(zziVar));
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzk
        /* renamed from: zzj */
        public void zza(InputStream inputStream) {
            this.zzcg.zzb(this.zzcwz.zzh(inputStream));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzc<T> extends zzlq<T> implements zzm.zzb<T> {
        private zzc() {
        }

        @Override // com.google.android.gms.internal.zzm.zzb
        public void zzb(@Nullable T t) {
            super.zzh(t);
        }
    }

    public zzli(Context context) {
        zzan(context);
    }

    private static zzl zzan(Context context) {
        zzl zzlVar;
        synchronized (zzcwt) {
            if (zzcws == null) {
                zzcws = zzac.zza(context.getApplicationContext());
            }
            zzlVar = zzcws;
        }
        return zzlVar;
    }

    public zzlt<String> zza(int i, final String str, @Nullable final Map<String, String> map, @Nullable final byte[] bArr) {
        final zzc zzcVar = new zzc();
        zzcws.zze(new zzab(i, str, zzcVar, new zzm.zza() { // from class: com.google.android.gms.internal.zzli.2
            @Override // com.google.android.gms.internal.zzm.zza
            public void zze(zzr zzrVar) {
                String str2 = str;
                String valueOf = String.valueOf(zzrVar.toString());
                zzkx.zzdi(new StringBuilder(String.valueOf(str2).length() + 21 + String.valueOf(valueOf).length()).append("Failed to load URL: ").append(str2).append("\n").append(valueOf).toString());
                zzcVar.zzb(null);
            }
        }) { // from class: com.google.android.gms.internal.zzli.3
            @Override // com.google.android.gms.internal.zzk
            public Map<String, String> getHeaders() throws com.google.android.gms.internal.zza {
                return map == null ? super.getHeaders() : map;
            }

            @Override // com.google.android.gms.internal.zzk
            public byte[] zzo() throws com.google.android.gms.internal.zza {
                return bArr == null ? super.zzo() : bArr;
            }
        });
        return zzcVar;
    }

    public <T> zzlt<T> zza(String str, zza<T> zzaVar) {
        zzc zzcVar = new zzc();
        zzcws.zze(new zzb(str, zzaVar, zzcVar));
        return zzcVar;
    }

    public zzlt<String> zzd(String str, Map<String, String> map) {
        return zza(0, str, map, null);
    }
}
