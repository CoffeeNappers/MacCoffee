package com.google.android.gms.internal;

import android.content.ContentResolver;
import android.content.Context;
import android.util.Log;
import com.google.android.gms.clearcut.zza;
import com.vk.media.camera.CameraUtilsEffects;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
/* loaded from: classes2.dex */
public class zzqh implements zza.zzb {
    private static final Charset UTF_8 = Charset.forName("UTF-8");
    static Boolean wH = null;
    final zza wI;

    /* loaded from: classes2.dex */
    static class zza {
        final ContentResolver mContentResolver;

        zza(Context context) {
            if (context == null || !zzbj(context)) {
                this.mContentResolver = null;
                return;
            }
            this.mContentResolver = context.getContentResolver();
            zzagp.zzb(this.mContentResolver, "gms:playlog:service:sampling_");
        }

        private static boolean zzbj(Context context) {
            if (zzqh.wH == null) {
                zzqh.wH = Boolean.valueOf(context.checkCallingOrSelfPermission("com.google.android.providers.gsf.permission.READ_GSERVICES") == 0);
            }
            return zzqh.wH.booleanValue();
        }

        long zzaqj() {
            if (this.mContentResolver == null) {
                return 0L;
            }
            return zzagp.getLong(this.mContentResolver, "android_id", 0L);
        }

        String zzhf(String str) {
            if (this.mContentResolver == null) {
                return null;
            }
            ContentResolver contentResolver = this.mContentResolver;
            String valueOf = String.valueOf("gms:playlog:service:sampling_");
            String valueOf2 = String.valueOf(str);
            return zzagp.zza(contentResolver, valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf), (String) null);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zzb {
        public final String wJ;
        public final long wK;
        public final long wL;

        public zzb(String str, long j, long j2) {
            this.wJ = str;
            this.wK = j;
            this.wL = j2;
        }

        public boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof zzb)) {
                return false;
            }
            zzb zzbVar = (zzb) obj;
            return com.google.android.gms.common.internal.zzz.equal(this.wJ, zzbVar.wJ) && com.google.android.gms.common.internal.zzz.equal(Long.valueOf(this.wK), Long.valueOf(zzbVar.wK)) && com.google.android.gms.common.internal.zzz.equal(Long.valueOf(this.wL), Long.valueOf(zzbVar.wL));
        }

        public int hashCode() {
            return com.google.android.gms.common.internal.zzz.hashCode(this.wJ, Long.valueOf(this.wK), Long.valueOf(this.wL));
        }
    }

    public zzqh() {
        this(new zza(null));
    }

    public zzqh(Context context) {
        this(new zza(context));
    }

    zzqh(zza zzaVar) {
        this.wI = (zza) com.google.android.gms.common.internal.zzaa.zzy(zzaVar);
    }

    static boolean zza(long j, long j2, long j3) {
        if (j2 < 0 || j3 < 0) {
            throw new IllegalArgumentException(new StringBuilder(72).append("negative values not supported: ").append(j2).append(CameraUtilsEffects.FILE_DELIM).append(j3).toString());
        }
        return j3 > 0 && zzqi.zzd(j, j3) < j2;
    }

    static long zzai(long j) {
        return zzqe.zzn(ByteBuffer.allocate(8).putLong(j).array());
    }

    static long zzd(String str, long j) {
        if (str == null || str.isEmpty()) {
            return zzai(j);
        }
        byte[] bytes = str.getBytes(UTF_8);
        ByteBuffer allocate = ByteBuffer.allocate(bytes.length + 8);
        allocate.put(bytes);
        allocate.putLong(j);
        return zzqe.zzn(allocate.array());
    }

    static zzb zzhe(String str) {
        int i = 0;
        if (str == null) {
            return null;
        }
        String str2 = "";
        int indexOf = str.indexOf(44);
        if (indexOf >= 0) {
            str2 = str.substring(0, indexOf);
            i = indexOf + 1;
        }
        int indexOf2 = str.indexOf(47, i);
        if (indexOf2 <= 0) {
            String valueOf = String.valueOf(str);
            Log.e("LogSamplerImpl", valueOf.length() != 0 ? "Failed to parse the rule: ".concat(valueOf) : new String("Failed to parse the rule: "));
            return null;
        }
        try {
            long parseLong = Long.parseLong(str.substring(i, indexOf2));
            long parseLong2 = Long.parseLong(str.substring(indexOf2 + 1));
            if (parseLong >= 0 && parseLong2 >= 0) {
                return new zzb(str2, parseLong, parseLong2);
            }
            Log.e("LogSamplerImpl", new StringBuilder(72).append("negative values not supported: ").append(parseLong).append(CameraUtilsEffects.FILE_DELIM).append(parseLong2).toString());
            return null;
        } catch (NumberFormatException e) {
            String valueOf2 = String.valueOf(str);
            Log.e("LogSamplerImpl", valueOf2.length() != 0 ? "parseLong() failed while parsing: ".concat(valueOf2) : new String("parseLong() failed while parsing: "), e);
            return null;
        }
    }

    @Override // com.google.android.gms.clearcut.zza.zzb
    public boolean zzh(String str, int i) {
        if (str == null || str.isEmpty()) {
            str = i >= 0 ? String.valueOf(i) : null;
        }
        if (str == null) {
            return true;
        }
        long zzaqj = this.wI.zzaqj();
        zzb zzhe = zzhe(this.wI.zzhf(str));
        if (zzhe == null) {
            return true;
        }
        return zza(zzd(zzhe.wJ, zzaqj), zzhe.wK, zzhe.wL);
    }
}
