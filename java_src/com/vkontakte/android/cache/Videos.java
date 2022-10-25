package com.vkontakte.android.cache;

import android.content.SharedPreferences;
import android.net.Uri;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import com.vk.core.network.Network;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.media.Vigo;
import com.vkontakte.android.utils.Utils;
import io.sentry.connection.AbstractConnection;
import io.sentry.event.EventBuilder;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class Videos {
    public static final int QUALITY_1080 = 6;
    public static final int QUALITY_240 = 2;
    public static final int QUALITY_360 = 3;
    public static final int QUALITY_480 = 4;
    public static final int QUALITY_720 = 5;
    public static final int QUALITY_HLS = -2;
    public static final int QUALITY_UNKNOWN = -1;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface Quality {
    }

    private Videos() {
        VKAccount account = VKAccountManager.getCurrent();
        if (!account.isUseVigo()) {
            throw new IllegalStateException("Vigo is disabled");
        }
        OkHttpClient.Builder vigoBuilder = Network.getInstance().getBuilder(Network.ClientType.CLIENT_VIGO);
        vigoBuilder.connectTimeout(account.getVigoConnectTimeout(), TimeUnit.MILLISECONDS);
        vigoBuilder.readTimeout(account.getVigoReadTimeout(), TimeUnit.MILLISECONDS);
        vigoBuilder.writeTimeout(1000L, TimeUnit.MILLISECONDS);
        Network.getInstance().setBuilder(Network.ClientType.CLIENT_VIGO, vigoBuilder);
    }

    public static boolean saveUsersChoice(int quality, String netType) {
        return VKApplication.context.getSharedPreferences(null, 0).edit().putInt("video_quality_" + netType, quality - 2).commit();
    }

    @WorkerThread
    public static int getQuality(@NonNull VideoFile file, @Nullable AtomicBoolean useVigo, String svcid) {
        int maxVideoSupportedQuality;
        int minVideoSupportedQuality;
        if (file.isHLSSupported()) {
            return -2;
        }
        boolean no240 = TextUtils.isEmpty(file.url240);
        boolean no360 = TextUtils.isEmpty(file.url360);
        boolean no480 = TextUtils.isEmpty(file.url480);
        boolean no720 = TextUtils.isEmpty(file.url720);
        boolean no1080 = TextUtils.isEmpty(file.url1080);
        if (!no240 && no360 && no480 && no720 && no1080) {
            return 2;
        }
        if (no240 && !no360 && no480 && no720 && no1080) {
            return 3;
        }
        if (no240 && no360 && !no480 && no720 && no1080) {
            return 4;
        }
        if (no240 && no360 && no480 && !no720 && no1080) {
            return 5;
        }
        if (no240 && no360 && no480 && no720 && !no1080) {
            return 6;
        }
        int maxDeviceSupportedQuality = getMaxSupportedQuality();
        try {
            VKAccount account = VKAccountManager.getCurrent();
            if (!account.isUseVigo()) {
                throw new IllegalStateException("Vigo is disabled");
            }
            Uri.Builder builder = Uri.parse("http://api.vigo.ru/uxzoom/2/network_status").buildUpon();
            if (!no240) {
                builder.appendQueryParameter("quality", "2");
            }
            if (!no360) {
                builder.appendQueryParameter("quality", "3");
            }
            if (!no480 && maxDeviceSupportedQuality >= 4) {
                builder.appendQueryParameter("quality", "4");
            }
            if (!no720 && maxDeviceSupportedQuality >= 5) {
                builder.appendQueryParameter("quality", "5");
            }
            if (!no1080 && maxDeviceSupportedQuality >= 6) {
                builder.appendQueryParameter("quality", AbstractConnection.SENTRY_PROTOCOL_VERSION);
            }
            Vigo vigo = VKApplication.getVigo(VKApplication.context);
            String url = builder.build().toString();
            if (vigo != null) {
                url = vigo.fillPlaybackUrlParams(builder, svcid, null).build().toString();
            }
            Request req = new Request.Builder().url(url).build();
            OkHttpClient client = Network.getInstance().getClient(Network.ClientType.CLIENT_VIGO);
            JSONObject response = new JSONObject(client.newCall(req).execute().body().string());
            if (useVigo != null) {
                useVigo.set(response.getBoolean("supported"));
            }
            int result = response.getJSONObject("load_info").getInt("quality");
            if (result <= 2 || result > 6) {
                throw new IllegalArgumentException("Unable to find best quality via Vigo");
            }
            return result;
        } catch (Throwable th) {
            if (useVigo != null) {
                useVigo.set(true);
            }
            if (!no1080) {
                maxVideoSupportedQuality = 6;
            } else {
                maxVideoSupportedQuality = !no720 ? 5 : !no480 ? 4 : !no360 ? 3 : 2;
            }
            if (!no240) {
                minVideoSupportedQuality = 2;
            } else {
                minVideoSupportedQuality = !no360 ? 3 : !no480 ? 4 : !no720 ? 5 : 6;
            }
            int max = maxVideoSupportedQuality < maxDeviceSupportedQuality ? maxVideoSupportedQuality : maxDeviceSupportedQuality;
            int min = Math.min(minVideoSupportedQuality, maxDeviceSupportedQuality);
            return getQualityByUserOrNetwork(max, min);
        }
    }

    public static String getUrl(VideoFile file, int quality) {
        switch (quality) {
            case -2:
                return file.urlHls;
            case -1:
            case 0:
            case 1:
            default:
                return null;
            case 2:
                return file.url240;
            case 3:
                return file.url360;
            case 4:
                return file.url480;
            case 5:
                return file.url720;
            case 6:
                return file.url1080;
        }
    }

    private static int getQualityByUserOrNetwork(int maxAllowedQuality, int minAllowedQuality) {
        int quality;
        String netType = Utils.getNetworkType();
        int usersChoice = VKApplication.context.getSharedPreferences(null, 0).getInt("video_quality_" + netType, -1);
        if (usersChoice != -1) {
            quality = usersChoice + 2;
        } else if ("edge".equals(netType)) {
            quality = 2;
        } else if ("3g".equals(netType)) {
            quality = 4;
        } else if ("wifi".equals(netType) || "ethernet".equals(netType)) {
            quality = 6;
        } else if ("lte".equals(netType)) {
            quality = 5;
        } else {
            quality = 3;
        }
        int result = quality < maxAllowedQuality ? quality : maxAllowedQuality;
        return Math.max(result, minAllowedQuality);
    }

    public static int getMaxSupportedQuality() {
        DisplayMetrics dm = VKApplication.context.getResources().getDisplayMetrics();
        int screenSize = Math.max(dm.widthPixels, dm.heightPixels);
        if (screenSize >= 1024) {
            return 6;
        }
        if (screenSize >= 800) {
            return 5;
        }
        if (screenSize < 480) {
            return 3;
        }
        return 4;
    }

    public static String getAutoPlayState() {
        if (VKAccountManager.getCurrent().isVideoAutoPlayAvailable()) {
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
            return preferences.getString("video_autoplay", "always");
        }
        return EventBuilder.DEFAULT_HOSTNAME;
    }

    public static boolean allowAutoPlayVideo() {
        if (VKAccountManager.getCurrent().isVideoAutoPlayAvailable()) {
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
            String value = preferences.getString("video_autoplay", "always");
            return "always".equals(value) || ("wifi".equals(value) && Utils.isWifi());
        }
        return false;
    }

    public static String formatDuration(int duration) {
        if (duration < 0) {
            duration = 0;
        }
        return duration < 3600 ? String.format("%d:%02d", Integer.valueOf(duration / 60), Integer.valueOf(duration % 60)) : String.format("%d:%02d:%02d", Integer.valueOf(duration / 3600), Integer.valueOf((duration / 60) % 60), Integer.valueOf(duration % 60));
    }

    public static String formatQuality(int quality) {
        switch (quality) {
            case -2:
                return "Auto";
            case -1:
            case 0:
            case 1:
            default:
                return null;
            case 2:
                return "240";
            case 3:
                return "360";
            case 4:
                return "480";
            case 5:
                return "720";
            case 6:
                return "1080";
        }
    }
}
