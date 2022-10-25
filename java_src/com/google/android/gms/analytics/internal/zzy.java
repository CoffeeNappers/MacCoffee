package com.google.android.gms.analytics.internal;

import com.google.android.gms.internal.zzsi;
import com.vkontakte.android.TimeUtils;
/* loaded from: classes2.dex */
public final class zzy {
    public static zza<Boolean> el = zza.zzf("analytics.service_enabled", false);
    public static zza<Boolean> em = zza.zzf("analytics.service_client_enabled", true);
    public static zza<String> en = zza.zzd("analytics.log_tag", "GAv4", "GAv4-SVC");
    public static zza<Long> eo = zza.zzb("analytics.max_tokens", 60);
    public static zza<Float> ep = zza.zza("analytics.tokens_per_sec", 0.5f);
    public static zza<Integer> eq = zza.zza("analytics.max_stored_hits", 2000, 20000);
    public static zza<Integer> er = zza.zze("analytics.max_stored_hits_per_app", 2000);
    public static zza<Integer> es = zza.zze("analytics.max_stored_properties_per_app", 100);
    public static zza<Long> et = zza.zza("analytics.local_dispatch_millis", 1800000L, 120000L);
    public static zza<Long> eu = zza.zza("analytics.initial_local_dispatch_millis", 5000L, 5000L);
    public static zza<Long> ev = zza.zzb("analytics.min_local_dispatch_millis", 120000);
    public static zza<Long> ew = zza.zzb("analytics.max_local_dispatch_millis", 7200000);
    public static zza<Long> ex = zza.zzb("analytics.dispatch_alarm_millis", 7200000);
    public static zza<Long> ey = zza.zzb("analytics.max_dispatch_alarm_millis", 32400000);
    public static zza<Integer> ez = zza.zze("analytics.max_hits_per_dispatch", 20);
    public static zza<Integer> eA = zza.zze("analytics.max_hits_per_batch", 20);
    public static zza<String> eB = zza.zzq("analytics.insecure_host", "http://www.google-analytics.com");
    public static zza<String> eC = zza.zzq("analytics.secure_host", "https://ssl.google-analytics.com");
    public static zza<String> eD = zza.zzq("analytics.simple_endpoint", "/collect");
    public static zza<String> eE = zza.zzq("analytics.batching_endpoint", "/batch");
    public static zza<Integer> eF = zza.zze("analytics.max_get_length", 2036);
    public static zza<String> eG = zza.zzd("analytics.batching_strategy.k", zzm.BATCH_BY_COUNT.name(), zzm.BATCH_BY_COUNT.name());
    public static zza<String> eH = zza.zzq("analytics.compression_strategy.k", zzo.GZIP.name());
    public static zza<Integer> eI = zza.zze("analytics.max_hits_per_request.k", 20);
    public static zza<Integer> eJ = zza.zze("analytics.max_hit_length.k", 8192);
    public static zza<Integer> eK = zza.zze("analytics.max_post_length.k", 8192);
    public static zza<Integer> eL = zza.zze("analytics.max_batch_post_length", 8192);
    public static zza<String> eM = zza.zzq("analytics.fallback_responses.k", "404,502");
    public static zza<Integer> eN = zza.zze("analytics.batch_retry_interval.seconds.k", 3600);
    public static zza<Long> eO = zza.zzb("analytics.service_monitor_interval", TimeUtils.DAY);
    public static zza<Integer> eP = zza.zze("analytics.http_connection.connect_timeout_millis", 60000);
    public static zza<Integer> eQ = zza.zze("analytics.http_connection.read_timeout_millis", 61000);
    public static zza<Long> eR = zza.zzb("analytics.campaigns.time_limit", TimeUtils.DAY);
    public static zza<String> eS = zza.zzq("analytics.first_party_experiment_id", "");
    public static zza<Integer> eT = zza.zze("analytics.first_party_experiment_variant", 0);
    public static zza<Boolean> eU = zza.zzf("analytics.test.disable_receiver", false);
    public static zza<Long> eV = zza.zza("analytics.service_client.idle_disconnect_millis", 10000L, 10000L);
    public static zza<Long> eW = zza.zzb("analytics.service_client.connect_timeout_millis", 5000);
    public static zza<Long> eX = zza.zzb("analytics.service_client.second_connect_delay_millis", 5000);
    public static zza<Long> eY = zza.zzb("analytics.service_client.unexpected_reconnect_millis", 60000);
    public static zza<Long> eZ = zza.zzb("analytics.service_client.reconnect_throttle_millis", 1800000);
    public static zza<Long> fa = zza.zzb("analytics.monitoring.sample_period_millis", TimeUtils.DAY);
    public static zza<Long> fb = zza.zzb("analytics.initialization_warning_threshold", 5000);

    /* loaded from: classes2.dex */
    public static final class zza<V> {
        private final V fc;
        private final zzsi<V> fd;

        private zza(zzsi<V> zzsiVar, V v) {
            com.google.android.gms.common.internal.zzaa.zzy(zzsiVar);
            this.fd = zzsiVar;
            this.fc = v;
        }

        static zza<Float> zza(String str, float f) {
            return zza(str, f, f);
        }

        static zza<Float> zza(String str, float f, float f2) {
            return new zza<>(zzsi.zza(str, Float.valueOf(f2)), Float.valueOf(f));
        }

        static zza<Integer> zza(String str, int i, int i2) {
            return new zza<>(zzsi.zza(str, Integer.valueOf(i2)), Integer.valueOf(i));
        }

        static zza<Long> zza(String str, long j, long j2) {
            return new zza<>(zzsi.zza(str, Long.valueOf(j2)), Long.valueOf(j));
        }

        static zza<Boolean> zza(String str, boolean z, boolean z2) {
            return new zza<>(zzsi.zzk(str, z2), Boolean.valueOf(z));
        }

        static zza<Long> zzb(String str, long j) {
            return zza(str, j, j);
        }

        static zza<String> zzd(String str, String str2, String str3) {
            return new zza<>(zzsi.zzaa(str, str3), str2);
        }

        static zza<Integer> zze(String str, int i) {
            return zza(str, i, i);
        }

        static zza<Boolean> zzf(String str, boolean z) {
            return zza(str, z, z);
        }

        static zza<String> zzq(String str, String str2) {
            return zzd(str, str2, str2);
        }

        public V get() {
            return this.fc;
        }
    }
}
