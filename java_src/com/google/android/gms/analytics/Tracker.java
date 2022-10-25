package com.google.android.gms.analytics;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.internal.zzab;
import com.google.android.gms.analytics.internal.zzad;
import com.google.android.gms.analytics.internal.zzan;
import com.google.android.gms.analytics.internal.zzao;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzms;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.stickers.Stickers;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
/* loaded from: classes.dex */
public class Tracker extends com.google.android.gms.analytics.internal.zzd {
    private boolean bu;
    private final Map<String, String> bv;
    private final zzad bw;
    private final zza bx;
    private ExceptionReporter by;
    private zzan bz;
    private final Map<String, String> zzbly;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class zza extends com.google.android.gms.analytics.internal.zzd implements GoogleAnalytics.zza {
        private boolean bI;
        private int bJ;
        private long bK;
        private boolean bL;
        private long bM;

        protected zza(com.google.android.gms.analytics.internal.zzf zzfVar) {
            super(zzfVar);
            this.bK = -1L;
        }

        private void zzaac() {
            if (this.bK >= 0 || this.bI) {
                zzza().zza(Tracker.this.bx);
            } else {
                zzza().zzb(Tracker.this.bx);
            }
        }

        public void enableAutoActivityTracking(boolean z) {
            this.bI = z;
            zzaac();
        }

        public void setSessionTimeout(long j) {
            this.bK = j;
            zzaac();
        }

        public synchronized boolean zzaab() {
            boolean z;
            z = this.bL;
            this.bL = false;
            return z;
        }

        boolean zzaad() {
            return zzabz().elapsedRealtime() >= this.bM + Math.max(1000L, this.bK);
        }

        @Override // com.google.android.gms.analytics.GoogleAnalytics.zza
        public void zzo(Activity activity) {
            if (this.bJ == 0 && zzaad()) {
                this.bL = true;
            }
            this.bJ++;
            if (this.bI) {
                Intent intent = activity.getIntent();
                if (intent != null) {
                    Tracker.this.setCampaignParamsOnNextHit(intent.getData());
                }
                HashMap hashMap = new HashMap();
                hashMap.put("&t", "screenview");
                Tracker.this.set("&cd", Tracker.this.bz != null ? Tracker.this.bz.zzr(activity) : activity.getClass().getCanonicalName());
                if (TextUtils.isEmpty((CharSequence) hashMap.get("&dr"))) {
                    String zzq = Tracker.zzq(activity);
                    if (!TextUtils.isEmpty(zzq)) {
                        hashMap.put("&dr", zzq);
                    }
                }
                Tracker.this.send(hashMap);
            }
        }

        @Override // com.google.android.gms.analytics.GoogleAnalytics.zza
        public void zzp(Activity activity) {
            this.bJ--;
            this.bJ = Math.max(0, this.bJ);
            if (this.bJ == 0) {
                this.bM = zzabz().elapsedRealtime();
            }
        }

        @Override // com.google.android.gms.analytics.internal.zzd
        protected void zzzy() {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Tracker(com.google.android.gms.analytics.internal.zzf zzfVar, String str, zzad zzadVar) {
        super(zzfVar);
        this.zzbly = new HashMap();
        this.bv = new HashMap();
        if (str != null) {
            this.zzbly.put("&tid", str);
        }
        this.zzbly.put("useSecure", AppEventsConstants.EVENT_PARAM_VALUE_YES);
        this.zzbly.put("&a", Integer.toString(new Random().nextInt(Integer.MAX_VALUE) + 1));
        if (zzadVar == null) {
            this.bw = new zzad("tracking", zzabz());
        } else {
            this.bw = zzadVar;
        }
        this.bx = new zza(zzfVar);
    }

    private static boolean zza(Map.Entry<String, String> entry) {
        String key = entry.getKey();
        entry.getValue();
        return key.startsWith("&") && key.length() >= 2;
    }

    private static String zzb(Map.Entry<String, String> entry) {
        if (!zza(entry)) {
            return null;
        }
        return entry.getKey().substring(1);
    }

    private static void zzb(Map<String, String> map, Map<String, String> map2) {
        zzaa.zzy(map2);
        if (map == null) {
            return;
        }
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String zzb = zzb(entry);
            if (zzb != null) {
                map2.put(zzb, entry.getValue());
            }
        }
    }

    private static void zzc(Map<String, String> map, Map<String, String> map2) {
        zzaa.zzy(map2);
        if (map == null) {
            return;
        }
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String zzb = zzb(entry);
            if (zzb != null && !map2.containsKey(zzb)) {
                map2.put(zzb, entry.getValue());
            }
        }
    }

    static String zzq(Activity activity) {
        zzaa.zzy(activity);
        Intent intent = activity.getIntent();
        if (intent == null) {
            return null;
        }
        String stringExtra = intent.getStringExtra("android.intent.extra.REFERRER_NAME");
        if (TextUtils.isEmpty(stringExtra)) {
            return null;
        }
        return stringExtra;
    }

    private boolean zzzz() {
        return this.by != null;
    }

    public void enableAdvertisingIdCollection(boolean z) {
        this.bu = z;
    }

    public void enableAutoActivityTracking(boolean z) {
        this.bx.enableAutoActivityTracking(z);
    }

    public void enableExceptionReporting(boolean z) {
        synchronized (this) {
            if (zzzz() == z) {
                return;
            }
            if (z) {
                this.by = new ExceptionReporter(this, Thread.getDefaultUncaughtExceptionHandler(), getContext());
                Thread.setDefaultUncaughtExceptionHandler(this.by);
                zzes("Uncaught exceptions will be reported to Google Analytics");
            } else {
                Thread.setDefaultUncaughtExceptionHandler(this.by.zzzb());
                zzes("Uncaught exceptions will not be reported to Google Analytics");
            }
        }
    }

    public String get(String str) {
        zzacj();
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (this.zzbly.containsKey(str)) {
            return this.zzbly.get(str);
        }
        if (str.equals("&ul")) {
            return zzao.zza(Locale.getDefault());
        }
        if (str.equals("&cid")) {
            return zzacf().zzady();
        }
        if (str.equals("&sr")) {
            return zzaci().zzafm();
        }
        if (str.equals("&aid")) {
            return zzach().zzadg().zzup();
        }
        if (str.equals("&an")) {
            return zzach().zzadg().zzaae();
        }
        if (str.equals("&av")) {
            return zzach().zzadg().zzaaf();
        }
        if (!str.equals("&aiid")) {
            return null;
        }
        return zzach().zzadg().zzaag();
    }

    public void send(Map<String, String> map) {
        final long currentTimeMillis = zzabz().currentTimeMillis();
        if (zzza().getAppOptOut()) {
            zzet("AppOptOut is set to true. Not sending Google Analytics hit");
            return;
        }
        final boolean isDryRunEnabled = zzza().isDryRunEnabled();
        final HashMap hashMap = new HashMap();
        zzb(this.zzbly, hashMap);
        zzb(map, hashMap);
        final boolean zzg = zzao.zzg(this.zzbly.get("useSecure"), true);
        zzc(this.bv, hashMap);
        this.bv.clear();
        final String str = hashMap.get("t");
        if (TextUtils.isEmpty(str)) {
            zzaca().zzh(hashMap, "Missing hit type parameter");
            return;
        }
        final String str2 = hashMap.get("tid");
        if (TextUtils.isEmpty(str2)) {
            zzaca().zzh(hashMap, "Missing tracking id parameter");
            return;
        }
        final boolean zzaaa = zzaaa();
        synchronized (this) {
            if ("screenview".equalsIgnoreCase(str) || "pageview".equalsIgnoreCase(str) || "appview".equalsIgnoreCase(str) || TextUtils.isEmpty(str)) {
                int parseInt = Integer.parseInt(this.zzbly.get("&a")) + 1;
                if (parseInt >= Integer.MAX_VALUE) {
                    parseInt = 1;
                }
                this.zzbly.put("&a", Integer.toString(parseInt));
            }
        }
        zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.Tracker.1
            @Override // java.lang.Runnable
            public void run() {
                boolean z = true;
                if (Tracker.this.bx.zzaab()) {
                    hashMap.put("sc", TtmlNode.START);
                }
                zzao.zzd(hashMap, "cid", Tracker.this.zzza().zzze());
                String str3 = (String) hashMap.get("sf");
                if (str3 != null) {
                    double zza2 = zzao.zza(str3, 100.0d);
                    if (zzao.zza(zza2, (String) hashMap.get("cid"))) {
                        Tracker.this.zzb("Sampling enabled. Hit sampled out. sample rate", Double.valueOf(zza2));
                        return;
                    }
                }
                com.google.android.gms.analytics.internal.zza zzacg = Tracker.this.zzacg();
                if (zzaaa) {
                    zzao.zzb(hashMap, "ate", zzacg.zzabc());
                    zzao.zzc(hashMap, "adid", zzacg.zzabn());
                } else {
                    hashMap.remove("ate");
                    hashMap.remove("adid");
                }
                zzms zzadg = Tracker.this.zzach().zzadg();
                zzao.zzc(hashMap, "an", zzadg.zzaae());
                zzao.zzc(hashMap, "av", zzadg.zzaaf());
                zzao.zzc(hashMap, AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, zzadg.zzup());
                zzao.zzc(hashMap, "aiid", zzadg.zzaag());
                hashMap.put("v", AppEventsConstants.EVENT_PARAM_VALUE_YES);
                hashMap.put("_v", com.google.android.gms.analytics.internal.zze.cS);
                zzao.zzc(hashMap, "ul", Tracker.this.zzaci().zzafl().getLanguage());
                zzao.zzc(hashMap, "sr", Tracker.this.zzaci().zzafm());
                if (!(str.equals("transaction") || str.equals(Stickers.EXTRA_ITEM)) && !Tracker.this.bw.zzagf()) {
                    Tracker.this.zzaca().zzh(hashMap, "Too many hits sent too quickly, rate limiting invoked");
                    return;
                }
                long zzfj = zzao.zzfj((String) hashMap.get("ht"));
                if (zzfj == 0) {
                    zzfj = currentTimeMillis;
                }
                if (isDryRunEnabled) {
                    Tracker.this.zzaca().zzc("Dry run enabled. Would have sent hit", new zzab(Tracker.this, hashMap, zzfj, zzg));
                    return;
                }
                String str4 = (String) hashMap.get("cid");
                HashMap hashMap2 = new HashMap();
                zzao.zza(hashMap2, ArgKeys.UID, hashMap);
                zzao.zza(hashMap2, "an", hashMap);
                zzao.zza(hashMap2, AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, hashMap);
                zzao.zza(hashMap2, "av", hashMap);
                zzao.zza(hashMap2, "aiid", hashMap);
                String str5 = str2;
                if (TextUtils.isEmpty((CharSequence) hashMap.get("adid"))) {
                    z = false;
                }
                hashMap.put("_s", String.valueOf(Tracker.this.zzzg().zza(new com.google.android.gms.analytics.internal.zzh(0L, str4, str5, z, 0L, hashMap2))));
                Tracker.this.zzzg().zza(new zzab(Tracker.this, hashMap, zzfj, zzg));
            }
        });
    }

    public void set(String str, String str2) {
        zzaa.zzb(str, "Key should be non-null");
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.zzbly.put(str, str2);
    }

    public void setAnonymizeIp(boolean z) {
        set("&aip", zzao.zzax(z));
    }

    public void setAppId(String str) {
        set("&aid", str);
    }

    public void setAppInstallerId(String str) {
        set("&aiid", str);
    }

    public void setAppName(String str) {
        set("&an", str);
    }

    public void setAppVersion(String str) {
        set("&av", str);
    }

    public void setCampaignParamsOnNextHit(Uri uri) {
        if (uri == null || uri.isOpaque()) {
            return;
        }
        String queryParameter = uri.getQueryParameter(ArgKeys.REFERRER);
        if (TextUtils.isEmpty(queryParameter)) {
            return;
        }
        String valueOf = String.valueOf(queryParameter);
        Uri parse = Uri.parse(valueOf.length() != 0 ? "http://hostname/?".concat(valueOf) : new String("http://hostname/?"));
        String queryParameter2 = parse.getQueryParameter("utm_id");
        if (queryParameter2 != null) {
            this.bv.put("&ci", queryParameter2);
        }
        String queryParameter3 = parse.getQueryParameter("anid");
        if (queryParameter3 != null) {
            this.bv.put("&anid", queryParameter3);
        }
        String queryParameter4 = parse.getQueryParameter("utm_campaign");
        if (queryParameter4 != null) {
            this.bv.put("&cn", queryParameter4);
        }
        String queryParameter5 = parse.getQueryParameter("utm_content");
        if (queryParameter5 != null) {
            this.bv.put("&cc", queryParameter5);
        }
        String queryParameter6 = parse.getQueryParameter("utm_medium");
        if (queryParameter6 != null) {
            this.bv.put("&cm", queryParameter6);
        }
        String queryParameter7 = parse.getQueryParameter("utm_source");
        if (queryParameter7 != null) {
            this.bv.put("&cs", queryParameter7);
        }
        String queryParameter8 = parse.getQueryParameter("utm_term");
        if (queryParameter8 != null) {
            this.bv.put("&ck", queryParameter8);
        }
        String queryParameter9 = parse.getQueryParameter("dclid");
        if (queryParameter9 != null) {
            this.bv.put("&dclid", queryParameter9);
        }
        String queryParameter10 = parse.getQueryParameter("gclid");
        if (queryParameter10 != null) {
            this.bv.put("&gclid", queryParameter10);
        }
        String queryParameter11 = parse.getQueryParameter("aclid");
        if (queryParameter11 == null) {
            return;
        }
        this.bv.put("&aclid", queryParameter11);
    }

    public void setClientId(String str) {
        set("&cid", str);
    }

    public void setEncoding(String str) {
        set("&de", str);
    }

    public void setHostname(String str) {
        set("&dh", str);
    }

    public void setLanguage(String str) {
        set("&ul", str);
    }

    public void setLocation(String str) {
        set("&dl", str);
    }

    public void setPage(String str) {
        set("&dp", str);
    }

    public void setReferrer(String str) {
        set("&dr", str);
    }

    public void setSampleRate(double d) {
        set("&sf", Double.toString(d));
    }

    public void setScreenColors(String str) {
        set("&sd", str);
    }

    public void setScreenName(String str) {
        set("&cd", str);
    }

    public void setScreenResolution(int i, int i2) {
        if (i >= 0 || i2 >= 0) {
            set("&sr", new StringBuilder(23).append(i).append("x").append(i2).toString());
        } else {
            zzev("Invalid width or height. The values should be non-negative.");
        }
    }

    public void setSessionTimeout(long j) {
        this.bx.setSessionTimeout(1000 * j);
    }

    public void setTitle(String str) {
        set("&dt", str);
    }

    public void setUseSecure(boolean z) {
        set("useSecure", zzao.zzax(z));
    }

    public void setViewportSize(String str) {
        set("&vp", str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(zzan zzanVar) {
        zzes("Loading Tracker config values");
        this.bz = zzanVar;
        if (this.bz.zzahc()) {
            String trackingId = this.bz.getTrackingId();
            set("&tid", trackingId);
            zza("trackingId loaded", trackingId);
        }
        if (this.bz.zzahd()) {
            String d = Double.toString(this.bz.zzahe());
            set("&sf", d);
            zza("Sample frequency loaded", d);
        }
        if (this.bz.zzahf()) {
            int sessionTimeout = this.bz.getSessionTimeout();
            setSessionTimeout(sessionTimeout);
            zza("Session timeout loaded", Integer.valueOf(sessionTimeout));
        }
        if (this.bz.zzahg()) {
            boolean zzahh = this.bz.zzahh();
            enableAutoActivityTracking(zzahh);
            zza("Auto activity tracking loaded", Boolean.valueOf(zzahh));
        }
        if (this.bz.zzahi()) {
            boolean zzahj = this.bz.zzahj();
            if (zzahj) {
                set("&aip", AppEventsConstants.EVENT_PARAM_VALUE_YES);
            }
            zza("Anonymize ip loaded", Boolean.valueOf(zzahj));
        }
        enableExceptionReporting(this.bz.zzahk());
    }

    boolean zzaaa() {
        return this.bu;
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
        this.bx.initialize();
        String zzaae = zzzh().zzaae();
        if (zzaae != null) {
            set("&an", zzaae);
        }
        String zzaaf = zzzh().zzaaf();
        if (zzaaf != null) {
            set("&av", zzaaf);
        }
    }
}
