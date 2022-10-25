package ru.mail.libverify.utils;

import android.support.annotation.Nullable;
/* loaded from: classes3.dex */
public final class k {
    public final boolean a;
    public final Long b;

    public k(boolean z, @Nullable Long l) {
        this.a = z;
        this.b = l;
    }

    public final String toString() {
        return "ScreenState{isScreenActive=" + this.a + ", inactiveTime=" + this.b + '}';
    }
}
