package com.google.android.gms.safetynet;
/* loaded from: classes2.dex */
public class SafeBrowsingThreat {
    public static final int TYPE_POTENTIALLY_HARMFUL_APPLICATION = 4;
    public static final int TYPE_SOCIAL_ENGINEERING = 5;
    private int aCi;

    public SafeBrowsingThreat(int i) {
        this.aCi = i;
    }

    public int getThreatType() {
        return this.aCi;
    }
}
