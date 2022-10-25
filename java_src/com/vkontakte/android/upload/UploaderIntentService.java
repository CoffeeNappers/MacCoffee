package com.vkontakte.android.upload;

import android.app.IntentService;
import android.content.Intent;
import com.vkontakte.android.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
/* loaded from: classes3.dex */
public class UploaderIntentService extends IntentService {
    private static HashMap<Integer, UploadTask> failedTasks = new HashMap<>();
    private static ArrayList<Integer> canceledIDs = new ArrayList<>();
    private static HashSet<Integer> queueIDs = new HashSet<>();
    private static UploadTask runningTask = null;

    public UploaderIntentService() {
        super("uploader");
    }

    @Override // android.app.IntentService, android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent.hasExtra("task")) {
            UploadTask task = (UploadTask) intent.getParcelableExtra("task");
            queueIDs.add(Integer.valueOf(task.getID()));
        }
        return super.onStartCommand(intent, flags, startId);
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        if (intent.hasExtra("task")) {
            UploadTask task = (UploadTask) intent.getParcelableExtra("task");
            runTask(task);
            queueIDs.remove(Integer.valueOf(task.getID()));
        } else if (intent.hasExtra("retry")) {
            int id = intent.getIntExtra("retry", 0);
            UploadTask t = failedTasks.remove(Integer.valueOf(id));
            if (t != null) {
                runTask(t);
            }
        }
    }

    @Override // android.app.Service
    public void onTaskRemoved(Intent rootIntent) {
        if (runningTask != null) {
            runningTask.cancel();
            runningTask.hideNotification();
        }
        super.onTaskRemoved(rootIntent);
    }

    private void runTask(UploadTask task) {
        if (!canceledIDs.contains(Integer.valueOf(task.getID()))) {
            runningTask = task;
            try {
                task.run();
            } catch (UploadException x) {
                Log.w("vk", x);
                failedTasks.put(Integer.valueOf(task.getID()), task);
            } catch (Throwable x2) {
                Log.w("vk", x2);
            }
            runningTask = null;
        }
    }

    public static boolean hasTaskWithID(int id) {
        return queueIDs.contains(Integer.valueOf(id)) || failedTasks.containsKey(Integer.valueOf(id));
    }

    public static boolean isTaskFailed(int id) {
        return failedTasks.containsKey(Integer.valueOf(id));
    }

    public static void cancel(int id) {
        if (runningTask != null && runningTask.getID() == id) {
            runningTask.cancel();
        } else {
            canceledIDs.add(Integer.valueOf(id));
        }
    }
}
