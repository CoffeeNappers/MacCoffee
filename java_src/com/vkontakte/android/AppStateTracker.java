package com.vkontakte.android;

import android.app.Activity;
import android.content.Intent;
import android.os.Looper;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.Vector;
/* loaded from: classes.dex */
public class AppStateTracker {
    private static Activity currentActivity;
    private static Timer timer;
    private static boolean isInBG = false;
    private static final Vector<Callback> callbacks = new Vector<>();
    private static final Set<Object> keepScreenObjects = new HashSet();

    /* loaded from: classes2.dex */
    public interface Callback {
        void onAppPaused();

        void onAppResumed();
    }

    public static void addCallback(Callback call) {
        callbacks.add(call);
    }

    public static void removeCallback(Callback call) {
        callbacks.remove(call);
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x000b, code lost:
        if (com.vkontakte.android.AppStateTracker.keepScreenObjects.add(r2) != false) goto L7;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void keepScreenOn(java.lang.Object r2, boolean r3) {
        /*
            java.util.Set<java.lang.Object> r1 = com.vkontakte.android.AppStateTracker.keepScreenObjects
            monitor-enter(r1)
            if (r3 == 0) goto L12
            java.util.Set<java.lang.Object> r0 = com.vkontakte.android.AppStateTracker.keepScreenObjects     // Catch: java.lang.Throwable -> L1b
            boolean r0 = r0.add(r2)     // Catch: java.lang.Throwable -> L1b
            if (r0 == 0) goto L10
        Ld:
            processKeepScreenOn()     // Catch: java.lang.Throwable -> L1b
        L10:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L1b
            return
        L12:
            java.util.Set<java.lang.Object> r0 = com.vkontakte.android.AppStateTracker.keepScreenObjects     // Catch: java.lang.Throwable -> L1b
            boolean r0 = r0.remove(r2)     // Catch: java.lang.Throwable -> L1b
            if (r0 == 0) goto L10
            goto Ld
        L1b:
            r0 = move-exception
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L1b
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.AppStateTracker.keepScreenOn(java.lang.Object, boolean):void");
    }

    private static void processKeepScreenOn() {
        Runnable runnable;
        runnable = AppStateTracker$$Lambda$1.instance;
        ViewUtils.runOnUiThread(runnable);
    }

    public static /* synthetic */ void lambda$processKeepScreenOn$0() {
        synchronized (keepScreenObjects) {
            Activity activity = currentActivity;
            if (activity != null) {
                if (!keepScreenObjects.isEmpty()) {
                    activity.getWindow().addFlags(128);
                } else {
                    activity.getWindow().clearFlags(128);
                }
            }
        }
    }

    public static void onActivityPaused() {
        if (timer == null) {
            timer = new Timer();
            timer.schedule(new BgTrackerTask(), 2000L);
        }
        currentActivity = null;
    }

    public static void onActivityResumed(Activity act) {
        if (timer != null) {
            timer.cancel();
            timer = null;
        }
        currentActivity = act;
        if (isInBG || act.isTaskRoot()) {
            Log.i("vk", "==== LEAVE BACKGROUND ====");
            isInBG = false;
            if (Global.longPoll != null) {
                Global.longPoll.cancelDelayedStop();
            } else {
                Intent intent = new Intent(VKApplication.context, LongPollService.class);
                VKApplication.context.startService(intent);
            }
            Iterator<Callback> it = callbacks.iterator();
            while (it.hasNext()) {
                Callback callback = it.next();
                callback.onAppResumed();
            }
        }
        processKeepScreenOn();
    }

    public static Activity getCurrentActivity() {
        return currentActivity;
    }

    public static boolean isInBackground() {
        return isInBG;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class BgTrackerTask extends TimerTask {
        private BgTrackerTask() {
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            if (Thread.currentThread().equals(Looper.getMainLooper().getThread())) {
                Timer unused = AppStateTracker.timer = null;
                boolean unused2 = AppStateTracker.isInBG = true;
                Log.i("vk", "==== ENTER BACKGROUND ====");
                if (Global.longPoll != null) {
                    Global.longPoll.stopDelayed();
                }
                Iterator it = AppStateTracker.callbacks.iterator();
                while (it.hasNext()) {
                    Callback callback = (Callback) it.next();
                    callback.onAppPaused();
                }
                return;
            }
            ViewUtils.runOnUiThread(this);
        }
    }
}
