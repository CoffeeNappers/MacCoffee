package com.google.firebase.remoteconfig;
/* loaded from: classes2.dex */
public class FirebaseRemoteConfigFetchThrottledException extends FirebaseRemoteConfigFetchException {
    private final long Hd;

    public FirebaseRemoteConfigFetchThrottledException(long j) {
        this.Hd = j;
    }

    public long getThrottleEndTimeMillis() {
        return this.Hd;
    }
}
