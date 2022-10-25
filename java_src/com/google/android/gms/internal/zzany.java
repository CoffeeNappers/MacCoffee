package com.google.android.gms.internal;

import com.google.firebase.remoteconfig.FirebaseRemoteConfigInfo;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigSettings;
/* loaded from: classes2.dex */
public class zzany implements FirebaseRemoteConfigInfo {
    private long blw;
    private int blx;
    private FirebaseRemoteConfigSettings bly;

    @Override // com.google.firebase.remoteconfig.FirebaseRemoteConfigInfo
    public FirebaseRemoteConfigSettings getConfigSettings() {
        return this.bly;
    }

    @Override // com.google.firebase.remoteconfig.FirebaseRemoteConfigInfo
    public long getFetchTimeMillis() {
        return this.blw;
    }

    @Override // com.google.firebase.remoteconfig.FirebaseRemoteConfigInfo
    public int getLastFetchStatus() {
        return this.blx;
    }

    public void setConfigSettings(FirebaseRemoteConfigSettings firebaseRemoteConfigSettings) {
        this.bly = firebaseRemoteConfigSettings;
    }

    public void zzagf(int i) {
        this.blx = i;
    }

    public void zzcp(long j) {
        this.blw = j;
    }
}
