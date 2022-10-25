package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
@zzji
/* loaded from: classes.dex */
public abstract class zzdc {
    @Nullable
    private static MessageDigest zzaxf = null;
    protected Object zzako = new Object();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract byte[] zzag(String str);

    /* JADX INFO: Access modifiers changed from: protected */
    @Nullable
    public MessageDigest zzjr() {
        MessageDigest messageDigest;
        synchronized (this.zzako) {
            if (zzaxf != null) {
                messageDigest = zzaxf;
            } else {
                for (int i = 0; i < 2; i++) {
                    try {
                        zzaxf = MessageDigest.getInstance(CommonUtils.MD5_INSTANCE);
                    } catch (NoSuchAlgorithmException e) {
                    }
                }
                messageDigest = zzaxf;
            }
        }
        return messageDigest;
    }
}
