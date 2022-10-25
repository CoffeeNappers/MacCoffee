package com.vk.analytics;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import com.crashlytics.android.Crashlytics;
import io.fabric.sdk.android.Fabric;
import io.sentry.DefaultSentryClientFactory;
import io.sentry.Sentry;
import io.sentry.SentryClient;
import io.sentry.android.event.helper.AndroidEventBuilderHelper;
import io.sentry.dsn.Dsn;
import io.sentry.event.Event;
import io.sentry.event.EventBuilder;
import io.sentry.event.interfaces.UserInterface;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import net.hockeyapp.android.CrashManager;
import net.hockeyapp.android.UpdateManager;
/* loaded from: classes.dex */
public class Analytics {
    private static final String HA_APP_ID = "9648099e8023ad5cb2ae265b85802bbc";
    private static final String TAG = Analytics.class.getSimpleName();
    private static Analytics sInstance;
    private String mAppHash;
    private Context mContext;
    private Firebase mDatabase;
    private String mId;
    private AnalyticsPreferences mPreferences;
    private ArrayList<String> mPerVersionEvents = new ArrayList<>();
    private ArrayList<String> mPerInstanceEvents = new ArrayList<>();
    private ArrayList<String> mAlwaysEvents = new ArrayList<>();
    private boolean mIsNeedCheckHockeyAppUpdate = false;

    /* loaded from: classes2.dex */
    public interface OnValueEventListener {
        void onDataChange(String str);
    }

    public static Analytics getInstance() {
        if (sInstance == null) {
            sInstance = new Analytics();
        }
        return sInstance;
    }

    public static void logException(Throwable e) {
        Crashlytics.logException(e);
    }

    public static void log(String msg) {
        Crashlytics.log(msg);
    }

    public static void log(AnalyticsEvent event) {
        getInstance().logEvent(event, false);
    }

    public static void logOnce(AnalyticsEvent event) {
        getInstance().logEventOnce(event, false);
    }

    public static boolean isEnabled() {
        return getInstance().database() != null && getInstance().database().isEnableAnalytics();
    }

    public Analytics init(Context context, final Runnable complete) {
        this.mContext = context;
        this.mPreferences = new AnalyticsPreferences(context);
        this.mDatabase = new Firebase(context, this.mPreferences);
        this.mDatabase.init(new Runnable() { // from class: com.vk.analytics.Analytics.1
            @Override // java.lang.Runnable
            public void run() {
                if (Analytics.this.mDatabase.isEnableEvents()) {
                    Analytics.this.checkEvents();
                }
                if (complete != null) {
                    complete.run();
                }
            }
        });
        return this;
    }

    public void initCrashHandler() {
        Fabric.with(this.mContext, new Crashlytics());
    }

    public Firebase database() {
        return this.mDatabase;
    }

    public void setUserData(String id, String name) {
        Crashlytics.setUserIdentifier(id);
        Crashlytics.setUserName(name);
        if (!TextUtils.isEmpty(id)) {
            try {
                int userId = Integer.valueOf(id).intValue();
                if (userId != 0 && TextUtils.isEmpty(this.mId)) {
                    this.mId = id;
                    final Firebase db = getInstance().database();
                    if (db != null) {
                        db.subscribe(Firebase.CONFIG_EVENTS, new OnValueEventListener() { // from class: com.vk.analytics.Analytics.2
                            @Override // com.vk.analytics.Analytics.OnValueEventListener
                            public void onDataChange(String value) {
                                Analytics.this.initCustomAnalytics();
                                db.unsubscribe(Firebase.CONFIG_EVENTS);
                            }
                        }, true);
                    }
                }
            } catch (Exception e) {
            }
        }
    }

    public String getProxies() {
        if (this.mDatabase != null) {
            return this.mDatabase.getProxies();
        }
        return null;
    }

    public void enableCheckForUpdates(boolean enable) {
        this.mIsNeedCheckHockeyAppUpdate = enable;
    }

    public void registerCrashReporter(Activity activity) {
        if (this.mIsNeedCheckHockeyAppUpdate) {
            UpdateManager.register(activity, HA_APP_ID);
            this.mIsNeedCheckHockeyAppUpdate = false;
        }
        CrashManager.register(activity, HA_APP_ID);
    }

    private void logEvent(AnalyticsEvent event, boolean error) {
        if (event != null && this.mDatabase.isEnableEvents()) {
            String key = event.getName();
            if (event.isReady() && !this.mPerInstanceEvents.isEmpty() && this.mPerInstanceEvents.contains(key)) {
                try {
                    if (AnalyticsImpl.logEvent(event, error)) {
                        int n = 0;
                        String count = this.mPreferences.getString(key);
                        if (!TextUtils.isEmpty(count)) {
                            n = Integer.valueOf(count).intValue();
                        }
                        this.mPreferences.set(key, String.valueOf(n + 1));
                    } else {
                        this.mPerInstanceEvents.remove(key);
                    }
                } catch (Exception e) {
                }
            }
            if (event.isReady() && !this.mAlwaysEvents.isEmpty() && this.mAlwaysEvents.contains(key)) {
                AnalyticsImpl.logEvent(event, error);
            }
        }
    }

    private void logEventOnce(AnalyticsEvent event, boolean error) {
        if (event != null && this.mDatabase.isEnableEvents()) {
            String key = event.getName();
            if (event.isReady() && !this.mPerVersionEvents.isEmpty() && this.mPerVersionEvents.contains(key)) {
                try {
                    if (AnalyticsImpl.logEvent(event, error)) {
                        this.mPreferences.set(key, this.mAppHash);
                        this.mPerVersionEvents.remove(key);
                    }
                } catch (Exception e) {
                    Log.d(TAG, "logEventOnce: " + (e != null ? e.toString() : null));
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initCustomAnalytics() {
        if (isEnabled() && !TextUtils.isEmpty(this.mId)) {
            AnalyticsImpl.init(this.mContext, this.mContext.getResources().getString(R.string.raven_dsn), this.mId);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkEvents() {
        this.mAppHash = AnalyticsUtils.getAppHash(this.mContext);
        ArrayList<String> list = new ArrayList<>();
        try {
            list.add(AnalyticsConst.EVENT_MEDIA_PLAYER_SUCCESS);
            list.add(AnalyticsConst.EVENT_CAMERA_SUCCESS);
            List<String> events = this.mDatabase.getEvents();
            boolean versionChange = false;
            Iterator<String> it = list.iterator();
            while (it.hasNext()) {
                String key = it.next();
                if (events.indexOf(key) >= 0) {
                    String value = this.mPreferences.getString(key);
                    if (TextUtils.isEmpty(value) || !value.contains(this.mAppHash)) {
                        if (!this.mPerVersionEvents.contains(key)) {
                            this.mPerVersionEvents.add(key);
                        }
                        versionChange = true;
                    }
                }
            }
            list.clear();
            list.add(AnalyticsConst.EVENT_MEDIA_ENCODER);
            list.add(AnalyticsConst.EVENT_MEDIA_PLAYER_ERROR);
            list.add(AnalyticsConst.EVENT_MEDIA_VIDEO_ERROR);
            list.add(AnalyticsConst.EVENT_MEDIA_DECODER_VIDEO);
            Iterator<String> it2 = list.iterator();
            while (it2.hasNext()) {
                String key2 = it2.next();
                if (events.indexOf(key2) >= 0) {
                    String count = this.mPreferences.getString(key2);
                    int n = !TextUtils.isEmpty(count) ? Integer.valueOf(count).intValue() : 0;
                    if (versionChange || n < 4) {
                        if (!this.mPerInstanceEvents.contains(key2)) {
                            this.mPerInstanceEvents.add(key2);
                        }
                        if (versionChange) {
                            this.mPreferences.set(key2, String.valueOf(0));
                        }
                    }
                }
            }
            list.clear();
            list.add(AnalyticsConst.EVENT_MEDIA_DECODER_AUDIO);
            Iterator<String> it3 = list.iterator();
            while (it3.hasNext()) {
                String key3 = it3.next();
                if (events.indexOf(key3) >= 0 && !this.mAlwaysEvents.contains(key3)) {
                    this.mAlwaysEvents.add(key3);
                }
            }
        } catch (Exception e) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class AnalyticsImpl {
        private AnalyticsImpl() {
        }

        public static void init(Context ctx, String dsn, String id) {
            Sentry.init(dsn, new CustomFactory(ctx, id));
        }

        public static boolean logEvent(AnalyticsEvent event, boolean error) {
            Event e;
            EventBuilder eventBuilder = new EventBuilder().withMessage(event.getEventName()).withLevel(error ? Event.Level.ERROR : Event.Level.INFO);
            Sentry.getStoredClient().runBuilderHelpers(eventBuilder);
            Bundle bundle = event.params();
            if (bundle != null) {
                try {
                    if (!event.mTags.isEmpty() && (e = eventBuilder.getEvent()) != null && e.getContexts() != null) {
                        Map<String, Object> tags = new HashMap<>();
                        tags.putAll(event.mTags);
                        e.getContexts().put(event.getName(), tags);
                    }
                    for (String key : bundle.keySet()) {
                        if (!TextUtils.isEmpty(key)) {
                            String value = (String) bundle.get(key);
                            eventBuilder.withExtra(key, value);
                        }
                    }
                    Sentry.getStoredClient().sendEvent(eventBuilder.build());
                } catch (Exception e2) {
                    Log.d(Analytics.TAG, "logEvent: " + (e2 != null ? e2.toString() : null));
                    return false;
                }
            }
            return true;
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes2.dex */
        public static class CustomFactory extends DefaultSentryClientFactory {
            private Context mContext;
            private UserInterface mUserInterface;

            public CustomFactory(Context context, String id) {
                this.mContext = context;
                String androidId = Settings.Secure.getString(context.getContentResolver(), "android_id");
                if (androidId != null && !androidId.trim().equals("")) {
                    this.mUserInterface = new UserInterface("android:" + androidId, id, null, null);
                }
            }

            @Override // io.sentry.DefaultSentryClientFactory, io.sentry.SentryClientFactory
            public SentryClient createSentryClient(Dsn dsn) {
                SentryClient sentryClient = super.createSentryClient(dsn);
                sentryClient.addBuilderHelper(new CustomBuilderHelper(this.mContext, this.mUserInterface));
                return sentryClient;
            }
        }

        /* loaded from: classes2.dex */
        private static class CustomBuilderHelper extends AndroidEventBuilderHelper {
            private UserInterface user;

            public CustomBuilderHelper(Context ctx, UserInterface user) {
                super(ctx);
                this.user = user;
            }

            @Override // io.sentry.android.event.helper.AndroidEventBuilderHelper, io.sentry.event.helper.EventBuilderHelper
            public void helpBuildingEvent(EventBuilder eventBuilder) {
                super.helpBuildingEvent(eventBuilder);
                if (this.user != null) {
                    eventBuilder.withSentryInterface(this.user, true);
                }
            }
        }
    }
}
