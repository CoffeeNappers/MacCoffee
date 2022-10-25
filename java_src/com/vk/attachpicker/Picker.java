package com.vk.attachpicker;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.content.ContextCompat;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public class Picker {
    private static Context appContext;
    private static final ExecutorService photoExecutorService = Executors.newSingleThreadExecutor();
    private static final ExecutorService videoExecutorService = Executors.newSingleThreadExecutor();
    private static final Timer timer = new Timer();
    private static final ExecutorService backgroundExecutor = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors());
    private static final Handler handler = new Handler(Looper.getMainLooper());

    public static void init(Activity activity) {
        init(activity.getApplicationContext());
    }

    public static void init(Context context) {
        appContext = context;
    }

    public static Context getContext() {
        return appContext;
    }

    public static int color(int colorResId) {
        return ContextCompat.getColor(appContext, colorResId);
    }

    public static ExecutorService executor(boolean forVideo) {
        return forVideo ? videoExecutorService : photoExecutorService;
    }

    public static void runBackground(Runnable runnable) {
        backgroundExecutor.execute(runnable);
    }

    public static void runBackground(final Runnable runnable, long delay) {
        timer.schedule(new TimerTask() { // from class: com.vk.attachpicker.Picker.1
            @Override // java.util.TimerTask, java.lang.Runnable
            public void run() {
                Picker.backgroundExecutor.execute(runnable);
            }
        }, delay);
    }

    public static void run(Runnable runnable) {
        handler.post(runnable);
    }

    public static void runDelayed(Runnable runnable, long delay) {
        handler.postDelayed(runnable, delay);
    }

    public static void removeTasks(Runnable runnable) {
        handler.removeCallbacks(runnable);
    }

    public static int getHeapSizeInBytes(Context context) {
        ActivityManager am = (ActivityManager) context.getSystemService("activity");
        boolean largeHeap = (context.getApplicationInfo().flags & 1048576) != 0;
        int memoryClass = am.getMemoryClass();
        if (largeHeap) {
            memoryClass = am.getLargeMemoryClass();
        }
        return memoryClass * 1024 * 1024;
    }
}
