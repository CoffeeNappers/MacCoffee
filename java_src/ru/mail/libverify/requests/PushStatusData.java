package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.List;
import java.util.Locale;
import ru.mail.libverify.requests.k;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public class PushStatusData implements l, Gsonable {
    public final k.a confirmAction;
    public final k.b deliveryMethod;
    public final String pushApplicationId;
    public final String pushSessionId;
    public final List<k.c> statusData;
    public final long statusTimestamp;

    private PushStatusData() {
        this.pushSessionId = null;
        this.statusData = null;
        this.pushApplicationId = null;
        this.statusTimestamp = 0L;
        this.deliveryMethod = null;
        this.confirmAction = null;
    }

    public PushStatusData(@NonNull List<k.c> list, @NonNull String str, @Nullable String str2, long j, @NonNull k.b bVar, @NonNull k.a aVar) {
        this.pushSessionId = str;
        this.statusData = list;
        this.pushApplicationId = str2;
        this.statusTimestamp = j;
        this.deliveryMethod = bVar;
        this.confirmAction = aVar;
    }

    @Override // ru.mail.libverify.requests.l
    public final String a() {
        return String.format(Locale.US, "%s_%s_%s_%s_%s", this.pushSessionId, this.statusData, this.pushApplicationId, this.deliveryMethod, this.confirmAction);
    }
}
