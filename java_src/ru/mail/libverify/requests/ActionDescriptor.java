package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
final class ActionDescriptor implements Gsonable {
    private transient m a;
    int attemptCount;
    long lastAttemptTimestamp;
    private final String requestJson;
    public final a type;

    /* loaded from: classes3.dex */
    enum a {
        UPDATE_SETTINGS(0),
        PUSH_STATUS(1),
        ATTEMPT(2);
        
        private int value;

        a(int i) {
            this.value = i;
        }
    }

    private ActionDescriptor() {
        this.lastAttemptTimestamp = 0L;
        this.attemptCount = 0;
        this.type = null;
        this.requestJson = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ActionDescriptor(a aVar, @NonNull m mVar) {
        this.lastAttemptTimestamp = 0L;
        this.attemptCount = 0;
        this.type = aVar;
        this.requestJson = mVar.a;
        this.a = mVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final m a() {
        if (this.a == null) {
            this.a = new m(this.requestJson);
        }
        return this.a;
    }
}
