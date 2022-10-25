package com.vkontakte.android.data;

import android.content.Context;
import android.content.SharedPreferences;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.support.annotation.Nullable;
import android.support.v4.util.Pair;
import android.telephony.CellLocation;
import android.telephony.TelephonyManager;
import android.telephony.cdma.CdmaCellLocation;
import android.telephony.gsm.GsmCellLocation;
import android.text.TextUtils;
import android.util.Log;
import com.facebook.share.internal.ShareConstants;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.core.network.Network;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.APIController;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.background.CancellableRunnable;
import com.vkontakte.android.background.WorkerThread;
import com.vkontakte.android.cache.Gifs;
import com.vkontakte.android.cache.Videos;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.media.ViewedSegments;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.statistics.StatisticBase;
import com.vkontakte.android.statistics.StatisticPrettyCard;
import com.vkontakte.android.statistics.StatisticSender;
import com.vkontakte.android.statistics.StatisticUrl;
import com.vkontakte.android.ui.posts.PostDisplayItem;
import com.vkontakte.android.utils.L;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Semaphore;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Analytics {
    private static final StatisticSender SENDER_EXTERNAL;
    private static final StatisticSender SENDER_PRETTY_CARD_IMPRESSION;
    private static final StatisticSender SENDER_STATISTIC_URL_IMPRESSION;
    private static String googleDeviceID;
    private static CancellableRunnable postedRunner;
    private static WorkerThread thread;
    private static HashSet<JSONObject> events = new HashSet<>();
    private static ConcurrentHashMap<String, JSONObject> collapsedEvents = new ConcurrentHashMap<>();
    private static ConcurrentHashMap<String, HashSet<String>> unique = new ConcurrentHashMap<>();
    private static Vector<String> logWriteQueue = new Vector<>();
    private static Vector<String> elogWriteQueue = new Vector<>();
    private static ArrayList<String> elog = new ArrayList<>();
    private static Semaphore queueAccess = new Semaphore(1, true);
    private static boolean googleDeviceIdLimited = false;
    public static final ViewPostTime viewPostTime = new ViewPostTime();
    public static final ViewedSegments videoViewedSegments = new ViewedSegments(VKApplication.context);

    static {
        Runnable runnable;
        Runnable runnable2;
        googleDeviceID = "-1";
        SharedPreferences prefs = VKApplication.context.getSharedPreferences(null, 0);
        googleDeviceID = prefs.getString("google_device_id", "-1");
        thread = new WorkerThread("Analytics background");
        thread.start();
        WorkerThread workerThread = thread;
        runnable = Analytics$$Lambda$3.instance;
        workerThread.postRunnable(runnable, 0L);
        WorkerThread workerThread2 = thread;
        runnable2 = Analytics$$Lambda$4.instance;
        workerThread2.postRunnable(runnable2);
        SENDER_STATISTIC_URL_IMPRESSION = new StatisticSender() { // from class: com.vkontakte.android.data.Analytics.1
            @Override // com.vkontakte.android.statistics.StatisticSender
            public boolean send(StatisticBase statistic) {
                if (statistic instanceof StatisticUrl) {
                    StatisticUrl statisticUrl = (StatisticUrl) statistic;
                    Analytics.track("ads/impression").collapse().unique().addParam("ad_data_impression", statisticUrl.value).commit().flushBuffer();
                    L.d("Statistics sent", statisticUrl);
                    return true;
                }
                return false;
            }
        };
        SENDER_PRETTY_CARD_IMPRESSION = new StatisticSender() { // from class: com.vkontakte.android.data.Analytics.2
            @Override // com.vkontakte.android.statistics.StatisticSender
            public boolean send(StatisticBase statistic) {
                if (statistic instanceof StatisticPrettyCard) {
                    StatisticPrettyCard statisticPrettyCard = (StatisticPrettyCard) statistic;
                    Analytics.track(Statistic.TYPE_IMPRESSION_PRETTY_CARD).unique().addParam("ad_data", statisticPrettyCard.adData).addParam("card_data", statisticPrettyCard.cardData).sendNow();
                    L.d("Statistics sent", statisticPrettyCard);
                    return true;
                }
                return false;
            }
        };
        SENDER_EXTERNAL = new StatisticSender() { // from class: com.vkontakte.android.data.Analytics.3
            @Override // com.vkontakte.android.statistics.StatisticSender
            public boolean send(StatisticBase statistic) {
                if (statistic instanceof StatisticUrl) {
                    StatisticUrl url = (StatisticUrl) statistic;
                    if (APIController.API_DEBUG) {
                        Log.v("vk", "Sending external request: " + url);
                    }
                    byte[] res = Analytics.sendRequest(url.value);
                    if (APIController.API_DEBUG) {
                        Log.v("vk", "Request done, got " + (res != null ? res.length : -1) + " bytes");
                    }
                    if (res != null) {
                        L.d("Statistics sent", url);
                    }
                    return res != null;
                }
                return false;
            }
        };
    }

    public static /* synthetic */ void lambda$static$0() {
        try {
            File file = new File(VKApplication.context.getFilesDir(), "analytics.log");
            if (file.exists()) {
                BufferedReader reader = new BufferedReader(new FileReader(file));
                while (true) {
                    String line = reader.readLine();
                    if (line == null || line.length() <= 0) {
                        break;
                    }
                    String[] x = line.split(",", 2);
                    if (x.length < 2) {
                        break;
                    }
                    long time = Long.parseLong(x[0]);
                    if (TimeUtils.getCurrentTime() - time < 86400) {
                        events.add(new JSONObject(x[1]));
                    }
                }
                reader.close();
            }
            File file2 = new File(VKApplication.context.getFilesDir(), "analytics_collapsed.log");
            if (file2.exists()) {
                BufferedReader reader2 = new BufferedReader(new FileReader(file2));
                while (true) {
                    String line2 = reader2.readLine();
                    if (line2 == null || line2.length() <= 0) {
                        break;
                    }
                    String[] x2 = line2.split(",", 2);
                    if (x2.length < 2) {
                        break;
                    }
                    long time2 = Long.parseLong(x2[0]);
                    if (System.currentTimeMillis() - time2 < TimeUtils.DAY) {
                        JSONObject obj = new JSONObject(x2[1]);
                        collapsedEvents.put(obj.getString("e"), obj);
                    }
                }
                reader2.close();
            }
            File file3 = new File(VKApplication.context.getFilesDir(), "analytics_events.log");
            boolean needRewrite = false;
            if (file3.exists()) {
                BufferedReader reader3 = new BufferedReader(new FileReader(file3));
                ArrayList<String> lines = new ArrayList<>();
                while (true) {
                    String line3 = reader3.readLine();
                    if (line3 == null || line3.length() <= 0) {
                        break;
                    }
                    String[] x3 = line3.split(",", 2);
                    if (x3.length < 2) {
                        break;
                    }
                    long time3 = Long.parseLong(x3[0]);
                    if (System.currentTimeMillis() < time3) {
                        elog.add(x3[1]);
                        lines.add(line3);
                    } else {
                        needRewrite = true;
                    }
                }
                reader3.close();
                if (needRewrite) {
                    FileOutputStream out = new FileOutputStream(file3);
                    out.write(TextUtils.join("\n", lines).getBytes());
                    out.close();
                }
            }
        } catch (Exception x4) {
            Log.w("vk", x4);
        }
    }

    public static void trackEvent(JSONObject e) {
        boolean needWrite = false;
        try {
            queueAccess.acquire();
        } catch (Exception e2) {
        }
        if (events.add(e)) {
            logWriteQueue.add(TimeUtils.getCurrentTime() + "," + e);
            needWrite = true;
        }
        queueAccess.release();
        if (needWrite) {
            flushFile();
        }
    }

    public static void flushFile() {
        if (postedRunner == null) {
            postedRunner = new StatsBackgroundRunner();
            thread.postRunnable(postedRunner.toRunnable(), 10000L);
        }
    }

    public static EventBuilder track(String ev) {
        return new EventBuilder(ev);
    }

    public static byte[] sendRequest(String url) {
        try {
            Request req = new Request.Builder().url(url).header("User-Agent", APIController.FUCKING_AD_USER_AGENT).build();
            Response resp = Network.getDefaultClient().newCall(req).execute();
            return resp.body().bytes();
        } catch (Exception e) {
            return null;
        }
    }

    public static void trackImpression(StatisticUrl statisticUrl) {
        if (statisticUrl != null) {
            statisticUrl.sendSync(SENDER_STATISTIC_URL_IMPRESSION);
        }
    }

    public static void trackImpression(StatisticPrettyCard statisticPrettyCard) {
        if (statisticPrettyCard != null) {
            statisticPrettyCard.sendSync(SENDER_PRETTY_CARD_IMPRESSION);
        }
    }

    public static void trackExternal(StatisticUrl url) {
        if (url != null) {
            url.sendAsync(SENDER_EXTERNAL, 10, 60000L);
        }
    }

    public static synchronized void getEvents(ArrayList<JSONObject> out) {
        Exception xx;
        synchronized (Analytics.class) {
            try {
                Iterator<JSONObject> it = events.iterator();
                while (it.hasNext()) {
                    JSONObject e = it.next();
                    out.add(new JSONObject(e.toString()));
                }
                for (Map.Entry<String, JSONObject> k : collapsedEvents.entrySet()) {
                    out.add(new JSONObject(k.getValue().toString()));
                }
            } catch (ConcurrentModificationException e2) {
                xx = e2;
                L.e(xx, new Object[0]);
            } catch (JSONException e3) {
                xx = e3;
                L.e(xx, new Object[0]);
            }
        }
    }

    public static void clear(boolean full) {
        events.clear();
        collapsedEvents.clear();
        unique.clear();
        if (full) {
            elog.clear();
        }
        try {
            new File(VKApplication.context.getFilesDir(), "analytics.log").delete();
            new File(VKApplication.context.getFilesDir(), "analytics_collapsed.log").delete();
            if (full) {
                new File(VKApplication.context.getFilesDir(), "analytics_events.log").delete();
            }
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        if (postedRunner != null) {
            postedRunner.cancel();
            postedRunner = null;
        }
    }

    public static void updateDeviceID(Runnable onDone) {
        new Thread(Analytics$$Lambda$1.lambdaFactory$(onDone)).start();
    }

    public static /* synthetic */ void lambda$updateDeviceID$2(Runnable onDone) {
        try {
            AdvertisingIdClient.Info info = AdvertisingIdClient.getAdvertisingIdInfo(VKApplication.context);
            googleDeviceID = info.getId();
            googleDeviceIdLimited = info.isLimitAdTrackingEnabled();
        } catch (Exception e) {
            googleDeviceID = Long.toHexString(VKApplication.deviceID);
        } finally {
            SharedPreferences prefs = VKApplication.context.getSharedPreferences(null, 0);
            prefs.edit().putString("google_device_id", googleDeviceID).apply();
        }
        if (onDone != null) {
            onDone.run();
        }
    }

    public static String getDeviceID() {
        return googleDeviceID;
    }

    public static boolean isLimitAdTrackingEnabled() {
        return googleDeviceIdLimited;
    }

    /* loaded from: classes2.dex */
    public static class StatsBackgroundRunner extends CancellableRunnable {
        private StatsBackgroundRunner() {
        }

        @Override // com.vkontakte.android.background.CancellableRunnable
        public void run() {
            try {
                Analytics.viewPostTime.commit();
                File file = new File(VKApplication.context.getFilesDir(), "analytics.log");
                if (!file.exists()) {
                    file.createNewFile();
                }
                FileOutputStream os = new FileOutputStream(file, true);
                Analytics.queueAccess.acquire();
                String data = TextUtils.join("\n", Analytics.logWriteQueue) + "\n";
                Analytics.logWriteQueue.clear();
                Analytics.queueAccess.release();
                os.write(data.getBytes());
                os.close();
            } catch (Exception x) {
                Log.w("vk", x);
            }
            try {
                File file2 = new File(VKApplication.context.getFilesDir(), "analytics_collapsed.log");
                if (!file2.exists()) {
                    file2.createNewFile();
                }
                FileOutputStream os2 = new FileOutputStream(file2);
                ArrayList<String> list = new ArrayList<>();
                for (Map.Entry<String, JSONObject> k : Analytics.collapsedEvents.entrySet()) {
                    list.add(TimeUtils.getCurrentTime() + "," + k.getValue());
                }
                String data2 = TextUtils.join("\n", list) + "\n";
                os2.write(data2.getBytes());
                os2.close();
            } catch (Exception x2) {
                Log.w("vk", x2);
            }
            try {
                File file3 = new File(VKApplication.context.getFilesDir(), "analytics_events.log");
                if (!file3.exists()) {
                    file3.createNewFile();
                }
                FileOutputStream os3 = new FileOutputStream(file3, true);
                Analytics.queueAccess.acquire();
                String data3 = TextUtils.join("\n", Analytics.elogWriteQueue) + "\n";
                Analytics.elogWriteQueue.clear();
                Analytics.queueAccess.release();
                os3.write(data3.getBytes());
                os3.close();
            } catch (Exception x3) {
                Log.w("vk", x3);
            }
            CancellableRunnable unused = Analytics.postedRunner = null;
        }
    }

    public static void logEvent(String event, long ttl) {
        elog.add(event);
        try {
            queueAccess.acquire();
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
        elogWriteQueue.add((System.currentTimeMillis() + ttl) + "," + event);
        queueAccess.release();
        flushFile();
    }

    public static boolean isLogged(String event) {
        return elog.contains(event);
    }

    /* loaded from: classes2.dex */
    public static class EventBuilder {
        boolean collapsed;
        String event;
        int mappedIndex;
        JSONObject params;
        boolean unique;

        private EventBuilder(String event) {
            this.mappedIndex = -1;
            this.event = event;
            this.params = new JSONObject();
            try {
                this.params.put("e", event);
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:52:0x00b2, code lost:
            if (((java.util.HashSet) com.vkontakte.android.data.Analytics.unique.get(r6.event + com.vk.media.camera.CameraUtilsEffects.FILE_DELIM + r7)).add(r8.toString()) == false) goto L4;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public com.vkontakte.android.data.Analytics.EventBuilder addParam(java.lang.String r7, java.lang.Object r8) {
            /*
                r6 = this;
                r5 = 0
                boolean r2 = r6.collapsed
                if (r2 == 0) goto Lc4
                if (r8 == 0) goto Lb4
                java.util.concurrent.ConcurrentHashMap r2 = com.vkontakte.android.data.Analytics.access$400()     // Catch: java.lang.Exception -> Lbd
                java.lang.String r3 = r6.event     // Catch: java.lang.Exception -> Lbd
                boolean r2 = r2.containsKey(r3)     // Catch: java.lang.Exception -> Lbd
                if (r2 != 0) goto L1e
                java.util.concurrent.ConcurrentHashMap r2 = com.vkontakte.android.data.Analytics.access$400()     // Catch: java.lang.Exception -> Lbd
                java.lang.String r3 = r6.event     // Catch: java.lang.Exception -> Lbd
                org.json.JSONObject r4 = r6.params     // Catch: java.lang.Exception -> Lbd
                r2.put(r3, r4)     // Catch: java.lang.Exception -> Lbd
            L1e:
                java.util.concurrent.ConcurrentHashMap r2 = com.vkontakte.android.data.Analytics.access$400()     // Catch: java.lang.Exception -> Lbd
                java.lang.String r3 = r6.event     // Catch: java.lang.Exception -> Lbd
                java.lang.Object r0 = r2.get(r3)     // Catch: java.lang.Exception -> Lbd
                org.json.JSONObject r0 = (org.json.JSONObject) r0     // Catch: java.lang.Exception -> Lbd
                boolean r2 = r0.has(r7)     // Catch: java.lang.Exception -> Lbd
                if (r2 != 0) goto L38
                org.json.JSONArray r2 = new org.json.JSONArray     // Catch: java.lang.Exception -> Lbd
                r2.<init>()     // Catch: java.lang.Exception -> Lbd
                r0.put(r7, r2)     // Catch: java.lang.Exception -> Lbd
            L38:
                boolean r2 = r6.unique     // Catch: java.lang.Exception -> Lbd
                if (r2 == 0) goto Lb5
                java.util.concurrent.ConcurrentHashMap r2 = com.vkontakte.android.data.Analytics.access$700()     // Catch: java.lang.Exception -> Lbd
                java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> Lbd
                r3.<init>()     // Catch: java.lang.Exception -> Lbd
                java.lang.String r4 = r6.event     // Catch: java.lang.Exception -> Lbd
                java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Exception -> Lbd
                java.lang.String r4 = "/"
                java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Exception -> Lbd
                java.lang.StringBuilder r3 = r3.append(r7)     // Catch: java.lang.Exception -> Lbd
                java.lang.String r3 = r3.toString()     // Catch: java.lang.Exception -> Lbd
                boolean r2 = r2.containsKey(r3)     // Catch: java.lang.Exception -> Lbd
                if (r2 != 0) goto L86
                java.util.concurrent.ConcurrentHashMap r2 = com.vkontakte.android.data.Analytics.access$700()     // Catch: java.lang.Exception -> Lbd
                java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> Lbd
                r3.<init>()     // Catch: java.lang.Exception -> Lbd
                java.lang.String r4 = r6.event     // Catch: java.lang.Exception -> Lbd
                java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Exception -> Lbd
                java.lang.String r4 = "/"
                java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Exception -> Lbd
                java.lang.StringBuilder r3 = r3.append(r7)     // Catch: java.lang.Exception -> Lbd
                java.lang.String r3 = r3.toString()     // Catch: java.lang.Exception -> Lbd
                java.util.HashSet r4 = new java.util.HashSet     // Catch: java.lang.Exception -> Lbd
                r4.<init>()     // Catch: java.lang.Exception -> Lbd
                r2.put(r3, r4)     // Catch: java.lang.Exception -> Lbd
            L86:
                java.util.concurrent.ConcurrentHashMap r2 = com.vkontakte.android.data.Analytics.access$700()     // Catch: java.lang.Exception -> Lbd
                java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> Lbd
                r3.<init>()     // Catch: java.lang.Exception -> Lbd
                java.lang.String r4 = r6.event     // Catch: java.lang.Exception -> Lbd
                java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Exception -> Lbd
                java.lang.String r4 = "/"
                java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Exception -> Lbd
                java.lang.StringBuilder r3 = r3.append(r7)     // Catch: java.lang.Exception -> Lbd
                java.lang.String r3 = r3.toString()     // Catch: java.lang.Exception -> Lbd
                java.lang.Object r2 = r2.get(r3)     // Catch: java.lang.Exception -> Lbd
                java.util.HashSet r2 = (java.util.HashSet) r2     // Catch: java.lang.Exception -> Lbd
                java.lang.String r3 = r8.toString()     // Catch: java.lang.Exception -> Lbd
                boolean r2 = r2.add(r3)     // Catch: java.lang.Exception -> Lbd
                if (r2 != 0) goto Lb5
            Lb4:
                return r6
            Lb5:
                org.json.JSONArray r2 = r0.getJSONArray(r7)     // Catch: java.lang.Exception -> Lbd
                r2.put(r8)     // Catch: java.lang.Exception -> Lbd
                goto Lb4
            Lbd:
                r1 = move-exception
                java.lang.Object[] r2 = new java.lang.Object[r5]
                com.vkontakte.android.utils.L.e(r1, r2)
                goto Lb4
            Lc4:
                int r2 = r6.mappedIndex     // Catch: java.lang.Exception -> Le0
                r3 = -1
                if (r2 == r3) goto Ld8
                java.lang.String r2 = r8.toString()     // Catch: java.lang.Exception -> Le0
                java.lang.String r3 = "_"
                java.lang.String[] r2 = r2.split(r3)     // Catch: java.lang.Exception -> Le0
                int r3 = r6.mappedIndex     // Catch: java.lang.Exception -> Le0
                r8 = r2[r3]     // Catch: java.lang.Exception -> Le0
            Ld8:
                if (r8 == 0) goto Lb4
                org.json.JSONObject r2 = r6.params     // Catch: java.lang.Exception -> Le0
                r2.put(r7, r8)     // Catch: java.lang.Exception -> Le0
                goto Lb4
            Le0:
                r1 = move-exception
                java.lang.Object[] r2 = new java.lang.Object[r5]
                com.vkontakte.android.utils.L.e(r1, r2)
                goto Lb4
            */
            throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.data.Analytics.EventBuilder.addParam(java.lang.String, java.lang.Object):com.vkontakte.android.data.Analytics$EventBuilder");
        }

        public EventBuilder collapse() {
            this.collapsed = true;
            return this;
        }

        public EventBuilder unique() {
            this.unique = true;
            return this;
        }

        public EventBuilder commit() {
            if (this.collapsed) {
                Analytics.flushFile();
            } else {
                Analytics.trackEvent(this.params);
            }
            return this;
        }

        public EventBuilder map(int index) {
            this.mappedIndex = index;
            return this;
        }

        public EventBuilder sendNow() {
            if (this.event.contains(CameraUtilsEffects.FILE_DELIM)) {
                try {
                    String[] ev = this.event.split(CameraUtilsEffects.FILE_DELIM, 2);
                    String type = ev[0];
                    String event = ev[1];
                    if ("ads".equals(type)) {
                        this.params.remove("e");
                        this.params.put("event_type", event);
                        new VKAPIRequest("adsint.registerAdEvents").param("events", "[" + this.params + "]").persist(null, null).setBackground(true).exec();
                    }
                } catch (Exception x) {
                    L.e(x, new Object[0]);
                }
            } else {
                new VKAPIRequest("stats.trackEvents").param("events", "[" + this.params + "]").exec();
            }
            return this;
        }

        public EventBuilder flushBuffer() {
            LongPollService.sendAnalyticsNow();
            return this;
        }
    }

    public static void sendGeoData() {
        if (VKAccountManager.getCurrent().isReal()) {
            boolean isLocationEnable = PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getBoolean("mytrackerLocationCrapEnabled", true);
            Location l = isLocationEnable ? collectData(VKApplication.context) : null;
            EventBuilder builder = track("geo_data");
            if (!isLocationEnable) {
                builder.addParam("no_data_reason", 1);
            } else if (l == null) {
                builder.addParam("no_data_reason", 2);
                addCellData(builder);
            } else {
                builder.addParam("accuracy", Float.valueOf(l.getAccuracy())).addParam("ts", Long.valueOf(l.getTime() / 1000)).addParam("lat", formatForGeo(l.getLatitude())).addParam("lon", formatForGeo(l.getLongitude()));
                addCellData(builder);
            }
            builder.commit();
        }
    }

    private static void addCellData(EventBuilder builder) {
        int bsid;
        try {
            TelephonyManager manager = (TelephonyManager) VKApplication.context.getSystemService(SignupPhoneFragment.KEY_PHONE);
            CellLocation cellLocation = manager.getCellLocation();
            if (cellLocation instanceof GsmCellLocation) {
                int cid = ((GsmCellLocation) cellLocation).getCid();
                if (cid >= 0) {
                    builder.addParam("cell_id", Integer.valueOf(cid));
                    builder.addParam("cell_type", "gsm");
                }
            } else if ((cellLocation instanceof CdmaCellLocation) && (bsid = ((CdmaCellLocation) cellLocation).getBaseStationId()) >= 0) {
                builder.addParam("cell_id", Integer.valueOf(bsid));
                builder.addParam("cell_type", "cdma");
            }
        } catch (Throwable th) {
        }
    }

    public static String formatForGeo(double d) {
        return ((int) d) + "." + Math.abs(((int) (10000.0d * d)) % 10000);
    }

    @Nullable
    public static Location collectData(Context context) {
        if (!isManufacturerAskPermission()) {
            if (Looper.myLooper() != Looper.getMainLooper()) {
                float bestAccuracy = Float.MAX_VALUE;
                long bestTime = 0;
                Location bestResult = null;
                LocationManager lm = (LocationManager) context.getSystemService(FirebaseAnalytics.Param.LOCATION);
                List<String> matchingProviders = lm.getAllProviders();
                if (matchingProviders == null) {
                    return null;
                }
                for (String provider : matchingProviders) {
                    try {
                        Location e = lm.getLastKnownLocation(provider);
                        if (e != null) {
                            float accuracy = e.getAccuracy();
                            long time = e.getTime();
                            if (bestResult == null || (time > bestTime && accuracy < bestAccuracy)) {
                                bestResult = e;
                                bestAccuracy = accuracy;
                                bestTime = time;
                            }
                        }
                    } catch (SecurityException e2) {
                    }
                }
                L.e("send_geo: " + bestResult);
                return bestResult;
            }
            L.e("send_geo: You must not call collectData method from main thread");
        }
        return null;
    }

    public static boolean isManufacturerAskPermission() {
        String manufacturer = Build.MANUFACTURER;
        return "Xiaomi".equalsIgnoreCase(manufacturer) || "Meizu".equalsIgnoreCase(manufacturer);
    }

    /* loaded from: classes2.dex */
    public static class ViewPostTime {
        HashMap<Pair<String, String>, HashMap<String, ArrayList<Integer>>> data = new HashMap<>();

        public void addTime(String refer, String trackCode, String postId, int time) {
            synchronized (this) {
                Pair<String, String> key = new Pair<>(refer, trackCode);
                HashMap<String, ArrayList<Integer>> map = this.data.get(key);
                if (map == null) {
                    HashMap<Pair<String, String>, HashMap<String, ArrayList<Integer>>> hashMap = this.data;
                    map = new HashMap<>();
                    hashMap.put(key, map);
                }
                ArrayList<Integer> times = map.get(postId);
                if (times == null) {
                    times = new ArrayList<>();
                    map.put(postId, times);
                }
                times.add(Integer.valueOf(time));
            }
        }

        public void commit() {
            synchronized (this) {
                if (this.data.size() > 0) {
                    try {
                        JSONArray object = toJSONObject();
                        Analytics.track("view_post_time").addParam(ServerKeys.VIEWS, object).commit();
                        this.data.clear();
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                    }
                }
            }
        }

        CharSequence arrayToString(ArrayList<Integer> arrayList) {
            if (arrayList == null) {
                return "[]";
            }
            StringBuilder builder = new StringBuilder("[");
            for (int i = 0; i < arrayList.size(); i++) {
                if (i != 0) {
                    builder.append(',');
                }
                builder.append(arrayList.get(i));
            }
            builder.append("]");
            return builder;
        }

        JSONObject toJSONObject(String ref, String trackCode, String postId, ArrayList<Integer> times) throws JSONException {
            JSONObject jsonObject = new JSONObject().put("ref", ref).put(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, postId).put("times", arrayToString(times));
            if (!TextUtils.isEmpty(trackCode)) {
                jsonObject.put("track_code", trackCode);
            }
            return jsonObject;
        }

        JSONArray toJSONObject() throws JSONException {
            JSONArray jsonArray = new JSONArray();
            for (Pair<String, String> s : this.data.keySet()) {
                HashMap<String, ArrayList<Integer>> map = this.data.get(s);
                for (String postId : map.keySet()) {
                    jsonArray.put(toJSONObject(s.first, s.second, postId, map.get(postId)));
                }
            }
            return jsonArray;
        }
    }

    public static PostDisplayItem.OnBindView getOnBindViewForNewsEntry(NewsEntry post) {
        if (post == null || post.type != 12) {
            return null;
        }
        return Analytics$$Lambda$2.lambdaFactory$(post);
    }

    public static void sendPromoPostActionByType(NewsEntry post, String type) {
        if (post.type == 12) {
            Iterator<Attachment> it = post.attachments.iterator();
            while (it.hasNext()) {
                Attachment att = it.next();
                if (att instanceof Statistic) {
                    sendPromoActionByType((Statistic) att, type);
                }
            }
        }
    }

    public static void sendPromoActionByType(Statistic statistic, String type) {
        for (StatisticUrl url : statistic.getStatisticByType(type)) {
            trackExternal(url);
        }
        if (Statistic.TYPE_IMPRESSION.equals(type)) {
            trackImpression(((ShitAttachment) statistic).dataImpression);
        }
    }

    public static void sendPromoAction(List<StatisticUrl> urls) {
        for (StatisticUrl url : urls) {
            trackExternal(url);
        }
    }

    public static void sendVideoViewedSegments() {
        videoViewedSegments.sendLastSessionStats();
    }

    public static void sendDailyStatistic(Context context) {
        SharedPreferences preferences = context.getSharedPreferences(null, 0);
        int lastSendTime = preferences.getInt("stats_daily_last_updated", 0);
        int currentTime = (int) (System.currentTimeMillis() / 1000);
        if (currentTime - lastSendTime > 86400) {
            sendGifAutoPlayState();
            sendVideoAutoPlayState();
            preferences.edit().putInt("stats_daily_last_updated", currentTime).apply();
        }
    }

    private static void sendVideoAutoPlayState() {
        track("autoplay_state").unique().addParam(ServerKeys.TYPE, "video").addParam("value", Videos.getAutoPlayState()).commit();
    }

    private static void sendGifAutoPlayState() {
        track("autoplay_state").unique().addParam(ServerKeys.TYPE, "gif").addParam("value", Gifs.getAutoPlayState()).commit();
    }

    public static boolean cleanGeoDataEvents() {
        boolean hasGeo = false;
        try {
            Set<JSONObject> copy = new HashSet<>(events);
            for (JSONObject obj : copy) {
                if (TextUtils.equals(obj.getString("e"), "geo_data")) {
                    events.remove(obj);
                    hasGeo = true;
                }
            }
        } catch (JSONException e) {
            L.e("VK", e);
        }
        return hasGeo;
    }
}
