package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
@zzji
/* loaded from: classes.dex */
public class zzky extends Handler {
    public zzky(Looper looper) {
        super(looper);
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        try {
            super.handleMessage(message);
        } catch (Exception e) {
            com.google.android.gms.ads.internal.zzu.zzgq().zza(e, "AdMobHandler.handleMessage");
        }
    }
}
