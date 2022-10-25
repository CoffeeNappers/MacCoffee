package com.google.firebase.appindexing;

import com.google.android.gms.tasks.Task;
import com.google.firebase.FirebaseApp;
import com.google.firebase.appindexing.internal.zze;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
public abstract class FirebaseUserActions {
    public static final String APP_INDEXING_API_TAG = "FirebaseUserActions";
    private static WeakReference<FirebaseUserActions> aWu;

    public static synchronized FirebaseUserActions getInstance() {
        FirebaseUserActions firebaseUserActions;
        synchronized (FirebaseUserActions.class) {
            firebaseUserActions = aWu == null ? null : aWu.get();
            if (firebaseUserActions == null) {
                firebaseUserActions = new zze(FirebaseApp.getInstance().getApplicationContext());
                aWu = new WeakReference<>(firebaseUserActions);
            }
        }
        return firebaseUserActions;
    }

    public abstract Task<Void> end(Action action);

    public abstract Task<Void> start(Action action);
}
