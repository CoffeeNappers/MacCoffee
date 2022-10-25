package com.vkontakte.android.utils;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.SparseArray;
import com.facebook.internal.FacebookRequestErrorClassification;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.cache.Gifs;
import com.vkontakte.android.cache.Videos;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.functions.VoidF1;
import io.reactivex.annotations.SchedulerSupport;
import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class Utils {
    private static final Object DEFAULT_OBJ = Utils.class;
    public static final String EMPTY_STRING = "";

    @Nullable
    public static Activity castToActivity(Context ctx) {
        if (ctx instanceof Activity) {
            return (Activity) ctx;
        }
        while (!(ctx instanceof Activity) && (ctx instanceof ContextWrapper)) {
            ctx = ((ContextWrapper) ctx).getBaseContext();
        }
        if (!(ctx instanceof Activity)) {
            return null;
        }
        return (Activity) ctx;
    }

    public static <O, T> boolean equals(@Nullable O o1, @Nullable T o2) {
        return o1 == o2 || (o1 != null && o1.equals(o2));
    }

    public static boolean containsKey(@Nullable SparseArray array, int key) {
        return (array == null || array.get(key, DEFAULT_OBJ) == DEFAULT_OBJ) ? false : true;
    }

    public static <T> boolean isEmptyArray(@Nullable T[] array) {
        return array == null || array.length == 0;
    }

    public static <T> ArrayList<T> addAndInitIfNeed(@Nullable ArrayList<T> array, T object) {
        if (array == null) {
            array = new ArrayList<>();
        }
        array.add(object);
        return array;
    }

    @Nullable
    public static <T> T[] arrayListToArray(@Nullable ArrayList<T> array, Parcelable.Creator<T> creator) {
        if (array == null) {
            return null;
        }
        return (T[]) array.toArray(creator.newArray(array.size()));
    }

    public static <C> ArrayList<C> asList(SparseArray<C> sparseArray) {
        if (sparseArray == null) {
            return null;
        }
        ArrayList<C> arrayList = new ArrayList<>(sparseArray.size());
        for (int i = 0; i < sparseArray.size(); i++) {
            arrayList.add(sparseArray.valueAt(i));
        }
        return arrayList;
    }

    public static void closeSilently(@Nullable Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    public static String getCommaSeparated(ArrayList<String> arrayList) {
        if (arrayList == null) {
            return "";
        }
        StringBuilder builder = new StringBuilder();
        Iterator<String> it = arrayList.iterator();
        while (it.hasNext()) {
            String string = it.next();
            builder.append(string);
            builder.append(",");
        }
        if (builder.length() <= 0) {
            return "";
        }
        String commaSeparated = builder.substring(0, builder.length() - 1);
        return commaSeparated;
    }

    @Nullable
    public static String optString(@Nullable JSONObject jsonObject, String key) {
        if (jsonObject == null || jsonObject.isNull(key)) {
            return null;
        }
        return jsonObject.optString(key);
    }

    @NonNull
    public static String readString(@Nullable Bundle b, @NonNull String key, @NonNull String def) {
        return b == null ? def : b.getString(key, def);
    }

    public static Bundle writeString(@Nullable Bundle b, String key, String value) {
        if (b != null) {
            b.putString(key, value);
        }
        return b;
    }

    public static <T> String objectToString(T o) {
        StringBuilder builder = new StringBuilder(o.getClass().getName()).append(" {");
        Field[] fields = o.getClass().getDeclaredFields();
        for (Field field : fields) {
            try {
                field.setAccessible(true);
                Object value = field.get(o);
                builder.append(field.getName()).append("='").append(value).append("',");
            } catch (IllegalAccessException e) {
            }
        }
        builder.append("}");
        return builder.toString();
    }

    public static boolean isBlank(@Nullable String string) {
        return string == null || string.trim().length() == 0;
    }

    private static ConnectivityManager getConnectivityManager() {
        return (ConnectivityManager) VKApplication.context.getSystemService("connectivity");
    }

    public static boolean isMobile() {
        NetworkInfo info = getConnectivityManager().getActiveNetworkInfo();
        return info != null && info.getType() == 0;
    }

    public static boolean isWifi() {
        NetworkInfo info = getConnectivityManager().getActiveNetworkInfo();
        return info != null && info.getType() == 1;
    }

    public static String getNetworkType() {
        NetworkInfo info = getConnectivityManager().getActiveNetworkInfo();
        if (info == null) {
            return SchedulerSupport.NONE;
        }
        if (info.getType() == 0) {
            if ("GPRS".equals(info.getSubtypeName()) || "EDGE".equals(info.getSubtypeName())) {
                return "edge";
            }
            if ("LTE".equals(info.getSubtypeName())) {
                return "lte";
            }
            return "3g";
        } else if (info.getType() == 1) {
            return "wifi";
        } else {
            if (info.getType() == 9) {
                return "ethernet";
            }
            return FacebookRequestErrorClassification.KEY_OTHER;
        }
    }

    public static String getConnectionType() {
        NetworkInfo info = getConnectivityManager().getActiveNetworkInfo();
        switch (info == null ? -1 : info.getType()) {
            case -1:
                return "unknown";
            case 0:
                return "mobile";
            case 1:
                return "wifi";
            case 9:
                return "ethernet";
            default:
                return FacebookRequestErrorClassification.KEY_OTHER;
        }
    }

    public static String getConnectionSubtype() {
        NetworkInfo info = getConnectivityManager().getActiveNetworkInfo();
        return (info == null || TextUtils.isEmpty(info.getSubtypeName())) ? "unknown" : info.getSubtypeName();
    }

    public static String getUserOptions() {
        JSONObject root = new JSONObject();
        try {
            JSONObject autoplay_video = new JSONObject();
            autoplay_video.put("value", normalizeAutoPlayState(Videos.getAutoPlayState()));
            root.put("autoplay_video", autoplay_video);
            JSONObject autoplay_gif = new JSONObject();
            autoplay_gif.put("value", normalizeAutoPlayState(Gifs.getAutoPlayState()));
            root.put("autoplay_gif", autoplay_gif);
        } catch (JSONException e) {
            L.e(e, new Object[0]);
        }
        return root.toString();
    }

    public static String getNewsFilterParams(String... adsParams) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
        boolean dbgNoSliderAds = prefs.getBoolean("__dbg_no_slider_ads", false);
        boolean dbgDemoAds = prefs.getBoolean("__dbg_demo_ads", false);
        boolean dbgNoAds = prefs.getBoolean("__dbg_no_ads", false);
        boolean dbgDemoPrettyCards = prefs.getBoolean("__dbg_demo_pretty_cards", false);
        StringBuilder builder = new StringBuilder();
        if (dbgDemoPrettyCards) {
            appendParamToBuilder(builder, "ads_post");
            appendParamToBuilder(builder, "ads_post_pretty_cards");
            appendParamToBuilder(builder, "ads_demo");
            appendParamToBuilder(builder, "ads_demo_pretty_cards");
            return builder.toString();
        }
        if (dbgDemoAds) {
            appendParamToBuilder(builder, "ads_demo");
        }
        for (String s : adsParams) {
            char c = 65535;
            switch (s.hashCode()) {
                case -1134409198:
                    if (s.equals("ads_app")) {
                        c = 0;
                        break;
                    }
                    break;
                case -1040444498:
                    if (s.equals("ads_app_slider")) {
                        c = 4;
                        break;
                    }
                    break;
                case -806500657:
                    if (s.equals("ads_post")) {
                        c = 2;
                        break;
                    }
                    break;
                case -806417034:
                    if (s.equals("ads_site")) {
                        c = 1;
                        break;
                    }
                    break;
                case -566432310:
                    if (s.equals("ads_post_pretty_cards")) {
                        c = 5;
                        break;
                    }
                    break;
                case 1493134350:
                    if (s.equals("ads_app_video")) {
                        c = 3;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                case 1:
                case 2:
                    if (!dbgNoAds) {
                        appendParamToBuilder(builder, s);
                        break;
                    } else {
                        break;
                    }
                case 3:
                case 4:
                case 5:
                    if (!dbgNoAds && !dbgNoSliderAds) {
                        appendParamToBuilder(builder, s);
                        break;
                    }
                    break;
                default:
                    appendParamToBuilder(builder, s);
                    break;
            }
        }
        return builder.toString();
    }

    private static void appendParamToBuilder(StringBuilder builder, String param) {
        if (builder.length() != 0) {
            builder.append(',');
        }
        builder.append(param);
    }

    public static String getDeviceInfo() {
        JSONObject devInfo = new JSONObject();
        try {
            String appVersion = VKApplication.context.getPackageManager().getPackageInfo(VKApplication.context.getPackageName(), 0).versionName;
            devInfo.put("app_version", appVersion);
            devInfo.put("system_name", "Android");
            devInfo.put("system_version", Build.VERSION.RELEASE);
            devInfo.put("manufacturer", Build.MANUFACTURER);
            devInfo.put("device_model", Build.MODEL);
            String adId = Analytics.getDeviceID();
            if ("-3".equals(adId)) {
                devInfo.put("ads_tracking_disabled", 1);
            } else if (!"-1".equals(adId) && !"-2".equals(adId)) {
                devInfo.put("ads_device_id", adId);
                if (Analytics.isLimitAdTrackingEnabled()) {
                    devInfo.put("ads_tracking_disabled", 1);
                }
            }
            if (VKApplication.deviceID != 0) {
                devInfo.put("ads_android_id", Long.toHexString(VKApplication.deviceID));
            }
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
        return devInfo.toString();
    }

    private static String normalizeAutoPlayState(String input) {
        String valueOf = String.valueOf(input);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -1414557169:
                if (valueOf.equals("always")) {
                    c = 1;
                    break;
                }
                break;
            case 3649301:
                if (valueOf.equals("wifi")) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
            case 1:
                return input;
            default:
                return SchedulerSupport.NONE;
        }
    }

    public static void copyInputStreamToFile(InputStream input, File file, VoidF1<Boolean> funcAfterCopied) {
        new Thread(Utils$$Lambda$1.lambdaFactory$(file, input, funcAfterCopied)).start();
    }

    public static /* synthetic */ void lambda$copyInputStreamToFile$0(File file, InputStream input, VoidF1 funcAfterCopied) {
        boolean result;
        try {
            OutputStream output = new FileOutputStream(file);
            try {
                byte[] buffer = new byte[32768];
                while (true) {
                    int read = input.read(buffer);
                    if (read == -1) {
                        break;
                    }
                    output.write(buffer, 0, read);
                }
                output.flush();
                result = true;
            } finally {
                closeSilently(output);
            }
        } catch (Exception e) {
            L.e(e, new Object[0]);
            result = false;
        } finally {
            closeSilently(input);
        }
        funcAfterCopied.f(Boolean.valueOf(result));
    }
}
