package com.vk.analytics;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.FirebaseApp;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.remoteconfig.FirebaseRemoteConfig;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigSettings;
import com.vk.analytics.Analytics;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class Firebase {
    public static final String CONFIG_ANALYTICS = "config_enable_analytics";
    public static final String CONFIG_EVENTS = "config_enable_events";
    public static final String CONFIG_PROXIES = "config_enable_proxy";
    public static final String CONFIG_PROXIES_LIST = "config_proxies_list";
    public static final String CONFIG_SETTINGS_PROXY_CHECK = "config_settings_proxy_check";
    public static final String CONFIG_SETTINGS_PROXY_MENU = "config_settings_proxy_menu";
    public static final String CONFIG_SETTINGS_PROXY_SHUFFLE = "config_settings_proxy_shuffle";
    private static final String TAG = Firebase.class.getSimpleName();
    private FirebaseDatabase mDatabase;
    private AnalyticsPreferences mPreferences;
    private FirebaseRemoteConfig mRemoteConfig;
    private boolean mIsEnableAnalytics = false;
    private boolean mIsEnableEvents = false;
    private HashMap<String, Analytics.OnValueEventListener> mSubscribers = new HashMap<>();
    private ArrayList<String> mSettings = new ArrayList<>();
    private HashMap<String, String> mSettingsValues = new HashMap<>();

    public Firebase(Context context, AnalyticsPreferences prefs) {
        FirebaseApp.initializeApp(context);
        this.mDatabase = FirebaseDatabase.getInstance();
        this.mPreferences = prefs;
        this.mSettings.add(CONFIG_SETTINGS_PROXY_CHECK);
        this.mSettings.add(CONFIG_SETTINGS_PROXY_MENU);
        this.mSettings.add(CONFIG_SETTINGS_PROXY_SHUFFLE);
        Iterator<String> it = this.mSettings.iterator();
        while (it.hasNext()) {
            String s = it.next();
            String value = this.mPreferences.getString(s);
            if (!TextUtils.isEmpty(value)) {
                this.mSettingsValues.put(s, value);
            }
        }
    }

    public void init(final Runnable complete) {
        this.mRemoteConfig = FirebaseRemoteConfig.getInstance();
        FirebaseRemoteConfigSettings configSettings = new FirebaseRemoteConfigSettings.Builder().setDeveloperModeEnabled(false).build();
        this.mRemoteConfig.setConfigSettings(configSettings);
        long cacheExpirationSec = 900;
        if (this.mRemoteConfig.getInfo().getConfigSettings().isDeveloperModeEnabled()) {
            cacheExpirationSec = 0;
        }
        this.mRemoteConfig.fetch(cacheExpirationSec).addOnCompleteListener(new OnCompleteListener<Void>() { // from class: com.vk.analytics.Firebase.1
            @Override // com.google.android.gms.tasks.OnCompleteListener
            public void onComplete(@NonNull Task<Void> task) {
                if (task.isSuccessful()) {
                    Firebase.this.mRemoteConfig.activateFetched();
                    Firebase.this.updateProxies();
                    Firebase.this.updateEvents();
                    Firebase.this.update();
                    if (complete != null) {
                        complete.run();
                    }
                }
            }
        });
    }

    public boolean subscribe(String event, Analytics.OnValueEventListener listener) {
        if (subscribe(event, listener, false)) {
            updateDatabase(event);
            return true;
        }
        return false;
    }

    public boolean subscribe(String event, Analytics.OnValueEventListener listener, boolean configOnly) {
        Analytics.OnValueEventListener l = this.mSubscribers.get(event);
        if (l == null || l != listener) {
            this.mSubscribers.put(event, listener);
            return true;
        }
        return false;
    }

    public void unsubscribe(String event) {
        if (this.mSubscribers.containsKey(event)) {
            this.mSubscribers.remove(event);
        }
    }

    public String getProxies() {
        return this.mPreferences.getString(CONFIG_PROXIES_LIST);
    }

    public void clearProxies() {
        this.mPreferences.set(CONFIG_PROXIES_LIST, "");
    }

    public boolean isEnableAnalytics() {
        return this.mIsEnableAnalytics;
    }

    public boolean isEnableEvents() {
        return this.mIsEnableEvents;
    }

    public boolean isEnableProxies() {
        return this.mPreferences.getBoolean(CONFIG_PROXIES);
    }

    public List<String> getEvents() {
        String events = this.mPreferences.getString(CONFIG_EVENTS);
        return !TextUtils.isEmpty(events) ? Arrays.asList(events.split("\\s+")) : new ArrayList();
    }

    public HashMap<String, String> getSettings() {
        return this.mSettingsValues;
    }

    private void updateDatabase(final String event) {
        try {
            Log.d(TAG, "connect to db");
            DatabaseReference reference = this.mDatabase.getReference(event);
            if (reference != null) {
                ValueEventListener listener = new ValueEventListener() { // from class: com.vk.analytics.Firebase.2
                    @Override // com.google.firebase.database.ValueEventListener
                    public void onDataChange(DataSnapshot dataSnapshot) {
                        Firebase.this.update(event, (String) dataSnapshot.getValue(String.class));
                        Firebase.this.unsubscribe(event);
                        Firebase.this.disconnect();
                    }

                    @Override // com.google.firebase.database.ValueEventListener
                    public void onCancelled(DatabaseError error) {
                        Log.d(Firebase.TAG, "canceled on db error: " + (error != null ? error.toString() : null));
                        Firebase.this.disconnect();
                    }
                };
                reference.addValueEventListener(listener);
            }
        } catch (Exception e) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void update(String event, String value) {
        this.mPreferences.set(event, value);
        Analytics.OnValueEventListener l = this.mSubscribers.get(event);
        if (l != null) {
            l.onDataChange(value);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateProxies() {
        boolean enable = this.mRemoteConfig.getBoolean(CONFIG_PROXIES);
        this.mPreferences.set(CONFIG_PROXIES, enable);
        String value = enable ? this.mPreferences.getString(CONFIG_PROXIES_LIST) : "";
        update(CONFIG_PROXIES_LIST, value);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateEvents() {
        if (this.mRemoteConfig.getBoolean(CONFIG_ANALYTICS)) {
            this.mIsEnableAnalytics = true;
            String events = this.mRemoteConfig.getString(CONFIG_EVENTS);
            if (!TextUtils.isEmpty(events)) {
                this.mIsEnableEvents = true;
                update(CONFIG_EVENTS, events);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void update() {
        Iterator<String> it = this.mSettings.iterator();
        while (it.hasNext()) {
            String s = it.next();
            String value = this.mRemoteConfig.getString(s);
            if (!TextUtils.isEmpty(value)) {
                this.mPreferences.set(s, value);
                this.mSettingsValues.put(s, value);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void disconnect() {
        Log.d(TAG, "disconnect to db");
        this.mDatabase.goOffline();
    }
}
