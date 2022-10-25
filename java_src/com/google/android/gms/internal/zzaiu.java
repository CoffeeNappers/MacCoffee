package com.google.android.gms.internal;

import java.util.concurrent.ScheduledExecutorService;
/* loaded from: classes2.dex */
public class zzaiu {
    private final ScheduledExecutorService aZE;
    private final zzait baQ;
    private final zzalx baR;
    private final boolean baS;
    private final String baT;
    private final String baU;

    public zzaiu(zzalx zzalxVar, zzait zzaitVar, ScheduledExecutorService scheduledExecutorService, boolean z, String str, String str2) {
        this.baR = zzalxVar;
        this.baQ = zzaitVar;
        this.aZE = scheduledExecutorService;
        this.baS = z;
        this.baT = str;
        this.baU = str2;
    }

    public zzalx zzcsh() {
        return this.baR;
    }

    public zzait zzcsi() {
        return this.baQ;
    }

    public ScheduledExecutorService zzcsj() {
        return this.aZE;
    }

    public boolean zzcsk() {
        return this.baS;
    }

    public String zzcsl() {
        return this.baT;
    }

    public String zzux() {
        return this.baU;
    }
}
