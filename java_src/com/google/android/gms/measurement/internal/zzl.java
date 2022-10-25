package com.google.android.gms.measurement.internal;

import com.facebook.common.util.UriUtil;
import com.google.android.exoplayer2.extractor.ogg.DefaultOggSeeker;
import com.google.android.gms.internal.zzsi;
import com.vk.stories.StoriesProcessor;
import com.vkontakte.android.TimeUtils;
/* loaded from: classes2.dex */
public final class zzl {
    public static zza<Boolean> arM = zza.zzm("measurement.service_enabled", true);
    public static zza<Boolean> arN = zza.zzm("measurement.service_client_enabled", true);
    public static zza<Boolean> arO = zza.zzm("measurement.log_installs_enabled", false);
    public static zza<String> arP = zza.zzk("measurement.log_tag", "FA", "FA-SVC");
    public static zza<Long> arQ = zza.zzf("measurement.ad_id_cache_time", 10000);
    public static zza<Long> arR = zza.zzf("measurement.monitoring.sample_period_millis", TimeUtils.DAY);
    public static zza<Long> arS = zza.zzb("measurement.config.cache_time", (long) TimeUtils.DAY, (long) TimeUtils.HOUR);
    public static zza<String> arT = zza.zzav("measurement.config.url_scheme", UriUtil.HTTPS_SCHEME);
    public static zza<String> arU = zza.zzav("measurement.config.url_authority", "app-measurement.com");
    public static zza<Integer> arV = zza.zzab("measurement.upload.max_bundles", 100);
    public static zza<Integer> arW = zza.zzab("measurement.upload.max_batch_size", 65536);
    public static zza<Integer> arX = zza.zzab("measurement.upload.max_bundle_size", 65536);
    public static zza<Integer> arY = zza.zzab("measurement.upload.max_events_per_bundle", 1000);
    public static zza<Integer> arZ = zza.zzab("measurement.upload.max_events_per_day", DefaultOggSeeker.MATCH_BYTE_RANGE);
    public static zza<Integer> asa = zza.zzab("measurement.upload.max_error_events_per_day", 1000);
    public static zza<Integer> asb = zza.zzab("measurement.upload.max_public_events_per_day", 50000);
    public static zza<Integer> asc = zza.zzab("measurement.upload.max_conversions_per_day", 500);
    public static zza<Integer> asd = zza.zzab("measurement.upload.max_realtime_events_per_day", 10);
    public static zza<Integer> ase = zza.zzab("measurement.store.max_stored_events_per_app", DefaultOggSeeker.MATCH_BYTE_RANGE);
    public static zza<String> asf = zza.zzav("measurement.upload.url", "https://app-measurement.com/a");
    public static zza<Long> asg = zza.zzf("measurement.upload.backoff_period", 43200000);
    public static zza<Long> ash = zza.zzf("measurement.upload.window_interval", TimeUtils.HOUR);
    public static zza<Long> asi = zza.zzf("measurement.upload.interval", TimeUtils.HOUR);
    public static zza<Long> asj = zza.zzf("measurement.upload.realtime_upload_interval", 10000);
    public static zza<Long> ask = zza.zzf("measurement.upload.minimum_delay", 500);
    public static zza<Long> asl = zza.zzf("measurement.alarm_manager.minimum_interval", 60000);
    public static zza<Long> asm = zza.zzf("measurement.upload.stale_data_deletion_interval", TimeUtils.DAY);
    public static zza<Long> asn = zza.zzf("measurement.upload.refresh_blacklisted_config_interval", TimeUtils.WEEK);
    public static zza<Long> aso = zza.zzf("measurement.upload.initial_upload_delay_time", StoriesProcessor.MAX_VIDEO_LENGTH);
    public static zza<Long> asp = zza.zzf("measurement.upload.retry_time", 1800000);
    public static zza<Integer> asq = zza.zzab("measurement.upload.retry_count", 6);
    public static zza<Long> asr = zza.zzf("measurement.upload.max_queue_time", 2419200000L);
    public static zza<Integer> ass = zza.zzab("measurement.lifetimevalue.max_currency_tracked", 4);
    public static zza<Integer> ast = zza.zzab("measurement.audience.filter_result_max_count", 200);
    public static zza<Long> asu = zza.zzf("measurement.service_client.idle_disconnect_millis", 5000);

    /* loaded from: classes2.dex */
    public static final class zza<V> {
        private final V fc;
        private final zzsi<V> fd;
        private final String zzbcn;

        private zza(String str, zzsi<V> zzsiVar, V v) {
            com.google.android.gms.common.internal.zzaa.zzy(zzsiVar);
            this.fd = zzsiVar;
            this.fc = v;
            this.zzbcn = str;
        }

        static zza<Integer> zzab(String str, int i) {
            return zzo(str, i, i);
        }

        static zza<String> zzav(String str, String str2) {
            return zzk(str, str2, str2);
        }

        static zza<Long> zzb(String str, long j, long j2) {
            return new zza<>(str, zzsi.zza(str, Long.valueOf(j2)), Long.valueOf(j));
        }

        static zza<Boolean> zzb(String str, boolean z, boolean z2) {
            return new zza<>(str, zzsi.zzk(str, z2), Boolean.valueOf(z));
        }

        static zza<Long> zzf(String str, long j) {
            return zzb(str, j, j);
        }

        static zza<String> zzk(String str, String str2, String str3) {
            return new zza<>(str, zzsi.zzaa(str, str3), str2);
        }

        static zza<Boolean> zzm(String str, boolean z) {
            return zzb(str, z, z);
        }

        static zza<Integer> zzo(String str, int i, int i2) {
            return new zza<>(str, zzsi.zza(str, Integer.valueOf(i2)), Integer.valueOf(i));
        }

        public V get() {
            return this.fc;
        }

        public V get(V v) {
            return v != null ? v : this.fc;
        }

        public String getKey() {
            return this.zzbcn;
        }
    }
}
