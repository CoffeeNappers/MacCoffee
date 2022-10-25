package com.google.firebase.appindexing;

import com.google.android.gms.tasks.Task;
import com.google.firebase.FirebaseApp;
import com.google.firebase.appindexing.internal.zzc;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
public abstract class FirebaseAppIndex {
    public static final String ACTION_UPDATE_INDEX = "com.google.firebase.appindexing.UPDATE_INDEX";
    public static final String APP_INDEXING_API_TAG = "FirebaseAppIndex";
    private static WeakReference<FirebaseAppIndex> aWu;

    public static synchronized FirebaseAppIndex getInstance() {
        FirebaseAppIndex firebaseAppIndex;
        synchronized (FirebaseAppIndex.class) {
            firebaseAppIndex = aWu == null ? null : aWu.get();
            if (firebaseAppIndex == null) {
                firebaseAppIndex = new zzc(FirebaseApp.getInstance().getApplicationContext());
                aWu = new WeakReference<>(firebaseAppIndex);
            }
        }
        return firebaseAppIndex;
    }

    public abstract Task<Void> remove(String... strArr);

    public abstract Task<Void> removeAll();

    public abstract Task<Void> update(Indexable... indexableArr);
}
