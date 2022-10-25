package com.vkontakte.android;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.content.res.Configuration;
import android.os.Build;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.support.annotation.NonNull;
import android.support.multidex.MultiDex;
import android.text.TextUtils;
import android.webkit.WebView;
import com.facebook.device.yearclass.YearClass;
import com.my.tracker.MyTracker;
import com.squareup.leakcanary.LeakCanary;
import com.squareup.leakcanary.RefWatcher;
import com.vk.analytics.Analytics;
import com.vk.attachpicker.Picker;
import com.vk.core.network.Network;
import com.vk.core.util.AppContextHolder;
import com.vk.emoji.Emoji;
import com.vk.imageloader.VKImageLoader;
import com.vk.medianative.MediaNative;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.media.Vigo;
import com.vkontakte.android.upload.DocumentUploadTask;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.VersionCodeCrushHandler;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.reactivex.functions.Consumer;
import java.io.File;
import java.lang.Thread;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import me.grishka.appkit.utils.V;
import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import ru.mail.libverify.api.VerificationFactory;
/* loaded from: classes.dex */
public class VKApplication extends Application {
    public static Context context;
    public static long deviceID = 0;
    private static int deviceYear;
    public static final boolean hasLollipop;
    public static RefWatcher refWatcher;
    public static Application sharedApp;
    public static Vigo vigo;

    static {
        hasLollipop = Build.VERSION.SDK_INT >= 21;
        deviceYear = 2016;
    }

    public static synchronized Vigo getVigo(Context context2) {
        Vigo vigo2;
        synchronized (VKApplication.class) {
            vigo2 = vigo;
        }
        return vigo2;
    }

    public static int deviceYear() {
        return deviceYear;
    }

    public static boolean isDeployApplication() {
        return false;
    }

    public static void setMyTrackLocationEnable(boolean enable) {
        MyTracker.getTrackerParams().setTrackingLocationEnabled(enable);
        MyTracker.getTrackerParams().setTrackingEnvironmentEnabled(enable);
    }

    @Override // android.app.Application
    public void onCreate() {
        sharedApp = this;
        VKAccountManager.init(this);
        Analytics.getInstance().init(this, new NetworkProxyPreferences());
        Network.getInstance().init(this, isDeployApplication());
        VKImageLoader.init(this);
        Picker.init(this);
        initDeviceYear(this);
        initEmoji(this);
        Thread.setDefaultUncaughtExceptionHandler(new VersionCodeCrushHandler(this));
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        overrideLangIfNeeded(getResources().getConfiguration());
        V.setApplicationContext(getApplicationContext());
        Thread.UncaughtExceptionHandler xHandler = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(VKApplication$$Lambda$1.lambdaFactory$(xHandler));
        MyTracker.createTracker("39905392329609327611", this);
        setMyTrackLocationEnable(prefs.getBoolean("mytrackerLocationCrapEnabled", true));
        MyTracker.getTrackerParams().setTrackingAppsEnabled(false);
        MyTracker.getTrackerParams().setDefaultVendorAppPackage();
        MyTracker.initTracker();
        try {
            VerificationFactory.onAppCreated(this);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
        if (!getSharedPreferences(null, 0).contains("ncode")) {
            getSharedPreferences(null, 0).edit().putInt("ncode", new Random().nextInt()).apply();
        }
        if (prefs.contains("notifyTypes")) {
            List<String> ntypes = Arrays.asList(prefs.getString("notifyTypes", "").split(";"));
            prefs.edit().putBoolean("notificationsPrivateMessages", ntypes.contains("messages")).putBoolean("notificationsChatMessages", ntypes.contains("messages")).putBoolean("notificationsFriendRequests", ntypes.contains("friends")).putBoolean("notificationsReplies", ntypes.contains("replies")).putBoolean("notificationsMentions", ntypes.contains("mentions")).putBoolean("notificationsGames", ntypes.contains("games")).remove("notifyTypes").apply();
        }
        try {
            String aid = Settings.Secure.getString(getApplicationContext().getContentResolver(), "android_id");
            deviceID = Long.parseLong(aid, 16);
        } catch (Exception e2) {
        }
        if (Build.VERSION.SDK_INT >= 19) {
            try {
                ApplicationInfo applicationInfo = getApplicationInfo();
                int i = applicationInfo.flags & 2;
                applicationInfo.flags = i;
                if (i != 0) {
                    WebView.setWebContentsDebuggingEnabled(true);
                }
            } catch (Exception e3) {
            }
        }
        File thumbsDir = new File(getApplicationContext().getCacheDir(), AttachmentInfo.DATA_THUMBS);
        if (!thumbsDir.exists()) {
            thumbsDir.mkdirs();
        }
        File[] thumbs = thumbsDir.listFiles();
        for (File file : thumbs) {
            file.delete();
        }
        if (context == null) {
            AppContextHolder.context = getApplicationContext();
            context = getApplicationContext();
            Global.init(context);
            Global.displayDensity = getResources().getDisplayMetrics().density;
        }
        initLog();
        try {
            File tmpUploadDir = new File(getExternalCacheDir(), "upload");
            if (tmpUploadDir.exists()) {
                File[] files = tmpUploadDir.listFiles();
                for (File f : files) {
                    f.delete();
                }
            }
        } catch (Exception e4) {
        }
        PurchasesManager.init(this);
        super.onCreate();
        MediaNative.init(context);
        Analytics.getInstance().initCrashHandler();
        VKAccountManager.fillAccountDataForAnalytics(VKAccountManager.getCurrent());
        refWatcher = LeakCanary.install(this);
        vigo = new Vigo(this);
        C2DM.stopIfNeed(this);
    }

    public static /* synthetic */ void lambda$onCreate$0(Thread.UncaughtExceptionHandler xHandler, Thread thread, Throwable throwable) {
        if (throwable.getMessage() == null || !throwable.getMessage().contains("during runtime shutdown")) {
            xHandler.uncaughtException(thread, throwable);
        }
    }

    @Override // android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        MultiDex.install(this);
    }

    private void initDeviceYear(Context context2) {
        int dy = YearClass.get(context2);
        if (dy >= 2008 && dy <= 2020) {
            deviceYear = dy;
        }
    }

    private void initEmoji(final Context context2) {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        executor.execute(new Runnable() { // from class: com.vkontakte.android.VKApplication.1
            {
                VKApplication.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                final Network.ClientType id = Network.ClientType.CLIENT_EMOJI;
                Emoji emoji = Emoji.instance(context2);
                OkHttpClient.Builder builder = Network.getInstance().getBuilder(id);
                Network.getInstance().setBuilder(id, builder.cache(emoji.getCache()));
                emoji.init(new Call.Factory() { // from class: com.vkontakte.android.VKApplication.1.2
                    {
                        AnonymousClass1.this = this;
                    }

                    @Override // okhttp3.Call.Factory
                    public Call newCall(Request request) {
                        return Network.getInstance().getClient(id).newCall(request);
                    }
                }).emojiLoadObservable().subscribe(new Consumer<Integer>() { // from class: com.vkontakte.android.VKApplication.1.1
                    {
                        AnonymousClass1.this = this;
                    }

                    @Override // io.reactivex.functions.Consumer
                    public void accept(@NonNull Integer integer) throws Exception {
                        VKApplication.this.onEmojiLoaded(integer);
                    }
                });
            }
        });
    }

    private String getPackageSignature() {
        try {
            PackageInfo info = getPackageManager().getPackageInfo(getPackageName(), 64);
            Signature sig = info.signatures[0];
            MessageDigest md = MessageDigest.getInstance("SHA1");
            md.update(sig.toByteArray());
            byte[] sha = md.digest();
            String certFp = "";
            for (byte sb : sha) {
                certFp = certFp + String.format("%02X", Byte.valueOf(sb));
            }
            return certFp;
        } catch (Exception x) {
            Log.w("vk", x);
            return "";
        }
    }

    private boolean overrideLangIfNeeded(Configuration conf) {
        Locale locale;
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        if (!prefs.contains("__dbg_lang_override") || TextUtils.isEmpty(prefs.getString("__dbg_lang_override", ""))) {
            return false;
        }
        String lang = prefs.getString("__dbg_lang_override", "");
        String[] langParts = lang.split(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR);
        if (langParts.length == 1) {
            locale = new Locale(lang);
        } else {
            locale = new Locale(langParts[0], langParts[1]);
        }
        Locale.setDefault(locale);
        conf.locale = locale;
        getResources().updateConfiguration(conf, getResources().getDisplayMetrics());
        return true;
    }

    public void onEmojiLoaded(Integer emojiLoadFlag) {
        Emoji.invalidateAll(AppStateTracker.getCurrentActivity());
    }

    public boolean isDebugApplication() {
        return VKAccountManager.getCurrent().debugAvailable;
    }

    private void initLog() {
        L.getInstance().init(new L.Callback() { // from class: com.vkontakte.android.VKApplication.2
            {
                VKApplication.this = this;
            }

            @Override // com.vkontakte.android.utils.L.Callback
            public boolean isLogEnable() {
                return VKApplication.this.isDebugApplication();
            }

            @Override // com.vkontakte.android.utils.L.Callback
            public void onCapture(String path) {
                VKAccount account = VKAccountManager.getCurrent();
                if (account != null && account.isReal()) {
                    Upload.start(VKApplication.context, new DocumentUploadTask(VKApplication.context, path, account.getUid(), false));
                }
            }
        });
    }
}
