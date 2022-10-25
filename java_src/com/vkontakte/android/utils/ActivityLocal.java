package com.vkontakte.android.utils;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import com.vkontakte.android.VKApplication;
import java.util.HashMap;
/* loaded from: classes3.dex */
public class ActivityLocal<T> {
    private HashMap<Activity, T> values = new HashMap<>();
    private Application.ActivityLifecycleCallbacks activityCallbacks = new Application.ActivityLifecycleCallbacks() { // from class: com.vkontakte.android.utils.ActivityLocal.1
        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStarted(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityResumed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityPaused(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStopped(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityDestroyed(Activity activity) {
            ActivityLocal.this.values.remove(activity);
            if (ActivityLocal.this.values.size() == 0) {
                VKApplication.sharedApp.unregisterActivityLifecycleCallbacks(ActivityLocal.this.activityCallbacks);
            }
        }
    };

    public T get(Activity act) {
        return this.values.get(act);
    }

    public void put(Activity act, T obj) {
        if (this.values.size() == 0) {
            VKApplication.sharedApp.registerActivityLifecycleCallbacks(this.activityCallbacks);
        }
        this.values.put(act, obj);
    }

    public void remove(Activity act) {
        this.values.remove(act);
        if (this.values.size() == 0) {
            VKApplication.sharedApp.unregisterActivityLifecycleCallbacks(this.activityCallbacks);
        }
    }
}
