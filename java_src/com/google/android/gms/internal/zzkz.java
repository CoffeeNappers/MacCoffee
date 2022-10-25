package com.google.android.gms.internal;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import java.util.concurrent.Future;
@zzji
/* loaded from: classes.dex */
public final class zzkz {

    /* loaded from: classes2.dex */
    private static abstract class zza extends zzkw {
        private zza() {
        }

        @Override // com.google.android.gms.internal.zzkw
        public void onStop() {
        }
    }

    /* loaded from: classes2.dex */
    public interface zzb {
        void zzh(Bundle bundle);
    }

    public static Future zza(final Context context, final int i) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.9
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences.Editor edit = zzkz.zzm(context).edit();
                edit.putInt("request_in_session_count", i);
                edit.apply();
            }
        }.zzrz();
    }

    public static Future zza(final Context context, final long j) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.7
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences.Editor edit = zzkz.zzm(context).edit();
                edit.putLong("app_last_background_time_ms", j);
                edit.apply();
            }
        }.zzrz();
    }

    public static Future zza(final Context context, final zzb zzbVar) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.10
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences zzm = zzkz.zzm(context);
                Bundle bundle = new Bundle();
                bundle.putBoolean("use_https", zzm.getBoolean("use_https", true));
                if (zzbVar != null) {
                    zzbVar.zzh(bundle);
                }
            }
        }.zzrz();
    }

    public static Future zza(final Context context, final String str, final long j) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.5
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences.Editor edit = zzkz.zzm(context).edit();
                edit.putString("app_settings_json", str);
                edit.putLong("app_settings_last_update_ms", j);
                edit.apply();
            }
        }.zzrz();
    }

    public static Future zzb(final Context context, final zzb zzbVar) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.11
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences zzm = zzkz.zzm(context);
                Bundle bundle = new Bundle();
                bundle.putInt("webview_cache_version", zzm.getInt("webview_cache_version", 0));
                if (zzbVar != null) {
                    zzbVar.zzh(bundle);
                }
            }
        }.zzrz();
    }

    public static Future zzc(final Context context, final zzb zzbVar) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.13
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences zzm = zzkz.zzm(context);
                Bundle bundle = new Bundle();
                bundle.putBoolean("content_url_opted_out", zzm.getBoolean("content_url_opted_out", true));
                if (zzbVar != null) {
                    zzbVar.zzh(bundle);
                }
            }
        }.zzrz();
    }

    public static Future zzc(final Context context, final boolean z) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences.Editor edit = zzkz.zzm(context).edit();
                edit.putBoolean("use_https", z);
                edit.apply();
            }
        }.zzrz();
    }

    public static Future zzd(final Context context, final zzb zzbVar) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.15
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences zzm = zzkz.zzm(context);
                Bundle bundle = new Bundle();
                bundle.putString("content_url_hashes", zzm.getString("content_url_hashes", ""));
                if (zzbVar != null) {
                    zzbVar.zzh(bundle);
                }
            }
        }.zzrz();
    }

    public static Future zze(final Context context, final zzb zzbVar) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences zzm = zzkz.zzm(context);
                Bundle bundle = new Bundle();
                bundle.putBoolean("auto_collect_location", zzm.getBoolean("auto_collect_location", false));
                if (zzbVar != null) {
                    zzbVar.zzh(bundle);
                }
            }
        }.zzrz();
    }

    public static Future zze(final Context context, final boolean z) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.12
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences.Editor edit = zzkz.zzm(context).edit();
                edit.putBoolean("content_url_opted_out", z);
                edit.apply();
            }
        }.zzrz();
    }

    public static Future zzf(final Context context, final zzb zzbVar) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.6
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences zzm = zzkz.zzm(context);
                Bundle bundle = new Bundle();
                bundle.putString("app_settings_json", zzm.getString("app_settings_json", ""));
                bundle.putLong("app_settings_last_update_ms", zzm.getLong("app_settings_last_update_ms", 0L));
                if (zzbVar != null) {
                    zzbVar.zzh(bundle);
                }
            }
        }.zzrz();
    }

    public static Future zzf(final Context context, final String str) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.14
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences.Editor edit = zzkz.zzm(context).edit();
                edit.putString("content_url_hashes", str);
                edit.apply();
            }
        }.zzrz();
    }

    public static Future zzf(final Context context, final boolean z) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences.Editor edit = zzkz.zzm(context).edit();
                edit.putBoolean("auto_collect_location", z);
                edit.apply();
            }
        }.zzrz();
    }

    public static Future zzg(final Context context, final zzb zzbVar) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.8
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences zzm = zzkz.zzm(context);
                Bundle bundle = new Bundle();
                bundle.putLong("app_last_background_time_ms", zzm.getLong("app_last_background_time_ms", 0L));
                if (zzbVar != null) {
                    zzbVar.zzh(bundle);
                }
            }
        }.zzrz();
    }

    public static Future zzg(final Context context, final String str) {
        return (Future) new zza() { // from class: com.google.android.gms.internal.zzkz.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.internal.zzkw
            public void zzfp() {
                SharedPreferences.Editor edit = zzkz.zzm(context).edit();
                edit.putString("content_vertical_hashes", str);
                edit.apply();
            }
        }.zzrz();
    }

    public static SharedPreferences zzm(Context context) {
        return context.getSharedPreferences("admob", 0);
    }
}
