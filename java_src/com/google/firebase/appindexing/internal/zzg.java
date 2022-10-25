package com.google.firebase.appindexing.internal;

import android.util.Log;
import com.google.firebase.appindexing.FirebaseAppIndex;
/* loaded from: classes2.dex */
public class zzg {
    public static boolean zzbi(int i) {
        return Log.isLoggable(FirebaseAppIndex.APP_INDEXING_API_TAG, i) || Log.isLoggable(FirebaseAppIndex.APP_INDEXING_API_TAG, i);
    }

    public static int zzrr(String str) {
        if (zzbi(3)) {
            return Log.d(FirebaseAppIndex.APP_INDEXING_API_TAG, str);
        }
        return 0;
    }
}
